# Load PowerShell module for O365
Connect-MSOLService

#date  
$date = $((Get-Date).ToString('MM-dd-yyyy_hh-mm'))
#path
$path = "C:"+$env:HOMEPATH +"\Desktop\"

# Export all users with details
Get-MSOLUser -maxresults 1600 | Select-Object ObjectId, DisplayName, UserPrincipalName, isLicensed, PasswordNeverExpires, PasswordLastSet, StrongPasswordRequired, ValidationStatus, lastSignInDateTime |Export-Csv -force -NoTypeInformation -path "$path\AD_O365_Report_$date.csv"
