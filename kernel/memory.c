#include <x86.h>
#include <libc/libc.h>
#include <util.h>
#include <memory.h>


extern char kernel_text_end[];
extern char kernel_data_end[];
extern char kernel_end[];
extern char kernel_begin[];
extern u32 istack_top;

/* We'll be using the Intel flat memory model to simply ignore segmentation,
 * we're gonna need the segments KERNEL_CODE, KERNEL_DATA, USER_CODE, USER_DATA */
segment_descriptor_t GDT[6];
tss_t TSS; /* we'll only use one TSS for the whole system */
pmm_t pmm;
pte_t* kpgdir; /* the page directory used for the kernel 
				* in the future we we'll be "copying" this
				* into the processes' page directories */

/* convinent function for making (flat mode)segment descriptors, only the low 20 bits of limit
 * are used and only the low 4 bits of flags are used.*/
segment_descriptor_t make_segment(u32 base, u32 limit, u8 access, u8 flags) {
	segment_descriptor_t segdesc; 
	segdesc.limit_low16 = limit & 0xffff;
	segdesc.limit_high4 = (limit >> 16) & 0xf;
	
	segdesc.base_low16  = base & 0xffff;
	segdesc.base_mid8   = (base >> 16) & 0xff;
	segdesc.base_high8  = (base >> 24 ) & 0xff;
	
	segdesc.access = access;
	segdesc.flag_reserved = 0;
	segdesc.flag_L = (flags >> 1) & 0x1;
	segdesc.flag_DB =  (flags >> 2) & 0x1;  
	segdesc.flag_G  = (flags >> 3) & 0x1;
	return segdesc; 
}


void init_segmentation() {
	GDT[SEG_NULL]  = make_segment(0, 0, 0, 0); 
	GDT[SEG_KCODE] = make_segment(0, 0xFFFFF, 0x9A, 0xC);
	GDT[SEG_KDATA] = make_segment(0, 0xFFFFF, 0x92, 0xC);
	GDT[SEG_UDATA] = make_segment(0, 0xFFFFF, 0xF2, 0xC);
	GDT[SEG_UCODE] = make_segment(0, 0xFFFFF, 0xFA, 0xC);
	/* TODO, fix this, this is only for debugging purposes */
	memset(&TSS, 0, sizeof(TSS));
	TSS.esp0 = (u32)&istack_top;
	TSS.ss0 = SEG_KDATA * 8;
	GDT[SEG_TSS]   = make_segment((u32)&TSS, sizeof(TSS), 0x89, 0x0);
	
	lgdt(GDT, sizeof(GDT));
	flush_gdt();
	flush_tss();
}
u32 page_roundup(u32 x) {
	x += PAGE_SIZE;
	x = x & ~(PAGE_SIZE-1);
	return x;
}u32 page_rounddown(u32 x) {
	x = x & ~(PAGE_SIZE-1);
	return x;
}



void pmm_init(void* start, void* end) {
	start = (u8*)page_roundup((u32)start);
	pmm.freelist = NULL;

	if (((u32)start % PAGE_SIZE) != 0) {
		panic("pmm_init(): start=%x is not page-aligned.\n", start);
	}
	for (void* i = start; i < end; i += PAGE_SIZE) {
		pmm.free_pages++;	
		struct freelist_t* new_head = (struct freelist_t*)i;
		new_head->next = pmm.freelist;
		pmm.freelist = new_head;
		
		pmm.end = i;
	}
	pmm.start = start;
	pmm.allocated_pages = 0;
	kdebug("pmm_init(): initialized pmm with start=%x, end = %x, free_pages = %d\n", pmm.start, pmm.end, pmm.free_pages);
}
void* pmm_alloc() {
	kdebug("pmm_alloc(): free_pages = %d, allocated_pages = %d ", pmm.free_pages, pmm.allocated_pages);
	if (pmm.free_pages <= 0) {
		kdebug("OOM");
		return NULL;
	}
	void* ret = pmm.freelist;
	pmm.freelist = pmm.freelist->next;
	pmm.free_pages--;
	pmm.allocated_pages++;
	kdebug("pmm_alloc(): returning %x\n", (u32)ret);
	return ret;
}
void pmm_free(void *ptr) {
	kdebug("pmm_free(): free_pages = %d, allocated_pages = %d ", pmm.free_pages, pmm.allocated_pages);
	kdebug("pmm_free(): freeing %x\n", (u32)ptr);
	struct freelist_t* p = (struct freelist_t*)ptr;
	p->next = pmm.freelist;
	pmm.freelist = p;
	pmm.allocated_pages--;
	pmm.free_pages++;
}

