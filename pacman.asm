Include Irvine32.inc
Include macros.inc
Includelib winmm.lib

TITLE MASM PlaySound
	PlaySound PROTO,
	pszSound: PTR BYTE,
	hmod: DWORD,
	fdwSound: DWORD



.data	

	SND_FILENAME DWORD 00020000h
	foodSound db "food.wav",0
	deathSound db "death.wav",0


	highname1 db "ROSS",0
	highname2 db "MONICA",0
	highname3 db "JOEY",0
	highname4 db "RACHEL",0
	highname5 db "PHEOBE",0

	highscore1 db 220
	highscore2 db 190
	highscore3 db 100
	highscore4 db 80
	highscore5 db 24

	help0 db  "        ._____________________________________________________________________________________________________.",0
	help1 db  "        |  <- Press B to go back                                                                              |",0
	help2 db  "        |                                        INSTRUCTIONS:                                                |",0
	help3 db  "        |    USE W, A, S, D keys to move up, left, down and right your character (e) and try to gather        |",0
	help4 db  "        |    200 points while also avoiding the ghost(s) (&). These ghosts will increase in                   |",0
	help5 db  "        |    amount and speed up as the levels increase and your job is to gather all the points (.)          |",0
	help6 db  "        |    losing all 3 of your lives. As the levels progress you get more and faster ghosts                |",0
	help7 db  "        |    and you could get a randomly generated cherry (o) that grants special powers                     |",0
	help8 db  "        |==============================================================.             CREATED BY:              |",0
	help9 db  "        |            .-.   .-.          .--.                           |                                      |",0
	help10 db "        |           | OO| | oo|        / _.-'    .-.     .-.    .-.    |    Muaz Ahmed (22I-1125)             |",0
	help11 db "        |           |   | |   |        \  '_.    '-'     '-'    '-'    |    COAL PROJECT                      |",0
	help12 db "        |           '^^^' '^^^'         '--'                           |                                      |",0
	help13 db "        |===================================================    .-.    |                                      |",0
	help14 db "        |                                                   |   '-'    |                                      |",0
	help15 db "        ._____________________________________________________________________________________________________.",0

	transition0  db  "        ._____________________________________________________________________________________________________.",0
	transition1  db  "        |                                                                                                     |",0
	transition2  db  "        |                                                                                                     |",0
	transition3  db  "        |                                                                                                     |",0
	transition4  db  "        |                 (                   (              )    *    (   (                 (                |",0
	transition5  db  "        |              )\ )                )\ )     (  ( /(  (  `   )\ ))\ )      *   )   )\ )                |",0
	transition6  db  "        |              (()/( (   (   (  (  (()/(     )\ )\()) )\))( (()/(()/( (  ` )  /(( (()/(               |",0
	transition7  db  "        |               /(_)))\  )\  )\ )\  /(_))  (((_|(_)\ ((_)()\ /(_))(_)))\  ( )(_))\ /(_))              |",0
	transition8  db  "        |              (_)) ((_)((_)((_|(_)(_))    )\___ ((_)(_()((_|_))(_)) ((_)(_(_()|(_|_))_               |",0
	transition9  db  "        |              | |  | __\ \ / /| __| |    ((/ __/ _ \|  \/  | _ \ |  | __|_   _| __|   \              |",0
	transition10 db  "        |              | |__| _| \ V / | _|| |__   | (_| (_) | |\/| |  _/ |__| _|  | | | _|| |) |             |",0
	transition11 db  "        |              |____|___| \_/  |___|____|   \___\___/|_|  |_|_| |____|___| |_| |___|___/              |",0
	transition12 db  "        |                                                                                                     |",0
	transition13 db  "        |                                                                                                     |",0
	transition14 db  "        |                                                                                                     |",0
	transition15 db  "        '_____________________________________________________________________________________________________'",0

	
                                                                           


	menu0 db  "        _____________________________________________________________________________________________________",0
	menu1 db  "        |               ___         ___           ___           ___           ___           ___             |",0
	menu2 db  "        |              /  /\       /  /\         /  /\         /__/\         /  /\         /__/\            |",0
	menu3 db  "        |             /  /::\     /  /::\       /  /:/        |  |::\       /  /::\        \  \:\           |",0
	menu4 db  "        |            /  /:/\:\   /  /:/\:\     /  /:/         |  |:|:\     /  /:/\:\        \  \:\          |",0
	menu5 db  "        |           /  /:/ /:/  /  /:/ /::\   /  /:/  ___   __|__|:|\:\   /  /:/~/::\   _____\__\:\         |",0
	menu6 db  "        |          /__/:/ /:/  /__/:/ /:/\:\ /__/:/  /  /\ /__/____| \:\ /__/:/ /:/\:\ /__/______\:\        |",0
	menu7 db  "        |          \  \:\/:/   \  \:\/:/__\/ \  \:\ /  /:/ \  \:\  \__\/ \  \:\/:/__\/ \  \:\  \__\/        |",0
	menu8 db  "        |           \  \::/     \  \::/       \  \:\  /:/   \  \:\        \  \::/       \  \:\              |",0
	menu9 db  "        |            \  \:\      \  \:\        \  \:\/:/     \  \:\        \  \:\        \  \:\             |",0
	menu10 db "        |             \  \:\      \  \:\        \  \::/       \  \:\        \  \:\        \  \:\            |",0
	menu11 db "        |              \__\/       \__\/         \__\/         \__\/         \__\/         \__\/            |",0
	menu16 db "        |                                           Enter Your name:                                        |",0 				        																								
	menu12 db "        |                                           Press any key to Start                                  |",0
	menu13 db "        |                                              Press esc to close                                   |",0
	menu14 db "        |                                                                                                   |",0
	menu15 db "        -----------------------------------------------------------------------------------------------------",0
	menu17 db "        |                                           1. Start                                                |",0
	menu18 db "        |                                           2. Help                                                 |",0
	menu19 db "        |                                           3. Exit                                                 |",0


	end1 db "     ___          ___          ___          ___             ___                      ___          ___     ",0
	end2 db "    /  /\        /  /\        /  /\        /  /\           /  /\        ___         /  /\        /  /\    ",0
	end3 db "   /  /::\      /  /::\      /  /::|      /  /::\         /  /::\      /  /\       /  /::\      /  /::\   ",0
	end4 db "  /  /:/\:\    /  /:/\:\    /  /:|:|     /  /:/\:\       /  /:/\:\    /  /:/      /  /:/\:\    /  /:/\:\  ",0
	end5 db " /  /:/  \:\  /  /::\ \:\  /  /:/|:|__  /  /::\ \:\     /  /:/  \:\  /  /:/      /  /::\ \:\  /  /::\ \:\ ",0
	end6 db "/__/:/_\_ \:\/__/:/\:\_\:\/__/:/_|::::\/__/:/\:\ \:\   /__/:/ \__\:\/__/:/  ___ /__/:/\:\ \:\/__/:/\:\_\:\ ",0
	end7 db "\  \:\__/\_\/\__\/  \:\/:/\__\/  /~~/:/\  \:\ \:\_\/   \  \:\ /  /:/|  |:| /  /\\  \:\ \:\_\/\__\/~|::\/:/",0
	end8 db " \  \:\ \:\       \__\::/       /  /:/  \  \:\ \:\      \  \:\  /:/ |  |:|/  /:/ \  \:\ \:\     |  |:|::/ ",0
	end9 db "  \  \:\/:/       /  /:/       /  /:/    \  \:\_\/       \  \:\/:/  |__|:|__/:/   \  \:\_\/     |  |:|\/  ",0
	end10 db "   \  \::/       /__/:/       /__/:/      \  \:\          \  \::/    \__\::::/     \  \:\       |__|:|~   ",0
	end11 db "    \__\/        \__\/        \__\/        \__\/           \__\/         ~~~~       \__\/        \__\| ",0

	map  db  "#############################################################",0
		 db  "# .   .   .   #################################   .   .   . #",0
		 db  "# .   .   .   . ############################# .   .   .   . #",0
		 db  "# .   .   .   .   .   . ############# .   .   .   .   .   . #",0
		 db  "# . ######### . ##### .   .   .   .   . ##### . ######### . #",0
		 db  "# .   .   . # . ##### .   .   .   .   . ##### . # .   .   . #",0
		 db  "# .   .   . # . # .   .   .   .   .   .   . # . # .   .   . #",0
		 db  "# . ######### . ##### .   .   .   .   . ##### . ######### . #",0
		 db  "# . # .   .   . # .        #     #        . # .   .   . # . #",0
		 db  "# . # .   .   . # .        #     #        . # .   .   . # . #",0
		 db  "# . ######### . # . ########     ######## . # . ######### . #",0
		 db  "# .   .   .   .   . #                   # .   .   .   .   . #",0
		 db  "# . ######### .   . #                   # .   . ######### . #",0
		 db  "# . # .   .   . # . ##################### . # .   .   . # . #",0
		 db  "# . # .   .   . # .                       . # .   .   . # . #",0
		 db  "# . ######### . # . ##################### . # . ######### . #",0
		 db  "# . ######### . # .   ################# . . # . ######### . #",0
		 db  "# . ######### . ###  .   .   .   .   .  . ### . ######### . #",0
		 db  "# . ######### . ####  .   .   .   .   .  #### . ######### . #",0
		 db  "# . # .   .   .  #### .   .   .   .   . ####  .   .   . # . #",0
		 db  "# . # .   .   .   . # .   .   .   .   . # .   .   .   . # . #",0
		 db  "# . ######### .   . ##########  ######### .   . ######### . #",0
		 db  "# .   .   .   .   .   .   .   .   .   .   .   .   .   .   . #",0
		 db  "#############################################################",0

	map2  db  "#############################################################",0
		  db  "# .   .   .   #################################   .   o   . #",0
		  db  "# .   .   .   . ############################# .   .   .   . #",0
		  db  "# .   .   .   .   .   . ############# .   .   .   .   .   . #",0
		  db  "# . ######### . ##### .   .   .   .   . ##### . ######### . #",0
		  db  "# .   .   . # . ##### .   .   .   .   o ##### . # .   .   . #",0
		  db  "# .   .   . # . # .   .   .   .   .   .   . # . # .   .   . #",0
		  db  "# . ######### . ##### .   .   .   .   . ##### . ######### . #",0
		  db  "# . # .   .   . # .        #     #        . # .   .   . # . #",0
		  db  "# . # .   .   . # .        #     #        . # .   .   . # . #",0
		  db  "# . ######### . # . ########     ######## . # . ######### o #",0
		  db  "# .   .   .   .   . #                   # .   .   .   .   . #",0
		  db  "# . ######### .   . #                   # .   . ######### . #",0
		  db  "# . # .   .   . # . ##################### . # .   .   . # . #",0
		  db  "# . # .   .   . # .                       . # .   .   . # . #",0
		  db  "# o ######### . # . ##################### . # . ######### . #",0
		  db  "# . ######### . # .   ################# . . # . ######### . #",0
		  db  "# . ######### . ###  .   .   .   .   .  . ### . ######### . #",0
		  db  "# . ######### . ####  .   .   .   .   .  #### . ######### . #",0
		  db  "# . # .   .   .  #### .   .   .   .   . ####  .   .   . # . #",0
		  db  "# . # .   .   .   . # .   .   .   .   . # .   .   .   . # . #",0
		  db  "# . ######### .   o ##########  ######### .   . ######### . #",0
		  db  "# .   .   .   .   .   .   .   .   .   .   .   .   .   .   . #",0
		  db  "#############################################################",0

	

	pause1  db ".-----------------------------.",0
	pause2  db "|            PAUSED           |",0
	pause3  db "|                             |",0
	pause4  db "|       1. RESUME             |",0
	pause5  db "|                             |",0
	pause6  db "|       2. HIGHSCORES         |",0
	pause7  db "|                             |",0
	pause8  db "|       3. EXIT               |",0
	pause9  db "|                             |",0
	pause10 db "|       4. RESTART            |",0
	pause11 db "'-----------------------------'",0

	hi1  db ".-----------------------------.",0
	hi2  db "|         HIGHSCORES          |",0
	hi3  db "|                             |",0
	hi4  db "|                             |",0
	hi5  db "|                             |",0
	hi6  db "|                             |",0
	hi7  db "|                             |",0
	hi8  db "|                             |",0
	hi9  db "|                             |",0
	hi10 db "|     PRESS B TO GO BACK      |",0
	hi11 db "'-----------------------------'",0

	clrPause db "                               ",0

	playerName db 10 dup(?)
	pointer db "->",0
	pointerMove db "  ",0
    RowMap = 30
	ColMap = 14
	ctr dd 0
	pauseCtr dd 0
	horizontal db 4
	pauseVertical db 10
	pointed db ".",0
	blanked db " ",0
	walled db "#",0
    colIndex dd 30
	rowIndex dd 14
	present dd 0
    presentPos = ((RowMap *60) + ColMap)
	cherryPointed db "o",0
	

	;PACMAN CHARACTERISTICS
	
	pacman db 'e',0
    pacX db 35
    pacY db 18

	;SCORING
	score dd 0
    scoreX db 80
    scoreY db 3
    score2X db 70
    score2Y db 3

	foodDetect db 0
	foodX db 0
	foodY db 0

	;LIVES
	Lives dd 3
	LivesX db 80
	LivesY db 4
	Lives2X db 70
	Lives2Y db 4

	;ENEMY
	enemy db '&'
    enemyX db 35
    enemyY db 15
    e1rowIndex dd 11
    e1colIndex dd 30
    e1move dd 7

