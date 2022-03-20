$s=New-PSSession -ConfigurationName microsoft.exchange -connectionuri http://EXCHANGEONLINESERVER/powershell
Import-PSSession $s
Get-mailbox