# Powershell-C2 Server

This is a primitive c2 server through an HTTP server. After the client has been infected with the  beaconing agent, it waits for a random time before requesting data from the C2. The beacon agent will execute the command sent.

### Script structure
Some of powershell scripts that are included must be modified before-hand, with correct URLs or IPs. Be sure to read them and understand them before running, and be especially aware of the encrypting stuff. Know your keys, so that if in case you encrypt by mistake some files, you can recover them after.

Scripts are split into multiple folders with the type of attack  it encompasses.
