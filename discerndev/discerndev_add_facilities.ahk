/*
discerndev_add_facilities.ahk
~~~~~~~~~~~~~~~~~~~~
In the DiscernDev tool, when you have to add facilities (or buildings or whatever)
and there are a lot of them, it's tiring because you need to click through multiple
levels and get to each facility. This script speeds it up a bit
*/
#SingleInstance, Force
SetWorkingDir, %A_ScriptDir%

PauseTime = 300 
TypingTextPauseTime = 10

SetTitleMatchMode 2 ; A window's title can contain WinTitle anywhere inside it to be a match
SetWinDelay, %PauseTime% ; Sets typical sleep after each step, recommended to be 1000 ms
SetKeyDelay, %PauseTime%
SetMouseDelay, 30

#Include %A_ScriptDir%\..\common\standard_functions.ahk

+1::
Loop, read, discern_dev_facilities.txt
	{
    facility = %A_LoopReadLine%
    clipboard = %facility%

    WinWaitActive, Expert Referential List Help - \\Remote
    WinGet, discern_dev_win_id, ID
    
    click 51, 127
    send ^a
    SetKeyDelay, %TypingTextPauseTime%
    send ^v
    SetKeyDelay, %PauseTime%
    sleep 1000

    click 55, 181
    sleep 100
    click 
    loop 4
    {
        sleep 500
        click 55, 198
        sleep 100
        click 
    }
    sleep 500
    click 53, 113
    }
return