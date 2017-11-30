include ksamd64.inc
EXTERN hook:NEAR

.code

medium  PROC
	
	; https://docs.microsoft.com/en-us/cpp/build/caller-callee-saved-registers

	push rax ; return value
	push rcx
	push RBX
	push RBP
	push RDI
	push RSI
	push RSP
	push R12
	push R13
	push R14
	push R15 

	; without this it crashes :)
	sub rsp, 1000h
	mov rdx, rax
	mov rcx, r10
	call hook
	add rsp, 1000h

	pop R15 
	pop R14
	pop R13
	pop R12
	pop RSP
	pop RSI
	pop RDI
	pop RBP
	pop RBX
	pop rcx
	pop rax

    jmp R10
medium  ENDP
 
END