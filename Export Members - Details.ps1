Import-Module ActiveDirectory
Get-ADUser -Filter * -Properties * | export-csv export_name.csv