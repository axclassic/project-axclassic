# Microsoft Developer Studio Project File - Name="World" - Package Owner=<4>
# Microsoft Developer Studio Generated Build File, Format Version 6.00
# ** DO NOT EDIT **

# TARGTYPE "Win32 (x86) Console Application" 0x0103

CFG=World - Win32 Debug
!MESSAGE This is not a valid makefile. To build this project using NMAKE,
!MESSAGE use the Export Makefile command and run
!MESSAGE 
!MESSAGE NMAKE /f "World.mak".
!MESSAGE 
!MESSAGE You can specify a configuration when running NMAKE
!MESSAGE by defining the macro CFG on the command line. For example:
!MESSAGE 
!MESSAGE NMAKE /f "World.mak" CFG="World - Win32 Debug"
!MESSAGE 
!MESSAGE Possible choices for configuration are:
!MESSAGE 
!MESSAGE "World - Win32 Release" (based on "Win32 (x86) Console Application")
!MESSAGE "World - Win32 Debug" (based on "Win32 (x86) Console Application")
!MESSAGE "World - Win32 Raid Addicts" (based on "Win32 (x86) Console Application")
!MESSAGE 

# Begin Project
# PROP AllowPerConfigDependencies 0
# PROP Scc_ProjName ""
# PROP Scc_LocalPath ""
CPP=cl.exe
RSC=rc.exe

!IF  "$(CFG)" == "World - Win32 Release"

# PROP BASE Use_MFC 0
# PROP BASE Use_Debug_Libraries 0
# PROP BASE Output_Dir "Release"
# PROP BASE Intermediate_Dir "Release"
# PROP BASE Target_Dir ""
# PROP Use_MFC 0
# PROP Use_Debug_Libraries 0
# PROP Output_Dir "../build/"
# PROP Intermediate_Dir "../Build/World/Release/"
# PROP Ignore_Export_Lib 0
# PROP Target_Dir ""
# ADD BASE CPP /nologo /W3 /GX /O2 /D "WIN32" /D "NDEBUG" /D "_CONSOLE" /D "_MBCS" /YX /FD /c
# ADD CPP /nologo /MT /w /W0 /GX /Zi /O2 /Ob2 /I "c:\mysql\include" /I "c:\eqemu\include" /I "..\common\SocketLib" /I "c:\Perl\lib\CORE" /D "NDEBUG" /D "IRC" /D "EMBPERL" /D "EMBPERL_PLUGIN" /D "WIN32" /D "WORLD" /D "i386" /D "SHAREMEM" /D "INVERSEXY" /D "_WIN32" /D _WIN32_WINNT=0x0400 /D "_CONSOLE" /D "_MBCS" /D "FIELD_ITEMS" /D EQDEBUG=5 /FR /FD /c
# SUBTRACT CPP /YX
# ADD BASE RSC /l 0x409 /d "NDEBUG"
# ADD RSC /l 0x409 /d "NDEBUG"
BSC32=bscmake.exe
# ADD BASE BSC32 /nologo
# ADD BSC32 /nologo /o"../Build/World/World.bsc"
LINK32=link.exe
# ADD BASE LINK32 kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib odbc32.lib odbccp32.lib kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib odbc32.lib odbccp32.lib /nologo /subsystem:console /machine:I386
# ADD LINK32 kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib odbc32.lib odbccp32.lib wsock32.lib mysqlclient.lib /nologo /subsystem:console /map:"../Build/World.map" /debug /machine:I386 /nodefaultlib:"libc" /libpath:"c:\eqemu\lib" /libpath:"c:\mysql\lib\opt" /libpath:"..\common\lib" /libpath:"c:\Perl\lib\CORE"
# SUBTRACT LINK32 /pdb:none

!ELSEIF  "$(CFG)" == "World - Win32 Debug"

