INCLUDE Irvine32.inc
INCLUDE MACROS.INC
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
customerNames BYTE 400 dup(0)
customerCnic BYTE 400 dup(0)
ptrName DWORD customerNames
ptrCnic DWORD customerCnic
abdullah dword 0
listingT dword 0
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
islamabad1 BYTE "	ISLAMABAD  ",10
BYTE "  1- MONDAY : ",10
BYTE "	PIA PK747",10
BYTE "	BOEING 747",10
BYTE "  DEPARTURE TIME : 4:30 PM ",10
BYTE "-----------------------------",0
islamabad2 BYTE "	ISLAMABAD  ",10
BYTE "  2- WEDNESDAY : ",10
BYTE "  PIA PK243",10
BYTE "  FOKER",10
BYTE "  TIME : 3:00 PM",10
;------------------------------
BYTE "-----------------------------",0
islamabad3 BYTE "	ISLAMABAD  ",10
BYTE "  3- SUNDAY : ",10
BYTE "  PIA PK239",10
BYTE "  AIRBUS A320",10
BYTE "  TIME : 12:00 PM",10
BYTE "-----------------------------",0
;------------------------------
;2------------------------------
heathrow1 BYTE "	UK , HEATHROW  ",10
BYTE "  1- WEDNESDAY : ",10
BYTE "	PIA PK720",10
BYTE "	AIRBUS A380",10
BYTE "  DEPARTURE TIME : 3:30 PM ",10
BYTE "-----------------------------",0
heathrow2 BYTE "	UK , HEATHROW  ",10
BYTE "  2- THURSDAY : ",10
BYTE "  EMIRATES 176E4",10
BYTE "  AIRBUS A380",10
BYTE "  TIME : 4:30 AM",10
BYTE "-----------------------------",0
;------------------------------
;3------------------------------
newyork1 BYTE "	NEWYORK  ",10
BYTE "  1- TUESDAY : ",10
BYTE "	PAN AMERICAN AIRLINE",10
BYTE "	PAN299",10
BYTE "	BOEING 700X",10
BYTE "  DEPARTURE TIME : 12:00 AM ",10
BYTE "-----------------------------",0
newyork2 BYTE "	NEWYORK  ",10
BYTE "  2- FRIDAY : ",10
BYTE "  PIA PK630",10
BYTE "  BOEING 747",10
BYTE "  TIME : 4:30 AM",10
BYTE "-----------------------------",0
;------------------------------
;4------------------------------
moscow1 BYTE "	MOSCOW , RUSSIA  ",10
BYTE "  1- WEDNESDAY : ",10
BYTE "	EMIRATES 176E9",10
BYTE "	AIRBUS A350",10
BYTE "  DEPARTURE TIME : 06:00 AM ",10
BYTE "-----------------------------",0
moscow2 BYTE "	MOSCOW , RUSSIA  ",10
BYTE "  2- SATURDAY : ",10
BYTE "  AEROFLOT AILINE",10
BYTE "  AA907",10
BYTE "  AIRBUS A900",10
BYTE "  TIME : 4:30 AM",10
BYTE "-----------------------------",0
;------------------------------
;5------------------------------
mexico1 BYTE "	MEXICO  ",10
BYTE "  1- MONDAY : ",10
BYTE "	PIA Pk240 ",10
BYTE "	BOEING 700X",10
BYTE "  DEPARTURE TIME : 2:00 PM ",10
BYTE "-----------------------------",0
mexico2 BYTE "	MEXICO  ",10
BYTE "  2- THURSDAY : ",10
BYTE "  QATAR AILINE",10
BYTE "  QA107",10
BYTE "  AIRBUS A320",10
BYTE "  TIME : 7:30 AM",10
BYTE "-----------------------------",0
;-------------------------------
;6------------------------------
tehran1 BYTE "	TEHRAN , IRAN  ",10
BYTE "  1- WEDNESDAY : ",10
BYTE "	EMIRATES 176E0 ",10
BYTE "	BOEING 747",10
BYTE "  DEPARTURE TIME : 06:00 PM ",10
BYTE "-----------------------------",0
tehran2 BYTE "	TEHRAN , IRAN  ",10
BYTE "  2- SATURDAY : ",10
BYTE "  AIR IRAN",10
BYTE "  AI201I",10
BYTE "  AIRBUS A320",10
BYTE "  TIME : 4:30 PM",10
BYTE "-----------------------------",0
;------------------------------

