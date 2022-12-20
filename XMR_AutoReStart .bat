@echo off
echo -------------------------------------------------------------------
echo Simple script to restart your miner software after a period of time
echo -------------------------------------------------------------------
echo:
Rem https://unmineable.com/ DOGE:w4j5-evhe  XMR:vjd4-juh9   ETC:unrs-y1r8  ETH: 9c5w-h5ny
Rem RX6800XT

set executable=teamredminer.exe

Rem RX5700XT
set commandline=--clk_core_mhz=1050 --clk_core_mv=700 --clk_mem_mhz=1850 --fan_control=:::30:40:60 -a ethash -d 0 --enable_compute --eth_config=XB -o stratum+tcp://ethash.unmineable.com:3333 -u XMR:46gnWLNg3p4LwF1Erxc69fHNo2ehwFKUF1bhky5pfWRKKQaBu2bnvADdozdJTNjpakR9dnKtK184tXrPstREeyrURj6daoj.Office#unrs-y1r8 -p x

Rem Vega56
Rem set commandline=--clk_core_mhz=852 --clk_core_mv=800 --clk_mem_mhz=950 --clk_mem_mv=900 --fan_control=:::25:30:50 -a ethash -d 0 --enable_compute --eth_config=XB -o stratum+tcp://ethash.unmineable.com:3333 -u XMR:46gnWLNg3p4LwF1Erxc69fHNo2ehwFKUF1bhky5pfWRKKQaBu2bnvADdozdJTNjpakR9dnKtK184tXrPstREeyrURj6daoj.Office#unrs-y1r8 -p x

set runforminutes=120
set /a runforseconds=runforminutes*60
set restartinseconds=6
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