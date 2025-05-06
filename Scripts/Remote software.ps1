#import CSV
$csvPath = "C:\temp\"
$csv = import-csv $csvPath -Encoding UTF8

#Export software list of remote PC
Foreach($row in $CSV)
{
$PCNAME = $null
$PCNAME = $Row.PCNAME
write-output $pcname
$software = Get-WmiObject -Class Win32_Product -Computer $pcname | export-csv "C:\Temp\software\$pcname.csv" -Encoding UTF8
}