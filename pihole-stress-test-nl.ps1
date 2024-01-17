<#
.SYNOPSIS
    Dit script genereert een groot aantal DNS-verzoeken om de capaciteit van een Pi-hole server te testen.

.DESCRIPTION
    Dit script creëert willekeurige domeinnamen en stuurt DNS-verzoeken naar een opgegeven Pi-hole server.

.PARAMETER PiHoleIP
    Het IP-adres van de Pi-hole server.

.PARAMETER QueryCount
    Het totale aantal te versturen DNS-verzoeken.

.PARAMETER Delay
    De vertraging (in milliseconden) tussen elk DNS-verzoek.
#>

param(
    [string]$PiHoleIP = $(Read-Host "Voer het IP-adres van de Pi-hole in (bijv. 192.168.1.100): "),
    [int]$QueryCount = $(Read-Host "Voer het aantal queries in dat je wilt versturen: "),
    [int]$Delay = $(Read-Host "Voer de vertraging (in milliseconden) in tussen elke query: ")
)

function Invoke-DNSQuery {
    param(
        [string]$Domain,
        [string]$ServerIP
    )
    Resolve-DnsName -Name $Domain -Server $ServerIP -ErrorAction SilentlyContinue
}

Write-Host "Pi-hole stress test wordt gestart"
Write-Host "Pi-hole IP: $PiHoleIP"
Write-Host "Aantal verzoeken: $QueryCount"
Write-Host "Vertraging tussen verzoeken: $Delay milliseconden"

for ($i = 0; $i -lt $QueryCount; $i++) {
    $randomDomain = -join ((65..90) + (97..122) | Get-Random -Count 12 | % {[char]$_}) + ".com"
    Invoke-DNSQuery -Domain $randomDomain -ServerIP $PiHoleIP
    Start-Sleep -Milliseconds $Delay
}

Write-Host "Pi-hole stress test is voltooid"