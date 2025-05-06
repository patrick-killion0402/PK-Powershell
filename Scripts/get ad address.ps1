##Get Address based on user location, CSV must contain names of users who need the address from
#import CSV
$csvPath = "C:\Temp\Book1.csv"
$csv = Import-Csv $csvPath -Encoding UTF8 

Foreach($row in $csv)
{
    $Name = $row.'Full Name'
    write-output $Name
    $ADInfo = Get-ADUser -Filter "Name -like '*$Name*'" -Properties streetaddress,l,st,postalcode,co
    $row.City = $ADInfo.l
    $row.'Street Address' = $ADInfo.StreetAddress
    $row.State = $ADInfo.st
    $row.Country = $ADInfo.co
    $row.'Zip Code' = $ADInfo.PostalCode
}


$CSV | export-CSV -path $CSVpath -NoTypeInformation -encoding UTF8