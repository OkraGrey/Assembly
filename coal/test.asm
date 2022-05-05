Include Irvine32.inc
INCLUDE MACROS.INC
.stack 4096
.data

ddata dword ?
filename Byte "names.txt",0
filecnic Byte "cnic.txt",0
fileticket Byte "tickets.txt",0

customerNames BYTE "aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa", 400 dup(?)
customerCnic BYTE "nbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbb", 400 dup(0)
tickets BYTE "ccccccccccccccccccccccccccccccccccccccccccccc", 5000 DUP(0)

filehandle DWORD ?

.code
main Proc

	INVOKE CreateFile ,ADDR filename,GENERIC_WRITE,DO_NOT_SHARE,NULL,CREATE_ALWAYS,FILE_ATTRIBUTE_NORMAL,0 
	
	INVOKE WriteFile ,eax,ADDR customerNames,sizeof customerNames,NULL,NULL   
	
	INVOKE CreateFile ,ADDR filecnic,GENERIC_WRITE,DO_NOT_SHARE,NULL,CREATE_ALWAYS,FILE_ATTRIBUTE_NORMAL,0 
	INVOKE WriteFile ,eax,ADDR customerCnic,sizeof customerCnic,NULL,NULL   
	
	INVOKE CreateFile ,ADDR fileticket,GENERIC_WRITE,DO_NOT_SHARE,NULL,CREATE_ALWAYS,FILE_ATTRIBUTE_NORMAL,0 
	INVOKE WriteFile ,eax,ADDR tickets,sizeof tickets,NULL,NULL   
	

exit 
main endp



end main