section .text
global enable_paging
global disable_paging
enable_paging:
	push eax	
	mov eax, cr0
	or eax, 0x80010001 
	mov cr0, eax
	pop eax
	ret

disable_paging:
	push eax
	mov eax, cr0
	and eax, 0x7ffffffe
	mov cr0, eax
	pop eax
	ret
