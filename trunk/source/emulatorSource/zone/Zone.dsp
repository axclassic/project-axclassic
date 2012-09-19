# Microsoft Developer Studio Project File - Name="Zone" - Package Owner=<4>
# Microsoft Developer Studio Generated Build File, Format Version 6.00
# ** DO NOT EDIT **

# TARGTYPE "Win32 (x86) Console Application" 0x0103

CFG=Zone - Win32 ReleasePerl
!MESSAGE This is not a valid makefile. To build this project using NMAKE,
!MESSAGE use the Export Makefile command and run
!MESSAGE 
!MESSAGE NMAKE /f "Zone.mak".
!MESSAGE 
!MESSAGE You can specify a configuration when running NMAKE
!MESSAGE by defining the macro CFG on the command line. For example:
!MESSAGE 
!MESSAGE NMAKE /f "Zone.mak" CFG="Zone - Win32 ReleasePerl"
!MESSAGE 
!MESSAGE Possible choices for configuration are:
!MESSAGE 
!MESSAGE "Zone - Win32 Release" (based on "Win32 (x86) Console Application")
!MESSAGE "Zone - Win32 Debug" (based on "Win32 (x86) Console Application")
!MESSAGE "Zone - Win32 Raid Addicts" (based on "Win32 (x86) Console Application")
!MESSAGE "Zone - Win32 DebugPerl" (based on "Win32 (x86) Console Application")
!MESSAGE "Zone - Win32 ReleasePerl" (based on "Win32 (x86) Console Application")
!MESSAGE 

# Begin Project
# PROP AllowPerConfigDependencies 0
# PROP Scc_ProjName ""
# PROP Scc_LocalPath ""
CPP=cl.exe
RSC=rc.exe

!IF  "$(CFG)" == "Zone - Win32 Release"

# PROP BASE Use_MFC 0
# PROP BASE Use_Debug_Libraries 0
# PROP BASE Output_Dir "Release"
# PROP BASE Intermediate_Dir "Release"
# PROP BASE Target_Dir ""
# PROP Use_MFC 0
# PROP Use_Debug_Libraries 0
# PROP Output_Dir "../Build/"
# PROP Intermediate_Dir "../Build/Zone/Release"
# PROP Ignore_Export_Lib 0
# PROP Target_Dir ""
# ADD BASE CPP /nologo /W3 /GX /O2 /D "WIN32" /D "NDEBUG" /D "_CONSOLE" /D "_MBCS" /YX /FD /c
# ADD CPP /nologo /MT /w /W0 /Gm /GX /Zi /O2 /Ob2 /I "c:\mysql\include" /I "c:\eqemu\include" /D "i386" /D "SHAREMEM" /D _WIN32_WINNT=0x0400 /D "ZONE" /D "INVERSEXY" /D "WIN32" /D "_CONSOLE" /D "_MBCS" /D EQDEBUG=5 /FD /c
# SUBTRACT CPP /Fr /YX
# ADD BASE RSC /l 0x409 /d "NDEBUG"
# ADD RSC /l 0x409 /d "NDEBUG"
BSC32=bscmake.exe
# ADD BASE BSC32 /nologo
# ADD BSC32 /nologo /o"../Build/Zone/Zone.bsc"
LINK32=link.exe
# ADD BASE LINK32 kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib odbc32.lib odbccp32.lib kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib odbc32.lib odbccp32.lib /nologo /subsystem:console /machine:I386
# ADD LINK32 libcmt.lib kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib odbc32.lib odbccp32.lib kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib odbc32.lib odbccp32.lib wsock32.lib zlib.lib mysqlclient.lib /nologo /subsystem:console /pdb:none /debug /machine:I386 /libpath:"c:\mysql\lib\opt" /libpath:"c:\eqemu\lib"
# SUBTRACT LINK32 /map

!ELSEIF  "$(CFG)" == "Zone - Win32 Debug"

