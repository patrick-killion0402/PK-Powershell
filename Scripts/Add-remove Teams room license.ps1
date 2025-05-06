#Connect Microsoft Graph
Connect-MgGraph -Scopes "User.ReadWrite.All"
#Activate License role, if you do not have this role this script will not work

#import CSV



#Teams room premium SKUID
$skuid = '4fb214cb-a430-4a91-9c91-4976763aa78f'
#teams Room Pro
$pro = '4cde982a-ede4-4409-9ae6-b003453c8ea6'

Foreach($row in $CSV)
{
 $roomName = $null
 #Remove license 
 Set-MgUserLicense -UserId $roomName -RemoveLicenses $skuID -AddLicenses @()
}