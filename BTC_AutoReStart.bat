@echo off
echo -------------------------------------------------------------------
echo Simple script to restart your miner software after a period of time
echo -------------------------------------------------------------------
echo:

set executable=teamredminer.exe

Rem RX6800XT
Рем Set commandline=--clk_core_mhz=1050 --clk_core_mv=650 --clk_mem_mhz=2100 --fan_control=:::30:30:66 -a ethash -d 0 --enable_compute --eth_config=XB -o stratum+tcp://daggerhashimoto.usa-east.nicehash.com:3353 -u 3N1h2hzFVo8irse444TWenSVfpqi7TjtX1.Office -p x

Rem RX5700XT
set commandline=--clk_core_mhz=1050 --clk_core_mv=700 --clk_mem_mhz=1850 --fan_control=:::30:40:60 -a ethash -d 0 --enable_compute --eth_config=XB -o stratum+tcp://daggerhashimoto.usa-east.nicehash.com:3353 -u 3N1h2hzFVo8irse444TWenSVfpqi7TjtX1.Office -p x


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