# PROP BASE Use_MFC 0
# PROP BASE Use_Debug_Libraries 1
# PROP BASE Output_Dir "Debug"
# PROP BASE Intermediate_Dir "Debug"
# PROP BASE Target_Dir ""
# PROP Use_MFC 0
# PROP Use_Debug_Libraries 1
# PROP Output_Dir "../build/"
# PROP Intermediate_Dir "../Build/Zone/Debug"
# PROP Ignore_Export_Lib 0
# PROP Target_Dir ""
# ADD BASE CPP /nologo /W3 /Gm /GX /ZI /Od /D "WIN32" /D "_DEBUG" /D "_CONSOLE" /D "_MBCS" /YX /FD /GZ /c
# ADD CPP /nologo /MTd /Gm /GX /Zi /Od /I "c:\mysql\include" /I "c:\eqemu\include" /D "i386" /D "SHAREMEM" /D _WIN32_WINNT=0x0400 /D "_EQDEBUG" /D "ZONE" /D "INVERSEXY" /D "WIN32" /D "_CONSOLE" /D "_MBCS" /D "EQDEBUG" /D "FIELD_ITEMS" /FR /FD /GZ /c
# SUBTRACT CPP /YX
# ADD BASE RSC /l 0x409 /d "_DEBUG"
# ADD RSC /l 0x409 /d "_DEBUG"
BSC32=bscmake.exe
# ADD BASE BSC32 /nologo
# ADD BSC32 /nologo
LINK32=link.exe
# ADD BASE LINK32 kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib odbc32.lib odbccp32.lib kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib odbc32.lib odbccp32.lib /nologo /subsystem:console /debug /machine:I386 /pdbtype:sept
# ADD LINK32 kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib odbc32.lib odbccp32.lib kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib odbc32.lib odbccp32.lib wsock32.lib zlib.lib mysqlclient.lib /nologo /subsystem:console /debug /machine:I386 /nodefaultlib:"LIBCMT" /nodefaultlib:"LIBC" /out:"../build/ZoneDebug.exe" /pdbtype:sept /libpath:"c:\mysql\lib\opt" /libpath:"c:\eqemu\lib"
# SUBTRACT LINK32 /pdb:none

!ELSEIF  "$(CFG)" == "Zone - Win32 Raid Addicts"

# PROP BASE Use_MFC 0
# PROP BASE Use_Debug_Libraries 0
# PROP BASE Output_Dir "Release"
# PROP BASE Intermediate_Dir "Release"
# PROP BASE Target_Dir ""
# PROP Use_MFC 0
# PROP Use_Debug_Libraries 0
# PROP Output_Dir "../Build/"
# PROP Intermediate_Dir "../Build/Zone/Release"
# PROP Ignore_Export_Lib 0
# PROP Target_Dir ""
# ADD BASE CPP /nologo /W3 /GX /O2 /D "WIN32" /D "NDEBUG" /D "_CONSOLE" /D "_MBCS" /YX /FD /c
# ADD CPP /nologo /MT /w /W0 /GX /Zi /O2 /Ob2 /I "c:\mysql\include" /I "c:\eqemu\include" /D "i386" /D "SHAREMEM" /D "CATCH_CRASH" /D _WIN32_WINNT=0x0400 /D "NDEBUG" /D "ZONESERVER" /D "ZONE" /D "INVERSEXY" /D "WIN32" /D "_CONSOLE" /D "_MBCS" /D "FIELD_ITEMS" /D EQDEBUG=5 /FR /YX /FD /c
# ADD BASE RSC /l 0x409 /d "NDEBUG"
# ADD RSC /l 0x409 /d "NDEBUG"
BSC32=bscmake.exe
# ADD BASE BSC32 /nologo
# ADD BSC32 /nologo /o"../Build/Zone/Zone.bsc"
LINK32=link.exe
# ADD BASE LINK32 kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib odbc32.lib odbccp32.lib kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib odbc32.lib odbccp32.lib /nologo /subsystem:console /machine:I386
# ADD LINK32 kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib odbc32.lib odbccp32.lib kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib odbc32.lib odbccp32.lib wsock32.lib zlib.lib mysqlclient.lib /nologo /subsystem:console /map:"../Build/Zone.map" /debug /machine:I386 /nodefaultlib:"libc" /libpath:"c:\mysql\lib\opt" /libpath:"c:\eqemu\lib"
# SUBTRACT LINK32 /pdb:none

!ELSEIF  "$(CFG)" == "Zone - Win32 DebugPerl"

