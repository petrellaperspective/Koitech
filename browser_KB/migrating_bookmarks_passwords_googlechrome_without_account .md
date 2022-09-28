# Google Chrome Migrating Bookmarks and Saved Passwords 
 
 If a user does not use a Google Account but uses Google Chrome you'll need to do a couple things to migrate their data like their bookmarks and saved passwords. 

Copy the User Data folder located in this directory below to your media of choice so it can go to the new machine to this directory below 

**C:\Users\billy.cabbage\AppData\Local\Google\Chrome** 

Now if they have logged into Chrome with their google account or had some other sync it may have a file called **logindata** which may or may not contain the autofilled and saved passwords. 

This will copy over their history, bookmarks and other preferences. Be sure that Google Chrome is closed completely before copying the data.  
 
Then copy the data over from your media of choice to the new machine in the same directory replacing all that detects duplicates.  

To grab the autofill and passwords requires a few more steps.  

On the original machine open Chrome and go to **Settings** then **Autofill** then **Password Manager** 

![screenshot1.PNG](https://github.com/petrellaperspective/Koitech/blob/main/github_images/search_flags_chrome04.PNG)

Graphical user interface, text, application

Description automatically generated 

Then click the three dots on the same line as Saved Passwords and next to the Add button and click on Export passwords… 
 
NOTE: This is NOT the vertical dots by each password entry though their proximity is close. Blame Google's UI 

![screenshot2.PNG](https://github.com/petrellaperspective/Koitech/blob/main/github_images/search_flags_chrome03.PNG)

You'll be prompted by this message below 

![screenshot3.PNG](https://github.com/petrellaperspective/Koitech/blob/main/github_images/search_flags_chrome05.PNG)

SUPER IMPORTANT NOTE: These passwords once exported will be in CSV plaintext meaning anyone with access to this file will be able to read everything. Ensure to delete all traces of this file after it is imported 
 
Then save the file to somewhere it can be transferred easily and removed like a flashdrive. 
 
Next you'll need to turn on an experimental feature in order to get the import passwords option. By default Google Chrome will NOT import passwords only Export. 

On the new machine's Google Chrome address bar type in 

**chrome://flags** 

It will take you the experimental part of Chrome, and despite what the name suggests this feature does work.  

![screenshot4.PNG](https://github.com/petrellaperspective/Koitech/blob/main/github_images/search_flags_chrome.PNG)

type in  

`password import` 

You should see this feature pop-up 

 ![screenshot5.PNG](https://github.com/petrellaperspective/Koitech/blob/main/github_images/search_flags_chrome02.PNG)

Select the Default dropdown and select Enable. You will have to relaunch Google Chrome for the changes to take effect. 

 Once added you'll get the option to import passwords and select the file from earlier going to the same 3 vertical dots you used to export the passwords. 

![screenshot6.PNG](https://github.com/petrellaperspective/Koitech/blob/main/github_images/search_flags_chrome07.PNG)

After the passwords are imported you'll see them populate that page. 

Remember to disable the Password Import feature by going back to 

 `chrome://flags` and selecting Disable from the drown down menu.  


Then make sure to delete all copies of the password file.  

Congrats! All the autofills and saved Google information should have transferred without using a Google Account. 

### Sources: 

https://linuxhint.com/import-and-export-passwords-in-google-chrome/ 