;7------------------------------
bejing1 BYTE "	BEIJING , CHINA  ",10
BYTE "  1- TUESDAY : ",10
BYTE "	AIR CHINA ",10
BYTE "	AC09CD ",10
BYTE "	BOEING 747",10
BYTE "  DEPARTURE TIME : 08:00 AM ",10
BYTE "-----------------------------",0
bejing2 BYTE "	BEIJING , CHINA  ",10
BYTE "  2- THURSDAY : ",10
BYTE "  PIA PK505",10
BYTE "  ATR TURBOPOP-42",10
BYTE "  TIME : 6:30 PM",10
BYTE "-----------------------------",0
;------------------------------
;8------------------------------
oslo1 BYTE "	OSLO  ",10
BYTE "  1- SUNDAY : ",10
BYTE "	EMIRATES ",10
BYTE "	176E91X ",10
BYTE "	BOEING 747",10
BYTE "  DEPARTURE TIME : 02:00 AM ",10
BYTE "-----------------------------",0

;9------------------------------
kabul1 BYTE "	KABUL , AFGHANISTAN  ",10
BYTE "  1- TUESDAY : ",10
BYTE "	PIA PK203",10
BYTE "	BOEING 747",10
BYTE "  DEPARTURE TIME : 2:30 PM ",10
BYTE "-----------------------------",0
kabul2 BYTE "	KABUL , AFGHANISTAN  ",10
BYTE "  2- WEDNESDAY : ",10
BYTE "  PIA PK293",10
BYTE "  ATR TUBOPOP-42",10
BYTE "  TIME : 04:30 PM",10
BYTE "-----------------------------",0
;------------------------------
kabul3 BYTE "	KABUL , AFGHANISTAN  ",10
BYTE "-----------------------------",10
BYTE "  3- SUNDAY : ",10
BYTE "  PIA PK200",10
BYTE "  ATR TURBOPOP-42",10
BYTE "  TIME : 11:00 AM",10
BYTE "-----------------------------",0
;------------------------------
;10------------------------------
sana1 BYTE "	SANA , YEMEN  ",10
BYTE "  1- THURSDAY : ",10
BYTE "	PIA PK203",10
BYTE "	BOEING 747",10
BYTE "  DEPARTURE TIME : 12:30 PM ",10
BYTE "-----------------------------",0
sana2  BYTE "	SANA , YEMEN  ",10
BYTE "  2- SATURDAY : ",10
BYTE "  EMIRATES 176E4",10
BYTE "  BOEING 700X",10
BYTE "  TIME : 03:00 PM",10
BYTE "-----------------------------",0
;------------------------------
BYTE "-----------------------------",0
sana3  BYTE "	SANA , YEMEN  ",10 
BYTE "  3- SUNDAY : ",10
BYTE "  PIA PK200",10
BYTE "  ATR TURBOPOP-42",10
BYTE "  TIME : 11:00 AM",10
BYTE "-----------------------------",0
;------------------------------
invalid BYTE "You entered an invalid input ",0 
optionss BYTE "SELECT ANY OF THE FOLLOWING: ",0

fair dword 0






;---------------------------------------FOR COPY PROCEDURE
recIndex dword 0
tickets BYTE 5000 DUP(0)

called Dword 0
;---------------------------------------FOR FILEHANDLING



filename Byte "names.txt",0,0
filecnic Byte "cnic.txt",0,0
fileticket Byte "tickets.txt",0,0
filevariable Byte "variable.txt",0,0
filefare Byte "fare.txt",0,0
filehandle dword ?
byteRead dword 0


loopHandling dword 0



