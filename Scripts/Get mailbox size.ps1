#Azure connections
Connect-AzureAD
Connect-ExchangeOnline
connect-mgGraph
Connect-MgGraph -Scopes "AuditLog.Read.All", "User.Read.All"


#Import CSV
$csvPath = "C:\temp\"
$csv = import-csv $csvPath -Encoding UTF8

#counts number of rows
$rowcount = $CSV.Length
$I = 0

Foreach ($row in $csv)
{
    $i++
    Write-Progress -activity "Getting Info . . ." -status "Fetched: $i of $($rowcount)" -percentComplete (($i / $rowcount)  * 100)
    Write-Host $row.'Email Address' 
 $mailboxdata = $null
 $mailboxdata = Get-MailboxStatistics -Identity $row.'Email Address' | Select DisplayName, TotalItemSize, StorageLimitStatus, ItemCount
 $row.MailboxSize = $mailboxdata.totalitemsize
 #$row.'Item Count' = $mailboxdata.itemcount
}




$CSV | export-CSV -path $CSVpath -NoTypeInformation -encoding UTF8