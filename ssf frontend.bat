@echo off
:start
color 1b
cls
echo Welcome to SSF Frontend
echo.
echo Made by Superfish the Human
echo 1. Game History
echo 2. Open ISO/CUE
echo 3. Quit
choice /c:123 /n /m "Enter your choice: "
if "%errorlevel%"=="1" goto history
if "%errorlevel%"=="2" goto play
if "%errorlevel%"=="3" exit
:play
color 7f
cls
set /p url=Enter the path of your ISO/CUE including filename (type "quit" to exit): 
if "%url%"=="quit" goto start
echo %url%>>history.cfg
ssf %url%
pause
goto start
:history
cls
color 3f
if not exist history.cfg echo.>history.cfg
echo The history are stored in history.cfg
echo.
echo 1. Open History
echo 2. Clear History
echo 3. Back
choice /c:123 /n /m "Enter your choice: "
if "%errorlevel%"=="1" goto notepad
if "%errorlevel%"=="2" goto del
if "%errorlevel%"=="3" goto start
:del
cls
color 4c
echo Are you sure you want to delete history? 
echo [y/n]
choice /cs /c yn /t 3 /d "n" /m "Will automatically choose N after 3 secs" /n
if "%errorlevel%"=="y" del history.cfg
goto start
:notepad
start notepad history.cfg
goto history