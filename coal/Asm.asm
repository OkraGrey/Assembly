INCLUDE Irvine32.inc

.stack 4096

.data 
;-------------------------------------------------------------------------

t BYTE "AIRLINE TICKET MANAGEMENT SYSTEM",0
explain BYTE "1-Customer details will be fetched 2 - Schedule will be displayed  3 - Fair generation 4 - Discount ",0
portion1 BYTE "CUSTOMER DETAILS"
;NOTE This program will entertain a max of 20 customers
;customer credentials , fname is an array that will take name , cnic
;will contain cnic 
stringName BYTE "Enter Name : ",0
stringCnic BYTE "Enter cnic : ",0
customerNames BYTE 400 dup(?)
customerCnic BYTE 400 dup(?)
ptrName DWORD customerNames
ptrCnic DWORD customerCnic
abdullah dword 0
temp dword 0
count = 0
x dword 0
y dword 0
count2 = 0



.code
;-------------------------------------------------------------------------
main proc
mov ecx , 5
a:


;count values
call addCustomer

loop a
call listAll



exit
main endp
;----------------------------------------------------------
;-ADDCUSTOMER will give a prompt to add a customer in the -
;-array specifeid at the top Customer Names and Cnic	  -
;-edx , ecx ,esi are used in the entire procedure		  -						
;-														  -
;----------------------------------------------------------
addCustomer PROC
	push edx
	push ecx
	push esi
	mov esi , x
	mov edx , offset stringName ; Enter Name : 
	call writestring
	call crlf 
	
	mov ecx , sizeof customerNames
	mov edx, offset customerNames
	add edx , x
	call readstring
	
	mov edx , offset stringCnic ; Enter Cnic : 
	call writestring
	call crlf 
	
	 
	mov ecx , sizeof customerCnic
	mov edx, offset customerCnic
	add edx , esi
	call readstring
	;mov eax , count ; initially clount = 0
	;call writeint ; 0
	;call crlf
	;mov eax , count
	;call writeint
	call crlf
	mov eax  , x   ; initial val x = 0
	add eax , 20    ; 
	mov x , eax   ; x = 20
	count = x      ; count  = 20
	;mov eax , count  ; printf count = 20
	;call writeint ;;;;0,20    20 , 40
	;if condition block is left , to ensure customers do not exceed 20
	pop esi
	pop ecx
	pop edx 
	
	ret

addCustomer ENDP

;-----------------------------------------------------------
;-ListAll works as a print all data in our proggram        -
;-It displays name at top and below cnic is mentioned	   -
;-edx , ecx ,eax are used in the entire procedure		   - 						
;-														   -
;-----------------------------------------------------------
listAll PROC
	
	push ecx
	push edx
	push eax
	mov edx ,0
	
	mov ecx , 20
	mov eax , x
	div ecx
	mov ecx ,eax 
	
	l:
		mov temp,ecx 


		mov ecx , sizeof customerNames
		mov edx,offset customerNames
		add edx , abdullah
		call writestring
		call crlf
		mov ecx , sizeof customerCnic
		mov edx,offset customerCnic
		add edx , abdullah
		call writestring
		call crlf
		add abdullah , 20
		
		mov ecx ,temp
		loop l
	pop eax
	pop edx
	pop ecx
	ret
listAll ENDP
end main