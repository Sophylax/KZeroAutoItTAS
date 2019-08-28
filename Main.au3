#include <Array.au3>
#include <Color.au3>
#include <Constants.au3>
#include <Console.au3>
#include <AutoItConstants.au3>
#include "Start.au3"
#include "Common.au3"
#include "01Factory.au3"

AutoItSetOption("PixelCoordMode",2)
AutoItSetOption("MouseCoordMode",2)
Cout("Starting TAS..." & @LF)
Sleep(250)

HotKeySet("{F5}", "Quit")
HotKeySet("{F6}", "Abort")

Func Abort()
	Exit
EndFunc

Func Quit()
	Send("{ESC}")
	Sleep(50)
	Send("{UP}")
;~ 	Sleep(100)
	Send("{UP}")
	Sleep(50)
	Send("{ENTER}")
	Exit
EndFunc

$KZ_handle = StartRun()
RunFactory($KZ_handle)


$begin = TimerInit ()
While 1
	$dif = TimerDiff ($begin)
	if $dif > 1 then exitloop
WEnd

Cout("Terminating...")
Local $dummy
;Cin($dummy)