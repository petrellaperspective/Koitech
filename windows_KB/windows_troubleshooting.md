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
