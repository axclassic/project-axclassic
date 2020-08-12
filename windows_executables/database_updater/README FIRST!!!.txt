BACKUP YOUR DATABASE FIRST!
If anything fails in this update, you risk losing your bots in npc_types - so,
BACKUP FIRST.
SELECT * FROM npc_types WHERE isbot=1 will tell you if bots are back after update.
If you see no errors after running the update bat file, then it worked.

You may have to run one or both of these;
GRANT RELOAD ON *.* TO 'eq'@'localhost'; 
 
in the my.ini file (my.cnf for Linux)
this no: sql_mode=NO_ENGINE_SUBSTITUTION,STRICT_TRANS_TABLES
this yes: sql_mode=NO_ENGINE_SUBSTITUTION

What is does;
It brings your ax_classic database up to par with the ongoing developement 
if you have custom databse work, it will be lost!

How to do this;
place all files in database_updater folder together in a folder,
unzip "updated_sqls.zip" into the same folder,
run the "update_database.bat" file.
DON'T FORGET to change the four instances of "mysql -uUSERNAME -pPASSWORD" to your database info.

I quit Windows after Windows 7 (I either have Windows 7 or Ubuntu), so all was tested with Windows 7, 
that being said, I don't know about Windows 10 and up.