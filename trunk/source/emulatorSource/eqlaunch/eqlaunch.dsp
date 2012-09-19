# Microsoft Developer Studio Project File - Name="eqlaunch" - Package Owner=<4>
# Microsoft Developer Studio Generated Build File, Format Version 6.00
# ** DO NOT EDIT **

# TARGTYPE "Win32 (x86) Console Application" 0x0103

CFG=eqlaunch - Win32 Debug
!MESSAGE This is not a valid makefile. To build this project using NMAKE,
!MESSAGE use the Export Makefile command and run
!MESSAGE 
!MESSAGE NMAKE /f "eqlaunch.mak".
!MESSAGE 
!MESSAGE You can specify a configuration when running NMAKE
!MESSAGE by defining the macro CFG on the command line. For example:
!MESSAGE 
!MESSAGE NMAKE /f "eqlaunch.mak" CFG="eqlaunch - Win32 Debug"
!MESSAGE 
!MESSAGE Possible choices for configuration are:
!MESSAGE 
!MESSAGE "eqlaunch - Win32 Release" (based on "Win32 (x86) Console Application")
!MESSAGE "eqlaunch - Win32 Debug" (based on "Win32 (x86) Console Application")
!MESSAGE 

# Begin Project
# PROP AllowPerConfigDependencies 0
# PROP Scc_ProjName ""
# PROP Scc_LocalPath ""
CPP=cl.exe
RSC=rc.exe

!IF  "$(CFG)" == "eqlaunch - Win32 Release"

# PROP BASE Use_MFC 0
# PROP BASE Use_Debug_Libraries 0
# PROP BASE Output_Dir "Release"
# PROP BASE Intermediate_Dir "Release"
# PROP BASE Target_Dir ""
# PROP Use_MFC 0
# PROP Use_Debug_Libraries 0
# PROP Output_Dir "Release"
# PROP Intermediate_Dir "Release"
# PROP Target_Dir ""
# ADD BASE CPP /nologo /W3 /GX /O2 /D "WIN32" /D "NDEBUG" /D "_CONSOLE" /D "_MBCS" /YX /FD /c
# ADD CPP /nologo /MD /W3 /GX /O2 /I "C:\mysql\include" /I "c:\eqemu\include" /D "NDEBUG" /D "WIN32" /D "_CONSOLE" /D "_MBCS" /D EQDEBUG=5 /YX /FD /c
# ADD BASE RSC /l 0x409 /d "NDEBUG"
# ADD RSC /l 0x409 /d "NDEBUG"
BSC32=bscmake.exe
# ADD BASE BSC32 /nologo
# ADD BSC32 /nologo
LINK32=link.exe
# ADD BASE LINK32 kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib odbc32.lib odbccp32.lib kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib odbc32.lib odbccp32.lib /nologo /subsystem:console /machine:I386
# ADD LINK32 zlib.lib wsock32.lib kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib odbc32.lib odbccp32.lib /nologo /subsystem:console /machine:I386 /libpath:"c:\eqemu\lib"

!ELSEIF  "$(CFG)" == "eqlaunch - Win32 Debug"

# PROP BASE Use_MFC 0
# PROP BASE Use_Debug_Libraries 1
# PROP BASE Output_Dir "Debug"
# PROP BASE Intermediate_Dir "Debug"
# PROP BASE Target_Dir ""
# PROP Use_MFC 0
# PROP Use_Debug_Libraries 1
# PROP Output_Dir "Debug"
# PROP Intermediate_Dir "Debug"
# PROP Target_Dir ""
# ADD BASE CPP /nologo /W3 /Gm /GX /ZI /Od /D "WIN32" /D "_DEBUG" /D "_CONSOLE" /D "_MBCS" /YX /FD /GZ /c
# ADD CPP /nologo /MDd /W3 /Gm /GX /ZI /Od /I "C:\mysql\include" /I "c:\eqemu\include" /D "_DEBUG" /D "WIN32" /D "_CONSOLE" /D "_MBCS" /D EQDEBUG=5 /FD /GZ /c
# SUBTRACT CPP /YX
# ADD BASE RSC /l 0x409 /d "_DEBUG"
# ADD RSC /l 0x409 /d "_DEBUG"
BSC32=bscmake.exe
# ADD BASE BSC32 /nologo
# ADD BSC32 /nologo
LINK32=link.exe
# ADD BASE LINK32 kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib odbc32.lib odbccp32.lib kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib odbc32.lib odbccp32.lib /nologo /subsystem:console /debug /machine:I386 /pdbtype:sept
# ADD LINK32 zlib.lib wsock32.lib kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib odbc32.lib odbccp32.lib /nologo /subsystem:console /debug /machine:I386 /nodefaultlib:"LIBCMT" /pdbtype:sept /libpath:"c:\mysql\lib\opt"

!ENDIF 

# Begin Target

# Name "eqlaunch - Win32 Release"
# Name "eqlaunch - Win32 Debug"
# Begin Group "Source Files"

# PROP Default_Filter "cpp;c;cxx;rc;def;r;odl;idl;hpj;bat"
# Begin Source File

SOURCE=.\eqlaunch.cpp
# End Source File
# Begin Source File

SOURCE=.\worldserver.cpp
# End Source File
# Begin Source File

SOURCE=.\ZoneLaunch.cpp
# End Source File
# End Group
# Begin Group "Header Files"

# PROP Default_Filter "h;hpp;hxx;hm;inl"
# End Group
# Begin Group "Resource Files"

# PROP Default_Filter "ico;cur;bmp;dlg;rc2;rct;bin;rgs;gif;jpg;jpeg;jpe"
# End Group
# Begin Group "Common Source"

# PROP Default_Filter ""
# Begin Source File

SOURCE=..\common\debug.cpp
# End Source File
# Begin Source File

SOURCE=..\common\EQEmuConfig.cpp
# End Source File
# Begin Source File

SOURCE=..\common\logsys.cpp
# End Source File
# Begin Source File

SOURCE=..\common\md5.cpp
# End Source File
# Begin Source File

SOURCE=..\common\misc.cpp
# End Source File
# Begin Source File

SOURCE=..\common\MiscFunctions.cpp
# End Source File
# Begin Source File

SOURCE=..\common\Mutex.cpp
# End Source File
# Begin Source File

SOURCE=..\common\packet_dump.cpp
# End Source File
# Begin Source File

SOURCE=..\common\packet_functions.cpp
# End Source File
# Begin Source File

SOURCE=..\common\ProcLauncher.cpp
# End Source File
# Begin Source File

SOURCE=..\common\TCPConnection.cpp
# End Source File
# Begin Source File

SOURCE=..\common\TCPServer.cpp
# End Source File
# Begin Source File

SOURCE=..\common\EQTCPServer.cpp
# End Source File
# Begin Source File

SOURCE=..\common\EQTCPConnection.cpp
# End Source File
# Begin Source File

SOURCE=..\common\timer.cpp
# End Source File
# Begin Source File

SOURCE=..\common\tinyxml\tinystr.cpp
# End Source File
# Begin Source File

SOURCE=..\common\tinyxml\tinyxml.cpp
# End Source File
# Begin Source File

SOURCE=..\common\tinyxml\tinyxmlerror.cpp
# End Source File
# Begin Source File

SOURCE=..\common\tinyxml\tinyxmlparser.cpp
# End Source File
# Begin Source File

SOURCE=..\common\worldconn.cpp
# End Source File
# Begin Source File

SOURCE=..\common\XMLParser.cpp
# End Source File
# End Group
# End Target
# End Project
