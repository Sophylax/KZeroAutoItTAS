Func RunFactory($kz_handle)
	Cout(@LF & " = Stage 01: Factory =" & @LF)
	Run0101($kz_handle)
	Run0102($kz_handle)
	Run0103($kz_handle)
	Run0104($kz_handle)
	Run0105($kz_handle)
EndFunc

Func Run0105($kz_handle)
	Cout("Level 01-05" & @LF)
	Cout("Waiting the level..." & @LF)
	;WaitLevel($kz_handle)
	;Sleep(750)

	;WaitCursorAppear($kz_handle)
	WaitSaveIcon($kz_handle)
	TimeFrame(75)

	Send("{RIGHT DOWN}")

	;Roll, slash open door
	DoRoll()
	TimeFrame(13)
	DoSlash(896, 650)
	TimeFrame(10)

	;Roll, slash to kill two
	DoRoll()
	TimeFrame(22)
	DoSlash(896, 650)
	TimeFrame(5)

	;Roll upstairs, slash open door
	DoChainRoll(3, 375)
	TimeFrame(16)
	DoSlash(1000, 360)

	;Turn Left, roll past lasers
	Send("{RIGHT UP}")
	Send("{LEFT DOWN}")
	TimeFrame(10)
	DoChainRoll(3, 425)
	TimeMili(375)
	DoRoll()
	TimeFrame(18)

	;Turn left, jump, slash to next floor
	Send("{LEFT UP}")
	Send("{RIGHT DOWN}")
	DoJumpFrame(12)
	DoSlash(800,100)
	TimeFrame(21)

	;Roll, slash open door
	DoRoll()
	TimeFrame(21)
	DoSlash(1250,400)
	TimeFrame(14)

	;Roll, switch lasers twice
	DoRoll()
	TimeFrame(3)
	Send("{SPACE}")
	TimeFrame(10)
	Send("{SPACE}")
	TimeFrame(9)

	;Slash to kill, Roll to scientist
	DoSlash(1250,400)
	TimeFrame(5)
	DoChainRoll(2, 450)
	TimeMili(375)
	TimeFrame(1)

	;Turn right, roll, release scientist
	Send("{RIGHT UP}")
	Send("{LEFT DOWN}")
	DoRoll()
	TimeFrame(1)
	Send("{SPACE}")

	;Wait out the damn cutscene, re-establish left
	TimeMili(2000)
	Send("{LEFT UP}")
	TimeMili(1817)
	Send("{LEFT DOWN}")
	TimeMili(1000)

	;Roll twice, turn off the lasers, roll more to drop
	DoChainRoll(2, 375)
	TimeMili(200)
	Send("{SPACE}")
	TimeMili(175)
	DoChainRoll(2, 375)
	TimeMili(375)
	DoRoll()
	DoDropFrame(9)

	;Slash down and right, turn right
	DoSlash(300,490)
	Send("{LEFT UP}")
	Send("{RIGHT DOWN}")
	TimeFrame(21)

	;Roll down, twice
	DoRoll()
	Send("{DOWN DOWN}")
	TimeFrame(24)
	DoRoll()
	TimeFrame(10)
	Send("{DOWN UP}")
	TimeFrame(6)

	;Slash to kill three
	DoSlash(960,360)
	Send("{RIGHT UP}")
	Send("{LEFT DOWN}")
	Send("{DOWN DOWN}")
	TimeFrame(10)
	TimeFrame(24)
	Send("{DOWN UP}")
	TimeMili(375)
	DoChainRoll(4, 375)
	Send("{LEFT UP}")
	Return

EndFunc

;Level:  6.15
;Target: 6.10
;Total: 35.15
Func Run0104($kz_handle)
	Cout("Level 01-04" & @LF)
	Cout("Waiting the level..." & @LF)
	;WaitCursorAppear($kz_handle)
	WaitSaveIcon($kz_handle)
	TimeFrame(68)

	;Roll Twice
	Send("{RIGHT DOWN}")
	DoChainRoll(2, 375)
	TimeFrame(10)

	;WallJumps
	DoJumpFrame(20)
	Send("{RIGHT UP}")
	Send("{LEFT DOWN}")
	DoJumpFrame(10)
	Send("{LEFT UP}")
	Send("{RIGHT DOWN}")
	DoJumpFrame(10)
	Send("{RIGHT UP}")
	Send("{LEFT DOWN}")
	DoJumpFrame(10)
	Send("{LEFT UP}")
	Send("{RIGHT DOWN}")

	;Slice Up
	DoSlash(550, 150)
	TimeFrame(12)

	;Roll-Slice Right
	DoSlash(1000, 480)
	TimeFrame(3)

	;Roll once
	DoRoll()
	TimeFrame(23)

	;Jump up, Turn Left
	DoJumpFrame(12)
	Send("{RIGHT UP}")
	Send("{LEFT DOWN}")
	TimeFrame(6)

	;Slash Up, Slide Up
	DoSlash(600, 150)
	DoJumpFrame(23)

	;Jump Right
	Send("{LEFT UP}")
	Send("{RIGHT DOWN}")
	DoJumpFrame(10)
	DoDropFrame(2)

	;Four Rolls to Exit
	DoChainRoll(4,375)
	TimeMili(200)
	Send("{RIGHT UP}")