codeAgent dword 123456



fares dword 20 dup (0)
lcw dword 0
lcw2 dword 0


.code
;-------------------------------------------------------------------------
main proc	



call loadData
	
	mov edx , 0
	mov eax ,x
	mov ebx ,20
	
	div ebx
	mov loopHandling, eax
	
	mov edx ,0
	mov eax ,x
	mov ebx ,5
	div ebx
	mov lcw, eax
	

	call crlf
	mov eax ,2
	;SWTICH STATEMENT
	call crlf
	call crlf
	call crlf


	mwrite "	|---------------------------------------------|"
	call crlf
	mwrite "	|WELCOME TO AIRLINE TICKET MANAGEMENT SYSTEM  |"
	call crlf
	mwrite "	|---------------------------------------------|"
	call crlf
	call crlf
	call crlf
	;mwrite "WHILE K ANDER NAI JA RHA"
	mov eax ,2
		 
.WHILE eax!=0 && loopHandling<20
	mwrite "SELECT ANY OF THE FOLLOWING OPTION"
	call crlf
	mwrite "1- List All Customer Details"
	call crlf
	mwrite "2- Add a Customer"
	call crlf
	mwrite "0- EXIT"
	call crlf
	call readint
		cmp eax,0
		je pfinish
		cmp eax,1
		je callingall
		cmp eax , 2
		je addingcustomer
		jne bad

callingall:

	mwrite "DETAILS OF ALL THE CUSTOMERS ARE : "
	call crlf
	call crlf
	
	call listAll
	jmp finishx
addingcustomer :
	call addCustomer
	CALL takeInput
	inc loopHandling 
	call saveData

	jmp finish


finish : 
	mwrite "THANKS FOR TRUSTING OUR COMPANY"
	call crlf
	mwrite "	HAVE A SAFE FLIGHT"
	call crlf
	jmp finishx
bad :
	mwrite "Invalid INPUT"
	call crlf
	call crlf
	call crlf
	jmp finishx

finishx : 
	call crlf
	 .ENDW

pfinish :	


exit
main endp
;------------------------Copy In fares--------------------------------
copyF PROC
	push eax
	push esi
			mov esi , lcw
			mov eax, fair
			mov fares[esi],eax
			call crlf
			mov eax , fares[esi]
			mwrite "Fare saved is : "
			call writeint
			call crlf
			add lcw ,4

	pop esi
	pop eax
	ret
copyF ENDP

;-----AGENT CODE--------------
agentCode PROC
	
	push eax
	push ebx
	push edx
		
		mwrite "If you are authorized by an agent ,"
		call crlf
		mwrite " kindly Enter the voucher code : "
		call readint
		cmp eax,123456
		je rightcall
		jne wrngcall
		rightcall:
			mwrite "Congragulations , You have earned a Discount"

			call crlf 
			mwrite "Now you have to pay 80 percent of your actual fare "
			call crlf
			mov eax , fair
						mov ebx , 80
						mul ebx
						;--eax = fair*100>>>>>>fair*100/70
						mov edx , 0
						mov ebx ,100
						div ebx
						mov fair, eax ;CEIL VALUE
			mwrite " Your New fare is : "
			mov eax , fair
			call writeint
			call crlf
			jmp endingMy
		wrngcall:
			call crlf
			mwrite "Invalid /Call denied"
	endingMy:
	pop edx
	pop ebx
	pop eax
	ret

agentCode Endp

