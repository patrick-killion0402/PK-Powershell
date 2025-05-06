#Import CSV - List of users you need OneDrive size information from
$csvPath = "C:\temp\"
$csv = import-csv $csvPath -Encoding UTF8
#import OneDrive CSV - Export of OneDrive storage usage
$OneDrivePath = "C:\temp\"
$oneDriveCSV = import-csv $OneDrivePath -encoding UTF8


#counts number of rows
$rowcount = $CSV.Length
$I = 0
#mailbox size


Foreach($row in $csv)
{
$i++
Write-Progress -activity "Getting Info . . ." -status "Fetched: $i of $($rowcount)" -percentComplete (($i / $rowcount)  * 100)
Write-output $row.'Email Address' 
$Email = $row.'Email Address'
    IF($oneDriveCSV.'Owner Principal Name' -contains $email)
    {
     $OneDriveSize = $oneDriveCSV | Where-object {$_.'Owner Principal Name' -eq $email} | select-object 'Storage Used (Byte)'
     write-output $OneDriveSize
     $OneDriveGB = $OneDriveSize.'Storage Used (Byte)'/(1000*1000*1000)
     Write-output $OneDriveGB
     $row.onedrive = $OneDriveGB

    }


}


$CSV | export-CSV -path $CSVpath -NoTypeInformation -encoding UTF8