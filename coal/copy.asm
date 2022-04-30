Include Irvine32.inc
INCLUDE MACROS.INC
.stack 4096
.data

ddata dword ?
source BYTE "You have chosed Islamabad ",10
BYTE "  SCHEDULE",10
BYTE "  1- MONDAY : ",10
BYTE "	PIA PK747",10
BYTE "	BOEING 747",10
BYTE "  DEPARTURE TIME : 4:30 PM ",10
BYTE "  FAIR : Rs.30,000 (BUISNESS CLASS)",10
BYTE "---------------------------",0
source2  BYTE "You have chosed Islamabad ",10
BYTE "  SCHEDULE",10
BYTE "  1- MONDAY : ",10
BYTE "	PIA PK747",10
BYTE "	BOEING 747",10
BYTE "  DEPARTURE TIME : 4:30 PM ",10
BYTE "  FAIR : Rs.30,000 (BUISNESS CLASS)",10
BYTE "---------------------------",0



dest    Byte 1000 dup(?)

recIndex dword 0



.code
main Proc
       mov edx , offset source
       call copy
       mov edx ,offset source2
       call copy
       call crlf

       mov edx , offset dest
       call writestring





       exit 
main endp
;----------------------------------------------------------------------------------------------
;Copy : It copies the ticket data into tickets array
;It will take edx as an argument having offset of source to be copied 
;----------------------------------------------------------------------------------------------
copy proc
    push esi
    push eax
    push ecx

            mov esi, recIndex
            mov eax , recIndex
            add eax ,200
            mov recIndex ,eax
   
    
            ;--------------------------
            ;initializing ecx
            call strLength
            call writeint
            mov ecx ,eax
            mov eax ,0
            ;--------------------------

            l1:
            mov al , [edx]
            mov dest[esi],al
            inc edx
            inc esi
    
       loop l1
       pop ecx
       pop eax
       pop esi
                    ret
copy endp
end main