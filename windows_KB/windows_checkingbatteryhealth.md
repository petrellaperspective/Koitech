# Checking the Battery Life on a Windows machine

Notice your Battery life is as good as before or say you've come across an older windows machine and you're not sure if the battery needs to be replaced? Luckily there's a built-in command in Windows will allow you to do just that!

Open Powershell, you may need to be either admin or run as administrator if the command below doesn't work.

`powercfg /batteryreport /output "battery_tellmeyoursecrets.html"`

It will be saved to the root directory of where you're running powershell. If you're running as a user it will show this:

`Battery Life report saved to C:\Users\billycabbage\battery_tellmeyoursecrets.html`


If running Powershell as administrator it will save it to root of system32 directory

`Battery Life report saved to C:\Windows\System32\battery_tellmeyoursecrets.html`

You can also save the file as XML format too.

For more info use these commands to learn more info on `powercfg`

`powercfg -help`

for detailed information on batteryreport use this command

` powercfg /? /batteryreport`

This will show you all the detailed information on your battery life to quite the detail. One of the simplest is checking the design capacity to its current charge capacity.

Scroll down or do a find for **Battery capacity history**

Which will look like below

![Battery Screenshot](https://github.com/petrellaperspective/Koitech/blob/main/github_images/battery_capacityhistory.PNG)

**_Source_**

https://www.windowscentral.com/how-check-your-laptops-battery-health-windows-10
