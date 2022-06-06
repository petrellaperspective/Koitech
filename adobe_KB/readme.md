# Adobe The Reference and Troubleshooting Guide

_This is a reference knowledge base for issues encountered with Adobe. Hope it helps
you out and reduces the frustration and exasperation of dealing with Adobe_

## Adobe Issue (Keychain, Unauthenticated Warnings) macOS

#### **Problem**

User continuously gets keychain popups whenever they launch or run an adobe application (Mac)

#### **Solution**

Reset the keychain
This will purge any system-saved passwords - make sure the user is aware!

Resetting the Keychain
Go to Spotlight (upper-right corner magnifying glass) → type Keychain and it should appear.

In the Keychain menu: Preferences → Reset My Default Keychain

The user should enter their current computer password in the password prompt

An empty login keychain will be created → click OK

Reboot

You will receive additional keychain prompts, as the keychain will be rebuilt upon each new access.

Everything should work, now.

## Unauthenticated Iissues macOS and Windows

#### **Problem**

If the user has had previous Adobe products on their system (from another school, free trials, etc), they may run into an unauthenticated warning.

#### **Solution**

Uninstall the trial products, log out of any trial accounts
If the issue persists, remove every **_existing_** Adobe product and try again by using Adobe Cleaner Tool https://helpx.adobe.com/creative-cloud/kb/cc-cleaner-tool-installation-problems.html

## Application lost licensing or any component of it is not working properly

_Adobe Acrobat but no other applications lost their licensing_

_In the Creative Cloud Desktop App my apps tab doesn't appear_

_A part of my illustrator or photoshop doesn't work as intended_

If any of those sound familiar Adobe support will usually do these two steps first.
Adobe is a messy program where it stores a lot of different things which is why it's often faster to simply remove certain directories or

#### REMOVE OOBE Files

macOS

**Make sure all adobe applications are closed before removing this directory.**

There are two OOBE (Out Of Box Experience) file directories on the macOS computer that stores the preferences for the Adobe applications including Creative Cloud Desktop. Navigate to /Volumes/Macintosh\ HD/Library/Application\ Support/Adobe for the computer's OOBE directory.

Navigate to /Volumes/Macintosh\ HD/Users/billycabbage/Library/Application\ Support/Adobe for user's OOBE library. It's recommended to delete this directory first as it often is tied to the user's account that the adobe application is failing to start or work correctly

WINDOWS
Go to your local drive and remove this directory.

**Be sure all Adobe Applications are closed prior to doing this.**

Local Disk C: > Program Files (x86) > Common Files > Adobe > OOBE

#### Run Adobe Creative Cloud Cleaner
Download the creative cloud cleaner tool and run it to remove the specific application or to remove almost everything. This page includes also the tool for windows as well. https://helpx.adobe.com/creative-cloud/kb/cc-cleaner-tool-installation-problems.html

This will remove MOST of the directories and files but there could still be older files and installers left behind.
