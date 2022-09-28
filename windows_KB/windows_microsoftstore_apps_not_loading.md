# Windows Microsoft Store apps not loading properly

This was an odd one and took me a bit to figure out. The solution could be a number of these, it could be one or several in sequence. I'll do my best to explain what which one does and why it can have an effect.

### Problems
The Microsoft Store will not load or open properly

Some of my Windows apps like photos, calendar, sticky notes and calculator will not open or are missing.

The Windows apps work fine on another account but NOT for the specific user.

If you encounter an issue like the ones above the following may help you.

A couple of things to check

### Does the App show up in the Apps and Features? Does it show up by using another tool called Bulk Crap Uninstaller?

Check to see if the application is listed there under this directory. This should list all the apps installed from the Microsoft Store and Windows native apps for that user. If it is missing from this directory that means it is not installed properly or is not registered properly or both.

`C:\Users\billycfabbage\AppData\Local\Packages`

![packages_Names.PNG](https://hypernotes.zenkit.com/api/v1/lists/2096297/files/XiPUdXDMJ)

I would also use an utility called Bulk Crap Uninstaller linked here https://github.com/Klocman/Bulk-Crap-Uninstaller to see if the app apears there at all. If not, it is not properly installed or registered on the account or the computer.

 If it is there, then as far as Windows is concerned it is installed and you may be able to uninstall via the **Settings** > **Apps & Features**. Then use Microsoft Store to reinstall the app that was removed.
 
#### Does the app work in the local administrator account or another user's account?

If not it might be something more corrupted with Windows and a possible Windows Reset or reinstall may be necessary. 

If they do work in the other account, that means its isolated to the account and you should be able to resolve the issue via the steps below. You may need to do a combination of these or just one of them. Check the recommended for what ultimately fixed the last issue I had.

#### When you a click on an app that is having problems and it shows an error or no error code and simply flashes or closes out of the window

This means the app is not properly installed or is corrupted. If this happens you won't be able to remove the app via the settings page and you'll need to reset the windows store or execute a powershell command or script to resolve the issue.

## Solutions

#### Run a DISM and SFC Scans

Yes it's the same thing EVERYONE tells you online to do first when you a problem with Windows, but it's still good to do for a couple reasons

1. It tells if you there is corruption with the Windows OS
2. It tells if you there are irregularities in the system files. 

_Note: 95% of the time this will show no problems and or not resolve the issue. But it is a good idea to do it because it's fairly quick and clues you in on a possible cause of the problem. There's also always that 5% and have seen it happen_
 
`DISM /Online /Cleanup-Image /RestoreHealth`

`SFC /Scanow`

#### Reset the Windows Store Cache

You can reset the cache of the Windows Store in two ways

Go to Settings > Apps & Features go to Microsoft Store and select **Advanced Options**
![microsoft_store_advanced.PNG](https://hypernotes.zenkit.com/api/v1/lists/2096297/files/J1sKp85JI)

Then hit ** Reset** at Reset portion of the page near the  bottom

![reset_repair_microsoft_store.PNG](https://hypernotes.zenkit.com/api/v1/lists/2096297/files/yHNkS44Q4)

Then after the reset restart the machine.

If that still doesn't resolve the issue try the **Repair** option

#### Reset the Windows Store cache and repair the Microsoft Store using Command line or Powershell

If you are unable to access the settings options to reset or repair the Microsoft Store or Windows Store cache you can use this command to do the same thing. You can run via powershell, commandline or even via the windows run command. 

`wsreset`
It is recommended to restart like in the previous step.

#### Powershell commands and scripts to reinstall and register Windows Apps (Recommended)
If the previous steps didn't work this is the solution that worked for me and may be able to be done without the previous steps.

You can use the script linked on this page 
https://www.thewindowsclub.com/reinstall-preinstalled-apps-windows-10

At the time of this writing this is the script's code for confirmation.

_NOTE: the copied formatting may not perfectly match so DO NOT strictly copy from this code block._


```
# Get all the provisioned packages 
$Packages = (get-item 
'HKLM:\Software\Microsoft\Windows\CurrentVersion\Appx\AppxAllUserStore\Applications') | Get-ChildItem 

# Filter the list if provided a filter 
$PackageFilter = $args[0] 
if ([string]::IsNullOrEmpty($PackageFilter))
{
     echo "No filter specified, attempting to re-register all provisioned apps." 
}
else
{ 
      $Packages = $Packages | where {$_.Name -like $PackageFilter}
      if ($Packages -eq $null) 
       { 
          echo "No provisioned apps match the specified filter." 
          exit
       }
      else
      { 
          echo "Registering the provisioned apps that match $PackageFilter"
      }
}

ForEach($Package in $Packages) 
{
         # get package name & path
         $PackageName = $Package | Get-ItemProperty | Select-Object -ExpandProperty PSChildName
         $PackagePath = [System.Environment]::ExpandEnvironmentVariables(($Package | Get-ItemProperty | Select-Object -ExpandProperty Path)) 

         # register the package   
         echo "Attempting to register package: $PackageName" 

        Add-AppxPackage -register $PackagePath -DisableDevelopmentMode }
```

_Note: You will need to set the powershell execution policy to unrestricted for the script to run and remember to reset it to Allsigned after you're done_

If you need to only reinstall a single app you can specify it in the script like below

`.\reinstall-preinstalledApps.ps1 *Microsoft.WindowsStore*`

### Sources and Further Reading 

https://www.thewindowsclub.com/reset-windows-store-cache

https://www.thewindowsclub.com/reinstall-preinstalled-apps-windows-10

https://www.thewindowsclub.com/re-register-windows-store-apps

https://lazyadmin.nl/it/uninstall-microsoft-store-and-default-apps/

https://superuser.com/questions/1018168/replace-app-package-on-windows-10

https://thegeekpage.com/windows-10-store-cache-damaged-resolved/

https://www.maketecheasier.com/access-windowsapps-folder-windows-10/
