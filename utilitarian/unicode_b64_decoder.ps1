param (
    [string]$encodedFilePath  # The path to the Base64-encoded file
)

# Check if the file exists
if (-Not (Test-Path $encodedFilePath)) {
    Write-Host "File not found: $encodedFilePath"
    exit 1
}

# Read the Base64-encoded content of the file
$base64Content = Get-Content -Path $encodedFilePath -Raw

# Convert the Base64 string back to bytes
$bytes = [Convert]::FromBase64String($base64Content)

# Convert the bytes back to a string using UTF-16 encoding (Unicode in .NET means UTF-16)
$originalContent = [System.Text.Encoding]::Unicode.GetString($bytes)

# Output the original content
Write-Output $originalContent
