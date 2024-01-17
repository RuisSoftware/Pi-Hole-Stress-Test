@echo off
set /p PiHoleIP="Enter the IP address of the Pi-hole (e.g., 192.168.1.100): "
set /p QueryCount="Enter the number of queries you want to send: "
set /p Delay="Enter the delay (in milliseconds) between each query: "

echo Running the Pi-hole stress test... Please wait.
PowerShell.exe -NoProfile -ExecutionPolicy Bypass -Command "& {.\pihole-stress-test-en.ps1 -PiHoleIP '%PiHoleIP%' -QueryCount %QueryCount% -Delay %Delay%}"
echo Test completed.
