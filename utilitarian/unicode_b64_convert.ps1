param (
    [string]$filePath
)

# Check if the file exists
if (-Not (Test-Path $filePath)) {
    Write-Host "File not found: $filePath"
    exit 1
}

# Read the contents of the file
$fileContent = Get-Content -Path $filePath -Raw

# Convert the content to bytes using UTF-16 encoding
$bytes = [System.Text.Encoding]::Unicode.GetBytes($fileContent)

# Encode the bytes to Base64
$base64 = [Convert]::ToBase64String($bytes)

# Output the Base64 string
Write-Output $base64
