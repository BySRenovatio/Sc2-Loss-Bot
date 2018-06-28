HotKeySet("{END}", "quit")
HotKeySet("{Home}", "start")
HotKeySet("{TAB}", "pozitie")

Global $xBut = 2300
Global $yBut = 840
Global $bColor = 2887939

Global $pX = 3430
Global $pY = 140
Global $port_color = 1053720

Global $iX = 2400
Global $iY = 940
Global $ingame = 0

While 1
	Sleep(250)
WEnd

Func quit()
	Exit
EndFunc

Func pozitie()
	Local $aPos = MouseGetPos()
	Local $color = PixelGetColor($aPos[0], $aPos[1])
	ToolTip($aPos[0] & " x " & $aPos[1] & " col: " & $color)
EndFunc

Func pozitiecheck()
	Local $color = PixelGetColor(2300, 840)
	ToolTip(2300 & " x " & 840 & " col: " & $color)
EndFunc

Func start()
	While 1
		$port_color = PixelGetColor($pX, $pY)
		$bColor = PixelGetColor($xBut, $yBut)
		Sleep(300)
		
		If $port_color = 1053720 AND $bColor = 2887939 Then
			click_play()
		EndIf

		$ingame = PixelGetColor($iX, $iY)
		If $ingame = 0 Then
			end_match()
		EndIf
		
		If $port_color <> 1053720 Then
			victorySCR()
		EndIf
		
		Sleep(700)
	WEnd
EndFunc

Func click_play()
	Local $aPos = MouseGetPos()
	MouseMove($xBut, $yBut, 0)
	Sleep(200)
	MouseClick("left")
	MouseMove($aPos[0], $aPos[1], 0)
EndFunc

Func end_match()
	Send("{F10}")
	Sleep(200)
	Send("{n}")
	Sleep(200)
EndFunc

Func victorySCR()
	Send("{s}")
	Sleep(200)
EndFunc