# PROP BASE Use_MFC 0
# PROP BASE Use_Debug_Libraries 1
# PROP BASE Output_Dir "Zone___Win32_DebugPerl"
# PROP BASE Intermediate_Dir "Zone___Win32_DebugPerl"
# PROP BASE Ignore_Export_Lib 0
# PROP BASE Target_Dir ""
# PROP Use_MFC 0
# PROP Use_Debug_Libraries 1
# PROP Output_Dir "..\Build"
# PROP Intermediate_Dir "..\Build\ZonePerl"
# PROP Ignore_Export_Lib 0
# PROP Target_Dir ""
# ADD BASE CPP /nologo /MTd /Gm /GX /Zi /Od /D "i386" /D "SHAREMEM" /D _WIN32_WINNT=0x0400 /D "_EQDEBUG" /D "ZONE" /D "INVERSEXY" /D "WIN32" /D "_CONSOLE" /D "_MBCS" /D "EQDEBUG" /D "FIELD_ITEMS" /FR /FD /GZ /c
# SUBTRACT BASE CPP /YX
# ADD CPP /nologo /MTd /Gm /GX /Zi /Od /I "C:\perl\lib\core" /I "c:\mysql\include" /I "c:\eqemu\include" /D "EMBPERL" /D "EMBPERL_PLUGIN" /D "i386" /D "SHAREMEM" /D _WIN32_WINNT=0x0400 /D "ZONE" /D "INVERSEXY" /D "WIN32" /D "_CONSOLE" /D "_MBCS" /D "EQDEBUG" /D "FIELD_ITEMS" /FR /FD /GZ /c
# SUBTRACT CPP /YX
# ADD BASE RSC /l 0x409 /d "_DEBUG"
# ADD RSC /l 0x409 /d "_DEBUG"
BSC32=bscmake.exe
# ADD BASE BSC32 /nologo
# ADD BSC32 /nologo
LINK32=link.exe
# ADD BASE LINK32 kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib odbc32.lib odbccp32.lib kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib odbc32.lib odbccp32.lib wsock32.lib zlib.lib mysqlclient.lib /nologo /subsystem:console /debug /machine:I386 /nodefaultlib:"LIBCMT" /nodefaultlib:"LIBC" /out:"../build/ZoneDebug.exe" /pdbtype:sept
# SUBTRACT BASE LINK32 /pdb:none
# ADD LINK32 perl58.lib kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib odbc32.lib odbccp32.lib kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib odbc32.lib odbccp32.lib wsock32.lib zlib.lib mysqlclient.lib /nologo /subsystem:console /debug /machine:I386 /nodefaultlib:"LIBCMT" /nodefaultlib:"LIBC" /out:"../build/ZoneDebugPerl.exe" /pdbtype:sept /libpath:"C:\perl\lib\core" /libpath:"c:\mysql\lib\opt" /libpath:"c:\eqemu\lib"
# SUBTRACT LINK32 /pdb:none

!ELSEIF  "$(CFG)" == "Zone - Win32 ReleasePerl"

# PROP BASE Use_MFC 0
# PROP BASE Use_Debug_Libraries 1
# PROP BASE Output_Dir "Zone___Win32_ReleasePerl"
# PROP BASE Intermediate_Dir "Zone___Win32_ReleasePerl"
# PROP BASE Ignore_Export_Lib 0
# PROP BASE Target_Dir ""
# PROP Use_MFC 0
# PROP Use_Debug_Libraries 1
# PROP Output_Dir "Zone___Win32_ReleasePerl"
# PROP Intermediate_Dir "Zone___Win32_ReleasePerl"
# PROP Ignore_Export_Lib 0
# PROP Target_Dir ""
# ADD BASE CPP /nologo /MTd /Gm /GX /Zi /Od /I "C:\perl\lib\core" /I "c:\mysql\include" /I "c:\eqemu\include" /D "EMBPERL" /D "EMBPERL_PLUGIN" /D "i386" /D "SHAREMEM" /D _WIN32_WINNT=0x0400 /D "ZONE" /D "INVERSEXY" /D "WIN32" /D "_CONSOLE" /D "_MBCS" /D "EQDEBUG" /D "FIELD_ITEMS" /FR /FD /GZ /c
# SUBTRACT BASE CPP /YX
# ADD CPP /nologo /MD /Gm /GX /Zi /O2 /Ob2 /I "C:\perl\lib\core" /I "c:\mysql\include" /I "c:\eqemu\include" /D "EMBPERL" /D "EMBPERL_PLUGIN" /D "i386" /D "SHAREMEM" /D _WIN32_WINNT=0x0400 /D "ZONE" /D "INVERSEXY" /D "WIN32" /D "_CONSOLE" /D "_MBCS" /D "EQDEBUG" /D "FIELD_ITEMS" /FD /c
# ADD BASE RSC /l 0x409 /d "_DEBUG"
# ADD RSC /l 0x409 /d "_DEBUG"
BSC32=bscmake.exe
# ADD BASE BSC32 /nologo
# ADD BSC32 /nologo
LINK32=link.exe
# ADD BASE LINK32 kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib odbc32.lib odbccp32.lib kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib odbc32.lib odbccp32.lib wsock32.lib zlib.lib mysqlclient.lib /nologo /subsystem:console /debug /machine:I386 /nodefaultlib:"LIBCMT" /nodefaultlib:"LIBC" /out:"../build/ZonePerl.exe" /pdbtype:sept /libpath:"C:\perl\lib\core" /libpath:"c:\mysql\lib\opt" /libpath:"c:\eqemu\lib"
# SUBTRACT BASE LINK32 /pdb:none
# ADD LINK32 perl58.lib msvcrt.lib kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib odbc32.lib odbccp32.lib kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib odbc32.lib odbccp32.lib wsock32.lib zlib.lib mysqlclient.lib /nologo /subsystem:console /pdb:none /debug /machine:I386 /nodefaultlib:"LIBCMT" /out:"../build/ZonePerl.exe" /libpath:"C:\perl\lib\core" /libpath:"c:\mysql\lib\opt" /libpath:"c:\eqemu\lib"

