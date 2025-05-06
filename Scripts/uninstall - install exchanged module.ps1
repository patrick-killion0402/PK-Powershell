uninstall-module -Name ExchangeOnlineManagement -Force -AllVersions 
Disconnect-ExchangeOnline
Install-Module -name ExchangeOnlineManagement -RequiredVersion 3.6.0 -AllowClobber -force
Connect-ExchangeOnline
remove-module -name Exchangeonlinemanagement 
get-module
import-module -Name exchangeonlinemanagement -RequiredVersion 3.6.0