;-------------------ASK FOR CLASSES----------------
askClass PROC
	
	push eax
	push ecx
	push edx	
			classes:
			mwrite "SELECT SEAT CATAGORY : "
			call crlf
			mwrite "1-BUISNESS"
			call crlf
			mwrite "FAIR = 100%"
			call crlf
			mwrite "2-PREMIUM ECONOMY"
			call crlf
			mwrite "FAIR = 70%"
			call crlf
			mwrite "3-ECONOMY"
			call crlf
			mwrite "FAIR = 40%"
			call crlf
			call readint
				;COMPARISIONS >>>>>>
				cmp eax , 1
				je iff1
				cmp eax ,2 
				je iff2
				cmp eax ,3
				je iff3
				jne xyz
				;------------------------------------------------------------------------
					xyz:
						mwrite "Invalid Input"
						call crlf
						jmp classes
						
					iff2:
						mwrite "Premium Economy"
						call crlf
						mov eax , fair
						mov ebx , 70
						mul ebx
						;--eax = fair*100>>>>>>fair*100/70
						mov edx , 0
						mov ebx ,100
						div ebx
						mov fair, eax ;CEIL VALUE
						mwrite "New Fair is : "
						mov eax ,fair
						call writeint
						call crlf
						jmp qwerty
					iff3:
						mwrite "Economy"
						call crlf
						mov eax , fair
						mov ebx , 40
						mul ebx
						;--eax = fair*100>>>>>>fair*100/40
						mov edx , 0
						mov ebx ,100
						div ebx
						mov fair, eax ;CEIL VALUE
						mwrite "New Fair is : "
						mov eax ,fair
						call writeint
						call crlf
						jmp qwerty
					iff1:	
						mwrite "Buisness Class"
						call crlf
						mwrite "Fair is : "
						mov eax ,fair
						call writeint
						call crlf

						qwerty:
							call agentCode
							call copyF
	pop edx
	pop ecx
	pop eax
	ret
askClass EndP


;-------------ticcket--------------
takeInput Proc
	push eax
	push ebx
	push ecx
	push edx
	push esi
	push ebp
	push esp
		

start1 :		call displayDestinations
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
	jne start1

	;1-
	isbl:
		mwrite "You have Chosed Islamabad "
		call crlf
		mwrite "         SHEDULE       "
		call crlf
		mov edx ,offset islamabad1
		call writestring
		call crlf
		mwrite "Buisness Class Fair : 30000"
		call crlf
		mwrite "-----------------------------"
		call crlf
		mov edx ,offset islamabad2
		call writestring
		call crlf
		mwrite "Buisness Class Fair : 30000"
		call crlf
		mwrite "-----------------------------"
		call crlf
		mov edx ,offset islamabad3
		call writestring
		call crlf
		mwrite "Buisness Class Fair : 30000"
		call crlf
		mwrite "-----------------------------"
		call crlf

startISB:		mov edx ,offset optionss
		call writestring

		call readint
			cmp eax , 1
			je  isbl1
			cmp eax , 2
			je  isbl2
			cmp eax , 3
			je  isbl3
			jne startISB
		
		
		jmp done 
	
	;2-
	heath:
		mwrite "You have Chosed Heathrow ,UK "
		call crlf
		mwrite "         SHEDULE       "
		call crlf
		mov edx ,offset heathrow1
		call writestring
		mwrite "Buisness Class Fair : 300000"
		call crlf
		mwrite "-----------------------------"
		call crlf
		call crlf
		mov edx ,offset heathrow2
		call writestring
		call crlf
		mwrite "Buisness Class Fair : 300000"
		call crlf
		mwrite "-----------------------------"
		call crlf
startHeath:		mov edx ,offset optionss
		call writestring

		call readint
		cmp eax , 1
			je  heath1
			cmp eax , 2
			je  heath2
			jne startHeath
 
	
	;3-
	ny:
		mwrite "You have Chosed NewYork "
		call crlf
		mwrite "         SHEDULE       "
		call crlf
		mov edx ,offset newyork1
		call writestring
		call crlf
		mwrite "Buisness Class Fair : 270000"
		call crlf
		mwrite "-----------------------------"
		call crlf
		mov edx ,offset newyork2
		call writestring
		call crlf
		mwrite "Buisness Class Fair : 270000"
		call crlf
		mwrite "-----------------------------"
		call crlf
startNY:		mov edx ,offset optionss
		call writestring

		call readint
		cmp eax , 1
			je  ny1
			cmp eax , 2
			je  ny2
			jne startNY
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
		mwrite "Buisness Class Fair : 270000"
		call crlf
		mwrite "-----------------------------"
		call crlf
		mov edx ,offset moscow2
		call writestring
		call crlf
		mwrite "Buisness Class Fair : 270000"
		call crlf
		mwrite "-----------------------------"
		call crlf