!ENDIF 

# Begin Target

# Name "Zone - Win32 Release"
# Name "Zone - Win32 Debug"
# Name "Zone - Win32 Raid Addicts"
# Name "Zone - Win32 DebugPerl"
# Name "Zone - Win32 ReleasePerl"
# Begin Group "Source Files"

# PROP Default_Filter "cpp;c;cxx;rc;def;r;odl;idl;hpj;bat"
# Begin Source File

SOURCE=.\AA.cpp
# End Source File
# Begin Source File

SOURCE=.\aggro.cpp
# End Source File
# Begin Source File

SOURCE=.\attack.cpp
# End Source File
# Begin Source File

SOURCE=.\beacon.cpp
# End Source File
# Begin Source File

SOURCE=.\bonuses.cpp
# End Source File
# Begin Source File

SOURCE=.\client.cpp
# End Source File
# Begin Source File

SOURCE=.\client_logs.cpp
# End Source File
# Begin Source File

SOURCE=.\client_mods.cpp
# End Source File
# Begin Source File

SOURCE=.\client_packet.cpp
# End Source File
# Begin Source File

SOURCE=.\client_process.cpp
# End Source File
# Begin Source File

SOURCE=.\command.cpp
# End Source File
# Begin Source File

SOURCE=.\doors.cpp
# End Source File
# Begin Source File

SOURCE=.\effects.cpp
# End Source File
# Begin Source File

SOURCE=.\embparser.cpp
# End Source File
# Begin Source File

SOURCE=.\embperl.cpp
# End Source File
# Begin Source File

SOURCE=.\embxs.cpp
# End Source File
# Begin Source File

SOURCE=.\entity.cpp
# End Source File
# Begin Source File

SOURCE=..\common\EQEMuError.cpp
# End Source File
# Begin Source File

SOURCE=.\exp.cpp
# End Source File
# Begin Source File

SOURCE=.\faction.cpp
# End Source File
# Begin Source File

SOURCE=.\fearpath.cpp
# End Source File
# Begin Source File

SOURCE=.\forage.cpp
# End Source File
# Begin Source File

SOURCE=.\groups.cpp
# End Source File
# Begin Source File

SOURCE=.\guild.cpp
# End Source File
# Begin Source File

SOURCE=.\guild_mgr.cpp
# End Source File
# Begin Source File

SOURCE=.\hate_list.cpp
# End Source File
# Begin Source File

SOURCE=.\horse.cpp
# End Source File
# Begin Source File

SOURCE=.\inventory.cpp
# End Source File
# Begin Source File

SOURCE=.\loottables.cpp
# End Source File
# Begin Source File

SOURCE=.\Map.cpp
# End Source File
# Begin Source File

SOURCE=.\watermap.cpp
# End Source File
# Begin Source File

SOURCE=.\mob.cpp
# End Source File
# Begin Source File

SOURCE=.\MobAI.cpp
# End Source File
# Begin Source File

SOURCE=.\net.cpp
# End Source File
# Begin Source File

SOURCE=.\npc.cpp
# End Source File
# Begin Source File

SOURCE=.\Object.cpp
# End Source File
# Begin Source File

SOURCE=.\parser.cpp
# End Source File
# Begin Source File

SOURCE=.\pathing.cpp
# End Source File
# Begin Source File

SOURCE=.\perl_client.cpp
# End Source File
# Begin Source File

