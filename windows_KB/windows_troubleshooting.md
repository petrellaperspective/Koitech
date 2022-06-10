# Windows Troubleshooting

## How to clear Windows Print Queue

### **Problem**
If you tried to print, but the job just got stuck in the queue without being able to
cancel it, you’re experiencing a stuck print job. There’s a simple way to clear out
the print queue, but it’s not always the most obvious thing. Here’s how to do it.

### **Solution**

(Screenshot to follow)

Clearing a Stuck Print Job in WindowsThe first thing you’re going
to want to do is open up **Services** through the start menu search

Find **Print Spooler** in the list

Click the **Stop** button

Now open up **Windows Explorer** and put this into the location bar:

`%windir%\System32\spool\PRINTERS`

You might be prompted for UAC to allow access to the folder, which will allow you access
to the folder.


Now you’ll see a bunch of files in the folder, and you’re going to want to delete all of them.

#### **Don’t delete the PRINTERS folder itself!** just the files.

Now go back to **Services** and click the **Start** button to start up the service again.

At this point your stuck print job should be gone.


## Troubleshooting BSODs and Examining a Windows BSOD dumpfile

When  BSOD happens like a Blue Screen of Death (BSOD) it can be annoying, scary and generate some WTH moments. Though there is useful information in that BSOD and the bug check to help you find out or clue into what could be causing the problem.

If you can catch the code on the BSOD it will be something like this 0x0000013A and a reference like **KERNEL_MODE_HEAP_CORRUPTION**

If you missed the code or it rebooted too quickly there is a record of it in the **Event Viewer** Track roughly the time it happened and lookup bugcheck or kernel power failure to narrow your search. You should see a bugcheck error which will display as similar message that was on the BSOD.

Look up the BSOD on this webiste which has a host of different BSODs in a long index http://www.carrona.org/bsodindx.html

From there it you can find more info hopefully and if it doesn't or isn't helpful enough on to the next step: examining the actual memory dump file.
First you need to install the software needed to analyze the file as it won't make sense otherwise.

Go this link below and install the Windows SDK. There's a LOT of components but thankfully we just need two from that main installer

https://developer.microsoft.com/en-us/windows/downloads/windows-sdk/

Install it and agree the license agreement. Then select ONLY the ones below toggling off the rest:

**Debugging Tools for Windows**
**Windows Performance Toolkit**

After that hit install and it should complete in the few minutes.

Find the DUMP file it will usually be in directory or the like

`C:\Windows\Memory Dumps\`

Than open that file on the machine you installed the Windows SDK on. If it's not the same machine you can simply copy over the dump file to the one  you do have it installed.

Open **WinDbg (x64)** (use the 64 bit or 32 bit  to the version you're running on the machine, I sincerely hope you're running 64 bit) if you do a search for it will show up otherwise it will be located at the path below if you kept the defaults for the install location

`C:\Program Files (x86)\Windows Kits\10\Debuggers\x64\windbg.exe`

Once opened Go to File or the little folder icon and select **Open Crash Dump** and select the dump file

From there it will load and then prompt you to enter the following in the line below

`!analyze -v`

From there it will take a few seconds to a few minutes to process and will no longer show *BUSY* when it is completed.

From there you can search the analysis and find more information on what was the culpirt.

Hope that helps. Happy Debugging!

**_Sources_**

[Bleeping Computer Forum Thread](https://www.bleepingcomputer.com/forums/t/762974/bsod-using-windbg-windows-debugger-and-analyze-v/)

[Windows Documentation for !analyze](https://docs.microsoft.com/en-us/windows-hardware/drivers/debugger/-analyze)

[Windows Documentation for more info on !analyze](https://docs.microsoft.com/en-us/windows-hardware/drivers/debugger/using-the--analyze-extension)
