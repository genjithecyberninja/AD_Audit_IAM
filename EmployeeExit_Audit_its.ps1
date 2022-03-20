# Load PowerShell module for Active Directory
Import-Module ActiveDirectory

# Exports the AD Atributes below
$properties = @(
    "Name",
    "GivenName",
    "Surname", 
    "SamAccountName",
    "CanonicalName", 
    "EmailAddress", 
    "UserPrincipalName"
    "DistinguishedName",
    "employeeID",
    "Enabled",
    "AccountLockoutTime"
    "Title",  
    "extensionAttribute1", 
    "Description",
    "Department", 
    "Office", 
    "Company", 
    "City",
    "Country", 
    "AccountExpirationDate", 
    "Manager",
    "PasswordExpired", 
    "PasswordLastSet", 
    "PasswordNeverExpires",
    "SID",
    "Created", 
    "LastLogonDate", 
    "Modified"
    )

# Report Date-Time  
$date = $((Get-Date).ToString('MM-dd-yyyy_hh-mm'))

# Export Path to your Windows Desktop
$path = "C:"+$env:HOMEPATH +"\Desktop\"

# Export Employee Exit Email
$user = Read-Host -Prompt 'Input the username of the Exit Employee'
$email = $user+"@DOMAIN.com"

# Export all users with details
Get-ADUser -Filter "SamAccountName -eq '$user'" -Properties $properties | Select-Object $properties | Export-Csv -force -NoTypeInformation -path "$path\AD_Exit.$user.$date.csv"