#Unblock all files and subfolders in one folder
get-childitem "C:\Users\Brink\Desktop" -recurse | unblock-file

#Unblock single file
unblock-file -path "full path of blocked file"