# PROP BASE Use_MFC 0
# PROP BASE Use_Debug_Libraries 1
# PROP BASE Output_Dir "Debug"
# PROP BASE Intermediate_Dir "Debug"
# PROP BASE Target_Dir ""
# PROP Use_MFC 0
# PROP Use_Debug_Libraries 1
# PROP Output_Dir "../build/"
# PROP Intermediate_Dir "../Build/World/Debug/"
# PROP Ignore_Export_Lib 0
# PROP Target_Dir ""
# ADD BASE CPP /nologo /W3 /Gm /GX /ZI /Od /D "WIN32" /D "_DEBUG" /D "_CONSOLE" /D "_MBCS" /YX /FD /GZ /c
# ADD CPP /nologo /MTd /Gm /GR /GX /ZI /Od /I "c:\mysql\include" /I "c:\eqemu\include" /I "..\common\SocketLib" /I "c:\Perl\lib\CORE" /D "_DEBUG" /D "EMBPERL" /D "EMBPERL_PLUGIN" /D "WIN32" /D "WORLD" /D "i386" /D "SHAREMEM" /D "INVERSEXY" /D "_WIN32" /D _WIN32_WINNT=0x0400 /D "_CONSOLE" /D "_MBCS" /D "FIELD_ITEMS" /D EQDEBUG=5 /FR /FD /GZ /c
# SUBTRACT CPP /YX
# ADD BASE RSC /l 0x409 /d "_DEBUG"
# ADD RSC /l 0x409 /d "_DEBUG"
BSC32=bscmake.exe
# ADD BASE BSC32 /nologo
# ADD BSC32 /nologo
LINK32=link.exe
# ADD BASE LINK32 kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib odbc32.lib odbccp32.lib kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib odbc32.lib odbccp32.lib /nologo /subsystem:console /debug /machine:I386 /pdbtype:sept
# ADD LINK32 kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib odbc32.lib odbccp32.lib wsock32.lib mysqlclient.lib /nologo /subsystem:console /debug /machine:I386 /nodefaultlib:"LIBCMT" /nodefaultlib:"LIBC" /out:"../build/WorldDebug.exe" /pdbtype:sept /libpath:"c:\eqemu\lib" /libpath:"c:\mysql\lib\opt" /libpath:"..\common\lib" /libpath:"c:\Perl\lib\CORE"
# SUBTRACT LINK32 /pdb:none /map

!ELSEIF  "$(CFG)" == "World - Win32 Raid Addicts"

# PROP BASE Use_MFC 0
# PROP BASE Use_Debug_Libraries 0
# PROP BASE Output_Dir "Release"
# PROP BASE Intermediate_Dir "Release"
# PROP BASE Target_Dir ""
# PROP Use_MFC 0
# PROP Use_Debug_Libraries 0
# PROP Output_Dir "../build/"
# PROP Intermediate_Dir "../Build/World/Release/"
# PROP Ignore_Export_Lib 0
# PROP Target_Dir ""
# ADD BASE CPP /nologo /W3 /GX /O2 /D "WIN32" /D "NDEBUG" /D "_CONSOLE" /D "_MBCS" /YX /FD /c
# ADD CPP /nologo /MT /w /W0 /GX /Zi /O2 /Ob2 /I "c:\mysql\include" /I "c:\eqemu\include" /I "..\common\SocketLib" /I "c:\Perl\lib\CORE" /D "NDEBUG" /D "EMBPERL" /D "EMBPERL_PLUGIN" /D "WIN32" /D "WORLD" /D "i386" /D "SHAREMEM" /D "INVERSEXY" /D "_WIN32" /D _WIN32_WINNT=0x0400 /D "_CONSOLE" /D "_MBCS" /D "FIELD_ITEMS" /D EQDEBUG=5 /FR /FD /c
# SUBTRACT CPP /YX
# ADD BASE RSC /l 0x409 /d "NDEBUG"
# ADD RSC /l 0x409 /d "NDEBUG"
BSC32=bscmake.exe
# ADD BASE BSC32 /nologo
# ADD BSC32 /nologo /o"../Build/World/World.bsc"
LINK32=link.exe
# ADD BASE LINK32 kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib odbc32.lib odbccp32.lib kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib odbc32.lib odbccp32.lib /nologo /subsystem:console /machine:I386
# ADD LINK32 kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib odbc32.lib odbccp32.lib wsock32.lib mysqlclient.lib /nologo /subsystem:console /map:"../Build/World.map" /debug /machine:I386 /nodefaultlib:"libc" /libpath:"c:\eqemu\lib" /libpath:"c:\mysql\lib\opt" /libpath:"..\common\lib" /libpath:"c:\Perl\lib\CORE"
# SUBTRACT LINK32 /pdb:none

!ENDIF 

# Begin Target

# Name "World - Win32 Release"
# Name "World - Win32 Debug"
# Name "World - Win32 Raid Addicts"
# Begin Group "Source Files"

