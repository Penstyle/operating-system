Get-ChildItem *.txt | ForEach-Object {
    Rename-Item $_ "OLD_$($_.Name)"
    Write-Host "Renamed $($_.Name) to OLD_$($_.Name)"
}