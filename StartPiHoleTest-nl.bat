@echo off
set /p PiHoleIP="Voer het IP-adres van de Pi-hole in (bijv. 192.168.1.100): "
set /p QueryCount="Voer het aantal queries in dat je wilt versturen: "
set /p Delay="Voer de vertraging (in milliseconden) in tussen elke query: "

echo Pi-hole stress test wordt uitgevoerd... Even geduld aub.
PowerShell.exe -NoProfile -ExecutionPolicy Bypass -Command "& {.\pihole-stress-test-nl.ps1 -PiHoleIP '%PiHoleIP%' -QueryCount %QueryCount% -Delay %Delay%}"
echo Test voltooid.
