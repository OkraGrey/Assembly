INCLUDE Irvine32.inc
INCLUDE MACROS.INC
.stack 4096

.data 
;-------------------------------------------------------------------------
;Hasnain Sohail trying git hub
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
count = 0 ; used in addCustomer
x dword 0
y dword 0
;-------------------------------------------------------------
;DESTINATIONS PART IS HERE --> SECTION 2
count2 = 0
destinations BYTE "SELECT ANY OF THE FOLLOWING DESTINATIONS FOR YOUR TRAVEL : ",10
BYTE "		1-Islamabad",10
BYTE "		2-Heathrow",10
BYTE "		3-NewYork",10
BYTE "		4-Moscow",10
BYTE "		5-Mexico",10
BYTE "		6-Tehran",10 
BYTE "		7-Beijing",10
BYTE "		8-Oslo",10
BYTE "		9-Kabul",10
BYTE "		10-Sana",10
inputDest dword ?  ;it will be used to store input taken from the user (DESTINATION)
;-------------------------------------------------------------------------
;Portion Number 3 Selection of Destination
;-------------------------------------------------------------------------
;1------------------------------
islamabad1 BYTE "  1- MONDAY : ",10
BYTE "	PIA PK747",10
BYTE "	BOEING 747",10
BYTE "  DEPARTURE TIME : 4:30 PM ",10
BYTE "  FAIR : Rs.30,000 (BUISNESS CLASS)",10
BYTE "---------------------------",0
islamabad2 BYTE "  2- WEDNESDAY : ",10
BYTE "  PIA PK243",10
BYTE "  FOKER",10
BYTE "  TIME : 3:00 PM",10
BYTE "  FAIR : Rs.30,000 (BUISNESS CLASS)",10
;------------------------------
BYTE "---------------------------",0
islamabad3 BYTE "  3- SUNDAY : ",10
BYTE "  PIA PK239",10
BYTE "  AIRBUS A320",10
BYTE "  TIME : 12:00 PM",10
BYTE "  FAIR : Rs.30,000 (BUISNESS CLASS)",0
;------------------------------
;2------------------------------
heathrow1 BYTE "  1- WEDNESDAY : ",10
BYTE "	PIA PK720",10
BYTE "	AIRBUS A380",10
BYTE "  DEPARTURE TIME : 3:30 PM ",10
BYTE "  FAIR : Rs.260,000 (BUISNESS CLASS)",10
BYTE "---------------------------",0
heathrow2 BYTE "  2- THURSDAY : ",10
BYTE "  EMIRATES 176E4",10
BYTE "  AIRBUS A380",10
BYTE "  TIME : 4:30 AM",10
BYTE "  FAIR : Rs.300,000 (BUISNESS CLASS)",0
;------------------------------
;3------------------------------
newyork1 BYTE "  1- TUESDAY : ",10
BYTE "	PAN AMERICAN AIRLINE",10
BYTE "	PAN299",10
BYTE "	BOEING 700X",10
BYTE "  DEPARTURE TIME : 12:00 AM ",10
BYTE "  FAIR : Rs.270,000 (BUISNESS CLASS)",10
BYTE "---------------------------",0
newyork2 BYTE "  2- FRIDAY : ",10
BYTE "  PIA PK630",10
BYTE "  BOEING 747",10
BYTE "  TIME : 4:30 AM",10
BYTE "  FAIR : Rs.250,000 (BUISNESS CLASS)",0
;------------------------------
;4------------------------------
moscow1 BYTE "  1- WEDNESDAY : ",10
BYTE "	EMIRATES 176E9",10
BYTE "	AIRBUS A350",10
BYTE "  DEPARTURE TIME : 06:00 AM ",10
BYTE "  FAIR : Rs.270,000 (BUISNESS CLASS)",10
BYTE "---------------------------",0
moscow2 BYTE "  2- SATURDAY : ",10
BYTE "  AEROFLOT AILINE",10
BYTE "  AA907",10
BYTE "  AIRBUS A900",10
BYTE "  TIME : 4:30 AM",10
BYTE "  FAIR : Rs.200,000 (BUISNESS CLASS)",0
;------------------------------
;5------------------------------
mexico1 BYTE "  1- MONDAY : ",10
BYTE "	PIA Pk240 ",10
BYTE "	BOEING 700X",10
BYTE "  DEPARTURE TIME : 2:00 PM ",10
BYTE "  FAIR : Rs.240,000 (BUISNESS CLASS)",10
BYTE "---------------------------",0
mexico2 BYTE "  2- THURSDAY : ",10
BYTE "  QATAR AILINE",10
BYTE "  QA107",10
BYTE "  AIRBUS A320",10
BYTE "  TIME : 7:30 AM",10
BYTE "  FAIR : Rs.260,000 (BUISNESS CLASS)",0
;-------------------------------
;6------------------------------
tehran1 BYTE "  1- WEDNESDAY : ",10
BYTE "	EMIRATES 176E0 ",10
BYTE "	BOEING 747",10
BYTE "  DEPARTURE TIME : 06:00 PM ",10
BYTE "  FAIR : Rs.185,000 (BUISNESS CLASS)",10
BYTE "---------------------------",0
tehran2 BYTE "  2- SATURDAY : ",10
BYTE "  AIR IRAN",10
BYTE "  AI201I",10
BYTE "  AIRBUS A320",10
BYTE "  TIME : 4:30 PM",10
BYTE "  FAIR : Rs.190,000 (BUISNESS CLASS)",0
;------------------------------

