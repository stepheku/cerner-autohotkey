/*
powerplan_tool.ahk
~~~~~~~~~~~~~~~~~~~~
Commonly used functions for the PowerPlan Tool
*/
#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.
#SingleInstance force

PauseTime = 100 
TypingTextPauseTime = 10

SetTitleMatchMode 2 ; A window's title can contain WinTitle anywhere inside it to be a match
SetWinDelay, %PauseTime% ; Sets typical sleep after each step, recommended to be 1000 ms
SetKeyDelay, %PauseTime%
SetMouseDelay, 30

; Usage:
; #Include #Include, %A_ScriptDir%\lib\powerplan_tool.ahk

open_powerplan(powerplan)
; Opens a PowerPlan and clicks through if there are any issues with opening
; (like something not virtual viewing)
{
    WinWaitActive, DCP: DB PowerPlan Tool - \\Remote
    Click 52, 68 ; Open a new powerplan
    WinWaitActive, Plan Selection - \\Remote
    SetKeyDelay, 10
    send %powerplan%
    send {enter}
    SetKeyDelay, 100
    sleep 500
    ; double-click powerplan to open
    click 98, 141
    sleep 100
    click
    ; Need to double-click the appropriate PowerPlan
    WinWaitActive, DCP: DB PowerPlan Tool - \\Remote
    sleep 500
    IfWinActive, PowerPlan Maintenance Tool - \\Remote
        {
            send {Enter}
        }
    WinWaitActive, DCP: DB PowerPlan Tool - \\Remote
    sleep 200
    return
}

change_display_description(new_disp_description = "")
{
    WinWaitActive, DCP: DB PowerPlan Tool - \\Remote
    WinGetPos, , , win_width
    xpos := win_width * (0.75)
    mousemove %xpos%, 114
    click
    sleep 100
    click
    SetKeyDelay, 10
    send {end}
    send {space}EKM{enter}
    SetKeyDelay, 100
    return
}

change_description(new_disp_description = "")
{
    WinWaitActive, DCP: DB PowerPlan Tool - \\Remote
    WinGetPos, , , win_width
    xpos := win_width * (0.75)
    mousemove %xpos%, 132
    click
    sleep 100
    click
    SetKeyDelay, 10
    send {end}
    send {delete 100}
    send %new_disp_description%
    SetKeyDelay, 100
    return
}

save_power_plan()
{
    WinWaitActive, DCP: DB PowerPlan Tool - \\Remote
    click 78, 66
    sleep 1000
    IfWinActive, PowerPlan Maintenance Tool - \\Remote
        {
            send {Enter}
        }
    WinWaitActive, DCP: DB PowerPlan Tool - \\Remote
    return
}