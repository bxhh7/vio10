ENTRY(entry)
kernel_offset = 0x100000;
SECTIONS
{
   . = 1M;
	PROVIDE(kernel_begin = .);
   .text BLOCK(4K) : ALIGN(4K) /*AT(kernel_offset) */
   {
      *(.multiboot)
      *(.text)
      *(.rodata)
   }
	PROVIDE(kernel_text_end = .);
   .data BLOCK(4K) : ALIGN(4K)
   {
      *(.data)
   }
	PROVIDE(kernel_data_end = .);
   .bss BLOCK(4K) : ALIGN(4K)
   {
      *(COMMON)
      *(.bss)
   }
	PROVIDE(kernel_end = .);
}