EndFunc

;Level:  4.37
;Target: 4.35
;Total  29.00
Func Run0103($kz_handle)
	Cout("Level 01-03" & @LF)
	Cout("Waiting the level..." & @LF)
	;WaitLevel($kz_handle)
	;Sleep(750)
	;WaitPixel($kz_handle, 182, 366, 16777215)
	;WaitUILeftSideWhiteBar($kz_handle)
	WaitSaveIcon($kz_handle)
	TimeFrame(30)

	;Six relatively slow rolls to avoid Lazor
	Send("{RIGHT DOWN}")
	DoChainRoll(6, 400)
	TimeMili(375)

	;Switch off the Lazor
	Send("{SPACE}")

	;Two more to exit
	DoChainRoll(2, 375)

	TimeMili(500)
	Send("{RIGHT UP}")
EndFunc

;Level:  11.81
;Target: 11.78
;Total:  24.63
Func Run0102($kz_handle)
	Cout("Level 01-02" & @LF)
	Cout("Waiting for the prompt..." & @LF)
	;While 1
	;	$pix = PixelGetColor ( 915 , 428, $kz_handle)
	;	if $pix = 15161524 then exitloop
	;	if $pix = 10263708 then exitloop
	;	;Cout($pix & @LF)
	;WEnd
	WaitSaveIcon($kz_handle)
	TimeFrame(434)
	MouseClick("left", 640, 360, 1, 0)
	;TimeFrame(1)

	;Two rolls to under the terry
	Send("{RIGHT DOWN}")
	DoChainRoll(2, 375)
	TimeFrame(13)

	;Jump Up
	DoJumpFrame(22)

	;Slash Up
	DoSlash(640, 300)

	;Switch Directions
	Send("{RIGHT UP}")
	Send("{LEFT DOWN}")
	TimeFrame(20)

	;Slash Door, Turn Right
	DoSlash(600, 300)
	TimeFrame(15)
	Send("{LEFT UP}")
	Send("{RIGHT DOWN}")
	TimeFrame(5)

	;Slash Left
	DoSlash(200, 450)
	TimeFrame(8)

	;Six Rolls to Exit Level
	DoChainRoll(6, 375)
	TimeFrame(20)
	Send("{RIGHT UP}")
EndFunc

;Level:  12.82
;Target: 12.82
;Total:  12.82
Func Run0101($kz_handle)
	Cout("Level 01-01" & @LF)
	Cout("Waiting for the prompt..." & @LF)
	While 1
		$pix = PixelGetColor ( 629 , 213, $kz_handle)
		if $pix = 15161524 then exitloop
		if $pix = 10263708 then exitloop
		;Cout($pix & @LF)
	WEnd
	MouseClick("left", 640, 360, 1, 0)
	Cout("Run started." & @LF)

	Cout("Waiting for controls..." & @LF)
	TimeMili(4350)
	;WaitCursorAppear($kz_handle)
	;While 1 ; Wait for black bars to disappear
	;	$pix = PixelGetColor ( 629 , 1, $kz_handle)
	;	if $pix <> 0 then exitloop
	;	;Cout($pix & @LF)
	;WEnd
	;Sleep(750) ; Turns out you need to wait more

	;Reorient and hold right
	Send("{RIGHT DOWN}")

	;Five Perfect Rolls
	DoChainRoll(5,375)
	TimeFrame(15)

	;Slash up to Crates
	DoSlash(1120,360)
	TimeFrame(12)

	;Roll Twice
	DoChainRoll(2,450)
	TimeFrame(16)

	;Slash right to Next Roof
	DoSlash(1120,375)
	TimeFrame(19)

	;Roll on roof
	DoRoll()
	TimeFrame(17)

	;Slash up to Next Roof
	DoSlash(1100,100)
	TimeFrame(18)

	;Roll on roof
	DoChainRoll(2,375)
	TimeMili(250)

	;High Jump and slash up
	DoJumpMili(250)
	DoSlash(800,10)
	TimeMili(350)

	;Roll Twice and Drop Down
	DoChainRoll(2,375)
	TimeMili(375)
	DoDropMili(400)

	;Roll once
	DoRoll()
	TimeFrame(12)

	;Slash Down
	DoSlash(1100,650)
	TimeFrame(1)
	DoDropMili(450)

	;Roll Once
	DoRoll()
	TimeMili(300)

	;Slash Open the Door
	DoSlash(1100,700)
	TimeFrame(10)

	;Roll Twice
	DoChainRoll(2,375)

	;Spam Space Each Frame for 10 Frames
	For $i = 1 To 10 Step 1
		TimeFrame(1)
		Send("{SPACE}")
	Next

	Send("{RIGHT UP}")
EndFunc