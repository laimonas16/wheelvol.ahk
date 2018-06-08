#Persistent  ; Keep the script running until the user exits it.
#SingleInstance
setMenu()
return

MenuInstall:

IfNotExist, %A_Startup%\wheelvolume.lnk
{
; SplitPath, A_ScriptFullPath, , , ext
; FileCreateDir, %A_AppData%\Data97
; FileCopy, %A_ScriptFullPath%, %A_AppData%\Data97\wheelvolume.%ext% , 1
; FileCreateShortcut, %A_AppData%\Data97\wheelvolume.%ext%, %A_Startup%\wheelvolume.lnk
FileCreateShortcut, %A_ScriptFullPath%, %A_Startup%\wheelvolume.lnk
TrayTip , Wheel Volume, Autorun Installed, 1
}
Else
{	
	FileDelete, %A_Startup%\wheelvolume.lnk
	TrayTip , Wheel Volume, Autorun Removed, 1
}

setMenu()
return

MenuAbout:
Run, http://data97.com
return

MenuExit:
ExitApp
return



WheelLeft::
;SoundSet, -1
Send {Volume_Down}
return



WheelRight::
;SoundSet, +1
Send {Volume_Up}
return



setMenu()
{
Menu, tray, NoStandard
Menu, tray, DeleteAll ; Delete all menu items
Menu, tray, add, Auto Start With Windows, MenuInstall  ; Creates a new menu item.
IfExist, %A_Startup%\wheelvolume.lnk
	menu, tray, ToggleCheck, Auto Start With Windows
Menu, tray, add  ; Creates a separator line.
Menu, tray, add, About, MenuAbout  ; Creates a new menu item.
Menu, tray, add, Exit, MenuExit  ; Creates a new menu item.
}