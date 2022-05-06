Include Irvine32.inc
INCLUDE MACROS.INC
.stack 4096
.data

filefare Byte "fare.txt",0,0
filehandle dword ?

fares dword 20 dup(0)
fair dword 150231
lcw dword 0
.code
main Proc

mov ecx , 20
mov esi ,lcw
l1:


mov eax, fair
inc eax
mov fares[esi],eax

	
	call crlf
	mov eax , fares[esi]
	call writeint
	call crlf
	add lcw ,4
	
loop l1
exit 
main endp



end main