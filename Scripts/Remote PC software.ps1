$computerName = ""
$credential = Get-Credential  # Enter your credentials when prompted

$softwareList = Invoke-Command -ComputerName $computerName -Credential $credential -ScriptBlock {
    Get-WmiObject -Class Win32_Product | Select-Object Name, Version, InstallDate
}

$softwareList | Format-Table -AutoSize