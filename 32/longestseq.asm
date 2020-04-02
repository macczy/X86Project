    section .text
    global longestseq ;32 bit version
longestseq:
	push ebp
    mov ebp, esp
	sub esp, 4
	
    push ebx
	push esi
	push edi
	
    mov eax, [ebp + 8] ;text to eax
	mov ecx, [ebp + 12] ;pattern to ecx
	
	mov ebx, 0 ;length of the current string in ebx set to 0
	mov esi, 0 ;max length of the string set to 0
	mov edi, eax ;save in edi pointer to the begining of the longest string matching pattern
	
	dec eax
loop:
	inc eax
	mov dl, [eax] ;remember next char to dl
	test dl, dl
	jz end
	
	mov ecx, [ebp + 12] ;pattern to ecx
isInPatternLoop:
	mov dh, [ecx] ;remember next pattern char in dh
	test dh, dh
	jz notInPattern ;end of pattern string
	cmp dh, dl
	je inPattern
	inc ecx
	jmp isInPatternLoop
notInPattern:
	mov ebx, 0 ;char not matching pattern - set current length as 0
	jmp loop
	
inPattern:
	inc ebx ;increment current string length
	cmp ebx, esi ;compare current and max length
	jle loop ;if current string is shorter than max, next iteration
	mov edi, eax
	sub edi, esi ;save in edi pointer to the beginning of the longest string matching pattern
	inc esi ;increment max string length
	jmp loop
end:
	mov eax, edi
	add edi, esi
	mov byte [edi], 0 ;terminate the desired string
	
	add esp, 4
	pop edi
	pop esi
    pop ebx
	pop ebp
    ret