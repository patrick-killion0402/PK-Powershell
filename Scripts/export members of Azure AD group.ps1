#Check AAD Account Status - Enter in email that is needed to be checked
Connect-AzureAD
get-azureaduser -ObjectId  | select AccountEnabled



#ObejectID needs to be ID of group
Get-AzureADGroupMember -ObjectId 3dcb64a4-7e20-40b6-b656-38b23a92a3a4 -All $true | Select-Object UserPrincipalName,DisplayName,ObjectId,UserType,AccountEnabled,CompanyName | Export-CSV 'C:\temp\Project Check\ProjectGroup.CSV' -Encoding UTF8
