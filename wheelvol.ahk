#Persistent  ; Keep the script running until the user exits it.
#SingleInstance
setMenu()
return

MenuInstall:
FileCreateDir, %A_AppData%\Data97
FileCopy, %A_ScriptFullPath%, %A_AppData%\Data97\wheelvolume.ahk , 1
FileCreateShortcut, %A_AppData%\Data97\wheelvolume.ahk, %A_Startup%\wheelvolume.lnk
setMenu()
MsgBox Autorun Installed
return

MenuUninstall:
FileDelete, %A_Startup%\wheelvolume.lnk
setMenu()
MsgBox Autorun Removed
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
;Menu, tray, add  ; Creates a separator line.
IfNotExist, %A_Startup%\wheelvolume.lnk
	Menu, tray, add, Install Autorun, MenuInstall  ; Creates a new menu item.
Else
	Menu, tray, add, Uninstall Autorun, MenuUninstall  ; Creates a new menu item.

Menu, tray, add  ; Creates a separator line.
Menu, tray, add, About, MenuAbout  ; Creates a new menu item.
Menu, tray, add, Exit, MenuExit  ; Creates a new menu item.
}