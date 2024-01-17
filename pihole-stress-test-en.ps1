<#
.SYNOPSIS
    This script generates a large number of DNS requests to test the capacity of a Pi-hole server.

.DESCRIPTION
    This script creates random domain names and sends DNS queries to a specified Pi-hole server.

.PARAMETER PiHoleIP
    The IP address of the Pi-hole server.

.PARAMETER QueryCount
    The total number of DNS requests to be sent.

.PARAMETER Delay
    The delay (in milliseconds) between each DNS request.
#>

param(
    [string]$PiHoleIP = $(Read-Host "Enter the IP address of the Pi-hole (e.g., 192.168.1.100): "),
    [int]$QueryCount = $(Read-Host "Enter the number of queries you want to send: "),
    [int]$Delay = $(Read-Host "Enter the delay (in milliseconds) between each query: ")
)

function Invoke-DNSQuery {
    param(
        [string]$Domain,
        [string]$ServerIP
    )
    Resolve-DnsName -Name $Domain -Server $ServerIP -ErrorAction SilentlyContinue
}

Write-Host "Starting Pi-hole stress test"
Write-Host "Pi-hole IP: $PiHoleIP"
Write-Host "Number of Queries: $QueryCount"
Write-Host "Delay between queries: $Delay milliseconds"

for ($i = 0; $i -lt $QueryCount; $i++) {
    $randomDomain = -join ((65..90) + (97..122) | Get-Random -Count 12 | % {[char]$_}) + ".com"
    Invoke-DNSQuery -Domain $randomDomain -ServerIP $PiHoleIP
    Start-Sleep -Milliseconds $Delay
}

Write-Host "Pi-hole stress test completed"