SOURCE=.\perl_entity.cpp
# End Source File
# Begin Source File

SOURCE=.\perl_groups.cpp
# End Source File
# Begin Source File

SOURCE=.\perl_mob.cpp
# End Source File
# Begin Source File

SOURCE=.\perl_npc.cpp
# End Source File
# Begin Source File

SOURCE=.\perl_perlpacket.cpp
# End Source File
# Begin Source File

SOURCE=.\perl_PlayerCorpse.cpp
# End Source File
# Begin Source File

SOURCE=.\perlpacket.cpp
# End Source File
# Begin Source File

SOURCE=.\perlparser.cpp
# End Source File
# Begin Source File

SOURCE=.\petitions.cpp
# End Source File
# Begin Source File

SOURCE=.\pets.cpp
# End Source File
# Begin Source File

SOURCE=.\PlayerCorpse.cpp
# End Source File
# Begin Source File

SOURCE=..\common\ptimer.cpp
# End Source File
# Begin Source File

SOURCE=.\questmgr.cpp
# End Source File
# Begin Source File

SOURCE=.\spawn2.cpp
# End Source File
# Begin Source File

SOURCE=.\spawngroup.cpp
# End Source File
# Begin Source File

SOURCE=.\spdat.cpp
# End Source File
# Begin Source File

SOURCE=.\special_attacks.cpp
# End Source File
# Begin Source File

SOURCE=.\spell_effects.cpp
# End Source File
# Begin Source File

SOURCE=.\spells.cpp
# End Source File
# Begin Source File

SOURCE=.\titles.cpp
# End Source File
# Begin Source File

SOURCE=.\tradeskills.cpp
# End Source File
# Begin Source File

SOURCE=.\trading.cpp
# End Source File
# Begin Source File

SOURCE=.\trap.cpp
# End Source File
# Begin Source File

SOURCE=.\tribute.cpp
# End Source File
# Begin Source File

SOURCE=.\waypoints.cpp
# End Source File
# Begin Source File

SOURCE=.\worldserver.cpp
# End Source File
# Begin Source File

SOURCE=.\zone.cpp
# End Source File
# Begin Source File

SOURCE=.\zone_logsys.cpp
# End Source File
# Begin Source File

SOURCE=.\ZoneConfig.cpp
# End Source File
# Begin Source File

SOURCE=.\zonedb.cpp
# End Source File
# Begin Source File

SOURCE=.\zonedbasync.cpp
# End Source File
# Begin Source File

SOURCE=.\zoning.cpp
# End Source File
# End Group
# Begin Group "Header Files"

# PROP Default_Filter "h;hpp;hxx;hm;inl"
# Begin Source File

SOURCE=.\beacon.h
# End Source File
# Begin Source File

SOURCE=.\client.h
# End Source File
# Begin Source File

SOURCE=.\command.h
# End Source File
# Begin Source File

SOURCE=.\doors.h
# End Source File
# Begin Source File

SOURCE=.\entity.h
# End Source File
# Begin Source File

SOURCE=..\common\EQEMuError.h
# End Source File
# Begin Source File

SOURCE=.\event_codes.h
# End Source File
# Begin Source File

SOURCE=.\faction.h
# End Source File
# Begin Source File

SOURCE=.\features.h
# End Source File
# Begin Source File

SOURCE=..\common\files.h
# End Source File
# Begin Source File

SOURCE=.\Forage.h
# End Source File
# Begin Source File

SOURCE=.\groups.h
# End Source File
# Begin Source File

SOURCE=.\hate_list.h
# End Source File
# Begin Source File

SOURCE=.\loottable.h
# End Source File
# Begin Source File

SOURCE=.\map.h
# End Source File
# Begin Source File

SOURCE=.\mob.h
# End Source File
# Begin Source File

SOURCE=.\net.h
# End Source File
# Begin Source File

SOURCE=.\npc.h
# End Source File
# Begin Source File

SOURCE=.\NpcAI.h
# End Source File
# Begin Source File

SOURCE=.\object.h
# End Source File
# Begin Source File

SOURCE=.\parser.h
# End Source File
# Begin Source File

SOURCE=.\petitions.h
# End Source File
# Begin Source File

SOURCE=.\PlayerCorpse.h
# End Source File
# Begin Source File

SOURCE=.\skills.h
# End Source File
# Begin Source File

SOURCE=.\spawn2.h
# End Source File
# Begin Source File

