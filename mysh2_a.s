section .text
  global _start
    _start:
	BITS 32
	jmp short two
    one:
 	pop ebx
	xor eax, eax
	mov [ebx+12], al	; address ebx+12 = first *
	mov [ebx+17], al	; address ebx+17 = second *
	mov [ebx+22], al	; address ebx+22 = third *
	mov [ebx+27], eax	; save 0x00 for null

	mov [ebx+23],  ebx	; arg0 (/usr/bin/env)
	
	lea edx, [ebx+13]	; address of first env variable
	mov [ebx+31], edx	; address of first env0

	lea edx, [ebx+18]	; address of second env variable
	mov [ebx+35], edx	; address of second argument

	mov [ebx+39], eax	; null for ****
	xor edx, edx

	lea ecx, [ebx+23]	; arg0
	lea edx, [ebx+31]	; ****

	mov al,  0x0b
	int 0x80,
     two:
 	call one
 	db '/usr/bin/env*a=11*b=22*arg0****env0env1****'
