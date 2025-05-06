##Modules for script
<#
Import-Module -Name AzureADPreview
Import-Module ExchangeOnlineManagement

Connect-AzureAD
#Add UPN to end of below line for who is running the script
Connect-ExchangeOnline -UserPrincipalName 
#>

$DATACSV = "C:\Temp\"
$csv = Import-Csv -Path $DATACSV -Encoding UTF8

ForEach ($row in $csv) 
{

#Percentage bar


    Write-Output $row.UserPrincipalName
    $user = Get-AzureADUser -objectid ($row.UserPrincipalName)
    $row.Email = $user.Mail

}


$CSV | export-CSV -path $NAGMCSV -NoTypeInformation -encoding UTF8