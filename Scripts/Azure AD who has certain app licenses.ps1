#Azure connections
Connect-AzureAD
Connect-ExchangeOnline
connect-mgGraph
Connect-MgGraph -Scopes "AuditLog.Read.All", "User.Read.All"

#enter in the ObjectID for the group that contains all the users
# Group for All users
$group0 = ""


$users = Get-AzureADGroupMember -ObjectId $group0 -All $true | Select-Object UserPrincipalName,DisplayName,ObjectId,UserType,AccountEnabled,CompanyName,AssignedLicenses
#Below variable needs to be Microsoft License sku
#Link as of 2/11/2025 -- https://learn.microsoft.com/en-us/entra/identity/users/licensing-service-plan-reference
#Copilot Sku
$copilot = "639dec6b-bb19-468b-871c-c5c441c4b0cb"
#Visio Plan 2 sku
$Visio = "c5928f49-12ba-48f7-ada3-0d743a3601d5"
#Planner and Project Plan 3 sku
$project = "53818b1b-4a27-454b-8896-0dba576410e6"

#Adjust accordning to what is needed to check -- Below check is for multiple licenses 
$licensedUsers = $users | Where-Object {((($_.AssignedLicenses.SkuId -contains $Visio) -or $_.AssignedLicenses.SkuId -contains $copilot) -or $_.AssignedLicenses.SkuId -contains $Project)}

#Check for one license membership
$licensedUsers = $users | Where-Object {$_.AssignedLicenses.SkuId -contains $Visio}

#Select name and email to export CSV - add additional properties as needed -- Update location if needed
$licensedUsers | Select-Object DisplayName, UserPrincipalName | Export-csv C:\Temp\.csv -Encoding UTF8