SOURCE=.\spawngroup.h
# End Source File
# Begin Source File

SOURCE=.\spdat.h
# End Source File
# Begin Source File

SOURCE=.\trap.h
# End Source File
# Begin Source File

SOURCE=.\worldserver.h
# End Source File
# Begin Source File

SOURCE=.\zone.h
# End Source File
# Begin Source File

SOURCE=.\zonedbasync.h
# End Source File
# Begin Source File

SOURCE=.\zonedump.h
# End Source File
# End Group
# Begin Group "Common Header Files"

# PROP Default_Filter ""
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

SOURCE=..\common\deity.h
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

SOURCE=..\common\EQNetwork.h
# End Source File
# Begin Source File

SOURCE=..\common\EQOpcodes.h
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

SOURCE=..\common\eqtime.h
# End Source File
# Begin Source File

SOURCE=..\common\Item.h
# End Source File
# Begin Source File

SOURCE="..\common\Kaiyodo-LList.h"
# End Source File
# Begin Source File

SOURCE=..\common\linked_list.h
# End Source File
# Begin Source File

SOURCE=..\common\logsys.h
# End Source File
# Begin Source File

SOURCE=..\common\logtypes.h
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

SOURCE=..\common\unix.h

!IF  "$(CFG)" == "Zone - Win32 Release"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "Zone - Win32 Debug"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "Zone - Win32 Raid Addicts"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "Zone - Win32 DebugPerl"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "Zone - Win32 ReleasePerl"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ENDIF 

# End Source File
# Begin Source File

SOURCE=..\common\version.h
# End Source File
# End Group
# Begin Group "Common Source Files"

# PROP Default_Filter ""
# Begin Source File

SOURCE=..\common\BasePacket.cpp
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

!IF  "$(CFG)" == "Zone - Win32 Release"

!ELSEIF  "$(CFG)" == "Zone - Win32 Debug"

# ADD CPP /Gd /Gm /YX

!ELSEIF  "$(CFG)" == "Zone - Win32 Raid Addicts"

!ELSEIF  "$(CFG)" == "Zone - Win32 DebugPerl"

# ADD BASE CPP /Gd /Gm /YX
# ADD CPP /Gd /Gm /YX

!ELSEIF  "$(CFG)" == "Zone - Win32 ReleasePerl"

# ADD BASE CPP /Gd /Gm /YX
# ADD CPP /Gd /Gm /YX

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

SOURCE=..\common\EQEmuConfig.cpp
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

SOURCE=..\common\guild_base.cpp
# End Source File
# Begin Source File

SOURCE=..\common\guilds.cpp
# End Source File
# Begin Source File

SOURCE=..\common\Item.cpp
# End Source File
# Begin Source File

SOURCE=..\common\rulesys.cpp
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

!IF  "$(CFG)" == "Zone - Win32 Release"

!ELSEIF  "$(CFG)" == "Zone - Win32 Debug"

# ADD CPP /w /W0

!ELSEIF  "$(CFG)" == "Zone - Win32 Raid Addicts"

!ELSEIF  "$(CFG)" == "Zone - Win32 DebugPerl"

# ADD BASE CPP /w /W0
# ADD CPP /w /W0

!ELSEIF  "$(CFG)" == "Zone - Win32 ReleasePerl"

# ADD BASE CPP /w /W0
# ADD CPP /w /W0

!ENDIF 

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

SOURCE=..\common\races.cpp
# End Source File
# Begin Source File

SOURCE=..\common\rdtsc.cpp
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

SOURCE=..\common\unix.cpp

!IF  "$(CFG)" == "Zone - Win32 Release"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "Zone - Win32 Debug"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "Zone - Win32 Raid Addicts"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "Zone - Win32 DebugPerl"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "Zone - Win32 ReleasePerl"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ENDIF 

# End Source File
# Begin Source File

SOURCE=..\common\worldconn.cpp
# End Source File
# Begin Source File

SOURCE=..\common\XMLParser.cpp
# End Source File
# End Group
# Begin Group "Text Files"

# PROP Default_Filter ""
# Begin Source File

SOURCE=..\readme.txt

!IF  "$(CFG)" == "Zone - Win32 Release"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "Zone - Win32 Debug"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "Zone - Win32 Raid Addicts"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "Zone - Win32 DebugPerl"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "Zone - Win32 ReleasePerl"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ENDIF 

# End Source File
# End Group
# Begin Group "Patches"

# PROP Default_Filter ""
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

SOURCE=..\common\patches\Live.cpp
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
