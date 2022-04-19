INCLUDE Irvine32.inc

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
isb BYTE "You have chosed Islamabad ",10
BYTE "  SCHEDULE",10
BYTE "  1- MONDAY : ",10
BYTE "	PIA PK747",10
BYTE "	BOEING 747",10
BYTE "  DEPARTURE TIME : 4:30 PM ",10
BYTE "  FAIR : Rs.30,000 (BUISNESS CLASS)",10
BYTE "---------------------------",10
BYTE "  2- WEDNESDAY : ",10
BYTE "  PIA PK243",10
BYTE "  FOKER",10
BYTE "  TIME : 3:00 PM",10
BYTE "  FAIR : Rs.30,000 (BUISNESS CLASS)",10
;------------------------------
BYTE "---------------------------",10
BYTE "  3- SUNDAY : ",10
BYTE "  PIA PK239",10
BYTE "  AIRBUS A320",10
BYTE "  TIME : 12:00 PM",10
BYTE "  FAIR : Rs.30,000 (BUISNESS CLASS)",0
;------------------------------
;2------------------------------
heathrow BYTE "You have chosed Heathrow London , UK ",10
BYTE "  SCHEDULE",10
BYTE "  1- WEDNESDAY : ",10
BYTE "	PIA PK720",10
BYTE "	AIRBUS A380",10
BYTE "  DEPARTURE TIME : 3:30 PM ",10
BYTE "  FAIR : Rs.260,000 (BUISNESS CLASS)",10
BYTE "---------------------------",10
BYTE "  2- WEDNESDAY : ",10
BYTE "  EMIRATES 176E4",10
BYTE "  AIRBUS A380",10
BYTE "  TIME : 4:30 AM",10
BYTE "  FAIR : Rs.300,000 (BUISNESS CLASS)",0
;------------------------------
;3------------------------------
newyork BYTE "You have chosed NewYork ,US ",10
BYTE "  SCHEDULE",10
BYTE "  1- TUESDAY : ",10
BYTE "	PAN AMERICAN AIRLINE",10
BYTE "	PAN299",10
BYTE "	BOEING 700X",10
BYTE "  DEPARTURE TIME : 12:00 AM ",10
BYTE "  FAIR : Rs.270,000 (BUISNESS CLASS)",10
BYTE "---------------------------",10
BYTE "  2- FRIDAY : ",10
BYTE "  PIA PK630",10
BYTE "  BOEING 747",10
BYTE "  TIME : 4:30 AM",10
BYTE "  FAIR : Rs.250,000 (BUISNESS CLASS)",0
;------------------------------
;4------------------------------
moscow BYTE "You have chosed Moscow ,RUSSIA  ",10
BYTE "  SCHEDULE",10
BYTE "  1- WEDNESDAY : ",10
BYTE "	EMIRATES 176E9",10
BYTE "	AIRBUS A350",10
BYTE "  DEPARTURE TIME : 06:00 AM ",10
BYTE "  FAIR : Rs.270,000 (BUISNESS CLASS)",10
BYTE "---------------------------",10
BYTE "  2- SATURDAY : ",10
BYTE "  AEROFLOT AILINE",10
BYTE "  AA907",10
BYTE "  AIRBUS A900",10
BYTE "  TIME : 4:30 AM",10
BYTE "  FAIR : Rs.200,000 (BUISNESS CLASS)",0
;------------------------------
;5------------------------------
mexico BYTE "You have chosed Mexico  ",10
BYTE "  SCHEDULE",10
BYTE "  1- MONDAY : ",10
BYTE "	PIA Pk240 ",10
BYTE "	BOEING 700X",10
BYTE "  DEPARTURE TIME : 2:00 PM ",10
BYTE "  FAIR : Rs.240,000 (BUISNESS CLASS)",10
BYTE "---------------------------",10
BYTE "  2- THURSDAY : ",10
BYTE "  QATAR AILINE",10
BYTE "  QA107",10
BYTE "  AIRBUS A320",10
BYTE "  TIME : 7:30 AM",10
BYTE "  FAIR : Rs.260,000 (BUISNESS CLASS)",0
;-------------------------------
;6------------------------------
tehran BYTE "You have chosed Tehran , Iran ",10
BYTE "  SCHEDULE",10
BYTE "  1- WEDNESDAY : ",10
BYTE "	EMIRATES 176E0 ",10
BYTE "	BOEING 747",10
BYTE "  DEPARTURE TIME : 06:00 PM ",10
BYTE "  FAIR : Rs.185,000 (BUISNESS CLASS)",10
BYTE "---------------------------",10
BYTE "  2- SATURDAY : ",10
BYTE "  AIR IRAN",10
BYTE "  AI201I",10
BYTE "  AIRBUS A320",10
BYTE "  TIME : 4:30 PM",10
BYTE "  FAIR : Rs.190,000 (BUISNESS CLASS)",0
;------------------------------

