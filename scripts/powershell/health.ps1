Write-Host "System Health Snapshot"
Write-Host "----------------------"
Write-Host "Current Date and Time: $(Get-Date)"
Write-Host "Hostname: $env:COMPUTERNAME"
Write-Host "Current User: $env:USERNAME"
Write-Host "Disk Usage (C:):"
$drive = Get-PSDrive C
Write-Host "Free: $($drive.Free / 1GB) GB, Total: $($drive.Used + $drive.Free / 1GB) GB"