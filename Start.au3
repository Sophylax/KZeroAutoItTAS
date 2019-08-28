Func LaunchGame()
	Run("G:\Steam\steamapps\common\Katana ZERO\Katana ZERO.exe")
	WinWaitActive("Katana ZERO")
EndFunc

Func SkipIntro($kz_handle)

	Cout("Waiting out the splash screen..." & @LF)
	;Wait out the initial splash screen
	While 1
		$pix = PixelGetColor ( 100 , 100, $kz_handle)
		if $pix = 3353158 then exitloop
	WEnd

	Cout("Skipping warnings and logo." & @LF)
	;Spam space to skip warnings and logo
	While 1
		$pix = PixelGetColor ( 100 , 100, $kz_handle)
		if $pix <> 3353158 then exitloop
		;Cout($pix & @LF)
		Send("{SPACE}")
		Sleep(50)
	WEnd
EndFunc

Func IdentifyMainMenu($kz_handle)
	While 1
		$pix = PixelGetColor ( 500 , 100, $kz_handle)
		if $pix = 7086931 then exitloop
		;Cout($pix & @LF)
	WEnd
EndFunc

Func BeginSpeedrun($kz_handle)
	Cout("Navigating menu." & @LF)
	Send("{DOWN}")
	Send("{SPACE}")
	While 1
		$pix = PixelGetColor ( 10 , 10, $kz_handle)
		if $pix = 255 then exitloop
		;Cout($pix)
	WEnd
	Send("{UP}")
	Sleep(50)
	Send("{UP}")
	Send("{SPACE}")
	Cout("Pressed 'Begin Run'." & @LF)
EndFunc

Func StartRun()
	If Not WinExists("Katana ZERO") Then
		LaunchGame()
		Cout("Launched Game." & @LF)
		$kz_handle = WinGetHandle("Katana ZERO")
		WinActivate($kz_handle)
		Cout("Skipping Intro" & @LF)
		SkipIntro($kz_handle)
	Else
		Cout("Game already launched." & @LF)
		$kz_handle = WinGetHandle("Katana ZERO")
		WinActivate($kz_handle)
	Endif

	IdentifyMainMenu($kz_handle)
	Cout("Main Menu identified." & @LF)

	BeginSpeedrun($kz_handle)

    Return $kz_handle
EndFunc