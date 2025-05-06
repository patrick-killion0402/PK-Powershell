#Import CSV
#Set to location of the CSV
$AssetFile = ""
$CSV = Import-Csv -Path $AssetFile -Encoding UTF8


Foreach($row in $CSV)
{

 $Main += $Row.'Old Name' + "|"
 
 #$UpdatedName = $Row.'Old Name' + "|"
 #$Row.Updated = $UpdatedName
}

#$CSV | export-CSV -path $Assetfile -NoTypeInformation -encoding UTF8