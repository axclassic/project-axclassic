@echo off
TITLE Perl Syntax Error Checker Windows
REM REMEMBER: !!!---THIS FILE SHOULD ONLY RESIDE IN QUESTS FOLDER----!!!
REM This checkall batch file checks for perl syntax errors for Windows
REM by scanning for only perl files in the quests folder. Like the Linux
REM version of check_all the syntax OK's will be ignored and only errors
REM will be generated to the user. This takes about a minute to scan.
REM -UPDATE- Will now append the results to a txt file called checkall.txt
REM 3rd rev. 11/11/2016 by Patrikpatrik

setlocal EnableDelayedExpansion
goto :main

:main
setlocal
set perlfile=*.pl

if exist checkalls.txt (
	del checkalls.txt
)

if exist checkall.txt (
	del checkall.txt
)

cls
echo Checking perl scripts for syntax errors... This might take a minute so grab a coffee^^!

for /R %%g in ( !perlfile! ) do (
	set localvar=%%g
	perl -c !localvar! 2>>checkalls.txt
)

cls
echo All done^^! These results have also been appended to a txt file called checkall.txt
echo If no results below then all perl scripts have checked syntax OK^^!
echo.

echo Perl error results at %time%. >> checkall.txt
echo If no results below then all perl scripts have checked syntax OK^^! >> checkall.txt
echo. >> checkall.txt

for /f "tokens=1,2,3*" %%h in ( checkalls.txt ) do (
	set tokvar=%%i %%j
	set newvar=syntax OK
	
	if not !tokvar!==!newvar! (
		set extrav=%%h %%i %%j %%k
		echo !extrav!
		echo !extrav! >> checkall.txt
	)
)
del checkalls.txt
echo.
pause
endlocal
goto :eof