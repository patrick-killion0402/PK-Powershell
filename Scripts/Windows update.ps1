$Windowsversion = "C:\temp"
$CSV = Import-Csv -path $Windowsversion -encoding UTF8
$Buildinfo = "C:\Temp"
$CSV2 = Import-csv -path $Buildinfo -encoding UTF8
Import-Module ActiveDirectory



Foreach($row in $CSV)
{
$PCName = $null
$Winver = $null
$PC =$null
$Build = $Null
$Vername = $null

$PCName =$row.'Device Name'
$PC = Get-ADcomputer $PCName -property operatingsystemversion
$Winver = $PC.OperatingSystemVersion
$Build = $CSV2 | Where-Object {$_.build -eq $Winver}
$vername = $build.Version

$row.'Version Number' = $vername
$row.'Build Version' = $Build.build

}

 $CSV | export-CSV -path $Windowsversion -NoTypeInformation -encoding UTF8
