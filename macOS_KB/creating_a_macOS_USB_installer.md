# Creating a macOS USB Installer

**Source:** https://support.apple.com/en-us/HT201372
## How to create a bootable installer for macOS



You can use an external drive or secondary volume as a startup disk from which to install the Mac operating system.


These advanced steps are primarily for system administrators and others who are familiar with the command line. You don't need a bootable installer to upgrade macOS or reinstall macOS, but it can be useful when you want to install on multiple computers without downloading the installer each time.


## What you need to create a bootable installer


*   A USB flash drive or other secondary volume formatted as Mac OS Extended, with at least 14GB of available storage
*   A downloaded installer for macOS Monterey, Big Sur, Catalina, Mojave, High Sierra, or El Capitan


## Download macOS


*   **Download: [macOS Monterey](https://apps.apple.com/us/app/macos-monterey/id1576738294?mt=12), [macOS Big Sur](https://apps.apple.com/us/app/macos-big-sur/id1526878132?mt=12), [macOS Catalina](https://apps.apple.com/us/app/macos-catalina/id1466841314?mt=12), [macOS Mojave](https://apps.apple.com/us/app/macos-mojave/id1398502828?mt=12), **or** [macOS High Sierra](https://apps.apple.com/us/app/macos-high-sierra/id1246284741?mt=12) **
    These download to your Applications folder as an app named Install macOS [version name]. If the installer opens after downloading, quit it without continuing installation. To get the correct installer, download from a Mac that is using macOS Sierra 10.12.5 or later, or El Capitan 10.11.6\. Enterprise administrators, please download from Apple, not a locally hosted software-update server. 
*   **Download: [OS X El Capitan](http://updates-http.cdn-apple.com/2019/cert/061-41424-20191024-218af9ec-cf50-4516-9011-228c78eda3d2/InstallMacOSX.dmg)** This downloads as a disk image named InstallMacOSX.dmg. On a Mac that is compatible with El Capitan, open the disk image and run the installer within, named InstallMacOSX.pkg. It installs an app named Install OS X El Capitan into your Applications folder. You will create the bootable installer from this app, not from the disk image or .pkg installer.


## Use the 'createinstallmedia' command in Terminal


1.  Connect the USB flash drive or other volume that you're using for the bootable installer. 
2.  Open Terminal, which is in the Utilities folder of your Applications folder.
3.  Type or paste one of the following commands in Terminal. These assume that the installer is in your Applications folder, and MyVolume is the name of the USB flash drive or other volume you're using. If it has a different name, replace `MyVolume` in these commands with the name of your volume.

**Monterey:**

``sudo /Applications/Install\ macOS\ Monterey.app/Contents/Resources/createinstallmedia --volume /Volumes/MyVolume``


**Big Sur:***

``sudo /Applications/Install\ macOS\ Big\ Sur.app/Contents/Resources/createinstallmedia --volume /Volumes/MyVolume``


**Catalina:**

``sudo /Applications/Install\ macOS\ Catalina.app/Contents/Resources/createinstallmedia --volume /Volumes/MyVolume``


**Mojave:**

``sudo /Applications/Install\ macOS\ Mojave.app/Contents/Resources/createinstallmedia --volume /Volumes/MyVolume``


**High Sierra:**

`` sudo /Applications/Install\ macOS\ High\ Sierra.app/Contents/Resources/createinstallmedia --volume /Volumes/MyVolume``


**El Capitan:**

``sudo /Applications/Install\ OS\ X\ El\ Capitan.app/Contents/Resources/createinstallmedia --volume /Volumes/MyVolume --applicationpath /Applications/Install\ OS\ X\ El\ Capitan.app``


* If your Mac is using macOS Sierra or earlier, include the `--applicationpath` argument and installer path, similar to the way this is done in the command for El Capitan.

After typing the command:

1.  Press Return to enter the command.
2.  When prompted, type your administrator password and press Return again. Terminal doesn't show any characters as you type your password.
3.  When prompted, type `Y` to confirm that you want to erase the volume, then press Return. Terminal shows the progress as the volume is erased.
4.  After the volume is erased, you may see an alert that Terminal would like to access files on a removable volume. Click OK to allow the copy to proceed. 
5.  When Terminal says that it's done, the volume will have the same name as the installer you downloaded, such as Install macOS Monterey. You can now quit Terminal and eject the volume.
    ![Terminal window showing completed process](https://support.apple.com/library/content/dam/edam/applecare/images/en_US/macos/Big-Sur/macos-big-sur-terminal-create-bootable-installer.jpg)




* * *



## Use the bootable installer


[Determine whether you're using a Mac with Apple silicon](https://support.apple.com/kb/HT211814), then follow the appropriate steps:


### Apple silicon


1.  Plug the bootable installer into a Mac that is connected to the internet and compatible with the version of macOS you're installing.
2.  Turn on your Mac and continue to hold the power button until you see the startup options window, which shows your bootable volumes.
3.  Select the volume containing the bootable installer, then click Continue.
4.  When the macOS installer opens, follow the onscreen instructions.


### Intel processor


1.  Plug the bootable installer into a Mac that is connected to the internet and compatible with the version of macOS you're installing.
2.  Press and hold the Option (Alt) ⌥ key immediately after turning on or restarting your Mac.
3.  Release the Option key when you see a dark screen showing your bootable volumes.
4.  Select the volume containing the bootable installer. Then click the up arrow or press Return. 
    If you can't start up from the bootable installer, make sure that the [External Boot setting in Startup Security Utility](https://support.apple.com/kb/HT208198) is set to allow booting from external media.
5.  Choose your language, if prompted.
6.  Select Install macOS (or Install OS X) from the Utilities window, then click Continue and follow the onscreen instructions.


* * *


## Learn more


A bootable installer doesn't download macOS from the internet, but it does require an internet connection to get firmware and other information specific to the Mac model.

For information about the `createinstallmedia` command and the arguments you can use with it, make sure that the macOS installer is in your Applications folder, then enter the appropriate path in Terminal:

/Applications/Install\ macOS\ Monterey.app/Contents/Resources/createinstallmedia


/Applications/Install\ macOS\ Big\ Sur.app/Contents/Resources/createinstallmedia


/Applications/Install\ macOS\ Catalina.app/Contents/Resources/createinstallmedia


/Applications/Install\ macOS\ Mojave.app/Contents/Resources/createinstallmedia


/Applications/Install\ macOS\ High\ Sierra.app/Contents/Resources/createinstallmedia


/Applications/Install\ OS\ X\ El\ Capitan.app/Contents/Resources/createinstallmedia

Published Date: October 25, 2021
