# Employee type of contractor and expiration is set to never

#Pulls all users in AD
$Allusers = Get-ADUser -Filter * -properties C,displayname,enabled,employeeType,SamAccountName,description,DistinguishedName,AccountExpirationDate

## Date Variable
$Date = Get-Date -Format MM-dd-yyyy

# Gets contractors from all users
$Contractors = $Allusers | Where-object {$_.employeeType -like "*contractor*"} 
$ConExpiration = $Contractors | Where-object {$_.AccountExpirationDate -eq $null}
$ConExpiration2 = $ConExpiration | Where-Object {$_.DistinguishedName -notmatch "ou=inert Users"}

$Export = $conexpiration2 | select-object C,displayname,enabled,employeeType,SamAccountName,description,DistinguishedName

$Export | export-CSV -path "C:\temp $date.csv" -NoTypeInformation -encoding UTF8