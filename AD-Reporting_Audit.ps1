# Load PowerShell module for Active Directory
Import-Module ActiveDirectory
    
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

#date  
$date = $((Get-Date).ToString('MM-dd-yyyy_hh-mm'))
#path
$path = "C:"+$env:HOMEPATH +"\Desktop\"

# Export all users with details
Get-ADUser -filter * -properties $properties | Select-Object $properties | Export-Csv -force -NoTypeInformation -path "$path\AD_Report_$date.csv"

# Export all users in Account Operators
Get-ADGroupMember -identity “Account Operators” | select distinguishedName,sAMAccountName | Export-Csv -force -NoTypeInformation -path "$path\AD_Groups_AO_$date.csv"

# Export all users in Enterprise Admins
Get-ADGroupMember -identity "Enterprise Admins" | select distinguishedName,sAMAccountName | Export-Csv -force -NoTypeInformation -path "$path\AD_Groups__EA_$date.csv"

# Export all users in Domain Admins
Get-ADGroupMember -identity "Domain Admins" | select distinguishedName,sAMAccountName | Export-Csv -force -NoTypeInformation -path "$path\AD_Groups_DA_$date.csv"

# Export all users in AD Administrators OU
Get-ADUser -SearchBase “OU=Administrators,DC=domain,DC=local” -filter * -properties $properties | Select-Object $properties | Export-Csv -force -NoTypeInformation -path "$path\AD_OU_Admins_$date.csv"