startMOS:		mov edx ,offset optionss
		call writestring

		call readint
		cmp eax , 1
			je  mos1
			cmp eax , 2
			je  mos2
			jne startMOS
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
		mwrite "Buisness Class Fair : 260000"
		call crlf
		mwrite "-----------------------------"
		call crlf
		mov edx ,offset mexico2
		call writestring

		call crlf
		mwrite "Buisness Class Fair : 260000"
		call crlf
		mwrite "-----------------------------"
		call crlf
startMEX:		mov edx ,offset optionss
		call writestring

		call readint
		cmp eax , 1
			je  mex1
			cmp eax , 2
			je  mex2
			jne startMEX
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
		mwrite "Buisness Class Fair : 190000"
		call crlf
		mwrite "-----------------------------"
		call crlf
		mov edx ,offset tehran2
		call writestring
		call crlf
		mwrite "Buisness Class Fair : 190000"
		call crlf
		mwrite "-----------------------------"
		call crlf
startTeh:		mov edx ,offset optionss
		call writestring

		call readint
		cmp eax , 1
			je  teh1
			cmp eax , 2
			je  teh2
			jne startTeh
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
		mwrite "Buisness Class Fair : 110000"
		call crlf
		mwrite "-----------------------------"
		call crlf
		mov edx ,offset bejing2
		call writestring
		call crlf
		mwrite "Buisness Class Fair : 110000"
		call crlf
		mwrite "-----------------------------"
		call crlf
startCHINA:		mov edx ,offset optionss
		call writestring

		call readint
		cmp eax , 1
			je  bchina1
			cmp eax , 2
			je  bchina2
			jne startCHINA
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
		mwrite "Buisness Class Fair : 290000"
		call crlf
		mwrite "-----------------------------"
		call crlf
startOSLO:		mov edx ,offset optionss
		call writestring

		call readint
		cmp eax , 1
			je  osl1
			jne startOSLO
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
		mwrite "Buisness Class Fair : 120000"
		call crlf
		mwrite "-----------------------------"
		call crlf
		mov edx ,offset kabul2
		call writestring
		call crlf
		mwrite "Buisness Class Fair : 120000"
		call crlf
		mwrite "-----------------------------"
		call crlf
		mov edx ,offset kabul3
		call writestring
		call crlf
		mwrite "Buisness Class Fair : 120000"
		call crlf
		mwrite "-----------------------------"
		call crlf
		
startKabul:		mov edx ,offset optionss
		call writestring

		call readint
		cmp eax , 1
			je  kab1
			cmp eax , 2
			je  kab2
			cmp eax , 3
			je  kab3
			jne startKabul
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
		mwrite "Buisness Class Fair : 210000"
		call crlf
		mwrite "-----------------------------"
		call crlf
		
		mov edx ,offset sana2
		call writestring
		call crlf
		mwrite "Buisness Class Fair : 210000"
		call crlf
		mwrite "-----------------------------"
		call crlf
		
		mov edx ,offset sana3
		call writestring
		call crlf
		mwrite "Buisness Class Fair : 210000"
		call crlf
		mwrite "-----------------------------"
		call crlf
		
