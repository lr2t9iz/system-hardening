# Hardening for Windows

## Logging and Monitoring
- Install Sysmon
```PowerShell
# https://c-137lab.com/posts/sysm0n/
.\Sysmon64.exe -accepteula -i sysmonconfig.xml
```
- Enable PowerShell logging
```PowerShell
# https://c-137lab.com/posts/powershell_logg1ng/
$basePath = "HKLM:\Software\Policies\Microsoft\Windows\PowerShell\ScriptBlockLogging"
if (-not (Test-Path $basePath)) { $null = New-Item $basePath -Force }
Set-ItemProperty $basePath -Name EnableScriptBlockLogging -Value "1"
```
- Enable TaskScheduler logs
```PowerShell
# https://c-137lab.com/posts/scheduled_t4sk/
wevtutil sl Microsoft-Windows-TaskScheduler/Operational /enabled:true
```