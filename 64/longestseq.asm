    section .text
    global longestseq ;64bit version
longestseq:
	push rbp
    mov rbp, rsp
    mov rax, rdi ;first parameter in rdi
	mov rcx, rsi ;second parameter in rsi

	mov r9d, 0 ;length of the current string in r9d set to 0
	mov r10d, 0;max length of the string in r10d set to 0
	mov r8, rax ;pointer to the longest matching string
	dec rax
	
loop:
	inc rax
	mov dl, [rax] ;remember next char to dl
	test dl, dl
	jz end
	
	mov rcx, rsi
isInPatternLoop:
	mov dh, [rcx] ;remember next pattern char in dh
	test dh, dh
	jz notInPattern ;end of pattern string
	cmp dh, dl
	je inPattern
	inc rcx
	jmp isInPatternLoop
notInPattern:

	mov r9d, 0
	jmp loop
	
inPattern:
	inc r9d
	cmp r9d, r10d
	jle loop ;if current string is shorter than max, next iteration
	;save in r8 pointer to the beginning of the longest string matching pattern
	mov r8, rax
	sub r8, r9
	inc r8
	inc r10d
	jmp loop
end:
	mov rax, r8
	add r8, r10
	mov byte [r8], 0
	
    pop rbp
    ret