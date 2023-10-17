; TODO don't hardcode the kernel code segment selector
; the gdt is already loaded.
[section text]
global flush_gdt
flush_gdt:
	pusha

	mov ax, 0x10 ; kernel data segment selector 
	mov ds, ax
	mov es, ax
    mov fs, ax
    mov gs, ax
    mov ss, ax
	jmp 0x8:.done ; far jump to realod the CS register
.done:
	popa
	ret