# PROP Default_Filter "cpp;c;cxx;rc;def;r;odl;idl;hpj;bat"
# Begin Source File

SOURCE=.\client.cpp
# End Source File
# Begin Source File

SOURCE=.\cliententry.cpp
# End Source File
# Begin Source File

SOURCE=.\clientlist.cpp
# End Source File
# Begin Source File

SOURCE=.\console.cpp
# End Source File
# Begin Source File

SOURCE=.\EQLConfig.cpp
# End Source File
# Begin Source File

SOURCE=.\LauncherLink.cpp
# End Source File
# Begin Source File

SOURCE=.\LauncherList.cpp
# End Source File
# Begin Source File

SOURCE=.\LoginServer.cpp
# End Source File
# Begin Source File

SOURCE=.\net.cpp
# End Source File
# Begin Source File

SOURCE=.\perl_EQLConfig.cpp
# End Source File
# Begin Source File

SOURCE=.\world_logsys.cpp
# End Source File
# Begin Source File

SOURCE=.\WorldConfig.cpp
# End Source File
# Begin Source File

SOURCE=.\worlddb.cpp
# End Source File
# Begin Source File

SOURCE=.\zonelist.cpp
# End Source File
# Begin Source File

SOURCE=.\zoneserver.cpp
# End Source File
# End Group
# Begin Group "Header Files"

# PROP Default_Filter "h;hpp;hxx;hm;inl"
# Begin Source File

SOURCE=.\client.h
# End Source File
# Begin Source File

SOURCE=.\console.h
# End Source File
# Begin Source File

SOURCE=.\LoginServer.h
# End Source File
# Begin Source File

SOURCE=.\net.h
# End Source File
# Begin Source File

SOURCE=.\WorldTCPConnection.h
# End Source File
# Begin Source File

SOURCE=.\zoneserver.h
# End Source File
# End Group
# Begin Group "Common Source Files"

# PROP Default_Filter "*.cpp"
# Begin Source File

SOURCE=..\common\SocketLib\Base64.cpp
# End Source File
# Begin Source File

SOURCE=..\common\BasePacket.cpp
# End Source File
# Begin Source File

SOURCE=..\common\rulesys.cpp
# End Source File
# Begin Source File

SOURCE=..\common\classes.cpp
# End Source File
# Begin Source File

SOURCE=..\common\Condition.cpp
# End Source File
# Begin Source File

SOURCE=..\common\CRC16.cpp
# End Source File
# Begin Source File

SOURCE=..\common\crc32.cpp
# End Source File
# Begin Source File

SOURCE=..\common\database.cpp

!IF  "$(CFG)" == "World - Win32 Release"

!ELSEIF  "$(CFG)" == "World - Win32 Debug"

# ADD CPP /Gd /Gm /YX

!ELSEIF  "$(CFG)" == "World - Win32 Raid Addicts"

!ENDIF 

# End Source File
# Begin Source File

SOURCE=..\common\dbasync.cpp
# End Source File
# Begin Source File

SOURCE=..\common\dbcore.cpp
# End Source File
# Begin Source File

SOURCE=..\common\DBMemLeak.cpp
# End Source File
# Begin Source File

SOURCE=..\common\debug.cpp
# End Source File
# Begin Source File

SOURCE=..\common\emu_opcodes.cpp
# End Source File
# Begin Source File

SOURCE=..\common\EMuShareMem.cpp
# End Source File
# Begin Source File

SOURCE=..\common\EmuTCPConnection.cpp
# End Source File
# Begin Source File

SOURCE=..\common\EmuTCPServer.cpp
# End Source File
# Begin Source File

SOURCE=..\common\EQChatPacket.cpp
# End Source File
# Begin Source File

SOURCE=..\common\EQDB.cpp
# End Source File
# Begin Source File

SOURCE=..\common\EQDBRes.cpp
# End Source File
# Begin Source File

SOURCE=..\common\EQEmuConfig.cpp
# End Source File
# Begin Source File

SOURCE=..\common\EQEMuError.cpp
# End Source File
# Begin Source File

SOURCE=..\common\EQPacket.cpp
# End Source File
# Begin Source File

SOURCE=..\common\EQStream.cpp
# End Source File
# Begin Source File

SOURCE=..\common\EQStreamFactory.cpp
# End Source File
# Begin Source File

SOURCE=..\common\EQStreamIdent.cpp
# End Source File
# Begin Source File

SOURCE=..\common\EQStreamProxy.cpp
# End Source File
# Begin Source File

