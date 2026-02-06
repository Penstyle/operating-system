$logfile = "server.log"

if (-not (Test-Path $logfile -PathType Leaf)) {
    Write-Host "Log file does not exist."
    exit 1
}

$count = (Select-String "Error" $logfile).Count
Write-Host "Number of lines with 'Error': $count"