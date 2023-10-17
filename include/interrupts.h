#pragma once
#include <x86.h>
void idt_set_gate(int index, idt_entry_t entry);
void init_idt();
void init_pic(u8 master_offset, i8 slave_offset);
void init_interrupts();
void handle_interrupt(trapframe_t* trapframe); /* every interrupt goes through this func*/
void handle_fault(trapframe_t* trapframe); /* interrupts 0-31 */
void handle_irq(trapframe_t* trapframe); /* interrupts 32-48(IRQs) */