;7------------------------------
bejing1 BYTE "  1- TUESDAY : ",10
BYTE "	AIR CHINA ",10
BYTE "	AC09CD ",10
BYTE "	BOEING 747",10
BYTE "  DEPARTURE TIME : 08:00 AM ",10
BYTE "  FAIR : Rs.110,000 (BUISNESS CLASS)",10
BYTE "---------------------------",0
bejing2 BYTE "  2- THURSDAY : ",10
BYTE "  PIA PK505",10
BYTE "  ATR TURBOPOP-42",10
BYTE "  TIME : 6:30 PM",10
BYTE "  FAIR : Rs.90,000 (BUISNESS CLASS)",0
;------------------------------
;8------------------------------
oslo1 BYTE "  1- SUNDAY : ",10
BYTE "	EMIRATES ",10
BYTE "	176E91X ",10
BYTE "	BOEING 747",10
BYTE "  DEPARTURE TIME : 02:00 AM ",10
BYTE "  FAIR : Rs.290,000 (BUISNESS CLASS)",10
BYTE "---------------------------",0

;9------------------------------
kabul1 BYTE "  1- TUESDAY : ",10
BYTE "	PIA PK203",10
BYTE "	BOEING 747",10
BYTE "  DEPARTURE TIME : 2:30 PM ",10
BYTE "  FAIR : Rs.120,000 (BUISNESS CLASS)",10
BYTE "---------------------------",0
kabul2 BYTE "  2- WEDNESDAY : ",10
BYTE "  PIA PK293",10
BYTE "  ATR TUBOPOP-42",10
BYTE "  TIME : 04:30 PM",10
BYTE "  FAIR : Rs.120,000 (BUISNESS CLASS)",0
;------------------------------
kabul3 BYTE "---------------------------",10
BYTE "  3- SUNDAY : ",10
BYTE "  PIA PK200",10
BYTE "  ATR TURBOPOP-42",10
BYTE "  TIME : 11:00 AM",10
BYTE "  FAIR : Rs.120,000 (BUISNESS CLASS)",0
;------------------------------
;10------------------------------
sana1 BYTE "  1- THURSDAY : ",10
BYTE "	PIA PK203",10
BYTE "	BOEING 747",10
BYTE "  DEPARTURE TIME : 12:30 PM ",10
BYTE "  FAIR : Rs.210,000 (BUISNESS CLASS)",10
BYTE "---------------------------",0
sana2 BYTE "  2- SATURDAY : ",10
BYTE "  EMIRATES 176E4",10
BYTE "  BOEING 700X",10
BYTE "  TIME : 03:00 PM",10
BYTE "  FAIR : Rs.240,000 (BUISNESS CLASS)",0
;------------------------------
BYTE "---------------------------",0
sana3 BYTE "  3- SUNDAY : ",10
BYTE "  PIA PK200",10
BYTE "  ATR TURBOPOP-42",10
BYTE "  TIME : 11:00 AM",10
BYTE "  FAIR : Rs.120,000 (BUISNESS CLASS)",0
;------------------------------
invalid BYTE "You entered an invalid input ",0 
optionss BYTE "SELECT ANY OF THE FOLLOWING: ",0

