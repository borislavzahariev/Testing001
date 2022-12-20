@echo off
echo -------------------------------------------------------------------
echo Simple script to restart your miner software after a period of time
echo -------------------------------------------------------------------
echo:

Rem Run RX Better Ver. 104
set commandline=--noTest

Rem Sometimes is better to start the .bat file
set executable=xmr-stak-rx.exe
set runforminutes=120
set /a runforseconds=runforminutes*60
set restartinseconds=10
set /a counter=1

 
:start
Echo:
Echo Run number %counter% for %runforminutes% minutes
start "Miner Window" %executable% %commandline%
timeout %runforseconds%
taskkill /f /im %executable%
Rem echo:
Rem echo Restarting the software in %restartinseconds% seconds
timeout %restartinseconds%
set /a counter+=1
echo:
goto start