startSANA:		mov edx ,offset optionss
		call writestring

		call readint
		cmp eax , 1
			je  san1
			cmp eax , 2
			je  san2
			cmp eax , 3
			je  san3

			jne startSANA
		mov fair , 210000
		jmp done 

	wrng:
		mov edx , offset invalid
		call writestring
		jmp done
		;-----------------------------------------------------------------SUBSECTION-------------------------------------
	isbl1:
		call crlf 
		call crlf
		mwrite "You have chosed"
		call crlf
		mwrite "1- MONDAY : "

		mov edx , offset islamabad1
		mov fair ,30000
		call askClass
		call copy

		jmp done
	isbl2:
		call crlf 
		call crlf
		mwrite "You have chosed"
		call crlf
		mwrite "2- WEDNESDAY : "
		mov edx , offset islamabad2
		mov fair ,30000
		call askClass
		call copy

		
		jmp done
	isbl3:
		call crlf 
		call crlf
		mwrite "You have chosed"
		call crlf
		mwrite "3- SUNDAY : "
		mov edx , offset islamabad3
		mov fair ,30000
		call askClass
		call copy

		
		jmp done
	heath1:
		call crlf 
		call crlf
		mwrite "You have chosed"
		call crlf
		mwrite "1- WEDNESDAY : "
		mov edx , offset heathrow1
		mov fair ,300000
		call askClass
		call copy

		jmp done
	heath2:
		call crlf 
		call crlf
		mwrite "You have chosed"
		call crlf
		mwrite "2- THURSDAY : "
		mov edx , offset heathrow2
		mov fair ,300000

		call askClass
		call copy


		jmp done
	ny1:
		call crlf 
		call crlf
		mwrite "You have chosed"
		call crlf
		mwrite "1- TUESDAY : "
		mov edx , offset newyork1
		mov fair ,270000
		call askClass

		call copy
		jmp done
	ny2:
		call crlf 
		call crlf
		mwrite "You have chosed"
		call crlf
		mov fair ,270000
		call askClass
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
		mov fair ,270000
		call askClass
		call copy
		jmp done
	mos2:
		call crlf 
		call crlf
		mwrite "You have chosed"
		call crlf
		mwrite " 2- SATURDAY : "
		mov edx , offset moscow2
		mov fair ,270000
		call askClass
		call copy
		jmp done
	mex1:
		call crlf 
		call crlf
		mwrite "You have chosed"
		call crlf
		mwrite "1- MONDAY : "
		mov edx , offset mexico1
		mov fair ,260000
		call askClass
		call copy
		jmp done
	mex2:
		call crlf 
		call crlf
		mwrite "You have chosed"
		call crlf
		mwrite "2- THURSDAY : "
		mov edx , offset mexico2
		mov fair ,260000
		call askClass
		call copy
		jmp done
	teh1:
		call crlf 
		call crlf
		mwrite "You have chosed"
		call crlf
		mwrite "1- WEDNESDAY : "
		mov edx , offset tehran1
		mov fair ,190000
		call askClass
		call copy
		jmp done
	teh2:
		call crlf 
		call crlf
		mwrite "You have chosed"
		call crlf
		mwrite "2- SATURDAY : "
		mov edx , offset tehran2
		mov fair ,190000
		call askClass
		call copy
		jmp done
	bchina1:
		call crlf 
		call crlf
		mwrite "You have chosed"
		call crlf
		mwrite "1- TUESDAY : "
		mov edx , offset bejing1
		mov fair ,110000
		call askClass
		call copy
		jmp done
	bchina2:
		call crlf 
		call crlf
		mwrite "You have chosed"
		call crlf
		mwrite "2- THURSDAY : "
		mov edx , offset bejing2
		mov fair ,110000
		call askClass
		call copy
		jmp done
	osl1:
		call crlf 
		call crlf
		mwrite "You have chosed"
		call crlf
		mwrite "1- SUNDAY : "
		mov edx , offset oslo1
		mov fair ,290000
		call askClass
		call copy
		jmp done
	kab1:
		call crlf 
		call crlf
		mwrite "You have chosed"
		call crlf
		mwrite "1- TUESDAY : "
		mov edx , offset kabul1
		mov fair ,120000
		call askClass
		call copy
		jmp done
	kab2:
		call crlf 
		call crlf
		mwrite "You have chosed"
		call crlf
		mwrite "2- WEDNESDAY : "
		mov edx , offset kabul2
		mov fair ,120000
		call askClass
		call copy
		jmp done
	kab3:
		call crlf 
		call crlf
		mwrite "You have chosed"
		call crlf
		mwrite "3- SUNDAY : "
		mov edx , offset kabul3
		mov fair ,120000
		call askClass
		call copy
		jmp done
	san1:
		call crlf 
		call crlf
		mwrite "You have chosed"
		call crlf
		mwrite "1- THURSDAY : "
		mov edx , offset sana1
		mov fair ,210000
		call askClass
		call copy
		jmp done
	san2:	
		call crlf 
		call crlf
		mwrite "You have chosed"
		call crlf
		mwrite " 2- SATURDAY :  "
		mov edx , offset sana2
		mov fair ,210000
		call askClass
		call copy
		jmp done
	san3:	
		call crlf 
		call crlf
		mwrite "You have chosed"
		call crlf
		mwrite " 3- SUNDAY :  "
		mov edx , offset sana3
		mov fair ,210000
		call askClass
		call copy
		jmp done
	
	done : 
		

	pop esp
	pop ebp
	pop esi
	pop edx
	pop ecx
	pop ebx
	pop eax
		ret