void vmm_map_kernel(pte_t* pgdir) {
	/* TODO: do not map .the text section as writable */
	/* TODO: add a permission arg to vmm_map() */
	/* for now we're only identity mapping [0x0:kernel_end] */
	vmm_map(pgdir, 0x0, (u32)kernel_end + (u32)kernel_begin, 0x0, PTE_PRESENT|PTE_RW);
}


void vmm_map(pte_t* pgdir, void* phys_start, u32 size, void* virutl_start, u8 perms) {
	kdebug("vmm_map(): mapping range phys[%x:%x] to virt[%x:%x]\n", phys_start, phys_start + size, virutl_start, virutl_start + size);
	u32 phys = page_rounddown((u32)phys_start);
	u32 virt = page_rounddown((u32)virutl_start);
	for (; phys < (u32)phys_start + size; phys += PAGE_SIZE, virt += PAGE_SIZE) {
		pte_t* pte = vmm_walk(pgdir, (void*)virt, 1, perms); 
		if (pte->bits.present)
			panic("remap");
		pte->as_u32 = phys | perms;
	}
}


pte_t* vmm_walk(pte_t* pgdir, void* addr, u8 alloc, u8 perms) {
#if __KERNELVERBOSE__
	kdebug("vmm_walk() : pgdir = %x, addr = %x, ", pgdir, addr);
	kdebug("vmm_walk() : addr.pde = %x, addr.pte = %x\n", VADDR_PDE(addr), VADDR_PTE(addr));
#endif
	u16 dir_index = VADDR_PDE(addr);
	
	if (PTE_EMPTY(pgdir[dir_index]) && alloc) {
		/* TODO, do not assume these permissions */
		pgdir[dir_index].as_u32 = (u32)pmm_alloc() | perms;
#if __KERNELVERBOSE__
		kdebug("vmm_walk()allocating the pgdir[%x],==>> %x \n ", dir_index, pgdir[dir_index].bits.addr_12_31);
#endif
		/* zero out the page table */
		memset((void*)((u32)pgdir[dir_index].bits.addr_12_31), 0, PAGE_SIZE);
	}
	pte_t* ptable = (pte_t*)((u32)pgdir[dir_index].bits.addr_12_31 << 12);
#if __KERNELVERBOSE__
	kdebug("vmm_walk(): returning %x\n", &ptable[VADDR_PTE(addr)]);
#endif
	return &ptable[VADDR_PTE(addr)];
}

void load_cr3(pte_t* pgdir) {
  asm volatile("movl %0,%%cr3" : : "r" (pgdir));
}


pte_t* vmm_setup_kpgdir() {
	pte_t* ret = pmm_alloc();
	memset(ret, 0, PAGE_SIZE);
	vmm_map_kernel(ret);
	return ret;
}

void print_pgdir(pte_t* pgdir) {
	kdebug("DIR %x\n", pgdir);
	for (int i = 0; i < 1024; i++) {
		if (PTE_EMPTY(pgdir[i]))
			continue;
		kdebug("... TBL %d(%x) perms(%x)\n", i, pgdir[i].bits.addr_12_31, pgdir[i].as_u32 & 0xfff);
		pte_t* table = (pte_t*)((u32)pgdir[i].bits.addr_12_31 << 12);
		for (int j = 0; j < 1024; j++) {
			if (PTE_EMPTY(table[j]))
				continue;
			kdebug("... ... PTE %d(%x)", j, (u32)table[j].bits.addr_12_31 << 12);
			kdebug("ADDR=%x, phys(%x) => virt(%x), perms(%x)\n", &table[j], table[j].bits.addr_12_31 << 12, 
					VADDR(i, j, 0), table[j].as_u32 & 0xfff);
		}
	}
}
