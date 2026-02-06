param (
    [string]$filename
)

if (-not $filename) {
    Write-Host "Usage: .\task1.ps1 <filename>"
    exit 1
}

if (-not (Test-Path $filename -PathType Leaf)) {
    Write-Host "File does not exist."
    exit 1
}

$file = Get-Item $filename
$size = $file.Length

if ($size -gt 1048576) {
    Write-Host "Warning: File is too large"
} else {
    Write-Host "File size is within limits."
}