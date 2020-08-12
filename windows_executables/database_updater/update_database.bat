@ECHO OFF

:start 
cls
echo.
echo Are your SURE you want to update your ax_classic database?
echo This procedure will update your active ax_classic database.
echo Did you set the USERNAME/PASSWORD info in this file to your database?
echo DO NOT USE ON THE RATHE SERVER!!!  
echo select 1 to continue, 2 to exit.
echo.
echo 1.Update
echo 2.Quit
set /p choice=enter your choice 1,2: 
if %choice%==1 goto Update
REM if %choice%==2 goto BackupFirst
if %choice%==2 exit

:Update
ECHO Removing old bots.sql file...
Del bots.sql
sleep 3
ECHO Done.
ECHO Backing up Bots in npc_types...
mysqldump --complete-insert --lock-all-tables --no-create-db --no-create-info --extended-insert -uUSERNAME -pPASSWORD ax_classic npc_types --where "isbot > 0" > bots.sql
sleep 5
ECHO Done.
ECHO Updating Database...
mysql -uUSERNAME -pPASSWORD < update.sql
sleep 5
ECHO Done.
ECHO Updating npcs in npc_types...
mysql -uUSERNAME -pPASSWORD < update2.sql
sleep 5
ECHO Done.
ECHO Restoring Bots in npc_types...
mysql -uUSERNAME -pPASSWORD -Dax_classic < bots.sql
sleep 5
ECHO Done.

