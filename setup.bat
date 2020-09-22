@echo off
:: BatchGotAdmin
::-------------------------------------
REM  --> Check for permissions
>nul 2>&1 "%SYSTEMROOT%\system32\cacls.exe" "%SYSTEMROOT%\system32\config\system"

REM --> If error flag set, we do not have admin.
if '%errorlevel%' NEQ '0' (
    echo Requesting administrative privileges...
    goto UACPrompt
) else ( goto gotAdmin )

:UACPrompt
    echo Set UAC = CreateObject^("Shell.Application"^) > "%temp%\getadmin.vbs"
    set params = %*:"="
    echo UAC.ShellExecute "cmd.exe", "/c %~s0 %params%", "", "runas", 1 >> "%temp%\getadmin.vbs"

    "%temp%\getadmin.vbs"
    del "%temp%\getadmin.vbs"
    exit /B

:gotAdmin
    pushd "%CD%"
    CD /D "%~dp0"
::--------------------------------------

::ENTER YOUR CODE BELOW:

<NUL echo Installation has started  (Step : 1 / 3) <NUL
mkdir "C:/Program Files/Drift Desk"
<NUL echo Installation has started  (Step : 2 / 3) <NUL
mkdir "C:/Program Files/Drift Desk/libs"
mkdir "C:/Program Files/Drift Desk/loads"
<NUL echo Installation has started  (Step : 3 / 3) <NUL
robocopy /s /e "./DriftWin/" "C:/Program Files/Drift Desk/libs/"
robocopy /s /e "./Worker/" "C:/Program Files/Drift Desk/loads/"
REM SetX PATH "C:/Program Files/Drift Desk/libs/;%PATH%"
SetX PATH "%PATH%;C:/Program Files/Drift Desk/loads/"
pause