#Azure Connections
Connect-MgGraph -Scopes "AuditLog.Read.All", "User.Read.All"
Connect-Graph -Scopes User.ReadWrite.All

#Teams room premium SKUID
$skuid = '4fb214cb-a430-4a91-9c91-4976763aa78f'
#teams Room Pro
$pro = '4cde982a-ede4-4409-9ae6-b003453c8ea6'

Set-MgUserLicense -userId  -RemoveLicenses $skuId -AddLicenses "4cde982a-ede4-4409-9ae6-b003453c8ea6"


#Script needs to be adjusted for what license sku needs to be add/removed
#Install Microsoft Graph if not installed
Install-Module Microsoft.Graph -scope AllUsers
#connect Microsot Graph
Connect-MgGraph -Scopes "User.ReadWrite.All"
#Check for currently assigned licenses 
Get-MgUserLicenseDetail -UserId  | Select-Object SkuPartNumber, SkuId
#Remove license 
Set-MgUserLicense -UserId  -RemoveLicenses "4fb214cb-a430-4a91-9c91-4976763aa78f" -AddLicenses @()
#Add license
Set-MgUserLicense -UserId  -AddLicenses "4fb214cb-a430-4a91-9c91-4976763aa78f" -RemoveLicenses @()