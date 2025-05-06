##Import CSVs

#CMDB
$CMDBLocation = "C:\Temp\"
$CMDBCSV = Import-Csv -Path $CMDBLocation -Encoding UTF8

#Data File
$DataFile = "C:\temp\"
$MainCSV = Import-Csv -Path $DataFile -Encoding UTF8

#
Foreach($row in $MainCSV)
{
 $Comptuer = $null
 $CMDBPull = $null
 $CMDBName = $null

 $computer = $Row.'Computer Name'
 If($CMDBCSV.HostName -contains $Computer)
  {
   $CMDBPull = $CMDBCSV | where-object {$_.hostname -eq $computer} | select-object 'Site ID', 'Primary User Full Name'
   $row.Name = $CMDBPull.'Primary User Full Name'
   $Row.Location = $CMDBPull.'Site ID'
  }

}

$MainCSV | export-CSV -path $Datafile -NoTypeInformation -encoding UTF8