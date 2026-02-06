Write-Host "Top 5 processes by memory usage`n"

Get-Process |
    Sort-Object WorkingSet -Descending |
    Select-Object Name, Id, @{Name="Memory (MB)"; Expression = { [math]::Round($_.WorkingSet / 1MB, 2) }} -First 5
