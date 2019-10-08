; Script Function:
;	Put a virtual numeric keypad on the screen

#NoEnv  						; Recommended for performance and compatibility with future AutoHotkey releases.
#Warn  							; Enable warnings to assist with detecting common errors.
SendMode Input  				; Recommended for new scripts due to its superior speed and reliability.
#SingleInstance, Force
SetWorkingDir %A_ScriptDir%		; Ensures a consistent starting directory.

global LastLayer
global TempVarLayerLayer
global Word_TemplateStyles := 3
global Word_BBLayer := 2
global Word_BaseLayer := 1

#Include %A_ScriptDir%\Layer0\Layer0.ahk
#Include %A_ScriptDir%\Layer1\Layer1.ahk
#Include %A_ScriptDir%\Layer2\Layer2.ahk
#Include %A_ScriptDir%\Layer3\Layer3.ahk

LastLayer := 0
Gui, Layer0:Show


; - - - - - - - - - - END OF INITIALIZATION - - - - - - - - - - - - - - -

~NumLock:: ; NumLock key support
     KeyWait, NumLock
     F_NumLockLayer(GetKeyState("NumLock", "T"))
return

NumLockP:
NumLockB:
     SetNumLockState % !GetKeyState("CapsLock", "T") ; Toggles NumLock state to its opposite state
     F_NumLockLayer(GetKeyState("NumLock", "T"))
return


;~ 1st row
NumpadDiv::
NumpadDivP:
NumpadDivB:
     if (LastLayer == Word_BaseLayer)
          {
          MoveToLayer(Word_TemplateStyles)
          }
     else if (LastLayer == Word_TemplateStyles)
          {
          TemplateStyle("Normalny ms", "Normalny ms")
          }     
return

NumpadMult::
NumpadMultP:
NumpadMultB:
     if (LastLayer < 2)
          {
          MoveToTheNextLayer()     
          }
     else if (LastLayer ==  Word_TemplateStyles)
          {
          TemplateStyle("Normalny pomiedzy ms", "Normalny pomiedzy ms")
          }
return

NumpadSub::
NumpadSubP:
NumpadSubB:
     if (LastLayer ==  Word_TemplateStyles)
          {
          TemplateStyle("Nag��wek 1 ms", "Nag��wek 1 ms")     
          }     
return

;~ 2nd row
NumpadHome::
NumpadHomeP:
NumpadHomeB:
     if (LastLayer == Word_BaseLayer)
          {
          SetTemplate("PL", "Do��cz domy�lny szablon dokumentu PL")     
          }     
     else if (LastLayer ==  Word_TemplateStyles)
          {
          TemplateStyle("Nag��wek 2 ms")     
          }
return

NumpadUp::
NumpadUpP:
NumpadUpB:
     if (LastLayer == Word_BaseLayer)
          {
          SetTemplate("EN", "Do��cz domy�lny szablon dokumentu EN")     
          }
     else if (LastLayer ==  Word_TemplateStyles)
          {
          TemplateStyle("Nag��wek 3 ms")     
          }          
return



NumpadPgup::
NumpadPgUpP:
NumpadPgUpB:
MsgBox, 2th row

NumpadAdd::
NumPadAddP:
NumPadAddB:
     if (LastLayer == Word_BaseLayer)
          {
          MoveToThePreviousLayer()
          ;~ MsgBox, % LastLayer
          }
     else if (LastLayer == Word_BBLayer)
          {
          MoveToThePreviousLayer()
          ;~ MsgBox, % LastLayer     
          }
     else if (LastLayer == Word_TemplateStyles)
          {
          MoveToLayer(Word_BaseLayer)
          ;~ MsgBox, % LastLayer
          }     
return

;~ 3rd row
NumpadLeft::
NumpadLeftP:
NumpadLeftB:

NumpadClear::
NumpadBlankP:
NumpadBlankB:

NumpadRight::
NumpadRightP:
NumpadRightB:

     MsgBox, 3th row
return

;~ 4th row
NumpadEnd::
NumpadEndP:
NumpadEndB:

NumpadDown::
NumpadDownP:
NumpadDownB:

NumpadPgdn::
NumpadPgDnP:
NumpadPgDnB:

NumpadEnter::
NumpadEnterP:
NumpadEnterB:
     MsgBox, 4th row
return

;~ 5th row
NumpadIns::
NumpadInsP:
NumpadInsB:

NumpadDel::
NumpadDelP:
NumpadDelB:
     MsgBox, 5th row
return

Layer0GuiClose:
Layer1GuiClose:
     ExitApp


; - - - - - - - - - - - FUNCTIONS - - - - - - - - - - -

F_NumLockLayer(V_NumLockState) ; do poprawy!
{
if (V_NumLockState == 0) ; Show
     {
     if (LastLayer == 0)
          {
          Gui, Layer0:Show
          }
     else if (LastLayer == 1)
          {
          Gui, Layer1:Show
          }     
     else if (LastLayer == 2)
          {
          Gui, Layer2:Show     
          }     
     }
else ; Hide
     {
     if (LastLayer == 0)
          {
          Gui, Layer0:Hide
          }
     else if (LastLayer == 1)
          {
          Gui, Layer1:Hide
          }
     else if (LastLayer == 2)
          {
          Gui, Layer2:Hide     
          }     
     }
}

; - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

MoveToTheNextLayer()
{
     global
     
     TempVarLayer := "Layer" . LastLayer
     Gui, %TempVarLayer%:Hide     
     LastLayer++
     TempVarLayer := "Layer" . LastLayer
     Gui, %TempVarLayer%:Show     
}

; - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

MoveToThePreviousLayer()
{
     global
     
     TempVarLayer := "Layer" . LastLayer
     Gui, %TempVarLayer%:Hide     
     LastLayer--
     TempVarLayer := "Layer" . LastLayer
     Gui, %TempVarLayer%:Show     
}

; - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

MoveToLayer(WhichLayer)
{
     global
     
     TempVarLayer := "Layer" . LastLayer
     ;~ MsgBox, % "LastLayer: "LastLayer
     Gui, %TempVarLayer%:Hide
     LastLayer := WhichLayer
     TempVarLayer := "Layer" . LastLayer
     Gui, %TempVarLayer%:Show     
}

; - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

#Include %A_ScriptDir%\Layer1\SetTemplate.ahk
#Include %A_ScriptDir%\Layer3\TemplateStyle.ahk


; - - - - - - - - LABELS - - - - - - - - - - - - - - - 

SwitchOffTooltip:
	ToolTip ,
return
