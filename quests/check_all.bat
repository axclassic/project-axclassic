@echo off
TITLE Perl Syntax Error Checker Windows
REM REMEMBER: !!!---THIS FILE SHOULD ONLY RESIDE IN QUESTS FOLDER----!!!
REM This checkall batch file checks for perl syntax errors for Windows
REM by scanning for only perl files in the quests folder. Like the Linux
REM version of check_all the syntax OK's will be ignored and only errors
REM will be generated to the user. This takes about a minute to scan.
REM 2nd rev. 11/11/2016 by Patrikpatrik

setlocal EnableDelayedExpansion
goto :main

:main
setlocal
set perlfile=*.pl

if exist checkall.txt (
	del checkall.txt
)

cls
echo Checking perl scripts for syntax errors... This might take a minute so grab a coffee^^!

for /R %%g in ( !perlfile! ) do (
	set localvar=%%g
	perl -c !localvar! 2>>checkall.txt
)

cls
echo All done^^! Finished at %time%. If no results below then all perl scripts checked syntax OK^^!
echo.

for /f "tokens=1,2,3*" %%h in ( checkall.txt ) do (
	set tokvar=%%i %%j
	set newvar=syntax OK
	
	if not !tokvar!==!newvar! (
		set extrav=%%h %%i %%j %%k
		echo !extrav!
	)
)
del checkall.txt
echo.
pause
endlocal
goto :eof
