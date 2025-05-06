# Employee type of contractor and expiration is set to never

#Pulls all users in AD
$Allusers = Get-ADUser -Filter * -properties *

# Gets contractors from all users
$Contractors = $Allusers | Where-object {$_.employeeType -like "*contractor*"} 
$ConExpiration = $Contractors | Where-object {$_.AccountExpirationDate -eq $null}
