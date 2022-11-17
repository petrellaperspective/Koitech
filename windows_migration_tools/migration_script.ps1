# Copies over the individual folders of an user's account to a external drive, their sticky notes files, Outlook Signature
# and Quick Access Links

$old_device_or_new = Read-Host "Are you migrating data from the old machine or to the new machine? type in 'old' if using old device or 'new' for new device"
$user= Read-Host "Please enter the name of the user you are migrating"
$destination = Read-Host "please enter the drive letter, i.e 'D:\', OR path of what you'll be using to migrate the data"
$msgBody = "All files successfully migrated"
$path_exists = "yes"
$path_does_not_exist = "no"
$ExcludeItems = "OneDrive"
$path_not_found_message = "The account $User could not be found AND/OR the connection to $destination failed. Double-check the username and your destination and try again"
$migration_successful = "All data transfered from $user transfer from $source. Good Job Everybody."
$transfer_path_not_found_message = "The account $user on $source could not be found AND/OR the connection to the new device failed. Double-check the username and your destination and try again"

switch ($old_device_or_new)

{
    "old"
{ Test-Path -path "C:\Users\$user\Downloads"
  Test-Path -path "$destination"

$path_check = Read-Host "Did all path detections return TRUE? If so type 'yes' otherwise type 'no'"

switch ($path_check) 

{
    "no"
{Add-Type -AssemblyName PresentationCore,PresentationFramework
[System.Windows.MessageBox]::Show($path_not_found_message)

exit 0 }
    "yes"
   { Write-Output "Connections established successfully! We did it!" }
}

Start-Transcript -Path "$destination\$user transfer\copy_log.txt"

Write-Output "Copying Data from Old Device to $destination..."
# Creates the directory on the external drive to house the transfer files
New-Item -Path "$destination" -Name "$user transfer" -ItemType "directory"

# Copies the User's Desktop
Copy-Item -Recurse "C:\Users\$user\Desktop" -Destination "$destination\$user transfer"
Write-Output "Desktop Copied"
# Copies the User's Documents
Copy-Item -Recurse "C:\Users\$user\Documents" -Destination "$destination\$user transfer"
Write-Output "Documents Copied"
# Copies the User's Downloads
Copy-Item -Recurse "C:\Users\$user\Downloads" -Destination "$destination\$user transfer"
Write-Output "Downloads Copied"
# Copies the User's Favorites
Copy-Item -Recurse "C:\Users\$user\Favorites" -Destination "$destination\$user transfer"
Write-Output "Favorites Copied"
# Copies the User's Links
Copy-Item -Recurse "C:\Users\$user\Links" -Destination "$destination\$user transfer"
Write-Output "Links Copied"
# Copies the User's Music
Copy-Item -Recurse "C:\Users\$user\Music" -Destination "$destination\$user transfer"
Write-Output "Music Copied"
# Copies the User's Pictures
Copy-Item -Recurse "C:\Users\$user\Pictures" -Destination "$destination\$user transfer"
Write-Output "Pictures Copied"
# Copies the User's Videos
Copy-Item -Recurse "C:\Users\$user\Videos" -Destination "$destination\$user transfer"
Write-Output "Videos Copied"
# Copies the User's Outlook Signatures
Copy-Item -Recurse "C:\Users\$user\AppData\Roaming\Microsoft\Signatures" -Destination "$destination\$user transfer"
Write-Output "Outlook Signatures Copied"
# Copies the User's Sticky Notes
Copy-Item -Recurse "C:\Users\$user\AppData\Local\Packages\Microsoft.MicrosoftStickyNotes_8wekyb3d8bbwe\LocalState" -Destination "$destination\$user transfer"
Write-Output "Don't fret your Sticky Notes are Copied"
# Copies the User's Quick Access Links
New-Item -Path "$destination" -Name "$user transfer\Quick_Access_Links" -ItemType "directory"
Copy-Item -Recurse "C:\Users\$user\AppData\Roaming\Microsoft\Windows\Recent\AutomaticDestinations" -Destination "$destination\$user transfer\Quick_Access_Links"
Write-Output "Quick Access Links have been copied" 



Add-Type -AssemblyName PresentationCore,PresentationFramework
[System.Windows.MessageBox]::Show($msgBody)

exit 0}
   
    "new"
   { $source = Read-Host "please confirm the path to where the $user directory is located"
     Test-Path -path "$source\$user transfer"
     Test-Path -path "C:\Users\$user\Downloads"

$transfer_check = Read-Host "Did all path detections return TRUE? If so type 'yes' otherwise type 'no'"

switch ($transfer_check) 

{
    "no"
{Add-Type -AssemblyName PresentationCore,PresentationFramework
[System.Windows.MessageBox]::Show($transfer_path_not_found_message)

exit 0 }
    "yes"
   { Write-Output "Connections established successfully! We did it!" }
}

Start-Transcript -Path "$source\$user transfer\transfer_log.txt"

# Migrates the data from the transfer directory to the user's account
Write-Output "Migrating data from $source to new machine..." 

# Transfers the user files to their Desktop
Copy-Item  "$source\$user transfer\Desktop\*" -Destination "C:\Users\$user\Desktop"
Write-Output "Desktop transferred"
# Transfers the user's files to their Documents
Copy-Item -Recurse "$source\$user transfer\Documents\*" -Destination "C:\Users\$user\Documents"
Write-Output "Documents transferred"
# Transfers the user's files to their Downloads
Copy-Item -Recurse "$source\$user transfer\Downloads\*" -Destination "C:\Users\$user\Downloads"
Write-Output "Downloads transferred"
# Transfers the user's files to their Favorites
Copy-Item -Recurse "$source\$user transfer\Favorites\*" -Destination "C:\Users\$user\Favorites"
Write-Output "Favorites transferred"
# Transfers the User's Links
Copy-Item -Recurse "$source\$user transfer\Links\*" -Destination "C:\Users\$user\Links"
Write-Output "Links transferred"
# Transfers the User's Music
Copy-Item -Recurse "$source\$user transfer\Music\*" -Destination "C:\Users\$user\Music"
Write-Output "Music transferred"
# Transfers the User's Pictures
Copy-Item -Recurse "$source\$user transfer\Pictures\*" -Destination "C:\Users\$user\Pictures"
Write-Output "Pictures transferrerd"
# Transfers the User's Videos
Copy-Item -Recurse "C:\Users\$user transfer\Videos\*" -Destination "C:\Users\$user\Videos"
Write-Output "Videos transferred"
# Transfers the User's Outlook Signatures
Copy-Item -Recurse "$source\$user transfer\Signatures" -Destination "C:\Users\$user\AppData\Roaming\Microsoft\"
Write-Output "Outlook Signatures transferred"
# Transfers the User's Sticky Notes
Copy-Item -Recurse -Force "$source\$user transfer\LocalState" -Destination "C:\Users\$user\AppData\Local\Packages\Microsoft.MicrosoftStickyNotes_8wekyb3d8bbwe\"
Write-Output "Sticky Notes are transferred"
# Transfers the User's Quick Access Links
Copy-Item -Recurse -Force "$source\$user transfer\Quick_Access_Links\AutomaticDestinations\*" -Destination "C:\Users\$user\AppData\Roaming\Microsoft\Windows\Recent\AutomaticDestinations"
Write-Output "Quick Access Links have been transferred" 

Add-Type -AssemblyName PresentationCore,PresentationFramework
[System.Windows.MessageBox]::Show($msgBody)

exit 0 }
}