SOURCE=..\common\eqtime.cpp
# End Source File
# Begin Source File

SOURCE=..\common\extprofile.cpp
# End Source File
# Begin Source File

SOURCE=..\common\SocketLib\File.cpp
# End Source File
# Begin Source File

SOURCE=..\common\guild_base.cpp
# End Source File
# Begin Source File

SOURCE=..\common\guilds.cpp
# End Source File
# Begin Source File

SOURCE=..\common\SocketLib\HttpdCookies.cpp
# End Source File
# Begin Source File

SOURCE=..\common\SocketLib\HttpdForm.cpp
# End Source File
# Begin Source File

SOURCE=..\common\SocketLib\HttpdSocket.cpp
# End Source File
# Begin Source File

SOURCE=..\common\SocketLib\HTTPSocket.cpp
# End Source File
# Begin Source File

SOURCE=..\common\Item.cpp
# End Source File
# Begin Source File

SOURCE=..\common\logsys.cpp
# End Source File
# Begin Source File

SOURCE=..\common\md5.cpp
# End Source File
# Begin Source File

SOURCE=..\common\SocketLib\MemFile.cpp
# End Source File
# Begin Source File

SOURCE=..\common\SocketLib\Mime.cpp
# End Source File
# Begin Source File

SOURCE=..\common\misc.cpp
# End Source File
# Begin Source File

SOURCE=..\common\MiscFunctions.cpp
# End Source File
# Begin Source File

SOURCE=..\common\moremath.cpp
# End Source File
# Begin Source File

SOURCE=..\common\Mutex.cpp
# End Source File
# Begin Source File

SOURCE=..\common\opcodemgr.cpp
# End Source File
# Begin Source File

SOURCE=..\common\packet_dump.cpp
# End Source File
# Begin Source File

SOURCE=..\common\packet_dump_file.cpp
# End Source File
# Begin Source File

SOURCE=..\common\packet_functions.cpp
# End Source File
# Begin Source File

SOURCE=..\common\SocketLib\Parse.cpp
# End Source File
# Begin Source File

SOURCE=..\common\perl_EQDB.cpp
# End Source File
# Begin Source File

SOURCE=..\common\perl_EQDBRes.cpp
# End Source File
# Begin Source File

SOURCE=..\common\races.cpp
# End Source File
# Begin Source File

SOURCE=..\common\serverinfo.cpp
# End Source File
# Begin Source File

SOURCE=..\common\shareddb.cpp
# End Source File
# Begin Source File

SOURCE=..\common\SharedLibrary.cpp
# End Source File
# Begin Source File

SOURCE=..\common\SocketLib\socket_include.cpp
# End Source File
# Begin Source File

SOURCE=..\common\StructStrategy.cpp
# End Source File
# Begin Source File

SOURCE=..\common\TCPConnection.cpp
# End Source File
# Begin Source File

SOURCE=..\common\TCPServer.cpp
# End Source File
# Begin Source File

SOURCE=..\common\timeoutmgr.cpp
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

SOURCE=..\common\SocketLib\Utility.cpp
# End Source File
# Begin Source File

SOURCE=..\common\XMLParser.cpp
# End Source File
# End Group
# Begin Group "Common Header Files"

# PROP Default_Filter "*.h"
# Begin Source File

SOURCE=..\common\classes.h
# End Source File
# Begin Source File

SOURCE=..\common\crc32.h
# End Source File
# Begin Source File

SOURCE=..\common\database.h
# End Source File
# Begin Source File

SOURCE=..\common\dbasync.h
# End Source File
# Begin Source File

SOURCE=..\common\dbcore.h
# End Source File
# Begin Source File

SOURCE=..\common\DBMemLeak.h
# End Source File
# Begin Source File

SOURCE=..\common\debug.h
# End Source File
# Begin Source File

SOURCE=..\common\EMuShareMem.h
# End Source File
# Begin Source File

SOURCE=..\common\eq_opcodes.h
# End Source File
# Begin Source File

SOURCE=..\common\eq_packet_structs.h
# End Source File
# Begin Source File

SOURCE=..\common\EQCheckTable.h
# End Source File
# Begin Source File

SOURCE=..\common\EQPacket.h
# End Source File
# Begin Source File

SOURCE=..\common\EQStream.h
# End Source File
# Begin Source File

SOURCE=..\common\EQStreamFactory.h
# End Source File
# Begin Source File