;7------------------------------
bej BYTE "You have chosed Beijing , China ",10
BYTE "  SCHEDULE",10
BYTE "  1- TUESDAY : ",10
BYTE "	AIR CHINA ",10
BYTE "	AC09CD ",10
BYTE "	BOEING 747",10
BYTE "  DEPARTURE TIME : 08:00 AM ",10
BYTE "  FAIR : Rs.110,000 (BUISNESS CLASS)",10
BYTE "---------------------------",10
BYTE "  2- THURSDAY : ",10
BYTE "  PIA PK505",10
BYTE "  ATR TURBOPOP-42",10
BYTE "  TIME : 6:30 PM",10
BYTE "  FAIR : Rs.90,000 (BUISNESS CLASS)",0
;------------------------------
;8------------------------------
oslo BYTE "You have chosed oslo , Norway ",10
BYTE "  SCHEDULE",10
BYTE "  1- SUNDAY : ",10
BYTE "	EMIRATES ",10
BYTE "	176E91X ",10
BYTE "	BOEING 747",10
BYTE "  DEPARTURE TIME : 02:00 AM ",10
BYTE "  FAIR : Rs.290,000 (BUISNESS CLASS)",10
BYTE "---------------------------",0

;9------------------------------
kabul BYTE "You have chosed Kabul , Afghanistan",10
BYTE "  SCHEDULE",10
BYTE "  1- TUESDAY : ",10
BYTE "	PIA PK203",10
BYTE "	BOEING 747",10
BYTE "  DEPARTURE TIME : 2:30 PM ",10
BYTE "  FAIR : Rs.120,000 (BUISNESS CLASS)",10
BYTE "---------------------------",10
BYTE "  2- WEDNESDAY : ",10
BYTE "  PIA PK293",10
BYTE "  ATR TUBOPOP-42",10
BYTE "  TIME : 04:30 PM",10
BYTE "  FAIR : Rs.120,000 (BUISNESS CLASS)",10
;------------------------------
BYTE "---------------------------",10
BYTE "  3- SUNDAY : ",10
BYTE "  PIA PK200",10
BYTE "  ATR TURBOPOP-42",10
BYTE "  TIME : 11:00 AM",10
BYTE "  FAIR : Rs.120,000 (BUISNESS CLASS)",0
;------------------------------
;10------------------------------
sana BYTE "You have chosed Sana , Yemen",10

BYTE "  SCHEDULE",10
BYTE "  1- THURSDAY : ",10
BYTE "	PIA PK203",10
BYTE "	BOEING 747",10
BYTE "  DEPARTURE TIME : 12:30 PM ",10
BYTE "  FAIR : Rs.210,000 (BUISNESS CLASS)",10
BYTE "---------------------------",10
BYTE "  2- SATURDAY : ",10
BYTE "  EMIRATES 176E4",10
BYTE "  BOEING 700X",10
BYTE "  TIME : 03:00 PM",10
BYTE "  FAIR : Rs.240,000 (BUISNESS CLASS)",0
;------------------------------
BYTE "---------------------------",10
BYTE "  3- SUNDAY : ",10
BYTE "  PIA PK200",10
BYTE "  ATR TURBOPOP-42",10
BYTE "  TIME : 11:00 AM",10
BYTE "  FAIR : Rs.120,000 (BUISNESS CLASS)",10
;------------------------------
invalid BYTE "You entered an invalid input ",0 
optionss BYTE "SELECT ANY OF THE FOLLOWING: ",0

fair dword 0
.code
;-------------------------------------------------------------------------
main proc


;call crlf
;mov ecx , 5
;a:
;count values
call addCustomer
call crlf
;loop a
;call listAll
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
	mov edx ,offset isb
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
	mov edx ,offset heathrow
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
	mov edx ,offset newyork
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
	mov edx ,offset moscow
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
	mov edx ,offset mexico
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
	mov edx ,offset tehran
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
	mov edx ,offset bej
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
	mov edx ,offset oslo
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
	mov edx ,offset kabul
	call writestring
	call crlf
	mov edx ,offset optionss
	call writestring

	call readint
	cmp eax , 1
		je  kabul1
		cmp eax , 2
		je  kabul2
		cmp eax , 3
		je  kabul3
		jne wrng
	mov fair , 120000
	jmp done 
	
;10-
san:
	mov edx ,offset sana
	call writestring
	call crlf
	mov edx ,offset optionss
	call writestring

	call readint
	cmp eax , 1
		je  sana1
		cmp eax , 2
		je  sana2
		jne wrng
	mov fair , 210000
	jmp done 

wrng:
	mov edx , offset invalid
	call writestring
	jmp done
isbl1:
	jmp done
isbl2:
	jmp done
isbl3:
	jmp done
heath1:
	jmp done
heath2:
	jmp done
ny1:
	jmp done
ny2:
	jmp done
mos1:
	jmp done
mos2:
	jmp done
mex1:
	jmp done
mex2:
	jmp done
teh1:
	jmp done
teh2:
	jmp done
bchina1:
	jmp done
bchina2:
	jmp done
osl1:
	jmp done
kabul1:
	jmp done
kabul2:
	jmp done
kabul3:
	jmp done
sana1:
	jmp done
sana2:
	jmp done
	
done : 
	call writeint
;if else finish
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
end main