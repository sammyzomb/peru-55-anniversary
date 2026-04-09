#Requires -Version 5.1
# Register hourly Windows Scheduled Task: Peru55-BaselineHourlyReminder
# Run from repo root: powershell -ExecutionPolicy Bypass -File .\scripts\Register-BaselineReminderTask.ps1
# If access denied, run PowerShell as Administrator.

$ErrorActionPreference = "Stop"
$scriptDir = Split-Path -Parent $MyInvocation.MyCommand.Path
$reminder = Join-Path $scriptDir "baseline-reminder.ps1"
if (-not (Test-Path -LiteralPath $reminder)) {
  Write-Error "baseline-reminder.ps1 not found: $reminder"
}

$taskName = "Peru55-BaselineHourlyReminder"
$ps = Join-Path $env:WINDIR "System32\WindowsPowerShell\v1.0\powershell.exe"
$arg = "-NoProfile -ExecutionPolicy Bypass -WindowStyle Hidden -File `"$reminder`""

$existing = Get-ScheduledTask -TaskName $taskName -ErrorAction SilentlyContinue
if ($existing) {
  Unregister-ScheduledTask -TaskName $taskName -Confirm:$false
}

$action = New-ScheduledTaskAction -Execute $ps -Argument $arg
$start = (Get-Date).AddMinutes(1)
$trigger = New-ScheduledTaskTrigger -Once -At $start -RepetitionInterval (New-TimeSpan -Hours 1) -RepetitionDuration (New-TimeSpan -Days 3650)
$settings = New-ScheduledTaskSettingsSet -AllowStartIfOnBatteries -DontStopIfGoingOnBatteries -StartWhenAvailable -MultipleInstances IgnoreNew
$principal = New-ScheduledTaskPrincipal -UserId $env:USERNAME -LogonType Interactive -RunLevel Limited
$desc = "Peru 55: hourly prompt to verify site + baseline tag (see scripts/baseline-reminder.ps1)."

try {
  Register-ScheduledTask -TaskName $taskName -Action $action -Trigger $trigger -Settings $settings -Principal $principal -Description $desc
  Write-Host "OK: registered '$taskName' (about hourly; first run ~1 min)."
  Write-Host "Remove with: powershell -ExecutionPolicy Bypass -File .\scripts\Unregister-BaselineReminderTask.ps1"
} catch {
  Write-Host ("ERROR: " + $_.Exception.Message) -ForegroundColor Red
  Write-Host "Try: run PowerShell as Administrator, then run this script again." -ForegroundColor Red
  exit 1
}
