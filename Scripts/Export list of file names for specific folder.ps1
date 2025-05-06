#Path of folder to get names of
$path = "C:\temp\PS"
#create folder to put CSV in during export
New-Item -Path "C:\temp\test" -ItemType Directory -Force
get-childitem -path $path -recurse -file | Select-Object Name | Export-Csv 'C:\temp\test\export.csv' -NoTypeInformation -encoding UTF8