#include <x86.h>
#include <libc/libc.h>
#include <interrupts.h>
#include <util.h>
#include <memory.h>

static idt_entry_t IDT[256];
volatile static int index = 0;
extern u32 asm_isr_array[256];
/* temporary for debugging purposes */
static int debug_index = 0;
static char *vidmem = (char*) 0xb8000;

void idt_set_gate(int index, idt_entry_t entry) {
	/* TODO bound checking */
	IDT[index] = entry;
}

void init_idt() {
	memset(IDT, 0, IDT_SIZE);
	for (int i = 0; i < 256; i++) {
		idt_set_gate(i, IDT_ENTRY(asm_isr_array[i], SEG_KCODE * 8, IDT_ATTR(GATE_TYPE_INTERRUPT32, 0, 1))); 
	}

	lidt(IDT, IDT_SIZE);
}
void init_pic(u8 master_offset, i8 slave_offset)
{
	u8 icw1 = PIC_ICW1_INIT | PIC_ICW1_4BYTE_VECTORS |  PIC_ICW1_CASCADE | PIC_ICW1_ICW4;
	outb(PIC_MASTER_CPORT, icw1);
	outb(PIC_SLAVE_CPORT, icw1);
	
	outb(PIC_MASTER_DPORT, master_offset);
	outb(PIC_SLAVE_DPORT, slave_offset);

	outb(PIC_MASTER_DPORT, 4); /* 0b100, meaning the second(3rd bit) 
								* IRQ is connected to a slave */
	outb(PIC_SLAVE_DPORT, 2); /* which master IRQ is it connected to ?*/

	u8 icw4 = PIC_ICW4_8086_MODE | PIC_ICW4_NOBUF_MASTER | PIC_ICW4_NOBUF_SLAVE;
	outb(PIC_MASTER_DPORT, icw4);
	outb(PIC_SLAVE_DPORT, icw4);

	/* unmask every irq */
	/* TODO keep track of masked IRQs */
	outb(PIC_MASTER_DPORT, 0x0);
	outb(PIC_SLAVE_DPORT, 0x0);
}

void init_interrupts() {
	cli();
	init_idt();
	init_pic(32, 40);
	sti();
}

void handle_interrupt(trapframe_t* trapframe) {
	/* TODO panic if trapframe->trapno < 0 */
	if (trapframe->trapno <= 31)
		handle_fault(trapframe);
	else if (trapframe->trapno <= 48)
		handle_irq(trapframe);
	else {
		/* TODO panic if we don't hanlde trapframe->trapno */
		vidmem[index] = 'U';
		index += 2;
	}
}

void handle_fault(trapframe_t* trapframe) {
	kdebug("fault : trapframe: \n");
	kdebug("... trapno = %x: \n", trapframe->trapno);
	kdebug("... errcode = %x: \n", trapframe->errcode);
    
	u32 addr, pgdir;
    asm("\t movl %%cr2 ,%0" : "=r"(addr));
    asm("\t movl %%cr3 ,%0" : "=r"(pgdir));
	if (trapframe->trapno == 0xe) {
		disable_paging();
		kdebug("...Cr2 = %x\n", addr);
		pte_t* dir = (pte_t*) pgdir;
		pte_t* pg = vmm_walk(dir, (void*)addr, 1, 3);
		pg->bits.addr_12_31 = (u32)pmm_alloc() >> 12;
		pg->bits.present = 1;
		pg->bits.rw = 1;
		enable_paging();
	}
	vidmem[index] = 'F';
	index += 2;
}
void handle_irq(trapframe_t* trapframe) {
	vidmem[index] = 'I';
	index += 2;
}
