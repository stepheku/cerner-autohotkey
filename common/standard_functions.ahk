/*
standard_functions.ahk
~~~~~~~~~~~~~~~~~~~~
Commonly used functions for all scripts
*/
#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.
#SingleInstance force

; Usage:
; #Include #Include, %A_ScriptDir%\common\standard_functions.ahk

Esc::
ExitApp

Pause::Pause