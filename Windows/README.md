# Hardening for Windows

## Logging and Monitoring
- Install Sysmon
```PowerShell
# https://c-137labs.mitzep.com/posts/sysm0n/
.\Sysmon64.exe -accepteula -i sysmonconfig.xml
```
- Enable PowerShell logging
```PowerShell
# https://c-137labs.mitzep.com/posts/powershell_logg1ng/
$basePath = "HKLM:\Software\Policies\Microsoft\Windows\PowerShell\ScriptBlockLogging"
if (-not (Test-Path $basePath)) { $null = New-Item $basePath -Force }
Set-ItemProperty $basePath -Name EnableScriptBlockLogging -Value "1"
```
- Enable TaskScheduler logs
```PowerShell
# https://c-137labs.mitzep.com/posts/scheduled_t4sk/
wevtutil sl Microsoft-Windows-TaskScheduler/Operational /enabled:true

# event on win security channel - https://learn.microsoft.com/en-us/previous-versions/windows/it-pro/windows-10/security/threat-protection/auditing/event-4702
auditpol /set /category:"Object Access" /subcategory:"Other Object Access Events" /success:enable
auditpol /get /category:"Object Access" | findstr /i "Other Object Access Events"
```