takeInput endP

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
	
	call crlf
	mov eax  , x   ; initial val x = 0
	add eax , 20    ; 
	mov x , eax   ; x = 20
	count = x      ; count  = 20
	
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
	mov lcw2,0
	;mwrite "VALUE OF X"
	;mov eax , x
	;call writeint
	;call crlf

	
	mov ecx , 20 ; total iterations can be 20
	mov eax , x ; multiple of 20
	div ecx
	mov ecx ,eax 
	mov ListingT,0
	mov abdullah,0

	.WHILE ecx>0
	;;mwrite "VALUE OF ECX : "
	;mov eax , ecx
	;call writeint 


		mov temp,ecx 


		;mov ecx , sizeof customerNames
		mov edx,offset customerNames
		add edx , abdullah
		mwrite "NAME : "
		call writestring
		call crlf
		;mov ecx , sizeof customerCnic
		mov edx,offset customerCnic
		add edx , abdullah
		mwrite "CNIC : "
		call writestring
		call crlf
		add abdullah , 20
		
		mov edx , offset tickets
		add edx , ListingT
		mwrite "TICKET DETAILS : "
		call crlf
		call writestring
		add ListingT ,201
		call crlf
		mov ecx ,temp
		dec ecx
		
		
		
		mov esi,lcw2
		mov eax, fares[esi]
		mwrite "YOUR FARE IS : "
		call writeint
		add lcw2,4
		call crlf
		.ENDW

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
            ;call writeint
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

loadData PROC
		
		push eax
		push esi
		push edx



		INVOKE CreateFile ,offset filefare,GENERIC_READ,DO_NOT_SHARE,NULL,OPEN_EXISTING,FILE_ATTRIBUTE_NORMAL,0
		mov filehandle , eax

		INVOKE ReadFile ,eax,ADDR fares,sizeof fares,NULL,NULL
		
		;mov eax , byteRead
		;call writeint

		;mov edx , offset customerNames
		;call writestring
		mov eax , filehandle
		call CloseFile







		INVOKE CreateFile ,offset filevariable,GENERIC_READ,DO_NOT_SHARE,NULL,OPEN_EXISTING,FILE_ATTRIBUTE_NORMAL,0
		mov filehandle , eax

		INVOKE ReadFile ,eax,ADDR x,sizeof x,ADDR byteRead,NULL
		
		;mov eax , x
		;mwrite "VALUE OF X : "
		;call writeint
		mov eax , filehandle
		call CloseFile

		;x 20,40,0
		mov eax , x
		mov abdullah , eax
		mov edx ,10
		mul edx ; 200,400,600
		mov ListingT , eax
		mov edx , 0;201,402,603
		mov eax , x
		mov esi , 20
		div esi
		mov esi, ListingT
		mov recIndex , esi
		add ListingT, eax

		;mov eax , ListingT
		;mwrite "Value if ListingT : "
		;call writeint
		;call crlf


		;call crlf

		INVOKE CreateFile ,offset filename,GENERIC_READ,DO_NOT_SHARE,NULL,OPEN_EXISTING,FILE_ATTRIBUTE_NORMAL,0
		mov filehandle , eax

		INVOKE ReadFile ,eax,ADDR customerNames,sizeof customerNames,ADDR byteRead,NULL
		
		;mov eax , byteRead
		;call writeint

		;mov edx , offset customerNames
		;call writestring
		mov eax , filehandle
		call CloseFile

		;call crlf

		INVOKE CreateFile ,offset filecnic,GENERIC_READ,DO_NOT_SHARE,NULL,OPEN_EXISTING,FILE_ATTRIBUTE_NORMAL,0
		mov filehandle , eax

		INVOKE ReadFile ,eax,ADDR customercnic,sizeof customercnic,NULL,NULL
		;mov edx , offset customercnic
		;call writestring
		mov eax , filehandle
		mov  eax,fileHandle
		call CloseFile

		;call crlf
		;call crlf

		INVOKE CreateFile ,offset fileticket,GENERIC_READ,DO_NOT_SHARE,NULL,OPEN_EXISTING,FILE_ATTRIBUTE_NORMAL,0
		mov filehandle , eax

		INVOKE ReadFile ,eax,ADDR tickets,sizeof tickets,NULL,NULL
		;mov edx , offset tickets
		;call writestring
		;mov eax , filehandle
		;Invoke CloseHandle,eax
		 mov  eax,fileHandle
		call CloseFile
		pop edx
		pop esi
		pop eax
	ret
