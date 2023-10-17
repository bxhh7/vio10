#include <x86.h>
inline void outb(u16 port, u8 data) { 
	asm volatile("out %0, %1" : : "a" (data), "d" (port));
}

inline void outw(u16 port, u8 data) {
  asm volatile("out %0,%1" : : "a" (data), "d" (port));
}

inline void outstr(u16 port, u8* address, u32 size) {
  asm volatile("cld; rep outsl" :
               "=S" (address), "=c" (size) :
               "d" (port), "0" (address), "1" (size) :
               "cc");
}

inline u8 inb(u16 port) {
	u8 data;
	asm volatile("in %1, %0" : "=a" (data) : "d" (port)); 
	return data;
}

inline void instr(u16 port, u8* address, u32 size) {

  asm volatile("cld; rep insl" :
               "=D" (address), "=c" (size) :
               "d" (port), "0" (address), "1" (size) :
               "memory", "cc");
}

inline void sti() {
	asm volatile("sti");
}

inline void cli() {
	asm volatile("cli");
}

inline void lgdt(segment_descriptor_t* segments, u16 size) {
	gdt_descriptor_t gdtdesc; 
	gdtdesc.size = size;
	gdtdesc.address = (u32)segments;
	asm volatile("lgdt (%0)" : : "r" (&gdtdesc));
}

inline void lidt(idt_entry_t* idt, u16 size) {
	idt_descriptor_t idtdesc;
	idtdesc.size = size - 1;
	idtdesc.address = (u32) idt;
	asm volatile("lidt (%0)" : : "r" (&idtdesc));
}
inline void nop() {
	asm volatile("nop");
}
