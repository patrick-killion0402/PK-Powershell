#import CSV
$csvPath = "C:\temp\Transfer\PenTest\Application PenTest Final.csv"
$csv = import-csv $csvPath -Encoding UTF8

#Connect MgGraph
connect-mggraph -clientid  -tenantid  -scopes "DeviceManagementApps.Read.All","Group.Read.All"

#Export software list of remote PC
Foreach($row in $CSV)
{
$device = $null
$lastLoggedInUserInfo = $null
$userDetails = $Null
$device = $row.PCNAME
$intunedevice = get-mgdevicemanagementmanageddevice -filter "devicename eq '$device'"
$url = "https://graph.microsoft.com/beta/deviceManagement/managedDevices/$($intunedevice.Id)"
$lastLoggedInUserInfo = (Invoke-MgGraphRequest -Method Get $url).usersLoggedon
$userDetails = Get-MgUser -All -Filter "Id eq '$($lastLoggedInUserInfo.userId)'"
write-output $userDetails.DisplayName
$row.'User - Intune' = $userDetails.DisplayName
}


$CSV | export-CSV -path $CSVpath -NoTypeInformation -encoding UTF8