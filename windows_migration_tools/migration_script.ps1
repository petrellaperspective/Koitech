# Copies over the individual folders of an user's account to a external drive
# Copies over the sticky note file of the user
# Copies over the signature file of the user

$user= Read-Host "Please enter your name"
$destination = Read-Host "please enter where you want the files copied"
$msgBody = "All files successfully migrated"
$error_with_path = "Invalid path. Exiting"
$path_exists = "yes"
$path_does_not_exist = "no"

Test-Path -path "C:\Users\$user\Desktop"

Read-Host "Did the path return True? If so type 'yes' otherwise type 'no'"
# if ($path_does_not_exist) 

# Write-Output "Path does not exist check the username and the path to your destination and try again"


# Creates the directory on the external drive to house the transfer files
New-Item -Path "$destination" -Name "$user transfer" -ItemType "directory"

# Copies the User's Desktop
Copy-Item -Recurse "C:\Users\$user\Desktop" -Destination "$destination\$user transfer"
# Copies the User's Documents
Copy-Item -Recurse "C:\Users\$user\Documents" -Destination "$destination\$user transfer"
# Copies the User's Downloads
Copy-Item -Recurse "C:\Users\$user\Downloads" -Destination "$destination\$user transfer"
# Copies the User's Favorites
Copy-Item -Recurse "C:\Users\$user\Favorites" -Destination "$destination\$user transfer"
# Copies the User's Links
Copy-Item -Recurse "C:\Users\$user\Links" -Destination "$destination\$user transfer"
# Copies the User's Music
Copy-Item -Recurse "C:\Users\$user\Music" -Destination "$destination\$user transfer"
# Copies the User's Pictures
Copy-Item -Recurse "C:\Users\$user\Pictures" -Destination "$destination\$user transfer"
# Copies the User's Videos
Copy-Item -Recurse "C:\Users\$user\Videos" -Destination "$destination\$user transfer"
# Copies the User's Outlook Signatures
Copy-Item -Recurse "C:\Users\$user\AppData\Roaming\Microsoft\Signatures" -Destination "$destination\$user transfer"
# Copies the User's Sticky Notes
Copy-Item -Recurse "C:\Users\$user\AppData\Local\Packages\Microsoft.MicrosoftStickyNotes_8wekyb3d8bbwe\LocalState" -Destination "$destination\$user transfer"

Add-Type -AssemblyName PresentationCore,PresentationFramework
[System.Windows.MessageBox]::Show($msgBody)

exit 0