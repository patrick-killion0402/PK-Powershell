#Adobe License check against Azure AD account status
#import CSV
$csvPath = 'C:\temp'
$csv = Import-Csv $csvPath -Encoding UTF8

Connect-MgGraph -Scopes "AuditLog.Read.All", "User.Read.All"

Foreach($row in $csv)
{
$email = $null
$email = $row.email
write-output $email
$user = get-mguser -userid $email -Property AccountEnabled | Select-Object AccountEnabled
Write-Output $user.AccountEnabled
$row.'Account status' = $user.AccountEnabled
}
