## Adobe Licensing Cost Center 
## Script to get Cost center and AD Account status 
## Script could be adjusted for any AD properties

$CSVVariable = "C:\Users\pkillion\Downloads\Adobe Renewal by Cost center 4-11-24.csv"
$CSV = Import-Csv -Path $CSVVariable -Encoding UTF8

#counts number of rows
$rowcount = $CSV.Length
$I = 0

Foreach($row in $CSV)
   {
   ## Null Zone
   $User = $Null
   $DN = $null
   $UN = $null
   $CostCenter = $Null


   $I++
   Write-Progress -Activity "Gathering data" -Status "On user: $i of $($rowcount)" -PercentComplete (($i / $rowcount) * 100)
   Write-output $Row.username
   $UN = $row.Username
   $User = Get-ADUser -Filter {mail -eq $UN} -Properties enabled,costcenter -Server ''
   $costcenter = $user.costcenter
   $Row."Cost Center" = $CostCenter
   If ($user -ne $null)
    {
    $DN = $user.DistinguishedName
     If($DN -like "*inert users*")
        {
         $row.status = "Inert"
        } 
     elseif($DN -like "*exceptions*")
        {
        $row.status = "Exceptions"
        }
       else
         {
         If($User.enabled -eq $true)
            {
            $row.status = "Enabled"
            $costcenter = $user.costcenter
            $Row."Cost Center" = $CostCenter
            }
            Else
            {
            $row.status = "Disabled"
            }
         }
      }
      #Not in AD 
   Else
   {
    $row.status = "Not in AD"
   }

   }

   $CSV | export-CSV -path $CSVVariable -NoTypeInformation -encoding UTF8

   