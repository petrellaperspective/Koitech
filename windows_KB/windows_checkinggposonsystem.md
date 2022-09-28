# Checking GPOs on the current system

Here's how to check what GPOs are applied to the current system. Useful if you're not sure or want to confirm.

Running this command as a standard powershell instance will ONLY show the User's GPOs, NOT the computer policies. To show ALL the policies you will need to the run the powershell as administrator.

Note: You can use command line as well I'm just using Powershell

Open up Powershell and run the following

`gpresult /H GPObestdarnreportyoueversee.html`

It will take a few seconds to a minute to process and will save to the root directory of the powershell session.

I.E. if running as a regular session it will go to here:

`C:\Users\billycabbage\GPObestdarnreportyoueversee.html`

Running as Administrator it will go to here:

`C:\Windows\System32\GPObestdarnreportyoueversee.html`
