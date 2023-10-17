#include <boot/multiboot.h>
#include <memory.h>
#include <interrupts.h>
#include<libc/libc.h>
#include <uart.h>
#include <util.h>
extern char kernel_text_end[];
extern char kernel_data_end[];
extern char kernel_end[];
extern char kernel_begin[];
extern pte_t* kpgdir; /* memory.c */
char buf[0x100000];
void func(char a[]) {}

int kmain(multiboot_info_t* minfo) {
	char *vidmem = (char*) 0xb8000;
	
	func(kernel_text_end);
	func(kernel_data_end);
	func(kernel_end);
	func(kernel_begin);

	char *str = "hi, we in kernel.\r\n";
	int index = 0;
	char *ptr = str;
	for (int i = 0; i < 80*26; i++)
		vidmem[i] = ' ';
	while (*ptr != '\0') {
		vidmem[index] = *ptr;
		ptr++;
		index += 2;
	}
	cli();
	init_segmentation();
	init_interrupts();
	sti();
	asm volatile("int $111");
	asm volatile("int $40");
	asm volatile("int $113");
	asm volatile("int $114");
	asm volatile("int $34");	
	uart_init(COM1, 115200);
	kdebug("wasup?");
	pmm_init((u8*)kernel_end, (u8*)(minfo->mem_upper * 1024));
	char *sstr = "hello, world";
	char* buffer = pmm_alloc();
	int i = 0;
	for (char *c = sstr; *c != '\0'; ++c) {
		buffer[i] = sstr[i];
		++i;
	}
	kdebug("this buffer=> %s <= was allocated using pmm_alloc().\n", buffer);
	void *a = pmm_alloc();
	void *b = pmm_alloc();
	void *c = pmm_alloc();
	void *d = pmm_alloc();
	void *e = pmm_alloc();
	void *ee = pmm_alloc();
	void *f = pmm_alloc();
	void *g = pmm_alloc();
	pmm_free(buffer);
	void *h = pmm_alloc();
	pmm_free(a);	
	pmm_free(b);	
	pmm_free(c);	
	pmm_free(d);	
	pmm_free(e);	
	pmm_free(f);	
	pmm_free(g);	
	pmm_free(h);	
	pte_t j;
	j.bits.present = 1;
	j.bits.rw = 1;
	j.bits.addr_12_31 = (u32)pmm_alloc() >> 12;
	kdebug("j.as_u32 = %x\n", j.as_u32);
	kdebug("0xdeadb00b(pd, pt, o) = (%x, %x, %x)\n",
			VADDR_PDE(0xdeadb00b), VADDR_PTE(0xdeadb00b), VADDR_OFFSET(0xdeadb00b));
	kdebug("reconstructing 0xdeadb00b: %x\n", VADDR(0x37a, 0x2db, 0xb));
	
	pte_t* pagedir = pmm_alloc();
	memset((void*)pagedir, 0, PAGE_SIZE);
	vmm_walk(pagedir, (void*)0xdeadb00b, 1, 3);
	vmm_walk(pagedir, (void*)0x0, 1, 3);
	vmm_walk(pagedir, (void*)0xf, 1, 3);
	vmm_walk(pagedir, (void*)0xffff, 1, 3);
	vmm_walk(pagedir, (void*)0xcafebabe, 1, 3);
	cli();
	
	kpgdir = vmm_setup_kpgdir();
	load_cr3(kpgdir);
	print_pgdir(kpgdir);
	enable_paging(); 
	sti();
	char* ptrptr =(void*)0x504000 + 4097;
	*ptrptr = 'A'; /* page fault test */
	index = 0;
	for (int i = 0; i < 0x10000; i++) {
		*(ptrptr+i) = (i + 21) % 126;
		vidmem[(100 + index + i)% 1000] = *(ptrptr + i);	
		index += 1;
	}
	
	ptrptr = (void*) kernel_begin + 3;
	*ptrptr = 'B';
	asm volatile("int $5");	
	asm volatile("int $5");	
	asm volatile("int $5");	
	return minfo->mem_lower;
}

