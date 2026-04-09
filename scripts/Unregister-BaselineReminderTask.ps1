#Requires -Version 5.1
$ErrorActionPreference = "Stop"
$taskName = "Peru55-BaselineHourlyReminder"
$task = Get-ScheduledTask -TaskName $taskName -ErrorAction SilentlyContinue
if (-not $task) {
  Write-Host "Task not found (maybe not registered): $taskName"
  exit 0
}
Unregister-ScheduledTask -TaskName $taskName -Confirm:$false
Write-Host "Removed scheduled task: $taskName"
