These installation instructions are not required if you are using the AX-Classic Server repack.

1a. INSTALLATION INSTRUCTIONS (For AX-Classic Server Repack Users)

To update your existing AX-Classic editor, perform the following steps:

1. Extract the axclassiceditor folder.
2. Move the contents into a subfolder of your C:\Program Files\AXClassic-PEQ\udrive\www folder.
3. Copy the settings from your known-good config.php folder into the folder you just created.
4. Browse to http://localhost/yoursubfoldername/index.php and start editing.

1b. MANUAL INSTALLATION INSTRUCTIONS

To install the AX-Classic Editor, perform the following steps:

1. Browse to http://www.apache.org to download and install the Apache HTTP server.
2. Browse to http://www.php.net to download and install PHP.
3. Move the files from this AX-Classic download into your Apache server's www directory.
4. Source schema.sql from the editor's \sql directory into your database.
5. Update config.php to configure to your database.
6. In your Server Repack application, click the Tools menu, and then click HeidiSQL
7. Write down the info in the window that follows if you don't know your database login info. Click OK.
8. Make sure the connection info matches what you wrote down in the previous step. Then click Connect.
9. Click the AX-Classic database in the left tab.
10. Then click in white box to the right of line number 1. 
11. Paste the text from section 2 below into that space, and then press the F9 key.
12. Browse to http://localhost/index.php and start editing.
13. The default username/password is admin/password. To add another user, click the Admin link once you login.


2. SQL INSTALLATION REQUIRED (BOTH CASES)

# Creates Editor Login Table
DROP TABLE IF EXISTS `peq_admin`;
CREATE TABLE `peq_admin` (
  `id` int(11) NOT NULL auto_increment,
  `login` varchar(30) character set utf8 NOT NULL default '',
  `password` varchar(255) character set utf8 NOT NULL default '',
  `administrator` int(11) NOT NULL default '0',
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC;

# Creates default admin/password entry in above table so users can login and change it after install.
INSERT INTO `peq_admin` VALUES ('1', 'admin', '5f4dcc3b5aa765d61d8327deb882cf99', '1');




