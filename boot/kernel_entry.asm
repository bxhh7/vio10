[SECTION .multiboot]
align 4
mb_magic: dd 0x1BADB002
mb_flags: dd 0b00000000000000000000000000000111
mb_checksum: dd (-0x1BADB002 - 0b00000000000000000000000000000111)
mb_pading: times 31 - ($ - $$) db 1
mb_mode_type: dd 0x1
mb_width: dd 0x0
mb_height: dd 0x0

section .bss
align 16
global stack_top
stack_bottom:
resb 0x100000 
stack_top:



; this is used for the TSS when the system boots, apparently QEMU requires a TSS to be present even when 
; the interrupt doesnt occur in ring < DPL, i checked it in a debugger and it doesnt use the TSS, it just 
; requires it to be present. i don't know what's the deal with that, i don't want to mess up the main 
; kernel stack so i thought better not risk it and reserve another stack for the initalization stages of the kernel.
section .bss
align 16
global istack_top 
istack_bottom:
resb 0x100000
istack_top:

[SECTION .text]
global entry 
entry:
	mov esp, stack_top
	mov byte [0x8b000], 'X'
	extern kmain
	push ebx
	call kmain

	cli 
	hlt
	jmp $

