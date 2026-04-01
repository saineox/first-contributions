@echo off
REM google-ping.bat - simple helper to ping google.com
REM Usage:
REM   google-ping.bat            -> pings 4 times (default)
REM   google-ping.bat 10         -> pings 10 times
REM   google-ping.bat continuous -> runs continuous ping (Ctrl+C to stop)
REM   google-ping.bat help       -> show this help

::check args
if "%~1"=="" goto default
if /I "%~1"=="help" goto help
if /I "%~1"=="continuous" goto continuous

::numeric arg provided
set COUNT=%~1
ngrep "[0-9]" >nul 2>&1
goto run

::defaults
:default
nset COUNT=4
ngoto run

::continuous ping
:continuous
necho Pinging google.com continuously. Press Ctrl+C to stop.
ping -t google.com
goto :eof

::run with count
:run
necho Pinging google.com %COUNT% time(s)...
ping -n %COUNT% google.com
echo Done.
goto :eof

::help text
:help
necho google-ping.bat - ping google.com helper
necho.
necho Usage:
necho   google-ping.bat            ^> pings 4 times (default)
necho   google-ping.bat 10         ^> pings 10 times
necho   google-ping.bat continuous ^> runs continuous ping (Ctrl+C to stop)
necho   google-ping.bat help       ^> show this help
goto :eof
