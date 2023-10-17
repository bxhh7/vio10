#pragma once
#include <defs.h>
#include <x86.h>

void init_segmentation(); /* sets up a Intel Flat Memory Model with segments:
						   * kernel code, kernel data, user code, user data */
struct freelist_t {
	struct freelist_t* next;
};
struct pmm_t {
	u8* start;
	u8* end;
	u32 allocated_pages;
	u32 free_pages;
	struct freelist_t* freelist;
};
typedef struct pmm_t pmm_t;
extern pmm_t pmm;

/* initializes the PMM(physcal memory manager) */
void pmm_init(void* start, void* end);

/* allocated a physcal page */
void* pmm_alloc();

/* frees an address allocated by pmm_alloc() */
void pmm_free(void* ptr);

u32 page_roundup(u32 x); 

/* returns the kernel page table with [0x0:kernel_end] identity mapped */
pte_t* vmm_setup_kpgdir();

/* maps the kernel part of page directory */
void vmm_map_kernel(pte_t* pgdir);

/* returns the entry corresponding the virtual
 * address addr in the page directory pgdir, if 
 * alloc is specified, pagetables that are needed are
 * allocated */
void vmm_map(pte_t* pgdir, void* phys_start, u32 size, void* virutl_start, u8 perms);

pte_t* vmm_walk(pte_t* pgdir, void* addr, u8 alloc, u8 perms); 
/* loads a page directory in the CR3 register */

void load_cr3(pte_t* pgdir);

/* enables paging ie setting the PE and PG flags in CR0 */
extern void enable_paging();
extern void disable_paging();

void print_pgdir(pte_t* pgdir);
