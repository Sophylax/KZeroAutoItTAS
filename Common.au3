$dll=DllOpen("kernel32.dll")

Func TimeFrame($sFrames)
	TimeMili($sFrames * 1000.0 / 60.0)
EndFunc

Func TimeMili($sTime)
	_DllTiming($sTime)
EndFunc

Func _DllTiming($sTime)
	DllCall($dll,"none","Sleep","dword",$sTime)
EndFunc

Func _BusyTiming($sTime)
    $timer=TimerInit()
    Do
        $tmp = TimerDiff($timer)
    Until $tmp >= $sTime
EndFunc

Func HoldKeyMili($key, $duration)
	Send("{" & $key & " DOWN}")
	TimeMili($duration)
	Send("{" & $key & " UP}")
EndFunc

Func HoldKeyFrame($key, $duration)
	Send("{" & $key & " DOWN}")
	TimeFrame($duration)
	Send("{" & $key & " UP}")
EndFunc

Func DoJumpMili($duration)
	HoldKeyMili("UP", $duration)
EndFunc

Func DoJumpFrame($duration)
	HoldKeyFrame("UP", $duration)
EndFunc

Func DoJump()
	Send("{UP}")
EndFunc

Func DoDropMili($duration)
	HoldKeyMili("DOWN", $duration)
EndFunc

Func DoDropFrame($duration)
	HoldKeyFrame("DOWN", $duration)
EndFunc

Func DoDrop()
	Send("{DOWN}")
EndFunc

Func DoRoll()
	Send("{ENTER DOWN}")
	Send("{ENTER UP}")
EndFunc

Func DoSlash($x = MouseGetPos(0), $y = MouseGetPos(1))
	MouseMove($x, $y, 0)
	MouseDown("main")
	TimeFrame(1)
	MouseUp("main")
EndFunc

Func DoChainRoll($roll_count, $roll_delay)
	For $i = 1 To $roll_count - 1 Step 1
		DoRoll()
		TimeMili($roll_delay)
	Next
	DoRoll()
EndFunc


Func WaitPixel($kz_handle, $x, $y, $color)
	While 1
		$pix = PixelGetColor ( $x , $y, $kz_handle)
		if $pix = $color then exitloop
		;Cout($pix & @LF)
	WEnd
EndFunc
Func WaitSolidRectangle($kz_handle, $x, $y, $w, $h, $color)
	While 1
		$match = 1
		For $row = 0 To $h - 1
			For $col = 0 To $w - 1
				$pix = PixelGetColor ( $x + $col , $y + $row, $kz_handle)
				If $pix <> $color Then
					Cout("Unmatch: " & $x + $col & "," & $y + $row & @LF)
					$match = 0
					ExitLoop
				EndIf
			Next
			If $match = 0 Then
				ExitLoop
			EndIf
		Next
		If $match = 1 Then
			ExitLoop
		EndIf
	WEnd
EndFunc

Func WaitUILeftSideWhiteBar($kz_handle)
	WaitPixel($kz_handle, 2, 44, 16777215)
EndFunc

Func WaitUIRightSideWhiteBar($kz_handle)
	WaitPixel($kz_handle, 1270, 44, 16777215)
EndFunc

Func WaitCursorAppear($kz_handle)
	Local $aPos = MouseGetPos()
	WaitPixel($kz_handle, $aPos[0], $aPos[1], 16777215)
EndFunc

Func WaitUIRightClickButton($kz_handle)
	WaitPixel($kz_handle, 1257, 35, 16777215)
EndFunc

Func WaitTimerDot($kz_handle)
	WaitPixel($kz_handle, 1110, 26, 12615872)
EndFunc

Func WaitSaveIcon($kz_handle)
	WaitPixel($kz_handle, 1204, 644, 3775695)
EndFunc

Func WaitLevel($kz_handle)
	;MouseMove(640, 360, 0)
	;WaitTimerDot($kz_handle)
	WaitUIRightClickButton($kz_handle)
EndFunc