loadData ENDP


saveData PROC
	push eax
	;mov edx ,offset filename
	;call CreateOutputFile
	;call writeint
	;call crlf
	
	;mwrite "Value of x"
	;call crlf
	;mov eax , x 
	;call writeint
	;call crlf

	INVOKE CreateFile ,ADDR filevariable,GENERIC_WRITE,DO_NOT_SHARE,NULL,CREATE_ALWAYS,FILE_ATTRIBUTE_NORMAL,0 
	;mwrite "CHECKING FILEHANDLE : "
	;call writeint
	call crlf
	mov filehandle , eax
	INVOKE WriteFile ,eax,ADDR x,sizeof x,NULL,NULL   
	;call writeint
	mov eax , filehandle
	INVOKE CloseHandle,eax
	call crlf



	INVOKE CreateFile ,ADDR filefare,GENERIC_WRITE,DO_NOT_SHARE,NULL,CREATE_ALWAYS,FILE_ATTRIBUTE_NORMAL,0 
	;call writeint
	mov filehandle , eax
	INVOKE WriteFile ,eax,ADDR fares,sizeof fares,NULL,NULL   
	;call writeint
	mov eax , filehandle
	INVOKE CloseHandle,eax
	call crlf







	INVOKE CreateFile ,ADDR filename,GENERIC_WRITE,DO_NOT_SHARE,NULL,CREATE_ALWAYS,FILE_ATTRIBUTE_NORMAL,0 
	;call writeint
	mov filehandle , eax
	INVOKE WriteFile ,eax,ADDR customerNames,sizeof customerNames,NULL,NULL   
	;call writeint
	mov eax , filehandle
	INVOKE CloseHandle,eax
	call crlf

	

	
	INVOKE CreateFile ,ADDR filecnic,GENERIC_WRITE,DO_NOT_SHARE,NULL,CREATE_ALWAYS,FILE_ATTRIBUTE_NORMAL,0 
	mov filehandle , eax
	INVOKE WriteFile ,eax,ADDR customerCnic,sizeof customerCnic,NULL,NULL   
	mov eax , filehandle
	INVOKE CloseHandle,eax

	INVOKE CreateFile ,ADDR fileticket,GENERIC_WRITE,DO_NOT_SHARE,NULL,CREATE_ALWAYS,FILE_ATTRIBUTE_NORMAL,0 
	mov filehandle, eax
	INVOKE WriteFile ,eax,ADDR tickets,sizeof tickets,NULL,NULL   
	mov eax , filehandle
	INVOKE CloseHandle,eax

	pop eax
	ret

saveData ENDP


end main