fair dword 0


;---------------------------------------FOR COPY PROCEDURE
recIndex dword 0
tickets BYTE 5000 DUP(?)

called Dword 0












.code
;-------------------------------------------------------------------------
main proc

.WHILE called <20

	

	;call crlf
	;mov ecx , 5
	;a:
	;count values
	;loop a
	;call listAll
	
	call addCustomer
	call crlf
	call displayDestinations
	call readint
	mov inputDest , eax
	call crlf
	;-----------------------------------------------
	;If else structure for chosing between destinations
	cmp eax , 1
	je isbl
	cmp eax ,2
	je heath
	cmp eax ,3
	je ny
	cmp eax ,4
	je mos
	cmp eax ,5
	je mex
	cmp eax ,6
	je teh
	cmp eax ,7
	je bchina
	cmp eax ,8
	je osl
	cmp eax ,9
	je kab
	cmp eax ,10
	je san
	jne wrng

	;1-
	isbl:
		mwrite "You have Chosed Islamabad "
		call crlf
		mwrite "         SHEDULE       "
		call crlf
		mov edx ,offset islamabad1
		call writestring
		call crlf
		mov edx ,offset islamabad2
		call writestring
		call crlf
		mov edx ,offset islamabad3
		call writestring
		call crlf

		mov edx ,offset optionss
		call writestring

		call readint
			cmp eax , 1
			je  isbl1
			cmp eax , 2
			je  isbl2
			cmp eax , 3
			je  isbl3
			jne wrng
		
		mov fair , 30000
		jmp done 
	
	;2-
	heath:
		mwrite "You have Chosed Heathrow ,UK "
		call crlf
		mwrite "         SHEDULE       "
		call crlf
		mov edx ,offset heathrow1
		call writestring
		call crlf
		mov edx ,offset heathrow2
		call writestring
		call crlf
		mov edx ,offset optionss
		call writestring

		call readint
		cmp eax , 1
			je  heath1
			cmp eax , 2
			je  heath2
			jne wrng
		
		mov fair , 130000
		jmp done 
	
	;3-
	ny:
		mwrite "You have Chosed NewYork "
		call crlf
		mwrite "         SHEDULE       "
		call crlf
		mov edx ,offset newyork1
		call writestring
		call crlf
		mov edx ,offset newyork2
		call writestring
		call crlf
		mov edx ,offset optionss
		call writestring

		call readint
		cmp eax , 1
			je  ny1
			cmp eax , 2
			je  ny2
			jne wrng
		mov fair , 180000
		jmp done 
	
	;4-
	mos:
		mwrite "You have Chosed Moscow "
		call crlf
		mwrite "         SHEDULE       "
		call crlf
		mov edx ,offset moscow1
		call writestring
		call crlf
		mov edx ,offset moscow2
		call writestring
		call crlf
		mov edx ,offset optionss
		call writestring

		call readint
		cmp eax , 1
			je  mos1
			cmp eax , 2
			je  mos2
			jne wrng
		mov fair , 190000
		jmp done
	
	;5-
	mex:
		mwrite "You have Chosed Mexico "
		call crlf
		mwrite "         SHEDULE       "
		call crlf
		mov edx ,offset mexico1
		call writestring
		call crlf
		mov edx ,offset mexico2
		call writestring
		call crlf
		mov edx ,offset optionss
		call writestring

		call readint
		cmp eax , 1
			je  mex1
			cmp eax , 2
			je  mex2
			jne wrng
		mov fair , 270000
		jmp done 
	
	;6-
	teh:
		mwrite "You have Chosed Tehran "
		call crlf
		mwrite "         SHEDULE       "
		call crlf
		mov edx ,offset tehran1
		call writestring
		call crlf
		mov edx ,offset tehran2
		call writestring
		call crlf
		mov edx ,offset optionss
		call writestring

		call readint
		cmp eax , 1
			je  teh1
			cmp eax , 2
			je  teh2
			jne wrng
		mov fair , 120000
		jmp done 
	
	;7-
	bchina:
		mwrite "You have Chosed China "
		call crlf
		mwrite "         SHEDULE       "
		call crlf
		mov edx ,offset bejing1
		call writestring
		call crlf
		mov edx ,offset bejing2
		call writestring
		call crlf
		mov edx ,offset optionss
		call writestring

		call readint
		cmp eax , 1
			je  bchina1
			cmp eax , 2
			je  bchina2
			jne wrng
		mov fair , 110000
		jmp done 
	
	;8-
	osl:
		mwrite "You have Chosed Oslo "
		call crlf
		mwrite "         SHEDULE       "
		call crlf
		mov edx ,offset oslo1
		call writestring
		call crlf
		mov edx ,offset optionss
		call writestring

		call readint
		cmp eax , 1
			je  osl1
			jne wrng
		mov fair , 290000
		jmp done 
	
	;9-
	kab:
		mwrite "You have Chosed Kabul , Afghanistan "
		call crlf
		mwrite "         SHEDULE       "
		call crlf
		mov edx ,offset kabul1
		call writestring
		call crlf
		mov edx ,offset kabul2
		call writestring
		call crlf
		mov edx ,offset kabul3
		call writestring
		call crlf
		mov edx ,offset optionss
		call writestring

		call readint
		cmp eax , 1
			je  kab1
			cmp eax , 2
			je  kab2
			cmp eax , 3
			je  kab3
			jne wrng
		mov fair , 120000
		jmp done 
	
	;10-
	san:
		mwrite "You have Chosed Sana , Yemen "
		call crlf
		mwrite "         SHEDULE       "
		call crlf
		mov edx ,offset sana1
		call writestring
		call crlf
		mov edx ,offset sana2
		call writestring
		call crlf
		mov edx ,offset sana3
		call writestring
		call crlf
		mov edx ,offset optionss
		call writestring

		call readint
		cmp eax , 1
			je  san1
			cmp eax , 2
			je  san2
			cmp eax , 3
			je  san3

			jne wrng
		mov fair , 210000
		jmp done 

	wrng:
		mov edx , offset invalid
		call writestring
		jmp done
	isbl1:
		call crlf 
		call crlf
		mwrite "You have chosed"
		call crlf
		mwrite "1- MONDAY : "

		mov edx , offset islamabad1
		call copy

		jmp done
	isbl2:
		call crlf 
		call crlf
		mwrite "You have chosed"
		call crlf
		mwrite "2- WEDNESDAY : "
		mov edx , offset islamabad2
		call copy
		jmp done
	isbl3:
		call crlf 
		call crlf
		mwrite "You have chosed"
		call crlf
		mwrite "3- SUNDAY : "
		mov edx , offset islamabad3
		call copy
		jmp done
	heath1:
		call crlf 
		call crlf
		mwrite "You have chosed"
		call crlf
		mwrite "1- WEDNESDAY : "
		mov edx , offset heathrow1
		call copy
		jmp done
	heath2:
		call crlf 
		call crlf
		mwrite "You have chosed"
		call crlf
		mwrite "2- THURSDAY : "
		mov edx , offset heathrow2
		call copy
		jmp done
	ny1:
		call crlf 
		call crlf
		mwrite "You have chosed"
		call crlf
		mwrite "1- TUESDAY : "
		mov edx , offset newyork1
		call copy
		jmp done
	ny2:
		call crlf 
		call crlf
		mwrite "You have chosed"
		call crlf
		mov edx , offset newyork2
		call copy
		mwrite "2- FRIDAY : "
		jmp done
	mos1:
		call crlf 
		call crlf
		mwrite "You have chosed"
		call crlf
		mwrite "1- WEDNESDAY : "
		mov edx , offset moscow1
		call copy
		jmp done
	mos2:
		call crlf 
		call crlf
		mwrite "You have chosed"
		call crlf
		mwrite " 2- SATURDAY : "
		mov edx , offset moscow2
		call copy
		jmp done
	mex1:
		call crlf 
		call crlf
		mwrite "You have chosed"
		call crlf
		mwrite "1- MONDAY : "
		mov edx , offset mexico1
		call copy
		jmp done
	mex2:
		call crlf 
		call crlf
		mwrite "You have chosed"
		call crlf
		mwrite "2- THURSDAY : "
		mov edx , offset mexico2
		call copy
		jmp done
	teh1:
		call crlf 
		call crlf
		mwrite "You have chosed"
		call crlf
		mwrite "1- WEDNESDAY : "
		mov edx , offset tehran1
		call copy
		jmp done
	teh2:
		call crlf 
		call crlf
		mwrite "You have chosed"
		call crlf
		mwrite "2- SATURDAY : "
		mov edx , offset tehran2
		call copy
		jmp done
	bchina1:
		call crlf 
		call crlf
		mwrite "You have chosed"
		call crlf
		mwrite "1- TUESDAY : "
		mov edx , offset bejing1
		call copy
		jmp done
	bchina2:
		call crlf 
		call crlf
		mwrite "You have chosed"
		call crlf
		mwrite "2- THURSDAY : "
		mov edx , offset bejing2
		call copy
		jmp done
	osl1:
		call crlf 
		call crlf
		mwrite "You have chosed"
		call crlf
		mwrite "1- SUNDAY : "
		mov edx , offset oslo1
		call copy
		jmp done
	kab1:
		call crlf 
		call crlf
		mwrite "You have chosed"
		call crlf
		mwrite "1- TUESDAY : "
		mov edx , offset kabul1
		call copy
		jmp done
	kab2:
		call crlf 
		call crlf
		mwrite "You have chosed"
		call crlf
		mwrite "2- WEDNESDAY : "
		mov edx , offset kabul2
		call copy
		jmp done
	kab3:
		call crlf 
		call crlf
		mwrite "You have chosed"
		call crlf
		mwrite "3- SUNDAY : "
		mov edx , offset kabul3
		call copy
		jmp done
	san1:
		call crlf 
		call crlf
		mwrite "You have chosed"
		call crlf
		mwrite "1- THURSDAY : "
		mov edx , offset sana1
		call copy
		jmp done
	san2:	
		call crlf 
		call crlf
		mwrite "You have chosed"
		call crlf
		mwrite " 2- SATURDAY :  "
		mov edx , offset sana2
		call copy
		jmp done
	san3:	
		call crlf 
		call crlf
		mwrite "You have chosed"
		call crlf
		mwrite " 3- SUNDAY :  "
		mov edx , offset sana3
		call copy
		jmp done
	

	done : 
		call crlf
		mwrite "Iteration done"
		call crlf
.ENDW
	mwrite "All Tickets have been sold"

	;----------------------------------------------------------------

exit
main endp


;---------------------------------------------------------

;----------------------------------------------------------
;Display Destinations
;----------------------------------------------------------
displayDestinations PROC
	push edx
	push ecx
	push eax

	mov edx, offset destinations
	call writestring
	call crlf

	pop eax
	pop ecx 
	pop edx

	ret
	displayDestinations ENDP
;-----------------------------------------------------------------------




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
	;mov eax , count ; initially count = 0
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
;----------------------------------------------------------------------------------------------
;Copy : It copies the ticket data into tickets array
;It will take edx as an argument having offset of source to be copied 
;----------------------------------------------------------------------------------------------
copy proc
    push esi
    push eax
    push ecx

            mov esi, recIndex ;recIndex means total tickets
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
            mov tickets[esi],al
			inc edx
			inc esi
			loop l1
		inc recIndex
		inc called
       pop ecx
       pop eax
       pop esi
                    ret
copy endp
end main