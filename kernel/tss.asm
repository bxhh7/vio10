global flush_tss
flush_tss:
	pusha
	mov ax, 40 ; = SEG_TSS, TODO don't hard code this
	ltr ax
	popa
	ret