.code

	main PROC
		
		call menu
		invoke exitProcess,0
	main ENDP


	menu PROC
		
		call clrscr
		mov eax,20

		mov edx,offset menu0
		call writestring
		call crlf
		call delay
		
		mov edx,offset menu1
		call writestring
		call crlf
		call delay

		mov edx,offset menu2
		call writestring
		call crlf
		call delay

		mov edx,offset menu3
		call writestring
		call crlf
		call delay

		mov edx,offset menu4
		call writestring
		call crlf
		call delay

		mov edx,offset menu5
		call writestring
		call crlf
		call delay

		mov edx,offset menu6
		call writestring
		call crlf
		call delay

		mov edx,offset menu7
		call writestring
		call crlf
		call delay

		mov edx,offset menu8
		call writestring
		call crlf
		call delay

		mov edx,offset menu9
		call writestring
		call crlf
		call delay

		mov edx,offset menu10
		call writestring
		call crlf
		call delay

		mov edx,offset menu11
		call writestring
		call crlf
		call delay

		mov edx,offset menu14
		call writestring
		call crlf
		call delay

		mov edx,offset menu12
		call writestring
		call crlf
		call delay

		mov edx,offset menu14
		call writestring
		call crlf
		call delay

		mov edx,offset menu13
		call writestring
		call crlf

		mov edx,offset menu15
		call writestring
		call crlf
		call delay

		mov eax,0
		call readchar
		cmp al,27
		jne L1

		ret

		L1:
			call nameRecord


	menu ENDP


	nameRecord PROC
		
		call clrscr
		mov eax,20

		mov edx,offset menu0
		call writestring
		call crlf
		call delay
		
		mov edx,offset menu1
		call writestring
		call crlf
		call delay

		mov edx,offset menu2
		call writestring
		call crlf
		call delay

		mov edx,offset menu3
		call writestring
		call crlf
		call delay

		mov edx,offset menu4
		call writestring
		call crlf
		call delay

		mov edx,offset menu5
		call writestring
		call crlf
		call delay

		mov edx,offset menu6
		call writestring
		call crlf
		call delay

		mov edx,offset menu7
		call writestring
		call crlf
		call delay

		mov edx,offset menu8
		call writestring
		call crlf
		call delay

		mov edx,offset menu9
		call writestring
		call crlf
		call delay

		mov edx,offset menu10
		call writestring
		call crlf
		call delay

		mov edx,offset menu11
		call writestring
		call crlf
		call delay

		mov edx,offset menu14
		call writestring
		call crlf
		call delay

		mov edx,offset menu16
		call writestring
		call crlf
		call delay

		mov edx,offset menu14
		call writestring
		call crlf
		call delay

		mov edx,offset menu14
		call writestring
		call crlf
		call delay

		mov edx,offset menu15
		call writestring
		call crlf
		call delay

		mGotoxy 68,13
		mReadString playerName
		
		call clrscr

		call options

	nameRecord ENDP

	options PROC
		call clrscr
		mov eax,20
		mov edx,offset menu0
		call writestring
		call crlf
		call delay
		
		mov edx,offset menu1
		call writestring
		call crlf
		call delay

		mov edx,offset menu2
		call writestring
		call crlf
		call delay

		mov edx,offset menu3
		call writestring
		call crlf
		call delay

		mov edx,offset menu4
		call writestring
		call crlf
		call delay

		mov edx,offset menu5
		call writestring
		call crlf
		call delay

		mov edx,offset menu6
		call writestring
		call crlf
		call delay

		mov edx,offset menu7
		call writestring
		call crlf
		call delay

		mov edx,offset menu8
		call writestring
		call crlf
		call delay

		mov edx,offset menu9
		call writestring
		call crlf
		call delay

		mov edx,offset menu10
		call writestring
		call crlf
		call delay

		mov edx,offset menu11
		call writestring
		call crlf
		call delay

		mov edx,offset menu14
		call writestring
		call crlf
		call delay

		mov edx,offset menu17
		call writestring
		call crlf
		call delay

		mov edx,offset menu14
		call writestring
		call crlf
		call delay

		mov edx,offset menu18
		call writestring
		call crlf

		mov edx,offset menu14
		call writestring
		call crlf
		call delay

		mov edx,offset menu19
		call writestring
		call crlf
		call delay

		mov edx,offset menu15
		call writestring
		call crlf
		call delay
		
		go1:
		mov edx,offset pointermove		
		call writestring
		mGotoxy 49,13
		mov edx, offset pointer
		call writestring
		call readChar
		
		cmp al,32
		je Entered1
		mGotoxy 49,13

		cmp al,"s"
		je go2

		cmp al, "w"
		je go3

		jmp go1

		go2:
			mov edx,offset pointermove		
			call writestring
			mGotoxy 49,15
			mov edx,offset pointer
			call writestring
			call readchar

			cmp al,32
			je Entered2
			mGotoxy 49,15

			cmp al,"s"
			je go3

			cmp al,"w"
			je go1

			jmp go2

		go3:
			mov edx,offset pointermove		
			call writestring
			mGotoxy 49,17
			mov edx,offset pointer
			call writestring
			call readchar

			cmp al,32
			je Entered3

			mGotoxy 49,17

			cmp al,"s"
			je go1

			cmp al,"w"
			je go2

			jmp go3

		Entered1:
			call Level1
		Entered2:
			call Instructions
			ret
		Entered3:
			mov eax,20
			call clrscr
			mGotoxy 0,0
			mov edx,offset end1
			call Writestring
			call crlf
			call delay

			mov edx,offset end2
			call Writestring
			call crlf
			call delay

			mov edx,offset end3
			call Writestring
			call crlf
			call delay

			mov edx,offset end4
			call Writestring
			call crlf
			call delay

			mov edx,offset end5
			call Writestring
			call crlf
			call delay

			mov edx,offset end6
			call Writestring
			call crlf
			call delay

			mov edx,offset end7
			call Writestring
			call crlf
			call delay

			mov edx,offset end8
			call Writestring
			call crlf
			call delay

			mov edx,offset end9
			call Writestring
			call crlf
			call delay

			mov edx,offset end10
			call Writestring
			call crlf
			call delay

			mov edx,offset end11
			call Writestring
			call crlf
			call delay
			
			Invoke ExitProcess,0

	options ENDP

	Instructions PROC
		call clrscr
		mov eax,20
		call clrscr
		mov edx,offset help0
		call writestring
		call crlf
		call delay
		
		mov edx,offset help1
		call writestring
		call crlf
		call delay

		mov edx,offset help2
		call writestring
		call crlf
		call delay

		mov edx,offset help3
		call writestring
		call crlf
		call delay

		mov edx,offset help4
		call writestring
		call crlf
		call delay

		mov edx,offset help5
		call writestring
		call crlf
		call delay

		mov edx,offset help6
		call writestring
		call crlf
		call delay

		mov edx,offset help7
		call writestring
		call crlf
		call delay

		mov edx,offset help8
		call writestring
		call crlf
		call delay

		mov edx,offset help9
		call writestring
		call crlf
		call delay

		mov edx,offset help10
		call writestring
		call crlf
		call delay

		mov edx,offset help11
		call writestring
		call crlf
		call delay

		mov edx,offset help12
		call writestring
		call crlf
		call delay

		mov edx,offset help13
		call writestring
		call crlf
		call delay

		mov edx,offset help14
		call writestring
		call crlf
		call delay

		mov edx,offset help15
		call writestring
		call crlf

		call readchar
		cmp al,"b"
		je options
	Instructions ENDP


	Level1 PROC
		call setup
	Level1 ENDP

	Level2 PROC
		mov pacX, 35
		mov pacY, 18

		call clrscr
		call setup2
		

	Level2 ENDP

	Level3 PROC
		mov pacX, 35
		mov pacY, 18

		call clrscr
		call setup3
	Level3 ENDP

	transitionLevel PROC
		call clrscr
		mov eax,20

		mov edx,offset transition0
		call writestring
		call crlf
		call delay

		mov edx,offset transition1
		call writestring
		call crlf
		call delay
		
		mov edx,offset transition2
		call writestring
		call crlf
		call delay

		mov edx,offset transition3
		call writestring
		call crlf
		call delay

		mov edx,offset transition4
		call writestring
		call crlf
		call delay

		mov edx,offset transition5
		call writestring
		call crlf
		call delay

		mov edx,offset transition6
		call writestring
		call crlf
		call delay

		mov edx,offset transition7
		call writestring
		call crlf
		call delay

		mov edx,offset transition8
		call writestring
		call crlf
		call delay

		mov edx,offset transition9
		call writestring
		call crlf
		call delay

		mov edx,offset transition10
		call writestring
		call crlf
		call delay

		mov edx,offset transition11
		call writestring
		call crlf
		call delay

		mov edx,offset transition12
		call writestring
		call crlf
		call delay

		mov edx,offset transition13
		call writestring
		call crlf
		call delay

		mov edx,offset transition14
		call writestring
		call crlf
		call delay

		mov edx,offset transition15
		call writestring
		call crlf
		mov eax,2000
		call delay

		ret

	transitionLevel ENDP

	setup PROC
		mov edx,0
		mov ecx,0
		mov eax,0
		mov ebx,0
		mov dh,0
		mov dl,0
		call gotoxy
		call playMap
		mov dl,pacX
		mov dh,pacY
		call Gotoxy
		mov eax,yellow+(black*16)
		call SetTextColor
		mov eax,"e"
		call writechar
		call gotoxy
		mov esi,offset map
		mov dl,score2X
		mov dh,score2Y
		call gotoxy
		mWrite "SCORE : "
		mov dl,scoreX
		mov dh,scoreY
		call gotoxy
		mov eax,score
		call writedec
		mov dl,Lives2X
		mov dh,Lives2Y
		call gotoxy
		mWrite "LIVES: "
		mov dl,LivesX
		mov dh,LivesY
		call gotoxy
		mov eax,Lives
		call writedec
		mov eax,magenta+(black*16)
		call SetTextColor
		mov dl,enemyX
		mov dh,enemyY
		call gotoxy
		mov eax,"&"
		call writechar
		mov eax,yellow+(black*16)
		call SetTextColor
		mov dl,pacX
		mov dh,pacY
		call gotoxy
		mov ebx,[esi+634]

		call L1
				
	setup ENDP

	setup2 PROC
		mov edx,0
		mov ecx,0
		mov eax,0
		mov ebx,0
		mov dh,0
		mov dl,0
		call gotoxy
		call playMap2
		mov dl,pacX
		mov dh,pacY
		call Gotoxy
		mov eax,yellow+(black*16)
		call SetTextColor
		mov eax,"e"
		call writechar
		call gotoxy
		mov esi,offset map
		mov dl,score2X
		mov dh,score2Y
		call gotoxy
		mWrite "SCORE : "
		mov dl,scoreX
		mov dh,scoreY
		call gotoxy
		mov eax,score
		call writedec
		mov dl,Lives2X
		mov dh,Lives2Y
		call gotoxy
		mWrite "LIVES: "
		mov dl,LivesX
		mov dh,LivesY
		call gotoxy
		mov eax,Lives
		call writedec
		mov eax,magenta+(black*16)
		call SetTextColor
		mov dl,enemyX
		mov dh,enemyY
		call gotoxy
		mov eax,"&"
		call writechar
		mov eax,yellow+(black*16)
		call SetTextColor
		mov dl,pacX
		mov dh,pacY
		call gotoxy
		mov ebx,[esi+634]

		call L2
				
	setup2 ENDP

	setup3 PROC
		mov edx,0
		mov ecx,0
		mov eax,0
		mov ebx,0
		mov dh,0
		mov dl,0
		call gotoxy
		call playMap2
		mov dl,pacX
		mov dh,pacY
		call Gotoxy
		mov eax,yellow+(black*16)
		call SetTextColor
		mov eax,"e"
		call writechar
		call gotoxy
		mov esi,offset map
		mov dl,score2X
		mov dh,score2Y
		call gotoxy
		mWrite "SCORE : "
		mov dl,scoreX
		mov dh,scoreY
		call gotoxy
		mov eax,score
		call writedec
		mov dl,Lives2X
		mov dh,Lives2Y
		call gotoxy
		mWrite "LIVES: "
		mov dl,LivesX
		mov dh,LivesY
		call gotoxy
		mov eax,Lives
		call writedec
		mov eax,magenta+(black*16)
		call SetTextColor
		mov dl,enemyX
		mov dh,enemyY
		call gotoxy
		mov eax,"&"
		call writechar
		mov eax,yellow+(black*16)
		call SetTextColor
		mov dl,pacX
		mov dh,pacY
		call gotoxy
		mov ebx,[esi+634]

		call L2
				
	setup3 ENDP

	L1 PROC
			mov eax,yellow+(black*16)
			call SetTextColor

			;LIVES
			mov dh,LivesY
			mov dl,LivesX
			call gotoxy
			mov eax,Lives
			call writedec

			;SCORING
			mov dl,scoreX
			mov dh,scoreY
			call gotoxy
			mov eax,score
			call writedec

			cmp score,200
			je levelOver

			call playerLoc
			mov eax,5
			call delay
			call readkey
			cmp al,"w"
			jz runUp
			cmp al,"a"
			jz runLeft
			cmp al,"s"
			jz runDown
			cmp al,"d"
			jz runRight
			cmp al,"p"
			je pauseTheGame
			cmp al,"-"
			je levelOver
			;ELSE
			jmp runNext

		pauseTheGame:
			call pauseGame

		runLeft:
			mov ebx,62
			mov eax,rowIndex
			mul ebx
			add eax,colIndex
			dec eax
			dec eax
			mov present,eax
			mov ebx,[esi+eax]
			cmp bl,"#"
			je runNext
			cmp bl,"."
			jne continues
			inc score
			;INVOKE PlaySound, OFFSET foodSound, NULL, SND_FILENAME
			mov bl," "
			mov [esi+eax],bl
			continues:
			dec colIndex
			ColMap = colIndex
			mov eax,ColMap
			mov eax," "
			call writechar
			dec pacX
			mov dh,pacY
			mov dl,pacX
			call gotoxy
			mov eax,"e"
			call writechar
			call gotoxy
			jmp runNext

		runRight:
			mov ebx,62
			mov eax,rowIndex
			mul ebx
			add eax,colIndex
			add eax,2
			mov ebx,[esi+eax]
			cmp bl,"#"
			je runNext
			cmp bl,"."
			jne continues2
			inc score
			;INVOKE PlaySound, OFFSET foodSound, NULL, SND_FILENAME
			mov bl," "
			mov [esi+eax],bl
			continues2:
			inc colIndex
			ColMap = colIndex
			mov eax," "
			call writechar
			inc pacX
			mov dh,pacY
			mov dl,pacX
			call gotoxy
			mov eax,'e'
			call writechar
			call gotoxy
			jmp runNext

		runUp:
			mov ebx,62
			mov eax,rowIndex
			dec eax
			mul ebx
			add eax,colIndex
			mov ebx,[esi+eax]
			cmp bl,"#"
			je runNext
			cmp bl,"."
			jne continues3
			inc score
			;INVOKE PlaySound, OFFSET foodSound, NULL, SND_FILENAME
			 mov bl," "
			mov [esi+eax],bl
			continues3:
			dec rowIndex
			mov eax," "
			call writechar
			dec pacY
			mov dl,pacX
			mov dh,pacY
			call gotoxy
			mov eax,'e'
			call writechar
			call gotoxy
			jmp runNext

		runDown:
			mov ebx,62
			mov eax,rowIndex
			inc eax
			mul ebx
			add eax,colIndex
			mov ebx,[esi+eax]
			cmp bl,"#"
			je runNext
			cmp bl,"."
			jne continues4
			inc score
			;INVOKE PlaySound, OFFSET foodSound, NULL, SND_FILENAME
			 mov bl," "
			mov [esi+eax],bl
			continues4:
			inc rowIndex
			mov eax," "
			call writechar
			inc pacY
			mov dl,pacX
			mov dh,pacY
			call gotoxy
			mov eax,'e'
			call writechar
			call gotoxy

		runNext:
			;GHOST DETECTION
			cmp e1move,2
			je jumpmove1
			cmp e1move,0
			je jumpmove1
			push offset e1move
			call runEnemy 

		jumpmove1:
			call moveEnemy 
			cmp foodDetect,1
			jne collides
			mov eax,white+(black*16)
			call SetTextColor
			mov eax,"."
			mov dl,foodY
			mov dh,foodX
			call gotoxy
			mov foodDetect,0
			call writechar

		collides:
			push e1rowIndex
			push e1colIndex
			call EnemyCheck	

		cmp score, 200
		je levelOver
		
		call L1

		levelOver:
			call transitionLevel
			call Level2
			
	L1 ENDP

	L2 PROC
			mov eax,yellow+(black*16)
			call SetTextColor

			;LIVES
			mov dh,LivesY
			mov dl,LivesX
			call gotoxy
			mov eax,Lives
			call writedec

			;SCORING
			mov dl,scoreX
			mov dh,scoreY
			call gotoxy
			mov eax,score
			call writedec

			cmp score,400
			je levelOver

			call playerLoc
			mov eax,5
			call delay
			call readkey
			cmp al,"w"
			jz runUp
			cmp al,"a"
			jz runLeft
			cmp al,"s"
			jz runDown
			cmp al,"d"
			jz runRight
			cmp al,"p"
			je pauseTheGame
			cmp al,"-"
			je levelOver
			;ELSE
			jmp runNext

		pauseTheGame:
			call pauseGame2

		runLeft:
			mov ebx,62
			mov eax,rowIndex
			mul ebx
			add eax,colIndex
			dec eax
			dec eax
			mov present,eax
			mov ebx,[esi+eax]
			cmp bl,"#"
			je runNext
			cmp bl,"."
			jne continues
			inc score
			cmp bl,"o"
			jne continues
			inc score
			inc score
			inc score
			inc score
			inc score
			;INVOKE PlaySound, OFFSET foodSound, NULL, SND_FILENAME
			mov bl," "
			mov [esi+eax],bl
			continues:
			dec colIndex
			ColMap = colIndex
			mov eax,ColMap
			mov eax," "
			call writechar
			dec pacX
			mov dh,pacY
			mov dl,pacX
			call gotoxy
			mov eax,"e"
			call writechar
			call gotoxy
			jmp runNext

		runRight:
			mov ebx,62
			mov eax,rowIndex
			mul ebx
			add eax,colIndex
			add eax,2
			mov ebx,[esi+eax]
			cmp bl,"#"
			je runNext
			cmp bl,"."
			jne continues2
			inc score
			cmp bl,"o"
			jne continues2
			inc score
			inc score
			inc score
			inc score
			inc score
			;INVOKE PlaySound, OFFSET foodSound, NULL, SND_FILENAME
			mov bl," "
			mov [esi+eax],bl
			continues2:
			inc colIndex
			ColMap = colIndex
			mov eax," "
			call writechar
			inc pacX
			mov dh,pacY
			mov dl,pacX
			call gotoxy
			mov eax,'e'
			call writechar
			call gotoxy
			jmp runNext

		runUp:
			mov ebx,62
			mov eax,rowIndex
			dec eax
			mul ebx
			add eax,colIndex
			mov ebx,[esi+eax]
			cmp bl,"#"
			je runNext
			cmp bl,"."
			jne continues3
			inc score
			cmp bl,"o"
			jne continues3
			add score,5
			;INVOKE PlaySound, OFFSET foodSound, NULL, SND_FILENAME
			mov bl," "
			mov [esi+eax],bl
			continues3:
			dec rowIndex
			mov eax," "
			call writechar
			dec pacY
			mov dl,pacX
			mov dh,pacY
			call gotoxy
			mov eax,'e'
			call writechar
			call gotoxy
			jmp runNext

		runDown:
			mov ebx,62
			mov eax,rowIndex
			inc eax
			mul ebx
			add eax,colIndex
			mov ebx,[esi+eax]
			cmp bl,"#"
			je runNext
			cmp bl,"."
			jne continues4
			inc score
			cmp bl,"o"
			jne continues4
			inc score
			inc score
			inc score
			inc score
			inc score
			;INVOKE PlaySound, OFFSET foodSound, NULL, SND_FILENAME
			 mov bl," "
			mov [esi+eax],bl
			continues4:
			inc rowIndex
			mov eax," "
			call writechar
			inc pacY
			mov dl,pacX
			mov dh,pacY
			call gotoxy
			mov eax,'e'
			call writechar
			call gotoxy

		runNext:
			;GHOST DETECTION
			cmp e1move,2
			je jumpmove1
			cmp e1move,0
			je jumpmove1
			push offset e1move
			call runEnemy 

		jumpmove1:
			call moveEnemy 
			cmp foodDetect,1
			jne collides
			mov eax,white+(black*16)
			call SetTextColor
			mov eax,"."
			mov dl,foodY
			mov dh,foodX
			call gotoxy
			mov foodDetect,0
			call writechar

		collides:
			push e1rowIndex
			push e1colIndex
			call EnemyCheck	

		cmp score, 200
		je levelOver
		
		call L2

		levelOver:
			call transitionLevel
			call Level3
			
	L2 ENDP

	pauseGame PROC
			mov eax,20
			mov dl, 75
			mov dh, pauseVertical
			call gotoxy
			mov edx, offset pause1
			call writestring
			call crlf
			call delay
			inc pauseVertical
			mov dl, 75
			mov dh, pauseVertical
			call gotoxy
			mov edx, offset pause2
			call writestring
			call crlf
			call delay
			inc pauseVertical
			mov dl, 75
			mov dh, pauseVertical
			call gotoxy
			mov edx, offset pause3
			call writestring
			call crlf
			call delay
			inc pauseVertical
			mov dl, 75
			mov dh, pauseVertical
			call gotoxy
			mov edx, offset pause4
			call writestring
			call crlf
			call delay
			inc pauseVertical
			mov dl, 75
			mov dh, pauseVertical
			call gotoxy
			mov edx, offset pause5
			call writestring
			call crlf
			call delay
			inc pauseVertical
			mov dl, 75
			mov dh, pauseVertical
			call gotoxy
			mov edx, offset pause6
			call writestring
			call crlf
			call delay
			inc pauseVertical
			mov dl, 75
			mov dh, pauseVertical
			call gotoxy
			mov edx, offset pause7
			call writestring
			call crlf
			call delay
			inc pauseVertical
			mov dl, 75
			mov dh, pauseVertical
			call gotoxy
			mov edx, offset pause8
			call writestring
			call crlf
			call delay
			inc pauseVertical
			mov dl, 75
			mov dh, pauseVertical
			call gotoxy
			mov edx, offset pause9
			call writestring
			call crlf
			call delay
			inc pauseVertical
			mov dl, 75
			mov dh, pauseVertical
			call gotoxy
			mov edx, offset pause10
			call writestring
			call crlf
			call delay
			inc pauseVertical
			mov dl, 75
			mov dh, pauseVertical
			call gotoxy
			mov edx, offset pause11
			call writestring
			call crlf
			call delay
			inc pauseVertical

			call readchar
			cmp al,"1"
				je resume
			cmp al,"2"
				je hi
			cmp al,"3"
				je finishes
			cmp al,"4"
				je restarting
			
			call endpause
			jmp pauseGame
			restarting:
				call clrscr
				mov pacX,35
				mov pacY,18
				call playMap
				call setup
			
			finishes:
				Invoke ExitProcess,0

			hi:
				call highscores
			resume:
				call endpause
				call L1
	pauseGame ENDP

		pauseGame2 PROC
			mov eax,20
			mov dl, 75
			mov dh, pauseVertical
			call gotoxy
			mov edx, offset pause1
			call writestring
			call crlf
			call delay
			inc pauseVertical
			mov dl, 75
			mov dh, pauseVertical
			call gotoxy
			mov edx, offset pause2
			call writestring
			call crlf
			call delay
			inc pauseVertical
			mov dl, 75
			mov dh, pauseVertical
			call gotoxy
			mov edx, offset pause3
			call writestring
			call crlf
			call delay
			inc pauseVertical
			mov dl, 75
			mov dh, pauseVertical
			call gotoxy
			mov edx, offset pause4
			call writestring
			call crlf
			call delay
			inc pauseVertical
			mov dl, 75
			mov dh, pauseVertical
			call gotoxy
			mov edx, offset pause5
			call writestring
			call crlf
			call delay
			inc pauseVertical
			mov dl, 75
			mov dh, pauseVertical
			call gotoxy
			mov edx, offset pause6
			call writestring
			call crlf
			call delay
			inc pauseVertical
			mov dl, 75
			mov dh, pauseVertical
			call gotoxy
			mov edx, offset pause7
			call writestring
			call crlf
			call delay
			inc pauseVertical
			mov dl, 75
			mov dh, pauseVertical
			call gotoxy
			mov edx, offset pause8
			call writestring
			call crlf
			call delay
			inc pauseVertical
			mov dl, 75
			mov dh, pauseVertical
			call gotoxy
			mov edx, offset pause9
			call writestring
			call crlf
			call delay
			inc pauseVertical
			mov dl, 75
			mov dh, pauseVertical
			call gotoxy
			mov edx, offset pause10
			call writestring
			call crlf
			call delay
			inc pauseVertical
			mov dl, 75
			mov dh, pauseVertical
			call gotoxy
			mov edx, offset pause11
			call writestring
			call crlf
			call delay
			inc pauseVertical

			call readchar
			cmp al,"1"
				je resume
			cmp al,"2"
				je hi
			cmp al,"3"
				je finishes
			cmp al,"4"
				je restarting
			
			call endpause
			jmp pauseGame2
			restarting:
				call setup
			
			finishes:
				Invoke ExitProcess,0

			hi:
				call highscores
			resume:
				call endpause
				call L2
	pauseGame2 ENDP

	endpause PROC
		mov eax,20
				dec pauseVertical 

				mov dl, 75
				mov dh, pauseVertical
				call gotoxy
				mov edx, offset clrPause
				call writestring
				call crlf
				call delay
				dec pauseVertical
				
				mov dl, 75
				mov dh, pauseVertical
				call gotoxy
				mov edx, offset clrPause
				call writestring
				call crlf
				call delay
				dec pauseVertical

				mov dl, 75
				mov dh, pauseVertical
				call gotoxy
				mov edx, offset clrPause
				call writestring
				call crlf
				call delay
				dec pauseVertical

				mov dl, 75
				mov dh, pauseVertical
				call gotoxy
				mov edx, offset clrPause
				call writestring
				call crlf
				call delay
				dec pauseVertical

				mov dl, 75
				mov dh, pauseVertical
				call gotoxy
				mov edx, offset clrPause
				call writestring
				call crlf
				call delay
				dec pauseVertical

				mov dl, 75
				mov dh, pauseVertical
				call gotoxy
				mov edx, offset clrPause
				call writestring
				call crlf
				call delay
				dec pauseVertical

				mov dl, 75
				mov dh, pauseVertical
				call gotoxy
				mov edx, offset clrPause
				call writestring
				call crlf
				call delay
				dec pauseVertical

				mov dl, 75
				mov dh, pauseVertical
				call gotoxy
				mov edx, offset clrPause
				call writestring
				call crlf
				call delay
				dec pauseVertical

				mov dl, 75
				mov dh, pauseVertical
				call gotoxy
				mov edx, offset clrPause
				call writestring
				call crlf
				call delay
				dec pauseVertical

				mov dl, 75
				mov dh, pauseVertical
				call gotoxy
				mov edx, offset clrPause
				call writestring
				call crlf
				call delay
				dec pauseVertical

				mov dl, 75
				mov dh, pauseVertical
				call gotoxy
				mov edx, offset clrPause
				call writestring
				call crlf
				call delay

				ret
	endpause ENDP

	highscores PROC
		call endpause

		mov eax,20
			mov dl, 75
			mov dh, pauseVertical
			call gotoxy
			mov edx, offset hi1
			call writestring
			call crlf
			call delay
			inc pauseVertical
			mov dl, 75
			mov dh, pauseVertical
			call gotoxy
			mov edx, offset hi2
			call writestring
			call crlf
			call delay
			inc pauseVertical
			mov dl, 75
			mov dh, pauseVertical
			call gotoxy
			mov edx, offset hi3
			call writestring
			call crlf
			call delay
			inc pauseVertical
			mov dl, 75
			mov dh, pauseVertical
			call gotoxy
			mov edx, offset hi4
			call writestring
			
				mov dl,78
				mov dh,pauseVertical
				call gotoxy
				mov edx,offset highname1
				call writestring

				mov dl,100
				mov dh, pauseVertical
				call gotoxy
				mov al,highscore1 
				call writeint

				mov eax,20
			call crlf
			call delay
			inc pauseVertical
			mov dl, 75
			mov dh, pauseVertical
			call gotoxy
			mov edx, offset hi5
			call writestring

				mov dl,78
				mov dh,pauseVertical
				call gotoxy
				mov edx,offset highname2
				call writestring

				mov dl,100
				mov dh, pauseVertical
				call gotoxy
				mov al, highscore2 
				call writeint

				mov eax,20
			call crlf
			call delay
			inc pauseVertical
			mov dl, 75
			mov dh, pauseVertical
			call gotoxy
			mov edx, offset hi6
			call writestring

				mov dl,78
				mov dh,pauseVertical
				call gotoxy
				mov edx,offset highname3
				call writestring

				mov dl,100
				mov dh, pauseVertical
				call gotoxy
				mov al, highscore3 
				call writeint

				mov eax,20

			call crlf
			call delay
			inc pauseVertical
			mov dl, 75
			mov dh, pauseVertical
			call gotoxy
			mov edx, offset hi7
			call writestring

				mov dl,78
				mov dh,pauseVertical
				call gotoxy
				mov edx,offset highname4
				call writestring

				mov dl,100
				mov dh, pauseVertical
				call gotoxy
				mov al, highscore4
				call writeint

				mov eax,20

			call crlf
			call delay
			inc pauseVertical
			mov dl, 75
			mov dh, pauseVertical
			call gotoxy
			mov edx, offset hi8
			call writestring

				mov dl,78
				mov dh,pauseVertical
				call gotoxy
				mov edx,offset highname5
				call writestring

				mov dl,100
				mov dh, pauseVertical
				call gotoxy
				mov al, highscore5 
				call writeint

				mov eax,20

			call crlf
			call delay
			inc pauseVertical
			mov dl, 75
			mov dh, pauseVertical
			call gotoxy
			mov edx, offset hi9
			call writestring
			call crlf
			call delay
			inc pauseVertical
			mov dl, 75
			mov dh, pauseVertical
			call gotoxy
			mov edx, offset hi10
			call writestring
			call crlf
			call delay
			inc pauseVertical
			mov dl, 75
			mov dh, pauseVertical
			call gotoxy
			mov edx, offset hi11
			call writestring
			call crlf
			call delay
			inc pauseVertical

			call readchar
			cmp al, "b"
				call endpause
				call pauseGame
			call highscores
	highscores ENDP

	playMap2 PROC
		mov horizontal, 4
		mov ctr,0
		call clrscr
		mov dl,5
		mov dh,horizontal
		call gotoxy
 		mov esi,offset map2
		mov ebx,60
		mov ecx,24
		mapping1:
			mapping2:
			inc ctr
			push ebx
			mov ebx,[esi]
       
			cmp bl,"#"
			je wall
			cmp bl,"."
			je food
			cmp bl,"o"
			je cherry
			call blanks 
			jmp Llooped
			wall:
			call walling
			jmp Llooped
			food:
				call points
				jmp Llooped
			cherry:
				call cherryPoint

			Llooped:
				inc esi
				pop ebx
				cmp ebx,0
				je loopAgain
				dec ebx

			jmp mapping2
			loopAgain:
			add esi,1
			mov ebx,60
			mov dl,5
			inc horizontal
			mov dh,horizontal
			call gotoxy
		loop mapping1

  
		call crlf
		ret
	PlayMap2 ENDP

	playMap PROC
		mov horizontal, 4
		mov ctr,0
		mov score,0
		mov lives,3
		call clrscr
		mov dl,5
		mov dh,horizontal
		call gotoxy
		mov esi,offset map
		mov ebx,60
		mov ecx,24
		mapping1:
			mapping2:
			inc ctr
			push ebx
			mov ebx,[esi]
       
			cmp bl,"#"
			je wall
			cmp bl,"."
			je food
			call blanks 
			jmp Llooped
			wall:
			call walling
			jmp Llooped
			food:
			call points
			Llooped:
			inc esi
			pop ebx
			cmp ebx,0
			je loopAgain
			dec ebx
        
			jmp mapping2
			loopAgain:
			add esi,1
			mov ebx,60
			mov dl,5
			inc horizontal
			mov dh,horizontal
			call gotoxy
		loop mapping1

  
		call crlf
		ret
	playMap ENDP

	blanks proc
		mov eax,black+(black*16)
		mov edx,offset blanked
		call SetTextColor
		call writestring
		ret
	blanks endp

	points proc
		mov eax,white+(black*16)
		mov edx,offset pointed
		call SetTextColor
		call writestring
		ret
	points endp

	cherryPoint proc
		mov eax,lightMagenta+(black*16)
		mov edx,offset cherryPointed
		call SetTextColor
		call writestring
		ret
	cherryPoint endp

	walling proc
		mov eax,blue+(blue*16)
		mov edx,offset walled
		call SetTextColor
		call writestring
		ret
	walling endp

	playerLoc proc
		mov dl,pacX
		mov dh,pacY
		call gotoxy
		ret
	playerLoc endp

	runEnemy proc
		mov eax,4
		enter 0,0
		call randomRange
		mov ecx,[ebp+8]
		mov [ecx],eax
		leave
		ret 4
	runEnemy endp

	moveEnemy proc
		mov eax,red+(black*16)
		call SetTextColor
		mov eax,150
		call Delay
		mov dl,enemyX
		mov dh,enemyY
		call gotoxy
    
		cmp e1move,0
		je enemyUp
		cmp e1move,1
		je enemyRight
		cmp e1move,2
		je enemyDown
		cmp e1move,3
		je enemyLeft
		enemyUp:
			mov ebx,62
			mov eax,e1rowIndex
			dec eax
			mul ebx
			add eax,e1colIndex
			mov ebx,[esi+eax]
			cmp bl,"#"
			je endMove
			cmp bl,"."
			jne nReCoinU
			mov foodDetect,1
			mov ecx,e1colIndex
			dec ecx
			add ecx,4
			mov edx,e1colIndex
			add edx,5
			mov foodX,cl
			mov foodY,dl
			mov foodDetect,1

			nReCoinU:
				dec e1rowIndex
				mov eax," "
				call writechar
				dec enemyY
				mov dl,enemyX
				mov dh,enemyY
				call gotoxy
				mov eax,'&'
				call writechar
				jmp endMove

		enemyRight:
			 mov ebx,62
			 mov eax,e1rowIndex
			 mul ebx
			 add eax,e1colIndex
			 add eax,2
			 mov ebx,[esi+eax]
			 cmp bl,"#"
			 je endMove
			 mov ebx,62
			 mov eax,e1rowIndex
			 mul ebx
			 add eax,e1colIndex
			 add eax,1
			 mov ebx,[esi+eax]
			 cmp bl,"."
			 jne nReCoinR
			 mov foodDetect,1
			 mov ecx,e1rowIndex
			 add ecx,4
			 mov edx,e1colIndex
			 add edx,5
			 mov foodX,cl
			 mov foodY,dl
			 mov foodDetect,1

			 nReCoinR:
				inc e1colIndex
				mov eax," "
				call writechar
				inc enemyX
				mov dl,enemyX
				mov dh,enemyY
				call gotoxy
				mov eax,"&"
				call writechar
			 jmp endMove

		enemyDown:
			 mov ebx,62
			 mov eax,e1rowIndex
			 inc eax
			 mul ebx
			 add eax,e1colIndex
			 mov ebx,[esi+eax]
			 cmp bl,"#"
			 je endMove
			 cmp bl,"."
			 jne nReCoinD
			 mov foodDetect,1
			 mov ecx,e1rowIndex
			 inc ecx
			 add ecx,4
			 mov edx,e1colIndex
			 add edx,5
			 mov foodX,cl
			 mov foodY,dl
			 mov foodDetect,1

			 nReCoinD:
				 inc e1rowIndex
				 mov eax," "
				 call writechar
				 inc enemyY
				 mov dl,enemyX
				 mov dh,enemyY
				 call gotoxy
				 mov eax,"&"
				 call writechar
			 jmp endMove
		enemyLeft:
			 mov ebx,62
			 mov eax,e1rowIndex
			 mul ebx
			 add eax,e1colIndex
			 sub eax,2
			 mov ebx,[esi+eax]
			 cmp bl,"#"
			 je endMove
			 mov ebx,62
			 mov eax,e1rowIndex
			 mul ebx
			 add eax,e1colIndex
			 add eax,1
			 mov ebx,[esi+eax]
			 cmp bl,"."
			 jne nReCoinL
			 mov foodDetect,1
			 mov ecx,e1rowIndex
			 add ecx,4
			 mov edx,e1colIndex
			 add edx,5
			 mov foodX,cl
			 mov foodY,dl
			 mov foodDetect,1

			nReCoinL:
				dec e1colIndex
				mov eax," "
				call writechar
				dec enemyX
				mov dl,enemyX
				mov dh,enemyY
				call gotoxy
				mov eax,"&"
				call writechar
		endMove:
			cmp bl,"#"
			je enemyMoveCheck
			jmp finish

			enemyMoveCheck:
				cmp e1move,0
				je enemyMoveRe
				cmp e1move,2
				je enemyMoveRe
				jmp finish
			enemyMoveRe:
				mov e1move,7
			finish:
				ret 
	moveEnemy endp

	EnemyCheck proc
		enter 0,0
        mov ecx,[ebp+12]
        mov ebx,[ebp+8]
        cmp rowIndex,ecx
		jne falseC
        cmp colIndex,ebx
		jne falseC
        dec Lives
		INVOKE PlaySound, OFFSET deathSound, NULL, SND_FILENAME
        mov rowIndex,14
        mov colIndex,30
        mov pacX,35
        mov pacY,18
		falseC:
			leave
			ret 8
	EnemyCheck endp

	gameOver PROC
		call clrscr
	gameOver ENDP


end main




