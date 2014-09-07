Windows users! What follows is what fixed my problem with zones crashing and getting hung up under windows servers.
I googled for "Google "dontshowui windows error reporting" and best result I found was this;
USE AT YOUR OWN RISK!

---------------------
http://social.msdn.microsoft.com/Forums/windowsdesktop/en-US/b0b8767a-c721-4e67-ae95-bd57e829200d/disabling-windows-error-reporting-completely

Disabling windows error reporting completely

Windows Error Reporting (WER) provides many settings to customize the problem reporting experience. All of these settings can be set using Group Policy. Some can also be changed in Action Center for Windows 7 or Problem Reports and Solutions for Windows Vista. WER settings are located in one of the following registry subkeys:

    HKEY_CURRENT_USER\Software\Microsoft\Windows\Windows Error Reporting
    HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\Windows Error Reporting

before you re boot, make sure this got changed to "1";
set this registry value to 1:

"HKEY_CURRENT_USER\Software\ Microsoft\Windows\Windows Error Reporting\DontShowUI"

Sometimes Win 7 wont allow major changes over remote
------------------

Windows XP---

HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\PCHealth\ErrorReporting

To disable Error Reporting, make sure all of the values located in this key are set to zero.
------------------