SOURCE=..\common\EQStreamLocator.h
# End Source File
# Begin Source File

SOURCE=..\Zone\faction.h
# End Source File
# Begin Source File

SOURCE=..\common\Guilds.h
# End Source File
# Begin Source File

SOURCE=..\common\Item.h
# End Source File
# Begin Source File

SOURCE=..\common\linked_list.h
# End Source File
# Begin Source File

SOURCE=..\Zone\loottable.h
# End Source File
# Begin Source File

SOURCE=..\common\md5.h
# End Source File
# Begin Source File

SOURCE=..\common\misc.h
# End Source File
# Begin Source File

SOURCE=..\common\MiscFunctions.h
# End Source File
# Begin Source File

SOURCE=..\common\moremath.h
# End Source File
# Begin Source File

SOURCE=..\common\Mutex.h
# End Source File
# Begin Source File

SOURCE=..\common\opcodemgr.h
# End Source File
# Begin Source File

SOURCE=..\common\packet_dump.h
# End Source File
# Begin Source File

SOURCE=..\common\packet_dump_file.h
# End Source File
# Begin Source File

SOURCE=..\common\packet_functions.h
# End Source File
# Begin Source File

SOURCE=..\common\queue.h
# End Source File
# Begin Source File

SOURCE=..\common\races.h
# End Source File
# Begin Source File

SOURCE=..\common\Seperator.h
# End Source File
# Begin Source File

SOURCE=..\common\serverinfo.h
# End Source File
# Begin Source File

SOURCE=..\common\servertalk.h
# End Source File
# Begin Source File

SOURCE=..\common\TCPConnection.h
# End Source File
# Begin Source File

SOURCE=..\common\timer.h
# End Source File
# Begin Source File

SOURCE=..\common\types.h
# End Source File
# Begin Source File

SOURCE=..\common\version.h
# End Source File
# End Group
# Begin Group "Text Files"

# PROP Default_Filter "*.txt"
# Begin Source File

SOURCE=..\readme.txt
# End Source File
# End Group
# Begin Group "HTTP"

# PROP Default_Filter ""
# Begin Source File

SOURCE=.\EQW.cpp
# End Source File
# Begin Source File

SOURCE=.\EQWHTTPHandler.cpp
# End Source File
# Begin Source File

SOURCE=.\EQWParser.cpp
# End Source File
# Begin Source File

SOURCE=.\HTTPRequest.cpp
# End Source File
# Begin Source File

SOURCE=.\perl_EQW.cpp
# End Source File
# Begin Source File

SOURCE=.\perl_HTTPRequest.cpp
# End Source File
# Begin Source File

SOURCE=.\wguild_mgr.cpp
# End Source File
# End Group
# Begin Group "Patches"

# PROP Default_Filter ""
# Begin Source File

SOURCE=..\common\patches\Live.cpp
# End Source File
# Begin Source File

SOURCE=..\common\patches\Client62.cpp
# End Source File
# Begin Source File

SOURCE=..\common\patches\Client62.h
# End Source File
# Begin Source File

SOURCE=..\common\patches\Client62_itemfields.h
# End Source File
# Begin Source File

SOURCE=..\common\patches\Client62_ops.h
# End Source File
# Begin Source File

SOURCE=..\common\patches\Client62_structs.h
# End Source File
# Begin Source File

SOURCE=..\common\patches\Live_itemfields.h
# End Source File
# Begin Source File

SOURCE=..\common\patches\patches.cpp
# End Source File
# Begin Source File

SOURCE=..\common\patches\patches.h
# End Source File
# Begin Source File

SOURCE=..\common\patches\SSDeclare.h
# End Source File
# Begin Source File

SOURCE=..\common\patches\SSDefine.h
# End Source File
# Begin Source File

SOURCE=..\common\patches\SSRegister.h
# End Source File
# Begin Source File

SOURCE=..\common\patches\Titanium.cpp
# End Source File
# Begin Source File

SOURCE=..\common\patches\Anniversary.cpp
# End Source File
# Begin Source File

SOURCE=..\common\patches\Titanium.h
# End Source File
# Begin Source File

SOURCE=..\common\patches\Titanium_itemfields.h
# End Source File
# Begin Source File

SOURCE=..\common\patches\Titanium_ops.h
# End Source File
# Begin Source File

SOURCE=..\common\patches\Titanium_structs.h
# End Source File
# End Group
# End Target
# End Project
