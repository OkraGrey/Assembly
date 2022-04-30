Include Irvine32.inc
INCLUDE MACROS.INC
.stack 4096
.data

ddata dword ?


isb BYTE "You have chosed Islamabad ",10
BYTE "  SCHEDULE",10
BYTE "  1- MONDAY : ",10
BYTE "	PIA PK747",10
BYTE "	BOEING 747",10
BYTE "  DEPARTURE TIME : 4:30 PM ",10
BYTE "  FAIR : Rs.30,000 (BUISNESS CLASS)",10
BYTE "---------------------------",0
ticketNumber dword 0
mult Byte "TCIKET TEST",10,"Newn Line",10,"another",0

xyz dword ?  

tickets BYTE 4000 DUP(?)
source BYTE "hello",0
target BYTE 1000 DUP (?)



.code
main Proc
       

       mov edx , offset isb
       call strlength
       mov ddata , eax
       call writedec
       call crlf
       call crlf
       call crlf
       call crlf
       call crlf




      mov ebx ,0 
      mov esi , 0
      mov ecx , ddata
      mov xyz , offset isb
      l1:
        mov eax, [edx]
        mov target[esi], al
        inc edx
        inc esi
        loop l1


        mov ebx ,0 
      mov esi , 100
      mov ecx , lengthof isb

      l3:
        mov al, isb[ebx]
        mov target[esi], al
        inc ebx
        inc esi
;        loop l3



mov ecx , lengthof target
mov esi ,0
    l2:
        mov al , target[esi]
        call writechar
        
        inc esi
        loop l2




exit 
main endp

getTicketData Proc
    push esi 
    push eax
    ;edx contains the offset to be copied
    push ecx
    push ebx
    
       ;mov edx , offset isb already contains the desired offset
       call strlength
       mov ecx , eax
        
        mov esi ,0 
        mov eax,ticketNumber
        mov ebx , 200
        mul ebx
        add esi , ebx
        mov eax,esi
        mwrite "value of esi : "
        call writeint

        ;mov ebx , eax ;;;;Holds the starting index to save for a separate ticket (ticketnumber *200)
        ;mov xyz , offset isb    
        lx:
            mov eax ,[edx] ;how to pass string vvaribale as argument? 

            mov tickets[esi] ,al
            inc edx
            inc esi

            loop lx

         

       




getTicketData endP



end main