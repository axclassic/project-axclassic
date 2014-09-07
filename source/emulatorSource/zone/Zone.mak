# Microsoft Developer Studio Generated NMAKE File, Based on Zone.dsp
!IF "$(CFG)" == ""
CFG=Zone - Win32 ReleasePerl
!MESSAGE No configuration specified. Defaulting to Zone - Win32 ReleasePerl.
!ENDIF 

!IF "$(CFG)" != "Zone - Win32 Release" && "$(CFG)" != "Zone - Win32 Debug" && "$(CFG)" != "Zone - Win32 Raid Addicts" && "$(CFG)" != "Zone - Win32 DebugPerl" && "$(CFG)" != "Zone - Win32 ReleasePerl"
!MESSAGE Invalid configuration "$(CFG)" specified.
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
!ERROR An invalid configuration is specified.
!ENDIF 

!IF "$(OS)" == "Windows_NT"
NULL=
!ELSE 
NULL=nul
!ENDIF 

!IF  "$(CFG)" == "Zone - Win32 Release"

OUTDIR=.\../Build
INTDIR=.\../Build/Zone/Release
# Begin Custom Macros
OutDir=.\../Build/
# End Custom Macros

ALL : "$(OUTDIR)\Zone.exe"


CLEAN :
	-@erase "$(INTDIR)\AA.obj"
	-@erase "$(INTDIR)\aggro.obj"
	-@erase "$(INTDIR)\attack.obj"
	-@erase "$(INTDIR)\beacon.obj"
	-@erase "$(INTDIR)\bonuses.obj"
	-@erase "$(INTDIR)\classes.obj"
	-@erase "$(INTDIR)\client.obj"
	-@erase "$(INTDIR)\client_logs.obj"
	-@erase "$(INTDIR)\client_mods.obj"
	-@erase "$(INTDIR)\client_packet.obj"
	-@erase "$(INTDIR)\client_process.obj"
	-@erase "$(INTDIR)\command.obj"
	-@erase "$(INTDIR)\Condition.obj"
	-@erase "$(INTDIR)\CRC16.obj"
	-@erase "$(INTDIR)\crc32.obj"
	-@erase "$(INTDIR)\database.obj"
	-@erase "$(INTDIR)\dbasync.obj"
	-@erase "$(INTDIR)\dbcore.obj"
	-@erase "$(INTDIR)\DBMemLeak.obj"
	-@erase "$(INTDIR)\debug.obj"
	-@erase "$(INTDIR)\doors.obj"
	-@erase "$(INTDIR)\effects.obj"
	-@erase "$(INTDIR)\embparser.obj"
	-@erase "$(INTDIR)\embperl.obj"
	-@erase "$(INTDIR)\embxs.obj"
	-@erase "$(INTDIR)\emu_opcodes.obj"
	-@erase "$(INTDIR)\EMuShareMem.obj"
	-@erase "$(INTDIR)\entity.obj"
	-@erase "$(INTDIR)\EQChatPacket.obj"
	-@erase "$(INTDIR)\EQEMuError.obj"
	-@erase "$(INTDIR)\EQLoginPacket.obj"
	-@erase "$(INTDIR)\EQMailPacket.obj"
	-@erase "$(INTDIR)\EQPacket.obj"
	-@erase "$(INTDIR)\EQStream.obj"
	-@erase "$(INTDIR)\EQStreamFactory.obj"
	-@erase "$(INTDIR)\eqtime.obj"
	-@erase "$(INTDIR)\EQWorldPacket.obj"
	-@erase "$(INTDIR)\EQZonePacket.obj"
	-@erase "$(INTDIR)\exp.obj"
	-@erase "$(INTDIR)\extprofile.obj"
	-@erase "$(INTDIR)\faction.obj"
	-@erase "$(INTDIR)\fearpath.obj"
	-@erase "$(INTDIR)\forage.obj"
	-@erase "$(INTDIR)\groups.obj"
	-@erase "$(INTDIR)\guilds.obj"
	-@erase "$(INTDIR)\hate_list.obj"
	-@erase "$(INTDIR)\horse.obj"
	-@erase "$(INTDIR)\inventory.obj"
	-@erase "$(INTDIR)\Item.obj"
	-@erase "$(INTDIR)\logsys.obj"
	-@erase "$(INTDIR)\loottables.obj"
	-@erase "$(INTDIR)\Map.obj"
	-@erase "$(INTDIR)\md5.obj"
	-@erase "$(INTDIR)\misc.obj"
	-@erase "$(INTDIR)\MiscFunctions.obj"
	-@erase "$(INTDIR)\mob.obj"
	-@erase "$(INTDIR)\MobAI.obj"
	-@erase "$(INTDIR)\moremath.obj"
	-@erase "$(INTDIR)\Mutex.obj"
	-@erase "$(INTDIR)\net.obj"
	-@erase "$(INTDIR)\npc.obj"
	-@erase "$(INTDIR)\Object.obj"
	-@erase "$(INTDIR)\opcodemgr.obj"
	-@erase "$(INTDIR)\packet_dump.obj"
	-@erase "$(INTDIR)\packet_dump_file.obj"
	-@erase "$(INTDIR)\packet_functions.obj"
	-@erase "$(INTDIR)\parser.obj"
	-@erase "$(INTDIR)\pathing.obj"
	-@erase "$(INTDIR)\perl_client.obj"
	-@erase "$(INTDIR)\perl_entity.obj"
	-@erase "$(INTDIR)\perl_groups.obj"
	-@erase "$(INTDIR)\perl_mob.obj"
	-@erase "$(INTDIR)\perl_npc.obj"
	-@erase "$(INTDIR)\perl_perlpacket.obj"
	-@erase "$(INTDIR)\perl_PlayerCorpse.obj"
	-@erase "$(INTDIR)\perlpacket.obj"
	-@erase "$(INTDIR)\perlparser.obj"
	-@erase "$(INTDIR)\petitions.obj"
	-@erase "$(INTDIR)\pets.obj"
	-@erase "$(INTDIR)\PlayerCorpse.obj"
	-@erase "$(INTDIR)\ptimer.obj"
	-@erase "$(INTDIR)\questmgr.obj"
	-@erase "$(INTDIR)\races.obj"
	-@erase "$(INTDIR)\rdtsc.obj"
	-@erase "$(INTDIR)\serverinfo.obj"
	-@erase "$(INTDIR)\SharedLibrary.obj"
	-@erase "$(INTDIR)\spawn2.obj"
	-@erase "$(INTDIR)\spawngroup.obj"
	-@erase "$(INTDIR)\spdat.obj"
	-@erase "$(INTDIR)\special_attacks.obj"
	-@erase "$(INTDIR)\spell_effects.obj"
	-@erase "$(INTDIR)\spells.obj"
	-@erase "$(INTDIR)\TCPConnection.obj"
	-@erase "$(INTDIR)\timeoutmgr.obj"
	-@erase "$(INTDIR)\timer.obj"
	-@erase "$(INTDIR)\titles.obj"
	-@erase "$(INTDIR)\tradeskills.obj"
	-@erase "$(INTDIR)\trading.obj"
	-@erase "$(INTDIR)\trap.obj"
	-@erase "$(INTDIR)\tribute.obj"
	-@erase "$(INTDIR)\vc60.idb"
	-@erase "$(INTDIR)\vc60.pdb"
	-@erase "$(INTDIR)\waypoints.obj"
	-@erase "$(INTDIR)\worldserver.obj"
	-@erase "$(INTDIR)\zone.obj"
	-@erase "$(INTDIR)\zonedbasync.obj"
	-@erase "$(INTDIR)\zoning.obj"
	-@erase "$(OUTDIR)\Zone.exe"

"$(OUTDIR)" :
    if not exist "$(OUTDIR)/$(NULL)" mkdir "$(OUTDIR)"

"$(INTDIR)" :
    if not exist "$(INTDIR)/$(NULL)" mkdir "$(INTDIR)"

CPP=cl.exe
CPP_PROJ=/nologo /MT /w /W0 /Gm /GX /Zi /O2 /Ob2 /I "c:\mysql\include" /I "c:\eqemu\include" /D "i386" /D "SHAREMEM" /D _WIN32_WINNT=0x0400 /D "ZONE" /D "INVERSEXY" /D "WIN32" /D "_CONSOLE" /D "_MBCS" /D EQDEBUG=0 /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\" /FD /c 

.c{$(INTDIR)}.obj::
   $(CPP) @<<
   $(CPP_PROJ) $< 
<<

.cpp{$(INTDIR)}.obj::
   $(CPP) @<<
   $(CPP_PROJ) $< 
<<

.cxx{$(INTDIR)}.obj::
   $(CPP) @<<
   $(CPP_PROJ) $< 
<<

.c{$(INTDIR)}.sbr::
   $(CPP) @<<
   $(CPP_PROJ) $< 
<<

.cpp{$(INTDIR)}.sbr::
   $(CPP) @<<
   $(CPP_PROJ) $< 
<<

.cxx{$(INTDIR)}.sbr::
   $(CPP) @<<
   $(CPP_PROJ) $< 
<<

RSC=rc.exe
BSC32=bscmake.exe
BSC32_FLAGS=/nologo /o"$(OUTDIR)\Zone\Zone.bsc" 
BSC32_SBRS= \
	
LINK32=link.exe
LINK32_FLAGS=libcmt.lib kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib odbc32.lib odbccp32.lib kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib odbc32.lib odbccp32.lib wsock32.lib zlib.lib mysqlclient.lib /nologo /subsystem:console /pdb:none /debug /machine:I386 /out:"$(OUTDIR)\Zone.exe" /libpath:"c:\mysql\lib\opt" /libpath:"c:\eqemu\lib" 
LINK32_OBJS= \
	"$(INTDIR)\AA.obj" \
	"$(INTDIR)\aggro.obj" \
	"$(INTDIR)\attack.obj" \
	"$(INTDIR)\beacon.obj" \
	"$(INTDIR)\bonuses.obj" \
	"$(INTDIR)\client.obj" \
	"$(INTDIR)\client_logs.obj" \
	"$(INTDIR)\client_mods.obj" \
	"$(INTDIR)\client_packet.obj" \
	"$(INTDIR)\client_process.obj" \
	"$(INTDIR)\command.obj" \
	"$(INTDIR)\doors.obj" \
	"$(INTDIR)\effects.obj" \
	"$(INTDIR)\embparser.obj" \
	"$(INTDIR)\embperl.obj" \
	"$(INTDIR)\embxs.obj" \
	"$(INTDIR)\entity.obj" \
	"$(INTDIR)\EQEMuError.obj" \
	"$(INTDIR)\exp.obj" \
	"$(INTDIR)\faction.obj" \
	"$(INTDIR)\fearpath.obj" \
	"$(INTDIR)\forage.obj" \
	"$(INTDIR)\groups.obj" \
	"$(INTDIR)\guilds.obj" \
	"$(INTDIR)\hate_list.obj" \
	"$(INTDIR)\horse.obj" \
	"$(INTDIR)\inventory.obj" \
	"$(INTDIR)\loottables.obj" \
	"$(INTDIR)\Map.obj" \
	"$(INTDIR)\mob.obj" \
	"$(INTDIR)\MobAI.obj" \
	"$(INTDIR)\net.obj" \
	"$(INTDIR)\npc.obj" \
	"$(INTDIR)\Object.obj" \
	"$(INTDIR)\parser.obj" \
	"$(INTDIR)\pathing.obj" \
	"$(INTDIR)\perl_client.obj" \
	"$(INTDIR)\perl_entity.obj" \
	"$(INTDIR)\perl_groups.obj" \
	"$(INTDIR)\perl_mob.obj" \
	"$(INTDIR)\perl_npc.obj" \
	"$(INTDIR)\perl_perlpacket.obj" \
	"$(INTDIR)\perl_PlayerCorpse.obj" \
	"$(INTDIR)\perlpacket.obj" \
	"$(INTDIR)\perlparser.obj" \
	"$(INTDIR)\petitions.obj" \
	"$(INTDIR)\pets.obj" \
	"$(INTDIR)\PlayerCorpse.obj" \
	"$(INTDIR)\ptimer.obj" \
	"$(INTDIR)\questmgr.obj" \
	"$(INTDIR)\spawn2.obj" \
	"$(INTDIR)\spawngroup.obj" \
	"$(INTDIR)\spdat.obj" \
	"$(INTDIR)\special_attacks.obj" \
	"$(INTDIR)\spell_effects.obj" \
	"$(INTDIR)\spells.obj" \
	"$(INTDIR)\titles.obj" \
	"$(INTDIR)\tradeskills.obj" \
	"$(INTDIR)\trading.obj" \
	"$(INTDIR)\trap.obj" \
	"$(INTDIR)\tribute.obj" \
	"$(INTDIR)\waypoints.obj" \
	"$(INTDIR)\worldserver.obj" \
	"$(INTDIR)\zone.obj" \
	"$(INTDIR)\zonedbasync.obj" \
	"$(INTDIR)\zoning.obj" \
	"$(INTDIR)\classes.obj" \
	"$(INTDIR)\Condition.obj" \
	"$(INTDIR)\CRC16.obj" \
	"$(INTDIR)\crc32.obj" \
	"$(INTDIR)\database.obj" \
	"$(INTDIR)\dbasync.obj" \
	"$(INTDIR)\dbcore.obj" \
	"$(INTDIR)\DBMemLeak.obj" \
	"$(INTDIR)\debug.obj" \
	"$(INTDIR)\emu_opcodes.obj" \
	"$(INTDIR)\EMuShareMem.obj" \
	"$(INTDIR)\EQChatPacket.obj" \
	"$(INTDIR)\EQLoginPacket.obj" \
	"$(INTDIR)\EQMailPacket.obj" \
	"$(INTDIR)\EQPacket.obj" \
	"$(INTDIR)\EQStream.obj" \
	"$(INTDIR)\EQStreamFactory.obj" \
	"$(INTDIR)\eqtime.obj" \
	"$(INTDIR)\EQWorldPacket.obj" \
	"$(INTDIR)\EQZonePacket.obj" \
	"$(INTDIR)\extprofile.obj" \
	"$(INTDIR)\Item.obj" \
	"$(INTDIR)\logsys.obj" \
	"$(INTDIR)\md5.obj" \
	"$(INTDIR)\misc.obj" \
	"$(INTDIR)\MiscFunctions.obj" \
	"$(INTDIR)\moremath.obj" \
	"$(INTDIR)\Mutex.obj" \
	"$(INTDIR)\opcodemgr.obj" \
	"$(INTDIR)\packet_dump.obj" \
	"$(INTDIR)\packet_dump_file.obj" \
	"$(INTDIR)\packet_functions.obj" \
	"$(INTDIR)\races.obj" \
	"$(INTDIR)\rdtsc.obj" \
	"$(INTDIR)\serverinfo.obj" \
	"$(INTDIR)\SharedLibrary.obj" \
	"$(INTDIR)\TCPConnection.obj" \
	"$(INTDIR)\timeoutmgr.obj" \
	"$(INTDIR)\timer.obj"

"$(OUTDIR)\Zone.exe" : "$(OUTDIR)" $(DEF_FILE) $(LINK32_OBJS)
    $(LINK32) @<<
  $(LINK32_FLAGS) $(LINK32_OBJS)
<<

!ELSEIF  "$(CFG)" == "Zone - Win32 Debug"

OUTDIR=.\../build
INTDIR=.\../Build/Zone/Debug
# Begin Custom Macros
OutDir=.\../build/
# End Custom Macros

ALL : "$(OUTDIR)\ZoneDebug.exe" "$(OUTDIR)\Zone.bsc"


CLEAN :
	-@erase "$(INTDIR)\AA.obj"
	-@erase "$(INTDIR)\AA.sbr"
	-@erase "$(INTDIR)\aggro.obj"
	-@erase "$(INTDIR)\aggro.sbr"
	-@erase "$(INTDIR)\attack.obj"
	-@erase "$(INTDIR)\attack.sbr"
	-@erase "$(INTDIR)\beacon.obj"
	-@erase "$(INTDIR)\beacon.sbr"
	-@erase "$(INTDIR)\bonuses.obj"
	-@erase "$(INTDIR)\bonuses.sbr"
	-@erase "$(INTDIR)\classes.obj"
	-@erase "$(INTDIR)\classes.sbr"
	-@erase "$(INTDIR)\client.obj"
	-@erase "$(INTDIR)\client.sbr"
	-@erase "$(INTDIR)\client_logs.obj"
	-@erase "$(INTDIR)\client_logs.sbr"
	-@erase "$(INTDIR)\client_mods.obj"
	-@erase "$(INTDIR)\client_mods.sbr"
	-@erase "$(INTDIR)\client_packet.obj"
	-@erase "$(INTDIR)\client_packet.sbr"
	-@erase "$(INTDIR)\client_process.obj"
	-@erase "$(INTDIR)\client_process.sbr"
	-@erase "$(INTDIR)\command.obj"
	-@erase "$(INTDIR)\command.sbr"
	-@erase "$(INTDIR)\Condition.obj"
	-@erase "$(INTDIR)\Condition.sbr"
	-@erase "$(INTDIR)\CRC16.obj"
	-@erase "$(INTDIR)\CRC16.sbr"
	-@erase "$(INTDIR)\crc32.obj"
	-@erase "$(INTDIR)\crc32.sbr"
	-@erase "$(INTDIR)\database.obj"
	-@erase "$(INTDIR)\database.sbr"
	-@erase "$(INTDIR)\dbasync.obj"
	-@erase "$(INTDIR)\dbasync.sbr"
	-@erase "$(INTDIR)\dbcore.obj"
	-@erase "$(INTDIR)\dbcore.sbr"
	-@erase "$(INTDIR)\DBMemLeak.obj"
	-@erase "$(INTDIR)\DBMemLeak.sbr"
	-@erase "$(INTDIR)\debug.obj"
	-@erase "$(INTDIR)\debug.sbr"
	-@erase "$(INTDIR)\doors.obj"
	-@erase "$(INTDIR)\doors.sbr"
	-@erase "$(INTDIR)\effects.obj"
	-@erase "$(INTDIR)\effects.sbr"
	-@erase "$(INTDIR)\embparser.obj"
	-@erase "$(INTDIR)\embparser.sbr"
	-@erase "$(INTDIR)\embperl.obj"
	-@erase "$(INTDIR)\embperl.sbr"
	-@erase "$(INTDIR)\embxs.obj"
	-@erase "$(INTDIR)\embxs.sbr"
	-@erase "$(INTDIR)\emu_opcodes.obj"
	-@erase "$(INTDIR)\emu_opcodes.sbr"
	-@erase "$(INTDIR)\EMuShareMem.obj"
	-@erase "$(INTDIR)\EMuShareMem.sbr"
	-@erase "$(INTDIR)\entity.obj"
	-@erase "$(INTDIR)\entity.sbr"
	-@erase "$(INTDIR)\EQChatPacket.obj"
	-@erase "$(INTDIR)\EQChatPacket.sbr"
	-@erase "$(INTDIR)\EQEMuError.obj"
	-@erase "$(INTDIR)\EQEMuError.sbr"
	-@erase "$(INTDIR)\EQLoginPacket.obj"
	-@erase "$(INTDIR)\EQLoginPacket.sbr"
	-@erase "$(INTDIR)\EQMailPacket.obj"
	-@erase "$(INTDIR)\EQMailPacket.sbr"
	-@erase "$(INTDIR)\EQPacket.obj"
	-@erase "$(INTDIR)\EQPacket.sbr"
	-@erase "$(INTDIR)\EQStream.obj"
	-@erase "$(INTDIR)\EQStream.sbr"
	-@erase "$(INTDIR)\EQStreamFactory.obj"
	-@erase "$(INTDIR)\EQStreamFactory.sbr"
	-@erase "$(INTDIR)\eqtime.obj"
	-@erase "$(INTDIR)\eqtime.sbr"
	-@erase "$(INTDIR)\EQWorldPacket.obj"
	-@erase "$(INTDIR)\EQWorldPacket.sbr"
	-@erase "$(INTDIR)\EQZonePacket.obj"
	-@erase "$(INTDIR)\EQZonePacket.sbr"
	-@erase "$(INTDIR)\exp.obj"
	-@erase "$(INTDIR)\exp.sbr"
	-@erase "$(INTDIR)\extprofile.obj"
	-@erase "$(INTDIR)\extprofile.sbr"
	-@erase "$(INTDIR)\faction.obj"
	-@erase "$(INTDIR)\faction.sbr"
	-@erase "$(INTDIR)\fearpath.obj"
	-@erase "$(INTDIR)\fearpath.sbr"
	-@erase "$(INTDIR)\forage.obj"
	-@erase "$(INTDIR)\forage.sbr"
	-@erase "$(INTDIR)\groups.obj"
	-@erase "$(INTDIR)\groups.sbr"
	-@erase "$(INTDIR)\guilds.obj"
	-@erase "$(INTDIR)\guilds.sbr"
	-@erase "$(INTDIR)\hate_list.obj"
	-@erase "$(INTDIR)\hate_list.sbr"
	-@erase "$(INTDIR)\horse.obj"
	-@erase "$(INTDIR)\horse.sbr"
	-@erase "$(INTDIR)\inventory.obj"
	-@erase "$(INTDIR)\inventory.sbr"
	-@erase "$(INTDIR)\Item.obj"
	-@erase "$(INTDIR)\Item.sbr"
	-@erase "$(INTDIR)\logsys.obj"
	-@erase "$(INTDIR)\logsys.sbr"
	-@erase "$(INTDIR)\loottables.obj"
	-@erase "$(INTDIR)\loottables.sbr"
	-@erase "$(INTDIR)\Map.obj"
	-@erase "$(INTDIR)\Map.sbr"
	-@erase "$(INTDIR)\md5.obj"
	-@erase "$(INTDIR)\md5.sbr"
	-@erase "$(INTDIR)\misc.obj"
	-@erase "$(INTDIR)\misc.sbr"
	-@erase "$(INTDIR)\MiscFunctions.obj"
	-@erase "$(INTDIR)\MiscFunctions.sbr"
	-@erase "$(INTDIR)\mob.obj"
	-@erase "$(INTDIR)\mob.sbr"
	-@erase "$(INTDIR)\MobAI.obj"
	-@erase "$(INTDIR)\MobAI.sbr"
	-@erase "$(INTDIR)\moremath.obj"
	-@erase "$(INTDIR)\moremath.sbr"
	-@erase "$(INTDIR)\Mutex.obj"
	-@erase "$(INTDIR)\Mutex.sbr"
	-@erase "$(INTDIR)\net.obj"
	-@erase "$(INTDIR)\net.sbr"
	-@erase "$(INTDIR)\npc.obj"
	-@erase "$(INTDIR)\npc.sbr"
	-@erase "$(INTDIR)\Object.obj"
	-@erase "$(INTDIR)\Object.sbr"
	-@erase "$(INTDIR)\opcodemgr.obj"
	-@erase "$(INTDIR)\opcodemgr.sbr"
	-@erase "$(INTDIR)\packet_dump.obj"
	-@erase "$(INTDIR)\packet_dump.sbr"
	-@erase "$(INTDIR)\packet_dump_file.obj"
	-@erase "$(INTDIR)\packet_dump_file.sbr"
	-@erase "$(INTDIR)\packet_functions.obj"
	-@erase "$(INTDIR)\packet_functions.sbr"
	-@erase "$(INTDIR)\parser.obj"
	-@erase "$(INTDIR)\parser.sbr"
	-@erase "$(INTDIR)\pathing.obj"
	-@erase "$(INTDIR)\pathing.sbr"
	-@erase "$(INTDIR)\perl_client.obj"
	-@erase "$(INTDIR)\perl_client.sbr"
	-@erase "$(INTDIR)\perl_entity.obj"
	-@erase "$(INTDIR)\perl_entity.sbr"
	-@erase "$(INTDIR)\perl_groups.obj"
	-@erase "$(INTDIR)\perl_groups.sbr"
	-@erase "$(INTDIR)\perl_mob.obj"
	-@erase "$(INTDIR)\perl_mob.sbr"
	-@erase "$(INTDIR)\perl_npc.obj"
	-@erase "$(INTDIR)\perl_npc.sbr"
	-@erase "$(INTDIR)\perl_perlpacket.obj"
	-@erase "$(INTDIR)\perl_perlpacket.sbr"
	-@erase "$(INTDIR)\perl_PlayerCorpse.obj"
	-@erase "$(INTDIR)\perl_PlayerCorpse.sbr"
	-@erase "$(INTDIR)\perlpacket.obj"
	-@erase "$(INTDIR)\perlpacket.sbr"
	-@erase "$(INTDIR)\perlparser.obj"
	-@erase "$(INTDIR)\perlparser.sbr"
	-@erase "$(INTDIR)\petitions.obj"
	-@erase "$(INTDIR)\petitions.sbr"
	-@erase "$(INTDIR)\pets.obj"
	-@erase "$(INTDIR)\pets.sbr"
	-@erase "$(INTDIR)\PlayerCorpse.obj"
	-@erase "$(INTDIR)\PlayerCorpse.sbr"
	-@erase "$(INTDIR)\ptimer.obj"
	-@erase "$(INTDIR)\ptimer.sbr"
	-@erase "$(INTDIR)\questmgr.obj"
	-@erase "$(INTDIR)\questmgr.sbr"
	-@erase "$(INTDIR)\races.obj"
	-@erase "$(INTDIR)\races.sbr"
	-@erase "$(INTDIR)\rdtsc.obj"
	-@erase "$(INTDIR)\rdtsc.sbr"
	-@erase "$(INTDIR)\serverinfo.obj"
	-@erase "$(INTDIR)\serverinfo.sbr"
	-@erase "$(INTDIR)\SharedLibrary.obj"
	-@erase "$(INTDIR)\SharedLibrary.sbr"
	-@erase "$(INTDIR)\spawn2.obj"
	-@erase "$(INTDIR)\spawn2.sbr"
	-@erase "$(INTDIR)\spawngroup.obj"
	-@erase "$(INTDIR)\spawngroup.sbr"
	-@erase "$(INTDIR)\spdat.obj"
	-@erase "$(INTDIR)\spdat.sbr"
	-@erase "$(INTDIR)\special_attacks.obj"
	-@erase "$(INTDIR)\special_attacks.sbr"
	-@erase "$(INTDIR)\spell_effects.obj"
	-@erase "$(INTDIR)\spell_effects.sbr"
	-@erase "$(INTDIR)\spells.obj"
	-@erase "$(INTDIR)\spells.sbr"
	-@erase "$(INTDIR)\TCPConnection.obj"
	-@erase "$(INTDIR)\TCPConnection.sbr"
	-@erase "$(INTDIR)\timeoutmgr.obj"
	-@erase "$(INTDIR)\timeoutmgr.sbr"
	-@erase "$(INTDIR)\timer.obj"
	-@erase "$(INTDIR)\timer.sbr"
	-@erase "$(INTDIR)\titles.obj"
	-@erase "$(INTDIR)\titles.sbr"
	-@erase "$(INTDIR)\tradeskills.obj"
	-@erase "$(INTDIR)\tradeskills.sbr"
	-@erase "$(INTDIR)\trading.obj"
	-@erase "$(INTDIR)\trading.sbr"
	-@erase "$(INTDIR)\trap.obj"
	-@erase "$(INTDIR)\trap.sbr"
	-@erase "$(INTDIR)\tribute.obj"
	-@erase "$(INTDIR)\tribute.sbr"
	-@erase "$(INTDIR)\vc60.idb"
	-@erase "$(INTDIR)\vc60.pdb"
	-@erase "$(INTDIR)\waypoints.obj"
	-@erase "$(INTDIR)\waypoints.sbr"
	-@erase "$(INTDIR)\worldserver.obj"
	-@erase "$(INTDIR)\worldserver.sbr"
	-@erase "$(INTDIR)\zone.obj"
	-@erase "$(INTDIR)\zone.sbr"
	-@erase "$(INTDIR)\zonedbasync.obj"
	-@erase "$(INTDIR)\zonedbasync.sbr"
	-@erase "$(INTDIR)\zoning.obj"
	-@erase "$(INTDIR)\zoning.sbr"
	-@erase "$(OUTDIR)\Zone.bsc"
	-@erase "$(OUTDIR)\ZoneDebug.exe"
	-@erase "$(OUTDIR)\ZoneDebug.ilk"
	-@erase "$(OUTDIR)\ZoneDebug.pdb"

"$(OUTDIR)" :
    if not exist "$(OUTDIR)/$(NULL)" mkdir "$(OUTDIR)"

"$(INTDIR)" :
    if not exist "$(INTDIR)/$(NULL)" mkdir "$(INTDIR)"

CPP=cl.exe
CPP_PROJ=/nologo /MTd /Gm /GX /Zi /Od /I "c:\mysql\include" /I "c:\eqemu\include" /D "i386" /D "SHAREMEM" /D _WIN32_WINNT=0x0400 /D "_EQDEBUG" /D "ZONE" /D "INVERSEXY" /D "WIN32" /D "_CONSOLE" /D "_MBCS" /D "EQDEBUG" /D "FIELD_ITEMS" /FR"$(INTDIR)\\" /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\" /FD /GZ /c 

.c{$(INTDIR)}.obj::
   $(CPP) @<<
   $(CPP_PROJ) $< 
<<

.cpp{$(INTDIR)}.obj::
   $(CPP) @<<
   $(CPP_PROJ) $< 
<<

.cxx{$(INTDIR)}.obj::
   $(CPP) @<<
   $(CPP_PROJ) $< 
<<

.c{$(INTDIR)}.sbr::
   $(CPP) @<<
   $(CPP_PROJ) $< 
<<

.cpp{$(INTDIR)}.sbr::
   $(CPP) @<<
   $(CPP_PROJ) $< 
<<

.cxx{$(INTDIR)}.sbr::
   $(CPP) @<<
   $(CPP_PROJ) $< 
<<

RSC=rc.exe
BSC32=bscmake.exe
BSC32_FLAGS=/nologo /o"$(OUTDIR)\Zone.bsc" 
BSC32_SBRS= \
	"$(INTDIR)\AA.sbr" \
	"$(INTDIR)\aggro.sbr" \
	"$(INTDIR)\attack.sbr" \
	"$(INTDIR)\beacon.sbr" \
	"$(INTDIR)\bonuses.sbr" \
	"$(INTDIR)\client.sbr" \
	"$(INTDIR)\client_logs.sbr" \
	"$(INTDIR)\client_mods.sbr" \
	"$(INTDIR)\client_packet.sbr" \
	"$(INTDIR)\client_process.sbr" \
	"$(INTDIR)\command.sbr" \
	"$(INTDIR)\doors.sbr" \
	"$(INTDIR)\effects.sbr" \
	"$(INTDIR)\embparser.sbr" \
	"$(INTDIR)\embperl.sbr" \
	"$(INTDIR)\embxs.sbr" \
	"$(INTDIR)\entity.sbr" \
	"$(INTDIR)\EQEMuError.sbr" \
	"$(INTDIR)\exp.sbr" \
	"$(INTDIR)\faction.sbr" \
	"$(INTDIR)\fearpath.sbr" \
	"$(INTDIR)\forage.sbr" \
	"$(INTDIR)\groups.sbr" \
	"$(INTDIR)\guilds.sbr" \
	"$(INTDIR)\hate_list.sbr" \
	"$(INTDIR)\horse.sbr" \
	"$(INTDIR)\inventory.sbr" \
	"$(INTDIR)\loottables.sbr" \
	"$(INTDIR)\Map.sbr" \
	"$(INTDIR)\mob.sbr" \
	"$(INTDIR)\MobAI.sbr" \
	"$(INTDIR)\net.sbr" \
	"$(INTDIR)\npc.sbr" \
	"$(INTDIR)\Object.sbr" \
	"$(INTDIR)\parser.sbr" \
	"$(INTDIR)\pathing.sbr" \
	"$(INTDIR)\perl_client.sbr" \
	"$(INTDIR)\perl_entity.sbr" \
	"$(INTDIR)\perl_groups.sbr" \
	"$(INTDIR)\perl_mob.sbr" \
	"$(INTDIR)\perl_npc.sbr" \
	"$(INTDIR)\perl_perlpacket.sbr" \
	"$(INTDIR)\perl_PlayerCorpse.sbr" \
	"$(INTDIR)\perlpacket.sbr" \
	"$(INTDIR)\perlparser.sbr" \
	"$(INTDIR)\petitions.sbr" \
	"$(INTDIR)\pets.sbr" \
	"$(INTDIR)\PlayerCorpse.sbr" \
	"$(INTDIR)\ptimer.sbr" \
	"$(INTDIR)\questmgr.sbr" \
	"$(INTDIR)\spawn2.sbr" \
	"$(INTDIR)\spawngroup.sbr" \
	"$(INTDIR)\spdat.sbr" \
	"$(INTDIR)\special_attacks.sbr" \
	"$(INTDIR)\spell_effects.sbr" \
	"$(INTDIR)\spells.sbr" \
	"$(INTDIR)\titles.sbr" \
	"$(INTDIR)\tradeskills.sbr" \
	"$(INTDIR)\trading.sbr" \
	"$(INTDIR)\trap.sbr" \
	"$(INTDIR)\tribute.sbr" \
	"$(INTDIR)\waypoints.sbr" \
	"$(INTDIR)\worldserver.sbr" \
	"$(INTDIR)\zone.sbr" \
	"$(INTDIR)\zonedbasync.sbr" \
	"$(INTDIR)\zoning.sbr" \
	"$(INTDIR)\classes.sbr" \
	"$(INTDIR)\Condition.sbr" \
	"$(INTDIR)\CRC16.sbr" \
	"$(INTDIR)\crc32.sbr" \
	"$(INTDIR)\database.sbr" \
	"$(INTDIR)\dbasync.sbr" \
	"$(INTDIR)\dbcore.sbr" \
	"$(INTDIR)\DBMemLeak.sbr" \
	"$(INTDIR)\debug.sbr" \
	"$(INTDIR)\emu_opcodes.sbr" \
	"$(INTDIR)\EMuShareMem.sbr" \
	"$(INTDIR)\EQChatPacket.sbr" \
	"$(INTDIR)\EQLoginPacket.sbr" \
	"$(INTDIR)\EQMailPacket.sbr" \
	"$(INTDIR)\EQPacket.sbr" \
	"$(INTDIR)\EQStream.sbr" \
	"$(INTDIR)\EQStreamFactory.sbr" \
	"$(INTDIR)\eqtime.sbr" \
	"$(INTDIR)\EQWorldPacket.sbr" \
	"$(INTDIR)\EQZonePacket.sbr" \
	"$(INTDIR)\extprofile.sbr" \
	"$(INTDIR)\Item.sbr" \
	"$(INTDIR)\logsys.sbr" \
	"$(INTDIR)\md5.sbr" \
	"$(INTDIR)\misc.sbr" \
	"$(INTDIR)\MiscFunctions.sbr" \
	"$(INTDIR)\moremath.sbr" \
	"$(INTDIR)\Mutex.sbr" \
	"$(INTDIR)\opcodemgr.sbr" \
	"$(INTDIR)\packet_dump.sbr" \
	"$(INTDIR)\packet_dump_file.sbr" \
	"$(INTDIR)\packet_functions.sbr" \
	"$(INTDIR)\races.sbr" \
	"$(INTDIR)\rdtsc.sbr" \
	"$(INTDIR)\serverinfo.sbr" \
	"$(INTDIR)\SharedLibrary.sbr" \
	"$(INTDIR)\TCPConnection.sbr" \
	"$(INTDIR)\timeoutmgr.sbr" \
	"$(INTDIR)\timer.sbr"

"$(OUTDIR)\Zone.bsc" : "$(OUTDIR)" $(BSC32_SBRS)
    $(BSC32) @<<
  $(BSC32_FLAGS) $(BSC32_SBRS)
<<

LINK32=link.exe
LINK32_FLAGS=kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib odbc32.lib odbccp32.lib kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib odbc32.lib odbccp32.lib wsock32.lib zlib.lib mysqlclient.lib /nologo /subsystem:console /incremental:yes /pdb:"$(OUTDIR)\ZoneDebug.pdb" /debug /machine:I386 /nodefaultlib:"LIBCMT" /nodefaultlib:"LIBC" /out:"$(OUTDIR)\ZoneDebug.exe" /pdbtype:sept /libpath:"c:\mysql\lib\opt" /libpath:"c:\eqemu\lib" 
LINK32_OBJS= \
	"$(INTDIR)\AA.obj" \
	"$(INTDIR)\aggro.obj" \
	"$(INTDIR)\attack.obj" \
	"$(INTDIR)\beacon.obj" \
	"$(INTDIR)\bonuses.obj" \
	"$(INTDIR)\client.obj" \
	"$(INTDIR)\client_logs.obj" \
	"$(INTDIR)\client_mods.obj" \
	"$(INTDIR)\client_packet.obj" \
	"$(INTDIR)\client_process.obj" \
	"$(INTDIR)\command.obj" \
	"$(INTDIR)\doors.obj" \
	"$(INTDIR)\effects.obj" \
	"$(INTDIR)\embparser.obj" \
	"$(INTDIR)\embperl.obj" \
	"$(INTDIR)\embxs.obj" \
	"$(INTDIR)\entity.obj" \
	"$(INTDIR)\EQEMuError.obj" \
	"$(INTDIR)\exp.obj" \
	"$(INTDIR)\faction.obj" \
	"$(INTDIR)\fearpath.obj" \
	"$(INTDIR)\forage.obj" \
	"$(INTDIR)\groups.obj" \
	"$(INTDIR)\guilds.obj" \
	"$(INTDIR)\hate_list.obj" \
	"$(INTDIR)\horse.obj" \
	"$(INTDIR)\inventory.obj" \
	"$(INTDIR)\loottables.obj" \
	"$(INTDIR)\Map.obj" \
	"$(INTDIR)\mob.obj" \
	"$(INTDIR)\MobAI.obj" \
	"$(INTDIR)\net.obj" \
	"$(INTDIR)\npc.obj" \
	"$(INTDIR)\Object.obj" \
	"$(INTDIR)\parser.obj" \
	"$(INTDIR)\pathing.obj" \
	"$(INTDIR)\perl_client.obj" \
	"$(INTDIR)\perl_entity.obj" \
	"$(INTDIR)\perl_groups.obj" \
	"$(INTDIR)\perl_mob.obj" \
	"$(INTDIR)\perl_npc.obj" \
	"$(INTDIR)\perl_perlpacket.obj" \
	"$(INTDIR)\perl_PlayerCorpse.obj" \
	"$(INTDIR)\perlpacket.obj" \
	"$(INTDIR)\perlparser.obj" \
	"$(INTDIR)\petitions.obj" \
	"$(INTDIR)\pets.obj" \
	"$(INTDIR)\PlayerCorpse.obj" \
	"$(INTDIR)\ptimer.obj" \
	"$(INTDIR)\questmgr.obj" \
	"$(INTDIR)\spawn2.obj" \
	"$(INTDIR)\spawngroup.obj" \
	"$(INTDIR)\spdat.obj" \
	"$(INTDIR)\special_attacks.obj" \
	"$(INTDIR)\spell_effects.obj" \
	"$(INTDIR)\spells.obj" \
	"$(INTDIR)\titles.obj" \
	"$(INTDIR)\tradeskills.obj" \
	"$(INTDIR)\trading.obj" \
	"$(INTDIR)\trap.obj" \
	"$(INTDIR)\tribute.obj" \
	"$(INTDIR)\waypoints.obj" \
	"$(INTDIR)\worldserver.obj" \
	"$(INTDIR)\zone.obj" \
	"$(INTDIR)\zonedbasync.obj" \
	"$(INTDIR)\zoning.obj" \
	"$(INTDIR)\classes.obj" \
	"$(INTDIR)\Condition.obj" \
	"$(INTDIR)\CRC16.obj" \
	"$(INTDIR)\crc32.obj" \
	"$(INTDIR)\database.obj" \
	"$(INTDIR)\dbasync.obj" \
	"$(INTDIR)\dbcore.obj" \
	"$(INTDIR)\DBMemLeak.obj" \
	"$(INTDIR)\debug.obj" \
	"$(INTDIR)\emu_opcodes.obj" \
	"$(INTDIR)\EMuShareMem.obj" \
	"$(INTDIR)\EQChatPacket.obj" \
	"$(INTDIR)\EQLoginPacket.obj" \
	"$(INTDIR)\EQMailPacket.obj" \
	"$(INTDIR)\EQPacket.obj" \
	"$(INTDIR)\EQStream.obj" \
	"$(INTDIR)\EQStreamFactory.obj" \
	"$(INTDIR)\eqtime.obj" \
	"$(INTDIR)\EQWorldPacket.obj" \
	"$(INTDIR)\EQZonePacket.obj" \
	"$(INTDIR)\extprofile.obj" \
	"$(INTDIR)\Item.obj" \
	"$(INTDIR)\logsys.obj" \
	"$(INTDIR)\md5.obj" \
	"$(INTDIR)\misc.obj" \
	"$(INTDIR)\MiscFunctions.obj" \
	"$(INTDIR)\moremath.obj" \
	"$(INTDIR)\Mutex.obj" \
	"$(INTDIR)\opcodemgr.obj" \
	"$(INTDIR)\packet_dump.obj" \
	"$(INTDIR)\packet_dump_file.obj" \
	"$(INTDIR)\packet_functions.obj" \
	"$(INTDIR)\races.obj" \
	"$(INTDIR)\rdtsc.obj" \
	"$(INTDIR)\serverinfo.obj" \
	"$(INTDIR)\SharedLibrary.obj" \
	"$(INTDIR)\TCPConnection.obj" \
	"$(INTDIR)\timeoutmgr.obj" \
	"$(INTDIR)\timer.obj"

"$(OUTDIR)\ZoneDebug.exe" : "$(OUTDIR)" $(DEF_FILE) $(LINK32_OBJS)
    $(LINK32) @<<
  $(LINK32_FLAGS) $(LINK32_OBJS)
<<

!ELSEIF  "$(CFG)" == "Zone - Win32 Raid Addicts"

OUTDIR=.\../Build
INTDIR=.\../Build/Zone/Release
# Begin Custom Macros
OutDir=.\../Build/
# End Custom Macros

ALL : "$(OUTDIR)\Zone.exe" "$(OUTDIR)\Zone\Zone.bsc"


CLEAN :
	-@erase "$(INTDIR)\AA.obj"
	-@erase "$(INTDIR)\AA.sbr"
	-@erase "$(INTDIR)\aggro.obj"
	-@erase "$(INTDIR)\aggro.sbr"
	-@erase "$(INTDIR)\attack.obj"
	-@erase "$(INTDIR)\attack.sbr"
	-@erase "$(INTDIR)\beacon.obj"
	-@erase "$(INTDIR)\beacon.sbr"
	-@erase "$(INTDIR)\bonuses.obj"
	-@erase "$(INTDIR)\bonuses.sbr"
	-@erase "$(INTDIR)\classes.obj"
	-@erase "$(INTDIR)\classes.sbr"
	-@erase "$(INTDIR)\client.obj"
	-@erase "$(INTDIR)\client.sbr"
	-@erase "$(INTDIR)\client_logs.obj"
	-@erase "$(INTDIR)\client_logs.sbr"
	-@erase "$(INTDIR)\client_mods.obj"
	-@erase "$(INTDIR)\client_mods.sbr"
	-@erase "$(INTDIR)\client_packet.obj"
	-@erase "$(INTDIR)\client_packet.sbr"
	-@erase "$(INTDIR)\client_process.obj"
	-@erase "$(INTDIR)\client_process.sbr"
	-@erase "$(INTDIR)\command.obj"
	-@erase "$(INTDIR)\command.sbr"
	-@erase "$(INTDIR)\Condition.obj"
	-@erase "$(INTDIR)\Condition.sbr"
	-@erase "$(INTDIR)\CRC16.obj"
	-@erase "$(INTDIR)\CRC16.sbr"
	-@erase "$(INTDIR)\crc32.obj"
	-@erase "$(INTDIR)\crc32.sbr"
	-@erase "$(INTDIR)\database.obj"
	-@erase "$(INTDIR)\database.sbr"
	-@erase "$(INTDIR)\dbasync.obj"
	-@erase "$(INTDIR)\dbasync.sbr"
	-@erase "$(INTDIR)\dbcore.obj"
	-@erase "$(INTDIR)\dbcore.sbr"
	-@erase "$(INTDIR)\DBMemLeak.obj"
	-@erase "$(INTDIR)\DBMemLeak.sbr"
	-@erase "$(INTDIR)\debug.obj"
	-@erase "$(INTDIR)\debug.sbr"
	-@erase "$(INTDIR)\doors.obj"
	-@erase "$(INTDIR)\doors.sbr"
	-@erase "$(INTDIR)\effects.obj"
	-@erase "$(INTDIR)\effects.sbr"
	-@erase "$(INTDIR)\embparser.obj"
	-@erase "$(INTDIR)\embparser.sbr"
	-@erase "$(INTDIR)\embperl.obj"
	-@erase "$(INTDIR)\embperl.sbr"
	-@erase "$(INTDIR)\embxs.obj"
	-@erase "$(INTDIR)\embxs.sbr"
	-@erase "$(INTDIR)\emu_opcodes.obj"
	-@erase "$(INTDIR)\emu_opcodes.sbr"
	-@erase "$(INTDIR)\EMuShareMem.obj"
	-@erase "$(INTDIR)\EMuShareMem.sbr"
	-@erase "$(INTDIR)\entity.obj"
	-@erase "$(INTDIR)\entity.sbr"
	-@erase "$(INTDIR)\EQChatPacket.obj"
	-@erase "$(INTDIR)\EQChatPacket.sbr"
	-@erase "$(INTDIR)\EQEMuError.obj"
	-@erase "$(INTDIR)\EQEMuError.sbr"
	-@erase "$(INTDIR)\EQLoginPacket.obj"
	-@erase "$(INTDIR)\EQLoginPacket.sbr"
	-@erase "$(INTDIR)\EQMailPacket.obj"
	-@erase "$(INTDIR)\EQMailPacket.sbr"
	-@erase "$(INTDIR)\EQPacket.obj"
	-@erase "$(INTDIR)\EQPacket.sbr"
	-@erase "$(INTDIR)\EQStream.obj"
	-@erase "$(INTDIR)\EQStream.sbr"
	-@erase "$(INTDIR)\EQStreamFactory.obj"
	-@erase "$(INTDIR)\EQStreamFactory.sbr"
	-@erase "$(INTDIR)\eqtime.obj"
	-@erase "$(INTDIR)\eqtime.sbr"
	-@erase "$(INTDIR)\EQWorldPacket.obj"
	-@erase "$(INTDIR)\EQWorldPacket.sbr"
	-@erase "$(INTDIR)\EQZonePacket.obj"
	-@erase "$(INTDIR)\EQZonePacket.sbr"
	-@erase "$(INTDIR)\exp.obj"
	-@erase "$(INTDIR)\exp.sbr"
	-@erase "$(INTDIR)\extprofile.obj"
	-@erase "$(INTDIR)\extprofile.sbr"
	-@erase "$(INTDIR)\faction.obj"
	-@erase "$(INTDIR)\faction.sbr"
	-@erase "$(INTDIR)\fearpath.obj"
	-@erase "$(INTDIR)\fearpath.sbr"
	-@erase "$(INTDIR)\forage.obj"
	-@erase "$(INTDIR)\forage.sbr"
	-@erase "$(INTDIR)\groups.obj"
	-@erase "$(INTDIR)\groups.sbr"
	-@erase "$(INTDIR)\guilds.obj"
	-@erase "$(INTDIR)\guilds.sbr"
	-@erase "$(INTDIR)\hate_list.obj"
	-@erase "$(INTDIR)\hate_list.sbr"
	-@erase "$(INTDIR)\horse.obj"
	-@erase "$(INTDIR)\horse.sbr"
	-@erase "$(INTDIR)\inventory.obj"
	-@erase "$(INTDIR)\inventory.sbr"
	-@erase "$(INTDIR)\Item.obj"
	-@erase "$(INTDIR)\Item.sbr"
	-@erase "$(INTDIR)\logsys.obj"
	-@erase "$(INTDIR)\logsys.sbr"
	-@erase "$(INTDIR)\loottables.obj"
	-@erase "$(INTDIR)\loottables.sbr"
	-@erase "$(INTDIR)\Map.obj"
	-@erase "$(INTDIR)\Map.sbr"
	-@erase "$(INTDIR)\md5.obj"
	-@erase "$(INTDIR)\md5.sbr"
	-@erase "$(INTDIR)\misc.obj"
	-@erase "$(INTDIR)\misc.sbr"
	-@erase "$(INTDIR)\MiscFunctions.obj"
	-@erase "$(INTDIR)\MiscFunctions.sbr"
	-@erase "$(INTDIR)\mob.obj"
	-@erase "$(INTDIR)\mob.sbr"
	-@erase "$(INTDIR)\MobAI.obj"
	-@erase "$(INTDIR)\MobAI.sbr"
	-@erase "$(INTDIR)\moremath.obj"
	-@erase "$(INTDIR)\moremath.sbr"
	-@erase "$(INTDIR)\Mutex.obj"
	-@erase "$(INTDIR)\Mutex.sbr"
	-@erase "$(INTDIR)\net.obj"
	-@erase "$(INTDIR)\net.sbr"
	-@erase "$(INTDIR)\npc.obj"
	-@erase "$(INTDIR)\npc.sbr"
	-@erase "$(INTDIR)\Object.obj"
	-@erase "$(INTDIR)\Object.sbr"
	-@erase "$(INTDIR)\opcodemgr.obj"
	-@erase "$(INTDIR)\opcodemgr.sbr"
	-@erase "$(INTDIR)\packet_dump.obj"
	-@erase "$(INTDIR)\packet_dump.sbr"
	-@erase "$(INTDIR)\packet_dump_file.obj"
	-@erase "$(INTDIR)\packet_dump_file.sbr"
	-@erase "$(INTDIR)\packet_functions.obj"
	-@erase "$(INTDIR)\packet_functions.sbr"
	-@erase "$(INTDIR)\parser.obj"
	-@erase "$(INTDIR)\parser.sbr"
	-@erase "$(INTDIR)\pathing.obj"
	-@erase "$(INTDIR)\pathing.sbr"
	-@erase "$(INTDIR)\perl_client.obj"
	-@erase "$(INTDIR)\perl_client.sbr"
	-@erase "$(INTDIR)\perl_entity.obj"
	-@erase "$(INTDIR)\perl_entity.sbr"
	-@erase "$(INTDIR)\perl_groups.obj"
	-@erase "$(INTDIR)\perl_groups.sbr"
	-@erase "$(INTDIR)\perl_mob.obj"
	-@erase "$(INTDIR)\perl_mob.sbr"
	-@erase "$(INTDIR)\perl_npc.obj"
	-@erase "$(INTDIR)\perl_npc.sbr"
	-@erase "$(INTDIR)\perl_perlpacket.obj"
	-@erase "$(INTDIR)\perl_perlpacket.sbr"
	-@erase "$(INTDIR)\perl_PlayerCorpse.obj"
	-@erase "$(INTDIR)\perl_PlayerCorpse.sbr"
	-@erase "$(INTDIR)\perlpacket.obj"
	-@erase "$(INTDIR)\perlpacket.sbr"
	-@erase "$(INTDIR)\perlparser.obj"
	-@erase "$(INTDIR)\perlparser.sbr"
	-@erase "$(INTDIR)\petitions.obj"
	-@erase "$(INTDIR)\petitions.sbr"
	-@erase "$(INTDIR)\pets.obj"
	-@erase "$(INTDIR)\pets.sbr"
	-@erase "$(INTDIR)\PlayerCorpse.obj"
	-@erase "$(INTDIR)\PlayerCorpse.sbr"
	-@erase "$(INTDIR)\ptimer.obj"
	-@erase "$(INTDIR)\ptimer.sbr"
	-@erase "$(INTDIR)\questmgr.obj"
	-@erase "$(INTDIR)\questmgr.sbr"
	-@erase "$(INTDIR)\races.obj"
	-@erase "$(INTDIR)\races.sbr"
	-@erase "$(INTDIR)\rdtsc.obj"
	-@erase "$(INTDIR)\rdtsc.sbr"
	-@erase "$(INTDIR)\serverinfo.obj"
	-@erase "$(INTDIR)\serverinfo.sbr"
	-@erase "$(INTDIR)\SharedLibrary.obj"
	-@erase "$(INTDIR)\SharedLibrary.sbr"
	-@erase "$(INTDIR)\spawn2.obj"
	-@erase "$(INTDIR)\spawn2.sbr"
	-@erase "$(INTDIR)\spawngroup.obj"
	-@erase "$(INTDIR)\spawngroup.sbr"
	-@erase "$(INTDIR)\spdat.obj"
	-@erase "$(INTDIR)\spdat.sbr"
	-@erase "$(INTDIR)\special_attacks.obj"
	-@erase "$(INTDIR)\special_attacks.sbr"
	-@erase "$(INTDIR)\spell_effects.obj"
	-@erase "$(INTDIR)\spell_effects.sbr"
	-@erase "$(INTDIR)\spells.obj"
	-@erase "$(INTDIR)\spells.sbr"
	-@erase "$(INTDIR)\TCPConnection.obj"
	-@erase "$(INTDIR)\TCPConnection.sbr"
	-@erase "$(INTDIR)\timeoutmgr.obj"
	-@erase "$(INTDIR)\timeoutmgr.sbr"
	-@erase "$(INTDIR)\timer.obj"
	-@erase "$(INTDIR)\timer.sbr"
	-@erase "$(INTDIR)\titles.obj"
	-@erase "$(INTDIR)\titles.sbr"
	-@erase "$(INTDIR)\tradeskills.obj"
	-@erase "$(INTDIR)\tradeskills.sbr"
	-@erase "$(INTDIR)\trading.obj"
	-@erase "$(INTDIR)\trading.sbr"
	-@erase "$(INTDIR)\trap.obj"
	-@erase "$(INTDIR)\trap.sbr"
	-@erase "$(INTDIR)\tribute.obj"
	-@erase "$(INTDIR)\tribute.sbr"
	-@erase "$(INTDIR)\vc60.idb"
	-@erase "$(INTDIR)\vc60.pdb"
	-@erase "$(INTDIR)\waypoints.obj"
	-@erase "$(INTDIR)\waypoints.sbr"
	-@erase "$(INTDIR)\worldserver.obj"
	-@erase "$(INTDIR)\worldserver.sbr"
	-@erase "$(INTDIR)\zone.obj"
	-@erase "$(INTDIR)\zone.sbr"
	-@erase "$(INTDIR)\zonedbasync.obj"
	-@erase "$(INTDIR)\zonedbasync.sbr"
	-@erase "$(INTDIR)\zoning.obj"
	-@erase "$(INTDIR)\zoning.sbr"
	-@erase "$(OUTDIR)\Zone.exe"
	-@erase "$(OUTDIR)\Zone.map"
	-@erase "$(OUTDIR)\Zone.pdb"
	-@erase "$(OUTDIR)\Zone\Zone.bsc"

"$(OUTDIR)" :
    if not exist "$(OUTDIR)/$(NULL)" mkdir "$(OUTDIR)"

"$(INTDIR)" :
    if not exist "$(INTDIR)/$(NULL)" mkdir "$(INTDIR)"

CPP=cl.exe
CPP_PROJ=/nologo /MT /w /W0 /GX /Zi /O2 /Ob2 /I "c:\mysql\include" /I "c:\eqemu\include" /D "i386" /D "SHAREMEM" /D "CATCH_CRASH" /D _WIN32_WINNT=0x0400 /D "NDEBUG" /D "ZONESERVER" /D "ZONE" /D "INVERSEXY" /D "WIN32" /D "_CONSOLE" /D "_MBCS" /D "FIELD_ITEMS" /D EQDEBUG=0 /FR"$(INTDIR)\\" /Fp"$(INTDIR)\Zone.pch" /YX /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\" /FD /c 

.c{$(INTDIR)}.obj::
   $(CPP) @<<
   $(CPP_PROJ) $< 
<<

.cpp{$(INTDIR)}.obj::
   $(CPP) @<<
   $(CPP_PROJ) $< 
<<

.cxx{$(INTDIR)}.obj::
   $(CPP) @<<
   $(CPP_PROJ) $< 
<<

.c{$(INTDIR)}.sbr::
   $(CPP) @<<
   $(CPP_PROJ) $< 
<<

.cpp{$(INTDIR)}.sbr::
   $(CPP) @<<
   $(CPP_PROJ) $< 
<<

.cxx{$(INTDIR)}.sbr::
   $(CPP) @<<
   $(CPP_PROJ) $< 
<<

RSC=rc.exe
BSC32=bscmake.exe
BSC32_FLAGS=/nologo /o"$(OUTDIR)\Zone\Zone.bsc" 
BSC32_SBRS= \
	"$(INTDIR)\AA.sbr" \
	"$(INTDIR)\aggro.sbr" \
	"$(INTDIR)\attack.sbr" \
	"$(INTDIR)\beacon.sbr" \
	"$(INTDIR)\bonuses.sbr" \
	"$(INTDIR)\client.sbr" \
	"$(INTDIR)\client_logs.sbr" \
	"$(INTDIR)\client_mods.sbr" \
	"$(INTDIR)\client_packet.sbr" \
	"$(INTDIR)\client_process.sbr" \
	"$(INTDIR)\command.sbr" \
	"$(INTDIR)\doors.sbr" \
	"$(INTDIR)\effects.sbr" \
	"$(INTDIR)\embparser.sbr" \
	"$(INTDIR)\embperl.sbr" \
	"$(INTDIR)\embxs.sbr" \
	"$(INTDIR)\entity.sbr" \
	"$(INTDIR)\EQEMuError.sbr" \
	"$(INTDIR)\exp.sbr" \
	"$(INTDIR)\faction.sbr" \
	"$(INTDIR)\fearpath.sbr" \
	"$(INTDIR)\forage.sbr" \
	"$(INTDIR)\groups.sbr" \
	"$(INTDIR)\guilds.sbr" \
	"$(INTDIR)\hate_list.sbr" \
	"$(INTDIR)\horse.sbr" \
	"$(INTDIR)\inventory.sbr" \
	"$(INTDIR)\loottables.sbr" \
	"$(INTDIR)\Map.sbr" \
	"$(INTDIR)\mob.sbr" \
	"$(INTDIR)\MobAI.sbr" \
	"$(INTDIR)\net.sbr" \
	"$(INTDIR)\npc.sbr" \
	"$(INTDIR)\Object.sbr" \
	"$(INTDIR)\parser.sbr" \
	"$(INTDIR)\pathing.sbr" \
	"$(INTDIR)\perl_client.sbr" \
	"$(INTDIR)\perl_entity.sbr" \
	"$(INTDIR)\perl_groups.sbr" \
	"$(INTDIR)\perl_mob.sbr" \
	"$(INTDIR)\perl_npc.sbr" \
	"$(INTDIR)\perl_perlpacket.sbr" \
	"$(INTDIR)\perl_PlayerCorpse.sbr" \
	"$(INTDIR)\perlpacket.sbr" \
	"$(INTDIR)\perlparser.sbr" \
	"$(INTDIR)\petitions.sbr" \
	"$(INTDIR)\pets.sbr" \
	"$(INTDIR)\PlayerCorpse.sbr" \
	"$(INTDIR)\ptimer.sbr" \
	"$(INTDIR)\questmgr.sbr" \
	"$(INTDIR)\spawn2.sbr" \
	"$(INTDIR)\spawngroup.sbr" \
	"$(INTDIR)\spdat.sbr" \
	"$(INTDIR)\special_attacks.sbr" \
	"$(INTDIR)\spell_effects.sbr" \
	"$(INTDIR)\spells.sbr" \
	"$(INTDIR)\titles.sbr" \
	"$(INTDIR)\tradeskills.sbr" \
	"$(INTDIR)\trading.sbr" \
	"$(INTDIR)\trap.sbr" \
	"$(INTDIR)\tribute.sbr" \
	"$(INTDIR)\waypoints.sbr" \
	"$(INTDIR)\worldserver.sbr" \
	"$(INTDIR)\zone.sbr" \
	"$(INTDIR)\zonedbasync.sbr" \
	"$(INTDIR)\zoning.sbr" \
	"$(INTDIR)\classes.sbr" \
	"$(INTDIR)\Condition.sbr" \
	"$(INTDIR)\CRC16.sbr" \
	"$(INTDIR)\crc32.sbr" \
	"$(INTDIR)\database.sbr" \
	"$(INTDIR)\dbasync.sbr" \
	"$(INTDIR)\dbcore.sbr" \
	"$(INTDIR)\DBMemLeak.sbr" \
	"$(INTDIR)\debug.sbr" \
	"$(INTDIR)\emu_opcodes.sbr" \
	"$(INTDIR)\EMuShareMem.sbr" \
	"$(INTDIR)\EQChatPacket.sbr" \
	"$(INTDIR)\EQLoginPacket.sbr" \
	"$(INTDIR)\EQMailPacket.sbr" \
	"$(INTDIR)\EQPacket.sbr" \
	"$(INTDIR)\EQStream.sbr" \
	"$(INTDIR)\EQStreamFactory.sbr" \
	"$(INTDIR)\eqtime.sbr" \
	"$(INTDIR)\EQWorldPacket.sbr" \
	"$(INTDIR)\EQZonePacket.sbr" \
	"$(INTDIR)\extprofile.sbr" \
	"$(INTDIR)\Item.sbr" \
	"$(INTDIR)\logsys.sbr" \
	"$(INTDIR)\md5.sbr" \
	"$(INTDIR)\misc.sbr" \
	"$(INTDIR)\MiscFunctions.sbr" \
	"$(INTDIR)\moremath.sbr" \
	"$(INTDIR)\Mutex.sbr" \
	"$(INTDIR)\opcodemgr.sbr" \
	"$(INTDIR)\packet_dump.sbr" \
	"$(INTDIR)\packet_dump_file.sbr" \
	"$(INTDIR)\packet_functions.sbr" \
	"$(INTDIR)\races.sbr" \
	"$(INTDIR)\rdtsc.sbr" \
	"$(INTDIR)\serverinfo.sbr" \
	"$(INTDIR)\SharedLibrary.sbr" \
	"$(INTDIR)\TCPConnection.sbr" \
	"$(INTDIR)\timeoutmgr.sbr" \
	"$(INTDIR)\timer.sbr"

"$(OUTDIR)\Zone\Zone.bsc" : "$(OUTDIR)" $(BSC32_SBRS)
    $(BSC32) @<<
  $(BSC32_FLAGS) $(BSC32_SBRS)
<<

LINK32=link.exe
LINK32_FLAGS=kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib odbc32.lib odbccp32.lib kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib odbc32.lib odbccp32.lib wsock32.lib zlib.lib mysqlclient.lib /nologo /subsystem:console /incremental:no /pdb:"$(OUTDIR)\Zone.pdb" /map:"../Build/Zone.map" /debug /machine:I386 /nodefaultlib:"libc" /out:"$(OUTDIR)\Zone.exe" /libpath:"c:\mysql\lib\opt" /libpath:"c:\eqemu\lib" 
LINK32_OBJS= \
	"$(INTDIR)\AA.obj" \
	"$(INTDIR)\aggro.obj" \
	"$(INTDIR)\attack.obj" \
	"$(INTDIR)\beacon.obj" \
	"$(INTDIR)\bonuses.obj" \
	"$(INTDIR)\client.obj" \
	"$(INTDIR)\client_logs.obj" \
	"$(INTDIR)\client_mods.obj" \
	"$(INTDIR)\client_packet.obj" \
	"$(INTDIR)\client_process.obj" \
	"$(INTDIR)\command.obj" \
	"$(INTDIR)\doors.obj" \
	"$(INTDIR)\effects.obj" \
	"$(INTDIR)\embparser.obj" \
	"$(INTDIR)\embperl.obj" \
	"$(INTDIR)\embxs.obj" \
	"$(INTDIR)\entity.obj" \
	"$(INTDIR)\EQEMuError.obj" \
	"$(INTDIR)\exp.obj" \
	"$(INTDIR)\faction.obj" \
	"$(INTDIR)\fearpath.obj" \
	"$(INTDIR)\forage.obj" \
	"$(INTDIR)\groups.obj" \
	"$(INTDIR)\guilds.obj" \
	"$(INTDIR)\hate_list.obj" \
	"$(INTDIR)\horse.obj" \
	"$(INTDIR)\inventory.obj" \
	"$(INTDIR)\loottables.obj" \
	"$(INTDIR)\Map.obj" \
	"$(INTDIR)\mob.obj" \
	"$(INTDIR)\MobAI.obj" \
	"$(INTDIR)\net.obj" \
	"$(INTDIR)\npc.obj" \
	"$(INTDIR)\Object.obj" \
	"$(INTDIR)\parser.obj" \
	"$(INTDIR)\pathing.obj" \
	"$(INTDIR)\perl_client.obj" \
	"$(INTDIR)\perl_entity.obj" \
	"$(INTDIR)\perl_groups.obj" \
	"$(INTDIR)\perl_mob.obj" \
	"$(INTDIR)\perl_npc.obj" \
	"$(INTDIR)\perl_perlpacket.obj" \
	"$(INTDIR)\perl_PlayerCorpse.obj" \
	"$(INTDIR)\perlpacket.obj" \
	"$(INTDIR)\perlparser.obj" \
	"$(INTDIR)\petitions.obj" \
	"$(INTDIR)\pets.obj" \
	"$(INTDIR)\PlayerCorpse.obj" \
	"$(INTDIR)\ptimer.obj" \
	"$(INTDIR)\questmgr.obj" \
	"$(INTDIR)\spawn2.obj" \
	"$(INTDIR)\spawngroup.obj" \
	"$(INTDIR)\spdat.obj" \
	"$(INTDIR)\special_attacks.obj" \
	"$(INTDIR)\spell_effects.obj" \
	"$(INTDIR)\spells.obj" \
	"$(INTDIR)\titles.obj" \
	"$(INTDIR)\tradeskills.obj" \
	"$(INTDIR)\trading.obj" \
	"$(INTDIR)\trap.obj" \
	"$(INTDIR)\tribute.obj" \
	"$(INTDIR)\waypoints.obj" \
	"$(INTDIR)\worldserver.obj" \
	"$(INTDIR)\zone.obj" \
	"$(INTDIR)\zonedbasync.obj" \
	"$(INTDIR)\zoning.obj" \
	"$(INTDIR)\classes.obj" \
	"$(INTDIR)\Condition.obj" \
	"$(INTDIR)\CRC16.obj" \
	"$(INTDIR)\crc32.obj" \
	"$(INTDIR)\database.obj" \
	"$(INTDIR)\dbasync.obj" \
	"$(INTDIR)\dbcore.obj" \
	"$(INTDIR)\DBMemLeak.obj" \
	"$(INTDIR)\debug.obj" \
	"$(INTDIR)\emu_opcodes.obj" \
	"$(INTDIR)\EMuShareMem.obj" \
	"$(INTDIR)\EQChatPacket.obj" \
	"$(INTDIR)\EQLoginPacket.obj" \
	"$(INTDIR)\EQMailPacket.obj" \
	"$(INTDIR)\EQPacket.obj" \
	"$(INTDIR)\EQStream.obj" \
	"$(INTDIR)\EQStreamFactory.obj" \
	"$(INTDIR)\eqtime.obj" \
	"$(INTDIR)\EQWorldPacket.obj" \
	"$(INTDIR)\EQZonePacket.obj" \
	"$(INTDIR)\extprofile.obj" \
	"$(INTDIR)\Item.obj" \
	"$(INTDIR)\logsys.obj" \
	"$(INTDIR)\md5.obj" \
	"$(INTDIR)\misc.obj" \
	"$(INTDIR)\MiscFunctions.obj" \
	"$(INTDIR)\moremath.obj" \
	"$(INTDIR)\Mutex.obj" \
	"$(INTDIR)\opcodemgr.obj" \
	"$(INTDIR)\packet_dump.obj" \
	"$(INTDIR)\packet_dump_file.obj" \
	"$(INTDIR)\packet_functions.obj" \
	"$(INTDIR)\races.obj" \
	"$(INTDIR)\rdtsc.obj" \
	"$(INTDIR)\serverinfo.obj" \
	"$(INTDIR)\SharedLibrary.obj" \
	"$(INTDIR)\TCPConnection.obj" \
	"$(INTDIR)\timeoutmgr.obj" \
	"$(INTDIR)\timer.obj"

"$(OUTDIR)\Zone.exe" : "$(OUTDIR)" $(DEF_FILE) $(LINK32_OBJS)
    $(LINK32) @<<
  $(LINK32_FLAGS) $(LINK32_OBJS)
<<

!ELSEIF  "$(CFG)" == "Zone - Win32 DebugPerl"

OUTDIR=.\..\Build
INTDIR=.\..\Build\ZonePerl
# Begin Custom Macros
OutDir=.\..\Build
# End Custom Macros

ALL : "$(OUTDIR)\ZoneDebugPerl.exe" "$(OUTDIR)\Zone.bsc"


CLEAN :
	-@erase "$(INTDIR)\AA.obj"
	-@erase "$(INTDIR)\AA.sbr"
	-@erase "$(INTDIR)\aggro.obj"
	-@erase "$(INTDIR)\aggro.sbr"
	-@erase "$(INTDIR)\attack.obj"
	-@erase "$(INTDIR)\attack.sbr"
	-@erase "$(INTDIR)\beacon.obj"
	-@erase "$(INTDIR)\beacon.sbr"
	-@erase "$(INTDIR)\bonuses.obj"
	-@erase "$(INTDIR)\bonuses.sbr"
	-@erase "$(INTDIR)\classes.obj"
	-@erase "$(INTDIR)\classes.sbr"
	-@erase "$(INTDIR)\client.obj"
	-@erase "$(INTDIR)\client.sbr"
	-@erase "$(INTDIR)\client_logs.obj"
	-@erase "$(INTDIR)\client_logs.sbr"
	-@erase "$(INTDIR)\client_mods.obj"
	-@erase "$(INTDIR)\client_mods.sbr"
	-@erase "$(INTDIR)\client_packet.obj"
	-@erase "$(INTDIR)\client_packet.sbr"
	-@erase "$(INTDIR)\client_process.obj"
	-@erase "$(INTDIR)\client_process.sbr"
	-@erase "$(INTDIR)\command.obj"
	-@erase "$(INTDIR)\command.sbr"
	-@erase "$(INTDIR)\Condition.obj"
	-@erase "$(INTDIR)\Condition.sbr"
	-@erase "$(INTDIR)\CRC16.obj"
	-@erase "$(INTDIR)\CRC16.sbr"
	-@erase "$(INTDIR)\crc32.obj"
	-@erase "$(INTDIR)\crc32.sbr"
	-@erase "$(INTDIR)\database.obj"
	-@erase "$(INTDIR)\database.sbr"
	-@erase "$(INTDIR)\dbasync.obj"
	-@erase "$(INTDIR)\dbasync.sbr"
	-@erase "$(INTDIR)\dbcore.obj"
	-@erase "$(INTDIR)\dbcore.sbr"
	-@erase "$(INTDIR)\DBMemLeak.obj"
	-@erase "$(INTDIR)\DBMemLeak.sbr"
	-@erase "$(INTDIR)\debug.obj"
	-@erase "$(INTDIR)\debug.sbr"
	-@erase "$(INTDIR)\doors.obj"
	-@erase "$(INTDIR)\doors.sbr"
	-@erase "$(INTDIR)\effects.obj"
	-@erase "$(INTDIR)\effects.sbr"
	-@erase "$(INTDIR)\embparser.obj"
	-@erase "$(INTDIR)\embparser.sbr"
	-@erase "$(INTDIR)\embperl.obj"
	-@erase "$(INTDIR)\embperl.sbr"
	-@erase "$(INTDIR)\embxs.obj"
	-@erase "$(INTDIR)\embxs.sbr"
	-@erase "$(INTDIR)\emu_opcodes.obj"
	-@erase "$(INTDIR)\emu_opcodes.sbr"
	-@erase "$(INTDIR)\EMuShareMem.obj"
	-@erase "$(INTDIR)\EMuShareMem.sbr"
	-@erase "$(INTDIR)\entity.obj"
	-@erase "$(INTDIR)\entity.sbr"
	-@erase "$(INTDIR)\EQChatPacket.obj"
	-@erase "$(INTDIR)\EQChatPacket.sbr"
	-@erase "$(INTDIR)\EQEMuError.obj"
	-@erase "$(INTDIR)\EQEMuError.sbr"
	-@erase "$(INTDIR)\EQLoginPacket.obj"
	-@erase "$(INTDIR)\EQLoginPacket.sbr"
	-@erase "$(INTDIR)\EQMailPacket.obj"
	-@erase "$(INTDIR)\EQMailPacket.sbr"
	-@erase "$(INTDIR)\EQPacket.obj"
	-@erase "$(INTDIR)\EQPacket.sbr"
	-@erase "$(INTDIR)\EQStream.obj"
	-@erase "$(INTDIR)\EQStream.sbr"
	-@erase "$(INTDIR)\EQStreamFactory.obj"
	-@erase "$(INTDIR)\EQStreamFactory.sbr"
	-@erase "$(INTDIR)\eqtime.obj"
	-@erase "$(INTDIR)\eqtime.sbr"
	-@erase "$(INTDIR)\EQWorldPacket.obj"
	-@erase "$(INTDIR)\EQWorldPacket.sbr"
	-@erase "$(INTDIR)\EQZonePacket.obj"
	-@erase "$(INTDIR)\EQZonePacket.sbr"
	-@erase "$(INTDIR)\exp.obj"
	-@erase "$(INTDIR)\exp.sbr"
	-@erase "$(INTDIR)\extprofile.obj"
	-@erase "$(INTDIR)\extprofile.sbr"
	-@erase "$(INTDIR)\faction.obj"
	-@erase "$(INTDIR)\faction.sbr"
	-@erase "$(INTDIR)\fearpath.obj"
	-@erase "$(INTDIR)\fearpath.sbr"
	-@erase "$(INTDIR)\forage.obj"
	-@erase "$(INTDIR)\forage.sbr"
	-@erase "$(INTDIR)\groups.obj"
	-@erase "$(INTDIR)\groups.sbr"
	-@erase "$(INTDIR)\guilds.obj"
	-@erase "$(INTDIR)\guilds.sbr"
	-@erase "$(INTDIR)\hate_list.obj"
	-@erase "$(INTDIR)\hate_list.sbr"
	-@erase "$(INTDIR)\horse.obj"
	-@erase "$(INTDIR)\horse.sbr"
	-@erase "$(INTDIR)\inventory.obj"
	-@erase "$(INTDIR)\inventory.sbr"
	-@erase "$(INTDIR)\Item.obj"
	-@erase "$(INTDIR)\Item.sbr"
	-@erase "$(INTDIR)\logsys.obj"
	-@erase "$(INTDIR)\logsys.sbr"
	-@erase "$(INTDIR)\loottables.obj"
	-@erase "$(INTDIR)\loottables.sbr"
	-@erase "$(INTDIR)\Map.obj"
	-@erase "$(INTDIR)\Map.sbr"
	-@erase "$(INTDIR)\md5.obj"
	-@erase "$(INTDIR)\md5.sbr"
	-@erase "$(INTDIR)\misc.obj"
	-@erase "$(INTDIR)\misc.sbr"
	-@erase "$(INTDIR)\MiscFunctions.obj"
	-@erase "$(INTDIR)\MiscFunctions.sbr"
	-@erase "$(INTDIR)\mob.obj"
	-@erase "$(INTDIR)\mob.sbr"
	-@erase "$(INTDIR)\MobAI.obj"
	-@erase "$(INTDIR)\MobAI.sbr"
	-@erase "$(INTDIR)\moremath.obj"
	-@erase "$(INTDIR)\moremath.sbr"
	-@erase "$(INTDIR)\Mutex.obj"
	-@erase "$(INTDIR)\Mutex.sbr"
	-@erase "$(INTDIR)\net.obj"
	-@erase "$(INTDIR)\net.sbr"
	-@erase "$(INTDIR)\npc.obj"
	-@erase "$(INTDIR)\npc.sbr"
	-@erase "$(INTDIR)\Object.obj"
	-@erase "$(INTDIR)\Object.sbr"
	-@erase "$(INTDIR)\opcodemgr.obj"
	-@erase "$(INTDIR)\opcodemgr.sbr"
	-@erase "$(INTDIR)\packet_dump.obj"
	-@erase "$(INTDIR)\packet_dump.sbr"
	-@erase "$(INTDIR)\packet_dump_file.obj"
	-@erase "$(INTDIR)\packet_dump_file.sbr"
	-@erase "$(INTDIR)\packet_functions.obj"
	-@erase "$(INTDIR)\packet_functions.sbr"
	-@erase "$(INTDIR)\parser.obj"
	-@erase "$(INTDIR)\parser.sbr"
	-@erase "$(INTDIR)\pathing.obj"
	-@erase "$(INTDIR)\pathing.sbr"
	-@erase "$(INTDIR)\perl_client.obj"
	-@erase "$(INTDIR)\perl_client.sbr"
	-@erase "$(INTDIR)\perl_entity.obj"
	-@erase "$(INTDIR)\perl_entity.sbr"
	-@erase "$(INTDIR)\perl_groups.obj"
	-@erase "$(INTDIR)\perl_groups.sbr"
	-@erase "$(INTDIR)\perl_mob.obj"
	-@erase "$(INTDIR)\perl_mob.sbr"
	-@erase "$(INTDIR)\perl_npc.obj"
	-@erase "$(INTDIR)\perl_npc.sbr"
	-@erase "$(INTDIR)\perl_perlpacket.obj"
	-@erase "$(INTDIR)\perl_perlpacket.sbr"
	-@erase "$(INTDIR)\perl_PlayerCorpse.obj"
	-@erase "$(INTDIR)\perl_PlayerCorpse.sbr"
	-@erase "$(INTDIR)\perlpacket.obj"
	-@erase "$(INTDIR)\perlpacket.sbr"
	-@erase "$(INTDIR)\perlparser.obj"
	-@erase "$(INTDIR)\perlparser.sbr"
	-@erase "$(INTDIR)\petitions.obj"
	-@erase "$(INTDIR)\petitions.sbr"
	-@erase "$(INTDIR)\pets.obj"
	-@erase "$(INTDIR)\pets.sbr"
	-@erase "$(INTDIR)\PlayerCorpse.obj"
	-@erase "$(INTDIR)\PlayerCorpse.sbr"
	-@erase "$(INTDIR)\ptimer.obj"
	-@erase "$(INTDIR)\ptimer.sbr"
	-@erase "$(INTDIR)\questmgr.obj"
	-@erase "$(INTDIR)\questmgr.sbr"
	-@erase "$(INTDIR)\races.obj"
	-@erase "$(INTDIR)\races.sbr"
	-@erase "$(INTDIR)\rdtsc.obj"
	-@erase "$(INTDIR)\rdtsc.sbr"
	-@erase "$(INTDIR)\serverinfo.obj"
	-@erase "$(INTDIR)\serverinfo.sbr"
	-@erase "$(INTDIR)\SharedLibrary.obj"
	-@erase "$(INTDIR)\SharedLibrary.sbr"
	-@erase "$(INTDIR)\spawn2.obj"
	-@erase "$(INTDIR)\spawn2.sbr"
	-@erase "$(INTDIR)\spawngroup.obj"
	-@erase "$(INTDIR)\spawngroup.sbr"
	-@erase "$(INTDIR)\spdat.obj"
	-@erase "$(INTDIR)\spdat.sbr"
	-@erase "$(INTDIR)\special_attacks.obj"
	-@erase "$(INTDIR)\special_attacks.sbr"
	-@erase "$(INTDIR)\spell_effects.obj"
	-@erase "$(INTDIR)\spell_effects.sbr"
	-@erase "$(INTDIR)\spells.obj"
	-@erase "$(INTDIR)\spells.sbr"
	-@erase "$(INTDIR)\TCPConnection.obj"
	-@erase "$(INTDIR)\TCPConnection.sbr"
	-@erase "$(INTDIR)\timeoutmgr.obj"
	-@erase "$(INTDIR)\timeoutmgr.sbr"
	-@erase "$(INTDIR)\timer.obj"
	-@erase "$(INTDIR)\timer.sbr"
	-@erase "$(INTDIR)\titles.obj"
	-@erase "$(INTDIR)\titles.sbr"
	-@erase "$(INTDIR)\tradeskills.obj"
	-@erase "$(INTDIR)\tradeskills.sbr"
	-@erase "$(INTDIR)\trading.obj"
	-@erase "$(INTDIR)\trading.sbr"
	-@erase "$(INTDIR)\trap.obj"
	-@erase "$(INTDIR)\trap.sbr"
	-@erase "$(INTDIR)\tribute.obj"
	-@erase "$(INTDIR)\tribute.sbr"
	-@erase "$(INTDIR)\vc60.idb"
	-@erase "$(INTDIR)\vc60.pdb"
	-@erase "$(INTDIR)\waypoints.obj"
	-@erase "$(INTDIR)\waypoints.sbr"
	-@erase "$(INTDIR)\worldserver.obj"
	-@erase "$(INTDIR)\worldserver.sbr"
	-@erase "$(INTDIR)\zone.obj"
	-@erase "$(INTDIR)\zone.sbr"
	-@erase "$(INTDIR)\zonedbasync.obj"
	-@erase "$(INTDIR)\zonedbasync.sbr"
	-@erase "$(INTDIR)\zoning.obj"
	-@erase "$(INTDIR)\zoning.sbr"
	-@erase "$(OUTDIR)\Zone.bsc"
	-@erase "$(OUTDIR)\ZoneDebugPerl.exe"
	-@erase "$(OUTDIR)\ZoneDebugPerl.ilk"
	-@erase "$(OUTDIR)\ZoneDebugPerl.pdb"

"$(OUTDIR)" :
    if not exist "$(OUTDIR)/$(NULL)" mkdir "$(OUTDIR)"

"$(INTDIR)" :
    if not exist "$(INTDIR)/$(NULL)" mkdir "$(INTDIR)"

CPP=cl.exe
CPP_PROJ=/nologo /MTd /Gm /GX /Zi /Od /I "C:\perl\lib\core" /I "c:\mysql\include" /I "c:\eqemu\include" /D "EMBPERL" /D "EMBPERL_PLUGIN" /D "i386" /D "SHAREMEM" /D _WIN32_WINNT=0x0400 /D "ZONE" /D "INVERSEXY" /D "WIN32" /D "_CONSOLE" /D "_MBCS" /D "EQDEBUG" /D "FIELD_ITEMS" /FR"$(INTDIR)\\" /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\" /FD /GZ /c 

.c{$(INTDIR)}.obj::
   $(CPP) @<<
   $(CPP_PROJ) $< 
<<

.cpp{$(INTDIR)}.obj::
   $(CPP) @<<
   $(CPP_PROJ) $< 
<<

.cxx{$(INTDIR)}.obj::
   $(CPP) @<<
   $(CPP_PROJ) $< 
<<

.c{$(INTDIR)}.sbr::
   $(CPP) @<<
   $(CPP_PROJ) $< 
<<

.cpp{$(INTDIR)}.sbr::
   $(CPP) @<<
   $(CPP_PROJ) $< 
<<

.cxx{$(INTDIR)}.sbr::
   $(CPP) @<<
   $(CPP_PROJ) $< 
<<

RSC=rc.exe
BSC32=bscmake.exe
BSC32_FLAGS=/nologo /o"$(OUTDIR)\Zone.bsc" 
BSC32_SBRS= \
	"$(INTDIR)\AA.sbr" \
	"$(INTDIR)\aggro.sbr" \
	"$(INTDIR)\attack.sbr" \
	"$(INTDIR)\beacon.sbr" \
	"$(INTDIR)\bonuses.sbr" \
	"$(INTDIR)\client.sbr" \
	"$(INTDIR)\client_logs.sbr" \
	"$(INTDIR)\client_mods.sbr" \
	"$(INTDIR)\client_packet.sbr" \
	"$(INTDIR)\client_process.sbr" \
	"$(INTDIR)\command.sbr" \
	"$(INTDIR)\doors.sbr" \
	"$(INTDIR)\effects.sbr" \
	"$(INTDIR)\embparser.sbr" \
	"$(INTDIR)\embperl.sbr" \
	"$(INTDIR)\embxs.sbr" \
	"$(INTDIR)\entity.sbr" \
	"$(INTDIR)\EQEMuError.sbr" \
	"$(INTDIR)\exp.sbr" \
	"$(INTDIR)\faction.sbr" \
	"$(INTDIR)\fearpath.sbr" \
	"$(INTDIR)\forage.sbr" \
	"$(INTDIR)\groups.sbr" \
	"$(INTDIR)\guilds.sbr" \
	"$(INTDIR)\hate_list.sbr" \
	"$(INTDIR)\horse.sbr" \
	"$(INTDIR)\inventory.sbr" \
	"$(INTDIR)\loottables.sbr" \
	"$(INTDIR)\Map.sbr" \
	"$(INTDIR)\mob.sbr" \
	"$(INTDIR)\MobAI.sbr" \
	"$(INTDIR)\net.sbr" \
	"$(INTDIR)\npc.sbr" \
	"$(INTDIR)\Object.sbr" \
	"$(INTDIR)\parser.sbr" \
	"$(INTDIR)\pathing.sbr" \
	"$(INTDIR)\perl_client.sbr" \
	"$(INTDIR)\perl_entity.sbr" \
	"$(INTDIR)\perl_groups.sbr" \
	"$(INTDIR)\perl_mob.sbr" \
	"$(INTDIR)\perl_npc.sbr" \
	"$(INTDIR)\perl_perlpacket.sbr" \
	"$(INTDIR)\perl_PlayerCorpse.sbr" \
	"$(INTDIR)\perlpacket.sbr" \
	"$(INTDIR)\perlparser.sbr" \
	"$(INTDIR)\petitions.sbr" \
	"$(INTDIR)\pets.sbr" \
	"$(INTDIR)\PlayerCorpse.sbr" \
	"$(INTDIR)\ptimer.sbr" \
	"$(INTDIR)\questmgr.sbr" \
	"$(INTDIR)\spawn2.sbr" \
	"$(INTDIR)\spawngroup.sbr" \
	"$(INTDIR)\spdat.sbr" \
	"$(INTDIR)\special_attacks.sbr" \
	"$(INTDIR)\spell_effects.sbr" \
	"$(INTDIR)\spells.sbr" \
	"$(INTDIR)\titles.sbr" \
	"$(INTDIR)\tradeskills.sbr" \
	"$(INTDIR)\trading.sbr" \
	"$(INTDIR)\trap.sbr" \
	"$(INTDIR)\tribute.sbr" \
	"$(INTDIR)\waypoints.sbr" \
	"$(INTDIR)\worldserver.sbr" \
	"$(INTDIR)\zone.sbr" \
	"$(INTDIR)\zonedbasync.sbr" \
	"$(INTDIR)\zoning.sbr" \
	"$(INTDIR)\classes.sbr" \
	"$(INTDIR)\Condition.sbr" \
	"$(INTDIR)\CRC16.sbr" \
	"$(INTDIR)\crc32.sbr" \
	"$(INTDIR)\database.sbr" \
	"$(INTDIR)\dbasync.sbr" \
	"$(INTDIR)\dbcore.sbr" \
	"$(INTDIR)\DBMemLeak.sbr" \
	"$(INTDIR)\debug.sbr" \
	"$(INTDIR)\emu_opcodes.sbr" \
	"$(INTDIR)\EMuShareMem.sbr" \
	"$(INTDIR)\EQChatPacket.sbr" \
	"$(INTDIR)\EQLoginPacket.sbr" \
	"$(INTDIR)\EQMailPacket.sbr" \
	"$(INTDIR)\EQPacket.sbr" \
	"$(INTDIR)\EQStream.sbr" \
	"$(INTDIR)\EQStreamFactory.sbr" \
	"$(INTDIR)\eqtime.sbr" \
	"$(INTDIR)\EQWorldPacket.sbr" \
	"$(INTDIR)\EQZonePacket.sbr" \
	"$(INTDIR)\extprofile.sbr" \
	"$(INTDIR)\Item.sbr" \
	"$(INTDIR)\logsys.sbr" \
	"$(INTDIR)\md5.sbr" \
	"$(INTDIR)\misc.sbr" \
	"$(INTDIR)\MiscFunctions.sbr" \
	"$(INTDIR)\moremath.sbr" \
	"$(INTDIR)\Mutex.sbr" \
	"$(INTDIR)\opcodemgr.sbr" \
	"$(INTDIR)\packet_dump.sbr" \
	"$(INTDIR)\packet_dump_file.sbr" \
	"$(INTDIR)\packet_functions.sbr" \
	"$(INTDIR)\races.sbr" \
	"$(INTDIR)\rdtsc.sbr" \
	"$(INTDIR)\serverinfo.sbr" \
	"$(INTDIR)\SharedLibrary.sbr" \
	"$(INTDIR)\TCPConnection.sbr" \
	"$(INTDIR)\timeoutmgr.sbr" \
	"$(INTDIR)\timer.sbr"

"$(OUTDIR)\Zone.bsc" : "$(OUTDIR)" $(BSC32_SBRS)
    $(BSC32) @<<
  $(BSC32_FLAGS) $(BSC32_SBRS)
<<

LINK32=link.exe
LINK32_FLAGS=perl58.lib kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib odbc32.lib odbccp32.lib kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib odbc32.lib odbccp32.lib wsock32.lib zlib.lib mysqlclient.lib /nologo /subsystem:console /incremental:yes /pdb:"$(OUTDIR)\ZoneDebugPerl.pdb" /debug /machine:I386 /nodefaultlib:"LIBCMT" /nodefaultlib:"LIBC" /out:"$(OUTDIR)\ZoneDebugPerl.exe" /pdbtype:sept /libpath:"C:\perl\lib\core" /libpath:"c:\mysql\lib\opt" /libpath:"c:\eqemu\lib" 
LINK32_OBJS= \
	"$(INTDIR)\AA.obj" \
	"$(INTDIR)\aggro.obj" \
	"$(INTDIR)\attack.obj" \
	"$(INTDIR)\beacon.obj" \
	"$(INTDIR)\bonuses.obj" \
	"$(INTDIR)\client.obj" \
	"$(INTDIR)\client_logs.obj" \
	"$(INTDIR)\client_mods.obj" \
	"$(INTDIR)\client_packet.obj" \
	"$(INTDIR)\client_process.obj" \
	"$(INTDIR)\command.obj" \
	"$(INTDIR)\doors.obj" \
	"$(INTDIR)\effects.obj" \
	"$(INTDIR)\embparser.obj" \
	"$(INTDIR)\embperl.obj" \
	"$(INTDIR)\embxs.obj" \
	"$(INTDIR)\entity.obj" \
	"$(INTDIR)\EQEMuError.obj" \
	"$(INTDIR)\exp.obj" \
	"$(INTDIR)\faction.obj" \
	"$(INTDIR)\fearpath.obj" \
	"$(INTDIR)\forage.obj" \
	"$(INTDIR)\groups.obj" \
	"$(INTDIR)\guilds.obj" \
	"$(INTDIR)\hate_list.obj" \
	"$(INTDIR)\horse.obj" \
	"$(INTDIR)\inventory.obj" \
	"$(INTDIR)\loottables.obj" \
	"$(INTDIR)\Map.obj" \
	"$(INTDIR)\mob.obj" \
	"$(INTDIR)\MobAI.obj" \
	"$(INTDIR)\net.obj" \
	"$(INTDIR)\npc.obj" \
	"$(INTDIR)\Object.obj" \
	"$(INTDIR)\parser.obj" \
	"$(INTDIR)\pathing.obj" \
	"$(INTDIR)\perl_client.obj" \
	"$(INTDIR)\perl_entity.obj" \
	"$(INTDIR)\perl_groups.obj" \
	"$(INTDIR)\perl_mob.obj" \
	"$(INTDIR)\perl_npc.obj" \
	"$(INTDIR)\perl_perlpacket.obj" \
	"$(INTDIR)\perl_PlayerCorpse.obj" \
	"$(INTDIR)\perlpacket.obj" \
	"$(INTDIR)\perlparser.obj" \
	"$(INTDIR)\petitions.obj" \
	"$(INTDIR)\pets.obj" \
	"$(INTDIR)\PlayerCorpse.obj" \
	"$(INTDIR)\ptimer.obj" \
	"$(INTDIR)\questmgr.obj" \
	"$(INTDIR)\spawn2.obj" \
	"$(INTDIR)\spawngroup.obj" \
	"$(INTDIR)\spdat.obj" \
	"$(INTDIR)\special_attacks.obj" \
	"$(INTDIR)\spell_effects.obj" \
	"$(INTDIR)\spells.obj" \
	"$(INTDIR)\titles.obj" \
	"$(INTDIR)\tradeskills.obj" \
	"$(INTDIR)\trading.obj" \
	"$(INTDIR)\trap.obj" \
	"$(INTDIR)\tribute.obj" \
	"$(INTDIR)\waypoints.obj" \
	"$(INTDIR)\worldserver.obj" \
	"$(INTDIR)\zone.obj" \
	"$(INTDIR)\zonedbasync.obj" \
	"$(INTDIR)\zoning.obj" \
	"$(INTDIR)\classes.obj" \
	"$(INTDIR)\Condition.obj" \
	"$(INTDIR)\CRC16.obj" \
	"$(INTDIR)\crc32.obj" \
	"$(INTDIR)\database.obj" \
	"$(INTDIR)\dbasync.obj" \
	"$(INTDIR)\dbcore.obj" \
	"$(INTDIR)\DBMemLeak.obj" \
	"$(INTDIR)\debug.obj" \
	"$(INTDIR)\emu_opcodes.obj" \
	"$(INTDIR)\EMuShareMem.obj" \
	"$(INTDIR)\EQChatPacket.obj" \
	"$(INTDIR)\EQLoginPacket.obj" \
	"$(INTDIR)\EQMailPacket.obj" \
	"$(INTDIR)\EQPacket.obj" \
	"$(INTDIR)\EQStream.obj" \
	"$(INTDIR)\EQStreamFactory.obj" \
	"$(INTDIR)\eqtime.obj" \
	"$(INTDIR)\EQWorldPacket.obj" \
	"$(INTDIR)\EQZonePacket.obj" \
	"$(INTDIR)\extprofile.obj" \
	"$(INTDIR)\Item.obj" \
	"$(INTDIR)\logsys.obj" \
	"$(INTDIR)\md5.obj" \
	"$(INTDIR)\misc.obj" \
	"$(INTDIR)\MiscFunctions.obj" \
	"$(INTDIR)\moremath.obj" \
	"$(INTDIR)\Mutex.obj" \
	"$(INTDIR)\opcodemgr.obj" \
	"$(INTDIR)\packet_dump.obj" \
	"$(INTDIR)\packet_dump_file.obj" \
	"$(INTDIR)\packet_functions.obj" \
	"$(INTDIR)\races.obj" \
	"$(INTDIR)\rdtsc.obj" \
	"$(INTDIR)\serverinfo.obj" \
	"$(INTDIR)\SharedLibrary.obj" \
	"$(INTDIR)\TCPConnection.obj" \
	"$(INTDIR)\timeoutmgr.obj" \
	"$(INTDIR)\timer.obj"

"$(OUTDIR)\ZoneDebugPerl.exe" : "$(OUTDIR)" $(DEF_FILE) $(LINK32_OBJS)
    $(LINK32) @<<
  $(LINK32_FLAGS) $(LINK32_OBJS)
<<

!ELSEIF  "$(CFG)" == "Zone - Win32 ReleasePerl"

OUTDIR=.\Zone___Win32_ReleasePerl
INTDIR=.\Zone___Win32_ReleasePerl

ALL : "..\build\ZonePerl.exe"


CLEAN :
	-@erase "$(INTDIR)\AA.obj"
	-@erase "$(INTDIR)\aggro.obj"
	-@erase "$(INTDIR)\attack.obj"
	-@erase "$(INTDIR)\beacon.obj"
	-@erase "$(INTDIR)\bonuses.obj"
	-@erase "$(INTDIR)\classes.obj"
	-@erase "$(INTDIR)\client.obj"
	-@erase "$(INTDIR)\client_logs.obj"
	-@erase "$(INTDIR)\client_mods.obj"
	-@erase "$(INTDIR)\client_packet.obj"
	-@erase "$(INTDIR)\client_process.obj"
	-@erase "$(INTDIR)\command.obj"
	-@erase "$(INTDIR)\Condition.obj"
	-@erase "$(INTDIR)\CRC16.obj"
	-@erase "$(INTDIR)\crc32.obj"
	-@erase "$(INTDIR)\database.obj"
	-@erase "$(INTDIR)\dbasync.obj"
	-@erase "$(INTDIR)\dbcore.obj"
	-@erase "$(INTDIR)\DBMemLeak.obj"
	-@erase "$(INTDIR)\debug.obj"
	-@erase "$(INTDIR)\doors.obj"
	-@erase "$(INTDIR)\effects.obj"
	-@erase "$(INTDIR)\embparser.obj"
	-@erase "$(INTDIR)\embperl.obj"
	-@erase "$(INTDIR)\embxs.obj"
	-@erase "$(INTDIR)\emu_opcodes.obj"
	-@erase "$(INTDIR)\EMuShareMem.obj"
	-@erase "$(INTDIR)\entity.obj"
	-@erase "$(INTDIR)\EQChatPacket.obj"
	-@erase "$(INTDIR)\EQEMuError.obj"
	-@erase "$(INTDIR)\EQLoginPacket.obj"
	-@erase "$(INTDIR)\EQMailPacket.obj"
	-@erase "$(INTDIR)\EQPacket.obj"
	-@erase "$(INTDIR)\EQStream.obj"
	-@erase "$(INTDIR)\EQStreamFactory.obj"
	-@erase "$(INTDIR)\eqtime.obj"
	-@erase "$(INTDIR)\EQWorldPacket.obj"
	-@erase "$(INTDIR)\EQZonePacket.obj"
	-@erase "$(INTDIR)\exp.obj"
	-@erase "$(INTDIR)\extprofile.obj"
	-@erase "$(INTDIR)\faction.obj"
	-@erase "$(INTDIR)\fearpath.obj"
	-@erase "$(INTDIR)\forage.obj"
	-@erase "$(INTDIR)\groups.obj"
	-@erase "$(INTDIR)\guilds.obj"
	-@erase "$(INTDIR)\hate_list.obj"
	-@erase "$(INTDIR)\horse.obj"
	-@erase "$(INTDIR)\inventory.obj"
	-@erase "$(INTDIR)\Item.obj"
	-@erase "$(INTDIR)\logsys.obj"
	-@erase "$(INTDIR)\loottables.obj"
	-@erase "$(INTDIR)\Map.obj"
	-@erase "$(INTDIR)\md5.obj"
	-@erase "$(INTDIR)\misc.obj"
	-@erase "$(INTDIR)\MiscFunctions.obj"
	-@erase "$(INTDIR)\mob.obj"
	-@erase "$(INTDIR)\MobAI.obj"
	-@erase "$(INTDIR)\moremath.obj"
	-@erase "$(INTDIR)\Mutex.obj"
	-@erase "$(INTDIR)\net.obj"
	-@erase "$(INTDIR)\npc.obj"
	-@erase "$(INTDIR)\Object.obj"
	-@erase "$(INTDIR)\opcodemgr.obj"
	-@erase "$(INTDIR)\packet_dump.obj"
	-@erase "$(INTDIR)\packet_dump_file.obj"
	-@erase "$(INTDIR)\packet_functions.obj"
	-@erase "$(INTDIR)\parser.obj"
	-@erase "$(INTDIR)\pathing.obj"
	-@erase "$(INTDIR)\perl_client.obj"
	-@erase "$(INTDIR)\perl_entity.obj"
	-@erase "$(INTDIR)\perl_groups.obj"
	-@erase "$(INTDIR)\perl_mob.obj"
	-@erase "$(INTDIR)\perl_npc.obj"
	-@erase "$(INTDIR)\perl_perlpacket.obj"
	-@erase "$(INTDIR)\perl_PlayerCorpse.obj"
	-@erase "$(INTDIR)\perlpacket.obj"
	-@erase "$(INTDIR)\perlparser.obj"
	-@erase "$(INTDIR)\petitions.obj"
	-@erase "$(INTDIR)\pets.obj"
	-@erase "$(INTDIR)\PlayerCorpse.obj"
	-@erase "$(INTDIR)\ptimer.obj"
	-@erase "$(INTDIR)\questmgr.obj"
	-@erase "$(INTDIR)\races.obj"
	-@erase "$(INTDIR)\rdtsc.obj"
	-@erase "$(INTDIR)\serverinfo.obj"
	-@erase "$(INTDIR)\SharedLibrary.obj"
	-@erase "$(INTDIR)\spawn2.obj"
	-@erase "$(INTDIR)\spawngroup.obj"
	-@erase "$(INTDIR)\spdat.obj"
	-@erase "$(INTDIR)\special_attacks.obj"
	-@erase "$(INTDIR)\spell_effects.obj"
	-@erase "$(INTDIR)\spells.obj"
	-@erase "$(INTDIR)\TCPConnection.obj"
	-@erase "$(INTDIR)\timeoutmgr.obj"
	-@erase "$(INTDIR)\timer.obj"
	-@erase "$(INTDIR)\titles.obj"
	-@erase "$(INTDIR)\tradeskills.obj"
	-@erase "$(INTDIR)\trading.obj"
	-@erase "$(INTDIR)\trap.obj"
	-@erase "$(INTDIR)\tribute.obj"
	-@erase "$(INTDIR)\vc60.idb"
	-@erase "$(INTDIR)\vc60.pdb"
	-@erase "$(INTDIR)\waypoints.obj"
	-@erase "$(INTDIR)\worldserver.obj"
	-@erase "$(INTDIR)\zone.obj"
	-@erase "$(INTDIR)\zonedbasync.obj"
	-@erase "$(INTDIR)\zoning.obj"
	-@erase "..\build\ZonePerl.exe"

"$(OUTDIR)" :
    if not exist "$(OUTDIR)/$(NULL)" mkdir "$(OUTDIR)"

CPP=cl.exe
CPP_PROJ=/nologo /MD /Gm /GX /Zi /O2 /Ob2 /I "C:\perl\lib\core" /I "c:\mysql\include" /I "c:\eqemu\include" /D "EMBPERL" /D "EMBPERL_PLUGIN" /D "i386" /D "SHAREMEM" /D _WIN32_WINNT=0x0400 /D "ZONE" /D "INVERSEXY" /D "WIN32" /D "_CONSOLE" /D "_MBCS" /D "EQDEBUG" /D "FIELD_ITEMS" /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\" /FD /c 

.c{$(INTDIR)}.obj::
   $(CPP) @<<
   $(CPP_PROJ) $< 
<<

.cpp{$(INTDIR)}.obj::
   $(CPP) @<<
   $(CPP_PROJ) $< 
<<

.cxx{$(INTDIR)}.obj::
   $(CPP) @<<
   $(CPP_PROJ) $< 
<<

.c{$(INTDIR)}.sbr::
   $(CPP) @<<
   $(CPP_PROJ) $< 
<<

.cpp{$(INTDIR)}.sbr::
   $(CPP) @<<
   $(CPP_PROJ) $< 
<<

.cxx{$(INTDIR)}.sbr::
   $(CPP) @<<
   $(CPP_PROJ) $< 
<<

RSC=rc.exe
BSC32=bscmake.exe
BSC32_FLAGS=/nologo /o"$(OUTDIR)\Zone.bsc" 
BSC32_SBRS= \
	
LINK32=link.exe
LINK32_FLAGS=perl58.lib msvcrt.lib kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib odbc32.lib odbccp32.lib kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib odbc32.lib odbccp32.lib wsock32.lib zlib.lib mysqlclient.lib /nologo /subsystem:console /pdb:none /debug /machine:I386 /nodefaultlib:"LIBCMT" /out:"../build/ZonePerl.exe" /libpath:"C:\perl\lib\core" /libpath:"c:\mysql\lib\opt" /libpath:"c:\eqemu\lib" 
LINK32_OBJS= \
	"$(INTDIR)\AA.obj" \
	"$(INTDIR)\aggro.obj" \
	"$(INTDIR)\attack.obj" \
	"$(INTDIR)\beacon.obj" \
	"$(INTDIR)\bonuses.obj" \
	"$(INTDIR)\client.obj" \
	"$(INTDIR)\client_logs.obj" \
	"$(INTDIR)\client_mods.obj" \
	"$(INTDIR)\client_packet.obj" \
	"$(INTDIR)\client_process.obj" \
	"$(INTDIR)\command.obj" \
	"$(INTDIR)\doors.obj" \
	"$(INTDIR)\effects.obj" \
	"$(INTDIR)\embparser.obj" \
	"$(INTDIR)\embperl.obj" \
	"$(INTDIR)\embxs.obj" \
	"$(INTDIR)\entity.obj" \
	"$(INTDIR)\EQEMuError.obj" \
	"$(INTDIR)\exp.obj" \
	"$(INTDIR)\faction.obj" \
	"$(INTDIR)\fearpath.obj" \
	"$(INTDIR)\forage.obj" \
	"$(INTDIR)\groups.obj" \
	"$(INTDIR)\guilds.obj" \
	"$(INTDIR)\hate_list.obj" \
	"$(INTDIR)\horse.obj" \
	"$(INTDIR)\inventory.obj" \
	"$(INTDIR)\loottables.obj" \
	"$(INTDIR)\Map.obj" \
	"$(INTDIR)\mob.obj" \
	"$(INTDIR)\MobAI.obj" \
	"$(INTDIR)\net.obj" \
	"$(INTDIR)\npc.obj" \
	"$(INTDIR)\Object.obj" \
	"$(INTDIR)\parser.obj" \
	"$(INTDIR)\pathing.obj" \
	"$(INTDIR)\perl_client.obj" \
	"$(INTDIR)\perl_entity.obj" \
	"$(INTDIR)\perl_groups.obj" \
	"$(INTDIR)\perl_mob.obj" \
	"$(INTDIR)\perl_npc.obj" \
	"$(INTDIR)\perl_perlpacket.obj" \
	"$(INTDIR)\perl_PlayerCorpse.obj" \
	"$(INTDIR)\perlpacket.obj" \
	"$(INTDIR)\perlparser.obj" \
	"$(INTDIR)\petitions.obj" \
	"$(INTDIR)\pets.obj" \
	"$(INTDIR)\PlayerCorpse.obj" \
	"$(INTDIR)\ptimer.obj" \
	"$(INTDIR)\questmgr.obj" \
	"$(INTDIR)\spawn2.obj" \
	"$(INTDIR)\spawngroup.obj" \
	"$(INTDIR)\spdat.obj" \
	"$(INTDIR)\special_attacks.obj" \
	"$(INTDIR)\spell_effects.obj" \
	"$(INTDIR)\spells.obj" \
	"$(INTDIR)\titles.obj" \
	"$(INTDIR)\tradeskills.obj" \
	"$(INTDIR)\trading.obj" \
	"$(INTDIR)\trap.obj" \
	"$(INTDIR)\tribute.obj" \
	"$(INTDIR)\waypoints.obj" \
	"$(INTDIR)\worldserver.obj" \
	"$(INTDIR)\zone.obj" \
	"$(INTDIR)\zonedbasync.obj" \
	"$(INTDIR)\zoning.obj" \
	"$(INTDIR)\classes.obj" \
	"$(INTDIR)\Condition.obj" \
	"$(INTDIR)\CRC16.obj" \
	"$(INTDIR)\crc32.obj" \
	"$(INTDIR)\database.obj" \
	"$(INTDIR)\dbasync.obj" \
	"$(INTDIR)\dbcore.obj" \
	"$(INTDIR)\DBMemLeak.obj" \
	"$(INTDIR)\debug.obj" \
	"$(INTDIR)\emu_opcodes.obj" \
	"$(INTDIR)\EMuShareMem.obj" \
	"$(INTDIR)\EQChatPacket.obj" \
	"$(INTDIR)\EQLoginPacket.obj" \
	"$(INTDIR)\EQMailPacket.obj" \
	"$(INTDIR)\EQPacket.obj" \
	"$(INTDIR)\EQStream.obj" \
	"$(INTDIR)\EQStreamFactory.obj" \
	"$(INTDIR)\eqtime.obj" \
	"$(INTDIR)\EQWorldPacket.obj" \
	"$(INTDIR)\EQZonePacket.obj" \
	"$(INTDIR)\extprofile.obj" \
	"$(INTDIR)\Item.obj" \
	"$(INTDIR)\logsys.obj" \
	"$(INTDIR)\md5.obj" \
	"$(INTDIR)\misc.obj" \
	"$(INTDIR)\MiscFunctions.obj" \
	"$(INTDIR)\moremath.obj" \
	"$(INTDIR)\Mutex.obj" \
	"$(INTDIR)\opcodemgr.obj" \
	"$(INTDIR)\packet_dump.obj" \
	"$(INTDIR)\packet_dump_file.obj" \
	"$(INTDIR)\packet_functions.obj" \
	"$(INTDIR)\races.obj" \
	"$(INTDIR)\rdtsc.obj" \
	"$(INTDIR)\serverinfo.obj" \
	"$(INTDIR)\SharedLibrary.obj" \
	"$(INTDIR)\TCPConnection.obj" \
	"$(INTDIR)\timeoutmgr.obj" \
	"$(INTDIR)\timer.obj"

"..\build\ZonePerl.exe" : "$(OUTDIR)" $(DEF_FILE) $(LINK32_OBJS)
    $(LINK32) @<<
  $(LINK32_FLAGS) $(LINK32_OBJS)
<<

!ENDIF 


!IF "$(NO_EXTERNAL_DEPS)" != "1"
!IF EXISTS("Zone.dep")
!INCLUDE "Zone.dep"
!ELSE 
!MESSAGE Warning: cannot find "Zone.dep"
!ENDIF 
!ENDIF 


!IF "$(CFG)" == "Zone - Win32 Release" || "$(CFG)" == "Zone - Win32 Debug" || "$(CFG)" == "Zone - Win32 Raid Addicts" || "$(CFG)" == "Zone - Win32 DebugPerl" || "$(CFG)" == "Zone - Win32 ReleasePerl"
SOURCE=.\AA.cpp

!IF  "$(CFG)" == "Zone - Win32 Release"


"$(INTDIR)\AA.obj" : $(SOURCE) "$(INTDIR)"


!ELSEIF  "$(CFG)" == "Zone - Win32 Debug"


"$(INTDIR)\AA.obj"	"$(INTDIR)\AA.sbr" : $(SOURCE) "$(INTDIR)"


!ELSEIF  "$(CFG)" == "Zone - Win32 Raid Addicts"


"$(INTDIR)\AA.obj"	"$(INTDIR)\AA.sbr" : $(SOURCE) "$(INTDIR)"


!ELSEIF  "$(CFG)" == "Zone - Win32 DebugPerl"


"$(INTDIR)\AA.obj"	"$(INTDIR)\AA.sbr" : $(SOURCE) "$(INTDIR)"


!ELSEIF  "$(CFG)" == "Zone - Win32 ReleasePerl"


"$(INTDIR)\AA.obj" : $(SOURCE) "$(INTDIR)"


!ENDIF 

SOURCE=.\aggro.cpp

!IF  "$(CFG)" == "Zone - Win32 Release"


"$(INTDIR)\aggro.obj" : $(SOURCE) "$(INTDIR)"


!ELSEIF  "$(CFG)" == "Zone - Win32 Debug"


"$(INTDIR)\aggro.obj"	"$(INTDIR)\aggro.sbr" : $(SOURCE) "$(INTDIR)"


!ELSEIF  "$(CFG)" == "Zone - Win32 Raid Addicts"


"$(INTDIR)\aggro.obj"	"$(INTDIR)\aggro.sbr" : $(SOURCE) "$(INTDIR)"


!ELSEIF  "$(CFG)" == "Zone - Win32 DebugPerl"


"$(INTDIR)\aggro.obj"	"$(INTDIR)\aggro.sbr" : $(SOURCE) "$(INTDIR)"


!ELSEIF  "$(CFG)" == "Zone - Win32 ReleasePerl"


"$(INTDIR)\aggro.obj" : $(SOURCE) "$(INTDIR)"


!ENDIF 

SOURCE=.\attack.cpp

!IF  "$(CFG)" == "Zone - Win32 Release"


"$(INTDIR)\attack.obj" : $(SOURCE) "$(INTDIR)"


!ELSEIF  "$(CFG)" == "Zone - Win32 Debug"


"$(INTDIR)\attack.obj"	"$(INTDIR)\attack.sbr" : $(SOURCE) "$(INTDIR)"


!ELSEIF  "$(CFG)" == "Zone - Win32 Raid Addicts"


"$(INTDIR)\attack.obj"	"$(INTDIR)\attack.sbr" : $(SOURCE) "$(INTDIR)"


!ELSEIF  "$(CFG)" == "Zone - Win32 DebugPerl"


"$(INTDIR)\attack.obj"	"$(INTDIR)\attack.sbr" : $(SOURCE) "$(INTDIR)"


!ELSEIF  "$(CFG)" == "Zone - Win32 ReleasePerl"


"$(INTDIR)\attack.obj" : $(SOURCE) "$(INTDIR)"


!ENDIF 

SOURCE=.\beacon.cpp

!IF  "$(CFG)" == "Zone - Win32 Release"


"$(INTDIR)\beacon.obj" : $(SOURCE) "$(INTDIR)"


!ELSEIF  "$(CFG)" == "Zone - Win32 Debug"


"$(INTDIR)\beacon.obj"	"$(INTDIR)\beacon.sbr" : $(SOURCE) "$(INTDIR)"


!ELSEIF  "$(CFG)" == "Zone - Win32 Raid Addicts"


"$(INTDIR)\beacon.obj"	"$(INTDIR)\beacon.sbr" : $(SOURCE) "$(INTDIR)"


!ELSEIF  "$(CFG)" == "Zone - Win32 DebugPerl"


"$(INTDIR)\beacon.obj"	"$(INTDIR)\beacon.sbr" : $(SOURCE) "$(INTDIR)"


!ELSEIF  "$(CFG)" == "Zone - Win32 ReleasePerl"


"$(INTDIR)\beacon.obj" : $(SOURCE) "$(INTDIR)"


!ENDIF 

SOURCE=.\bonuses.cpp

!IF  "$(CFG)" == "Zone - Win32 Release"


"$(INTDIR)\bonuses.obj" : $(SOURCE) "$(INTDIR)"


!ELSEIF  "$(CFG)" == "Zone - Win32 Debug"


"$(INTDIR)\bonuses.obj"	"$(INTDIR)\bonuses.sbr" : $(SOURCE) "$(INTDIR)"


!ELSEIF  "$(CFG)" == "Zone - Win32 Raid Addicts"


"$(INTDIR)\bonuses.obj"	"$(INTDIR)\bonuses.sbr" : $(SOURCE) "$(INTDIR)"


!ELSEIF  "$(CFG)" == "Zone - Win32 DebugPerl"


"$(INTDIR)\bonuses.obj"	"$(INTDIR)\bonuses.sbr" : $(SOURCE) "$(INTDIR)"


!ELSEIF  "$(CFG)" == "Zone - Win32 ReleasePerl"


"$(INTDIR)\bonuses.obj" : $(SOURCE) "$(INTDIR)"


!ENDIF 

SOURCE=.\client.cpp

!IF  "$(CFG)" == "Zone - Win32 Release"


"$(INTDIR)\client.obj" : $(SOURCE) "$(INTDIR)"


!ELSEIF  "$(CFG)" == "Zone - Win32 Debug"


"$(INTDIR)\client.obj"	"$(INTDIR)\client.sbr" : $(SOURCE) "$(INTDIR)"


!ELSEIF  "$(CFG)" == "Zone - Win32 Raid Addicts"


"$(INTDIR)\client.obj"	"$(INTDIR)\client.sbr" : $(SOURCE) "$(INTDIR)"


!ELSEIF  "$(CFG)" == "Zone - Win32 DebugPerl"


"$(INTDIR)\client.obj"	"$(INTDIR)\client.sbr" : $(SOURCE) "$(INTDIR)"


!ELSEIF  "$(CFG)" == "Zone - Win32 ReleasePerl"


"$(INTDIR)\client.obj" : $(SOURCE) "$(INTDIR)"


!ENDIF 

SOURCE=.\client_logs.cpp

!IF  "$(CFG)" == "Zone - Win32 Release"


"$(INTDIR)\client_logs.obj" : $(SOURCE) "$(INTDIR)"


!ELSEIF  "$(CFG)" == "Zone - Win32 Debug"


"$(INTDIR)\client_logs.obj"	"$(INTDIR)\client_logs.sbr" : $(SOURCE) "$(INTDIR)"


!ELSEIF  "$(CFG)" == "Zone - Win32 Raid Addicts"


"$(INTDIR)\client_logs.obj"	"$(INTDIR)\client_logs.sbr" : $(SOURCE) "$(INTDIR)"


!ELSEIF  "$(CFG)" == "Zone - Win32 DebugPerl"


"$(INTDIR)\client_logs.obj"	"$(INTDIR)\client_logs.sbr" : $(SOURCE) "$(INTDIR)"


!ELSEIF  "$(CFG)" == "Zone - Win32 ReleasePerl"


"$(INTDIR)\client_logs.obj" : $(SOURCE) "$(INTDIR)"


!ENDIF 

SOURCE=.\client_mods.cpp

!IF  "$(CFG)" == "Zone - Win32 Release"


"$(INTDIR)\client_mods.obj" : $(SOURCE) "$(INTDIR)"


!ELSEIF  "$(CFG)" == "Zone - Win32 Debug"


"$(INTDIR)\client_mods.obj"	"$(INTDIR)\client_mods.sbr" : $(SOURCE) "$(INTDIR)"


!ELSEIF  "$(CFG)" == "Zone - Win32 Raid Addicts"


"$(INTDIR)\client_mods.obj"	"$(INTDIR)\client_mods.sbr" : $(SOURCE) "$(INTDIR)"


!ELSEIF  "$(CFG)" == "Zone - Win32 DebugPerl"


"$(INTDIR)\client_mods.obj"	"$(INTDIR)\client_mods.sbr" : $(SOURCE) "$(INTDIR)"


!ELSEIF  "$(CFG)" == "Zone - Win32 ReleasePerl"


"$(INTDIR)\client_mods.obj" : $(SOURCE) "$(INTDIR)"


!ENDIF 

SOURCE=.\client_packet.cpp

!IF  "$(CFG)" == "Zone - Win32 Release"


"$(INTDIR)\client_packet.obj" : $(SOURCE) "$(INTDIR)"


!ELSEIF  "$(CFG)" == "Zone - Win32 Debug"


"$(INTDIR)\client_packet.obj"	"$(INTDIR)\client_packet.sbr" : $(SOURCE) "$(INTDIR)"


!ELSEIF  "$(CFG)" == "Zone - Win32 Raid Addicts"


"$(INTDIR)\client_packet.obj"	"$(INTDIR)\client_packet.sbr" : $(SOURCE) "$(INTDIR)"


!ELSEIF  "$(CFG)" == "Zone - Win32 DebugPerl"


"$(INTDIR)\client_packet.obj"	"$(INTDIR)\client_packet.sbr" : $(SOURCE) "$(INTDIR)"


!ELSEIF  "$(CFG)" == "Zone - Win32 ReleasePerl"


"$(INTDIR)\client_packet.obj" : $(SOURCE) "$(INTDIR)"


!ENDIF 

SOURCE=.\client_process.cpp

!IF  "$(CFG)" == "Zone - Win32 Release"


"$(INTDIR)\client_process.obj" : $(SOURCE) "$(INTDIR)"


!ELSEIF  "$(CFG)" == "Zone - Win32 Debug"


"$(INTDIR)\client_process.obj"	"$(INTDIR)\client_process.sbr" : $(SOURCE) "$(INTDIR)"


!ELSEIF  "$(CFG)" == "Zone - Win32 Raid Addicts"


"$(INTDIR)\client_process.obj"	"$(INTDIR)\client_process.sbr" : $(SOURCE) "$(INTDIR)"


!ELSEIF  "$(CFG)" == "Zone - Win32 DebugPerl"


"$(INTDIR)\client_process.obj"	"$(INTDIR)\client_process.sbr" : $(SOURCE) "$(INTDIR)"


!ELSEIF  "$(CFG)" == "Zone - Win32 ReleasePerl"


"$(INTDIR)\client_process.obj" : $(SOURCE) "$(INTDIR)"


!ENDIF 

SOURCE=.\command.cpp

!IF  "$(CFG)" == "Zone - Win32 Release"


"$(INTDIR)\command.obj" : $(SOURCE) "$(INTDIR)"


!ELSEIF  "$(CFG)" == "Zone - Win32 Debug"


"$(INTDIR)\command.obj"	"$(INTDIR)\command.sbr" : $(SOURCE) "$(INTDIR)"


!ELSEIF  "$(CFG)" == "Zone - Win32 Raid Addicts"


"$(INTDIR)\command.obj"	"$(INTDIR)\command.sbr" : $(SOURCE) "$(INTDIR)"


!ELSEIF  "$(CFG)" == "Zone - Win32 DebugPerl"


"$(INTDIR)\command.obj"	"$(INTDIR)\command.sbr" : $(SOURCE) "$(INTDIR)"


!ELSEIF  "$(CFG)" == "Zone - Win32 ReleasePerl"


"$(INTDIR)\command.obj" : $(SOURCE) "$(INTDIR)"


!ENDIF 

SOURCE=.\doors.cpp

!IF  "$(CFG)" == "Zone - Win32 Release"


"$(INTDIR)\doors.obj" : $(SOURCE) "$(INTDIR)"


!ELSEIF  "$(CFG)" == "Zone - Win32 Debug"


"$(INTDIR)\doors.obj"	"$(INTDIR)\doors.sbr" : $(SOURCE) "$(INTDIR)"


!ELSEIF  "$(CFG)" == "Zone - Win32 Raid Addicts"


"$(INTDIR)\doors.obj"	"$(INTDIR)\doors.sbr" : $(SOURCE) "$(INTDIR)"


!ELSEIF  "$(CFG)" == "Zone - Win32 DebugPerl"


"$(INTDIR)\doors.obj"	"$(INTDIR)\doors.sbr" : $(SOURCE) "$(INTDIR)"


!ELSEIF  "$(CFG)" == "Zone - Win32 ReleasePerl"


"$(INTDIR)\doors.obj" : $(SOURCE) "$(INTDIR)"


!ENDIF 

SOURCE=.\effects.cpp

!IF  "$(CFG)" == "Zone - Win32 Release"


"$(INTDIR)\effects.obj" : $(SOURCE) "$(INTDIR)"


!ELSEIF  "$(CFG)" == "Zone - Win32 Debug"


"$(INTDIR)\effects.obj"	"$(INTDIR)\effects.sbr" : $(SOURCE) "$(INTDIR)"


!ELSEIF  "$(CFG)" == "Zone - Win32 Raid Addicts"


"$(INTDIR)\effects.obj"	"$(INTDIR)\effects.sbr" : $(SOURCE) "$(INTDIR)"


!ELSEIF  "$(CFG)" == "Zone - Win32 DebugPerl"


"$(INTDIR)\effects.obj"	"$(INTDIR)\effects.sbr" : $(SOURCE) "$(INTDIR)"


!ELSEIF  "$(CFG)" == "Zone - Win32 ReleasePerl"


"$(INTDIR)\effects.obj" : $(SOURCE) "$(INTDIR)"


!ENDIF 

SOURCE=.\embparser.cpp

!IF  "$(CFG)" == "Zone - Win32 Release"


"$(INTDIR)\embparser.obj" : $(SOURCE) "$(INTDIR)"


!ELSEIF  "$(CFG)" == "Zone - Win32 Debug"


"$(INTDIR)\embparser.obj"	"$(INTDIR)\embparser.sbr" : $(SOURCE) "$(INTDIR)"


!ELSEIF  "$(CFG)" == "Zone - Win32 Raid Addicts"


"$(INTDIR)\embparser.obj"	"$(INTDIR)\embparser.sbr" : $(SOURCE) "$(INTDIR)"


!ELSEIF  "$(CFG)" == "Zone - Win32 DebugPerl"


"$(INTDIR)\embparser.obj"	"$(INTDIR)\embparser.sbr" : $(SOURCE) "$(INTDIR)"


!ELSEIF  "$(CFG)" == "Zone - Win32 ReleasePerl"


"$(INTDIR)\embparser.obj" : $(SOURCE) "$(INTDIR)"


!ENDIF 

SOURCE=.\embperl.cpp

!IF  "$(CFG)" == "Zone - Win32 Release"


"$(INTDIR)\embperl.obj" : $(SOURCE) "$(INTDIR)"


!ELSEIF  "$(CFG)" == "Zone - Win32 Debug"


"$(INTDIR)\embperl.obj"	"$(INTDIR)\embperl.sbr" : $(SOURCE) "$(INTDIR)"


!ELSEIF  "$(CFG)" == "Zone - Win32 Raid Addicts"


"$(INTDIR)\embperl.obj"	"$(INTDIR)\embperl.sbr" : $(SOURCE) "$(INTDIR)"


!ELSEIF  "$(CFG)" == "Zone - Win32 DebugPerl"


"$(INTDIR)\embperl.obj"	"$(INTDIR)\embperl.sbr" : $(SOURCE) "$(INTDIR)"


!ELSEIF  "$(CFG)" == "Zone - Win32 ReleasePerl"


"$(INTDIR)\embperl.obj" : $(SOURCE) "$(INTDIR)"


!ENDIF 

SOURCE=.\embxs.cpp

!IF  "$(CFG)" == "Zone - Win32 Release"


"$(INTDIR)\embxs.obj" : $(SOURCE) "$(INTDIR)"


!ELSEIF  "$(CFG)" == "Zone - Win32 Debug"


"$(INTDIR)\embxs.obj"	"$(INTDIR)\embxs.sbr" : $(SOURCE) "$(INTDIR)"


!ELSEIF  "$(CFG)" == "Zone - Win32 Raid Addicts"


"$(INTDIR)\embxs.obj"	"$(INTDIR)\embxs.sbr" : $(SOURCE) "$(INTDIR)"


!ELSEIF  "$(CFG)" == "Zone - Win32 DebugPerl"


"$(INTDIR)\embxs.obj"	"$(INTDIR)\embxs.sbr" : $(SOURCE) "$(INTDIR)"


!ELSEIF  "$(CFG)" == "Zone - Win32 ReleasePerl"


"$(INTDIR)\embxs.obj" : $(SOURCE) "$(INTDIR)"


!ENDIF 

SOURCE=.\entity.cpp

!IF  "$(CFG)" == "Zone - Win32 Release"


"$(INTDIR)\entity.obj" : $(SOURCE) "$(INTDIR)"


!ELSEIF  "$(CFG)" == "Zone - Win32 Debug"


"$(INTDIR)\entity.obj"	"$(INTDIR)\entity.sbr" : $(SOURCE) "$(INTDIR)"


!ELSEIF  "$(CFG)" == "Zone - Win32 Raid Addicts"


"$(INTDIR)\entity.obj"	"$(INTDIR)\entity.sbr" : $(SOURCE) "$(INTDIR)"


!ELSEIF  "$(CFG)" == "Zone - Win32 DebugPerl"


"$(INTDIR)\entity.obj"	"$(INTDIR)\entity.sbr" : $(SOURCE) "$(INTDIR)"


!ELSEIF  "$(CFG)" == "Zone - Win32 ReleasePerl"


"$(INTDIR)\entity.obj" : $(SOURCE) "$(INTDIR)"


!ENDIF 

SOURCE=..\common\EQEMuError.cpp

!IF  "$(CFG)" == "Zone - Win32 Release"


"$(INTDIR)\EQEMuError.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Zone - Win32 Debug"


"$(INTDIR)\EQEMuError.obj"	"$(INTDIR)\EQEMuError.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Zone - Win32 Raid Addicts"


"$(INTDIR)\EQEMuError.obj"	"$(INTDIR)\EQEMuError.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Zone - Win32 DebugPerl"


"$(INTDIR)\EQEMuError.obj"	"$(INTDIR)\EQEMuError.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Zone - Win32 ReleasePerl"


"$(INTDIR)\EQEMuError.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ENDIF 

SOURCE=.\exp.cpp

!IF  "$(CFG)" == "Zone - Win32 Release"


"$(INTDIR)\exp.obj" : $(SOURCE) "$(INTDIR)"


!ELSEIF  "$(CFG)" == "Zone - Win32 Debug"


"$(INTDIR)\exp.obj"	"$(INTDIR)\exp.sbr" : $(SOURCE) "$(INTDIR)"


!ELSEIF  "$(CFG)" == "Zone - Win32 Raid Addicts"


"$(INTDIR)\exp.obj"	"$(INTDIR)\exp.sbr" : $(SOURCE) "$(INTDIR)"


!ELSEIF  "$(CFG)" == "Zone - Win32 DebugPerl"


"$(INTDIR)\exp.obj"	"$(INTDIR)\exp.sbr" : $(SOURCE) "$(INTDIR)"


!ELSEIF  "$(CFG)" == "Zone - Win32 ReleasePerl"


"$(INTDIR)\exp.obj" : $(SOURCE) "$(INTDIR)"


!ENDIF 

SOURCE=.\faction.cpp

!IF  "$(CFG)" == "Zone - Win32 Release"


"$(INTDIR)\faction.obj" : $(SOURCE) "$(INTDIR)"


!ELSEIF  "$(CFG)" == "Zone - Win32 Debug"


"$(INTDIR)\faction.obj"	"$(INTDIR)\faction.sbr" : $(SOURCE) "$(INTDIR)"


!ELSEIF  "$(CFG)" == "Zone - Win32 Raid Addicts"


"$(INTDIR)\faction.obj"	"$(INTDIR)\faction.sbr" : $(SOURCE) "$(INTDIR)"


!ELSEIF  "$(CFG)" == "Zone - Win32 DebugPerl"


"$(INTDIR)\faction.obj"	"$(INTDIR)\faction.sbr" : $(SOURCE) "$(INTDIR)"


!ELSEIF  "$(CFG)" == "Zone - Win32 ReleasePerl"


"$(INTDIR)\faction.obj" : $(SOURCE) "$(INTDIR)"


!ENDIF 

SOURCE=.\fearpath.cpp

!IF  "$(CFG)" == "Zone - Win32 Release"


"$(INTDIR)\fearpath.obj" : $(SOURCE) "$(INTDIR)"


!ELSEIF  "$(CFG)" == "Zone - Win32 Debug"


"$(INTDIR)\fearpath.obj"	"$(INTDIR)\fearpath.sbr" : $(SOURCE) "$(INTDIR)"


!ELSEIF  "$(CFG)" == "Zone - Win32 Raid Addicts"


"$(INTDIR)\fearpath.obj"	"$(INTDIR)\fearpath.sbr" : $(SOURCE) "$(INTDIR)"


!ELSEIF  "$(CFG)" == "Zone - Win32 DebugPerl"


"$(INTDIR)\fearpath.obj"	"$(INTDIR)\fearpath.sbr" : $(SOURCE) "$(INTDIR)"


!ELSEIF  "$(CFG)" == "Zone - Win32 ReleasePerl"


"$(INTDIR)\fearpath.obj" : $(SOURCE) "$(INTDIR)"


!ENDIF 

SOURCE=.\forage.cpp

!IF  "$(CFG)" == "Zone - Win32 Release"


"$(INTDIR)\forage.obj" : $(SOURCE) "$(INTDIR)"


!ELSEIF  "$(CFG)" == "Zone - Win32 Debug"


"$(INTDIR)\forage.obj"	"$(INTDIR)\forage.sbr" : $(SOURCE) "$(INTDIR)"


!ELSEIF  "$(CFG)" == "Zone - Win32 Raid Addicts"


"$(INTDIR)\forage.obj"	"$(INTDIR)\forage.sbr" : $(SOURCE) "$(INTDIR)"


!ELSEIF  "$(CFG)" == "Zone - Win32 DebugPerl"


"$(INTDIR)\forage.obj"	"$(INTDIR)\forage.sbr" : $(SOURCE) "$(INTDIR)"


!ELSEIF  "$(CFG)" == "Zone - Win32 ReleasePerl"


"$(INTDIR)\forage.obj" : $(SOURCE) "$(INTDIR)"


!ENDIF 

SOURCE=.\groups.cpp

!IF  "$(CFG)" == "Zone - Win32 Release"


"$(INTDIR)\groups.obj" : $(SOURCE) "$(INTDIR)"


!ELSEIF  "$(CFG)" == "Zone - Win32 Debug"


"$(INTDIR)\groups.obj"	"$(INTDIR)\groups.sbr" : $(SOURCE) "$(INTDIR)"


!ELSEIF  "$(CFG)" == "Zone - Win32 Raid Addicts"


"$(INTDIR)\groups.obj"	"$(INTDIR)\groups.sbr" : $(SOURCE) "$(INTDIR)"


!ELSEIF  "$(CFG)" == "Zone - Win32 DebugPerl"


"$(INTDIR)\groups.obj"	"$(INTDIR)\groups.sbr" : $(SOURCE) "$(INTDIR)"


!ELSEIF  "$(CFG)" == "Zone - Win32 ReleasePerl"


"$(INTDIR)\groups.obj" : $(SOURCE) "$(INTDIR)"


!ENDIF 

SOURCE=.\guilds.cpp

!IF  "$(CFG)" == "Zone - Win32 Release"


"$(INTDIR)\guilds.obj" : $(SOURCE) "$(INTDIR)"


!ELSEIF  "$(CFG)" == "Zone - Win32 Debug"


"$(INTDIR)\guilds.obj"	"$(INTDIR)\guilds.sbr" : $(SOURCE) "$(INTDIR)"


!ELSEIF  "$(CFG)" == "Zone - Win32 Raid Addicts"


"$(INTDIR)\guilds.obj"	"$(INTDIR)\guilds.sbr" : $(SOURCE) "$(INTDIR)"


!ELSEIF  "$(CFG)" == "Zone - Win32 DebugPerl"


"$(INTDIR)\guilds.obj"	"$(INTDIR)\guilds.sbr" : $(SOURCE) "$(INTDIR)"


!ELSEIF  "$(CFG)" == "Zone - Win32 ReleasePerl"


"$(INTDIR)\guilds.obj" : $(SOURCE) "$(INTDIR)"


!ENDIF 

SOURCE=.\hate_list.cpp

!IF  "$(CFG)" == "Zone - Win32 Release"


"$(INTDIR)\hate_list.obj" : $(SOURCE) "$(INTDIR)"


!ELSEIF  "$(CFG)" == "Zone - Win32 Debug"


"$(INTDIR)\hate_list.obj"	"$(INTDIR)\hate_list.sbr" : $(SOURCE) "$(INTDIR)"


!ELSEIF  "$(CFG)" == "Zone - Win32 Raid Addicts"


"$(INTDIR)\hate_list.obj"	"$(INTDIR)\hate_list.sbr" : $(SOURCE) "$(INTDIR)"


!ELSEIF  "$(CFG)" == "Zone - Win32 DebugPerl"


"$(INTDIR)\hate_list.obj"	"$(INTDIR)\hate_list.sbr" : $(SOURCE) "$(INTDIR)"


!ELSEIF  "$(CFG)" == "Zone - Win32 ReleasePerl"


"$(INTDIR)\hate_list.obj" : $(SOURCE) "$(INTDIR)"


!ENDIF 

SOURCE=.\horse.cpp

!IF  "$(CFG)" == "Zone - Win32 Release"


"$(INTDIR)\horse.obj" : $(SOURCE) "$(INTDIR)"


!ELSEIF  "$(CFG)" == "Zone - Win32 Debug"


"$(INTDIR)\horse.obj"	"$(INTDIR)\horse.sbr" : $(SOURCE) "$(INTDIR)"


!ELSEIF  "$(CFG)" == "Zone - Win32 Raid Addicts"


"$(INTDIR)\horse.obj"	"$(INTDIR)\horse.sbr" : $(SOURCE) "$(INTDIR)"


!ELSEIF  "$(CFG)" == "Zone - Win32 DebugPerl"


"$(INTDIR)\horse.obj"	"$(INTDIR)\horse.sbr" : $(SOURCE) "$(INTDIR)"


!ELSEIF  "$(CFG)" == "Zone - Win32 ReleasePerl"


"$(INTDIR)\horse.obj" : $(SOURCE) "$(INTDIR)"


!ENDIF 

SOURCE=.\inventory.cpp

!IF  "$(CFG)" == "Zone - Win32 Release"


"$(INTDIR)\inventory.obj" : $(SOURCE) "$(INTDIR)"


!ELSEIF  "$(CFG)" == "Zone - Win32 Debug"


"$(INTDIR)\inventory.obj"	"$(INTDIR)\inventory.sbr" : $(SOURCE) "$(INTDIR)"


!ELSEIF  "$(CFG)" == "Zone - Win32 Raid Addicts"


"$(INTDIR)\inventory.obj"	"$(INTDIR)\inventory.sbr" : $(SOURCE) "$(INTDIR)"


!ELSEIF  "$(CFG)" == "Zone - Win32 DebugPerl"


"$(INTDIR)\inventory.obj"	"$(INTDIR)\inventory.sbr" : $(SOURCE) "$(INTDIR)"


!ELSEIF  "$(CFG)" == "Zone - Win32 ReleasePerl"


"$(INTDIR)\inventory.obj" : $(SOURCE) "$(INTDIR)"


!ENDIF 

SOURCE=.\loottables.cpp

!IF  "$(CFG)" == "Zone - Win32 Release"


"$(INTDIR)\loottables.obj" : $(SOURCE) "$(INTDIR)"


!ELSEIF  "$(CFG)" == "Zone - Win32 Debug"


"$(INTDIR)\loottables.obj"	"$(INTDIR)\loottables.sbr" : $(SOURCE) "$(INTDIR)"


!ELSEIF  "$(CFG)" == "Zone - Win32 Raid Addicts"


"$(INTDIR)\loottables.obj"	"$(INTDIR)\loottables.sbr" : $(SOURCE) "$(INTDIR)"


!ELSEIF  "$(CFG)" == "Zone - Win32 DebugPerl"


"$(INTDIR)\loottables.obj"	"$(INTDIR)\loottables.sbr" : $(SOURCE) "$(INTDIR)"


!ELSEIF  "$(CFG)" == "Zone - Win32 ReleasePerl"


"$(INTDIR)\loottables.obj" : $(SOURCE) "$(INTDIR)"


!ENDIF 

SOURCE=.\Map.cpp

!IF  "$(CFG)" == "Zone - Win32 Release"


"$(INTDIR)\Map.obj" : $(SOURCE) "$(INTDIR)"


!ELSEIF  "$(CFG)" == "Zone - Win32 Debug"


"$(INTDIR)\Map.obj"	"$(INTDIR)\Map.sbr" : $(SOURCE) "$(INTDIR)"


!ELSEIF  "$(CFG)" == "Zone - Win32 Raid Addicts"


"$(INTDIR)\Map.obj"	"$(INTDIR)\Map.sbr" : $(SOURCE) "$(INTDIR)"


!ELSEIF  "$(CFG)" == "Zone - Win32 DebugPerl"


"$(INTDIR)\Map.obj"	"$(INTDIR)\Map.sbr" : $(SOURCE) "$(INTDIR)"


!ELSEIF  "$(CFG)" == "Zone - Win32 ReleasePerl"


"$(INTDIR)\Map.obj" : $(SOURCE) "$(INTDIR)"


!ENDIF 

SOURCE=.\mob.cpp

!IF  "$(CFG)" == "Zone - Win32 Release"


"$(INTDIR)\mob.obj" : $(SOURCE) "$(INTDIR)"


!ELSEIF  "$(CFG)" == "Zone - Win32 Debug"


"$(INTDIR)\mob.obj"	"$(INTDIR)\mob.sbr" : $(SOURCE) "$(INTDIR)"


!ELSEIF  "$(CFG)" == "Zone - Win32 Raid Addicts"


"$(INTDIR)\mob.obj"	"$(INTDIR)\mob.sbr" : $(SOURCE) "$(INTDIR)"


!ELSEIF  "$(CFG)" == "Zone - Win32 DebugPerl"


"$(INTDIR)\mob.obj"	"$(INTDIR)\mob.sbr" : $(SOURCE) "$(INTDIR)"


!ELSEIF  "$(CFG)" == "Zone - Win32 ReleasePerl"


"$(INTDIR)\mob.obj" : $(SOURCE) "$(INTDIR)"


!ENDIF 

SOURCE=.\MobAI.cpp

!IF  "$(CFG)" == "Zone - Win32 Release"


"$(INTDIR)\MobAI.obj" : $(SOURCE) "$(INTDIR)"


!ELSEIF  "$(CFG)" == "Zone - Win32 Debug"


"$(INTDIR)\MobAI.obj"	"$(INTDIR)\MobAI.sbr" : $(SOURCE) "$(INTDIR)"


!ELSEIF  "$(CFG)" == "Zone - Win32 Raid Addicts"


"$(INTDIR)\MobAI.obj"	"$(INTDIR)\MobAI.sbr" : $(SOURCE) "$(INTDIR)"


!ELSEIF  "$(CFG)" == "Zone - Win32 DebugPerl"


"$(INTDIR)\MobAI.obj"	"$(INTDIR)\MobAI.sbr" : $(SOURCE) "$(INTDIR)"


!ELSEIF  "$(CFG)" == "Zone - Win32 ReleasePerl"


"$(INTDIR)\MobAI.obj" : $(SOURCE) "$(INTDIR)"


!ENDIF 

SOURCE=.\net.cpp

!IF  "$(CFG)" == "Zone - Win32 Release"


"$(INTDIR)\net.obj" : $(SOURCE) "$(INTDIR)"


!ELSEIF  "$(CFG)" == "Zone - Win32 Debug"


"$(INTDIR)\net.obj"	"$(INTDIR)\net.sbr" : $(SOURCE) "$(INTDIR)"


!ELSEIF  "$(CFG)" == "Zone - Win32 Raid Addicts"


"$(INTDIR)\net.obj"	"$(INTDIR)\net.sbr" : $(SOURCE) "$(INTDIR)"


!ELSEIF  "$(CFG)" == "Zone - Win32 DebugPerl"


"$(INTDIR)\net.obj"	"$(INTDIR)\net.sbr" : $(SOURCE) "$(INTDIR)"


!ELSEIF  "$(CFG)" == "Zone - Win32 ReleasePerl"


"$(INTDIR)\net.obj" : $(SOURCE) "$(INTDIR)"


!ENDIF 

SOURCE=.\npc.cpp

!IF  "$(CFG)" == "Zone - Win32 Release"


"$(INTDIR)\npc.obj" : $(SOURCE) "$(INTDIR)"


!ELSEIF  "$(CFG)" == "Zone - Win32 Debug"


"$(INTDIR)\npc.obj"	"$(INTDIR)\npc.sbr" : $(SOURCE) "$(INTDIR)"


!ELSEIF  "$(CFG)" == "Zone - Win32 Raid Addicts"


"$(INTDIR)\npc.obj"	"$(INTDIR)\npc.sbr" : $(SOURCE) "$(INTDIR)"


!ELSEIF  "$(CFG)" == "Zone - Win32 DebugPerl"


"$(INTDIR)\npc.obj"	"$(INTDIR)\npc.sbr" : $(SOURCE) "$(INTDIR)"


!ELSEIF  "$(CFG)" == "Zone - Win32 ReleasePerl"


"$(INTDIR)\npc.obj" : $(SOURCE) "$(INTDIR)"


!ENDIF 

SOURCE=.\Object.cpp

!IF  "$(CFG)" == "Zone - Win32 Release"


"$(INTDIR)\Object.obj" : $(SOURCE) "$(INTDIR)"


!ELSEIF  "$(CFG)" == "Zone - Win32 Debug"


"$(INTDIR)\Object.obj"	"$(INTDIR)\Object.sbr" : $(SOURCE) "$(INTDIR)"


!ELSEIF  "$(CFG)" == "Zone - Win32 Raid Addicts"


"$(INTDIR)\Object.obj"	"$(INTDIR)\Object.sbr" : $(SOURCE) "$(INTDIR)"


!ELSEIF  "$(CFG)" == "Zone - Win32 DebugPerl"


"$(INTDIR)\Object.obj"	"$(INTDIR)\Object.sbr" : $(SOURCE) "$(INTDIR)"


!ELSEIF  "$(CFG)" == "Zone - Win32 ReleasePerl"


"$(INTDIR)\Object.obj" : $(SOURCE) "$(INTDIR)"


!ENDIF 

SOURCE=.\parser.cpp

!IF  "$(CFG)" == "Zone - Win32 Release"


"$(INTDIR)\parser.obj" : $(SOURCE) "$(INTDIR)"


!ELSEIF  "$(CFG)" == "Zone - Win32 Debug"


"$(INTDIR)\parser.obj"	"$(INTDIR)\parser.sbr" : $(SOURCE) "$(INTDIR)"


!ELSEIF  "$(CFG)" == "Zone - Win32 Raid Addicts"


"$(INTDIR)\parser.obj"	"$(INTDIR)\parser.sbr" : $(SOURCE) "$(INTDIR)"


!ELSEIF  "$(CFG)" == "Zone - Win32 DebugPerl"


"$(INTDIR)\parser.obj"	"$(INTDIR)\parser.sbr" : $(SOURCE) "$(INTDIR)"


!ELSEIF  "$(CFG)" == "Zone - Win32 ReleasePerl"


"$(INTDIR)\parser.obj" : $(SOURCE) "$(INTDIR)"


!ENDIF 

SOURCE=.\pathing.cpp

!IF  "$(CFG)" == "Zone - Win32 Release"


"$(INTDIR)\pathing.obj" : $(SOURCE) "$(INTDIR)"


!ELSEIF  "$(CFG)" == "Zone - Win32 Debug"


"$(INTDIR)\pathing.obj"	"$(INTDIR)\pathing.sbr" : $(SOURCE) "$(INTDIR)"


!ELSEIF  "$(CFG)" == "Zone - Win32 Raid Addicts"


"$(INTDIR)\pathing.obj"	"$(INTDIR)\pathing.sbr" : $(SOURCE) "$(INTDIR)"


!ELSEIF  "$(CFG)" == "Zone - Win32 DebugPerl"


"$(INTDIR)\pathing.obj"	"$(INTDIR)\pathing.sbr" : $(SOURCE) "$(INTDIR)"


!ELSEIF  "$(CFG)" == "Zone - Win32 ReleasePerl"


"$(INTDIR)\pathing.obj" : $(SOURCE) "$(INTDIR)"


!ENDIF 

SOURCE=.\perl_client.cpp

!IF  "$(CFG)" == "Zone - Win32 Release"


"$(INTDIR)\perl_client.obj" : $(SOURCE) "$(INTDIR)"


!ELSEIF  "$(CFG)" == "Zone - Win32 Debug"


"$(INTDIR)\perl_client.obj"	"$(INTDIR)\perl_client.sbr" : $(SOURCE) "$(INTDIR)"


!ELSEIF  "$(CFG)" == "Zone - Win32 Raid Addicts"


"$(INTDIR)\perl_client.obj"	"$(INTDIR)\perl_client.sbr" : $(SOURCE) "$(INTDIR)"


!ELSEIF  "$(CFG)" == "Zone - Win32 DebugPerl"


"$(INTDIR)\perl_client.obj"	"$(INTDIR)\perl_client.sbr" : $(SOURCE) "$(INTDIR)"


!ELSEIF  "$(CFG)" == "Zone - Win32 ReleasePerl"


"$(INTDIR)\perl_client.obj" : $(SOURCE) "$(INTDIR)"


!ENDIF 

SOURCE=.\perl_entity.cpp

!IF  "$(CFG)" == "Zone - Win32 Release"


"$(INTDIR)\perl_entity.obj" : $(SOURCE) "$(INTDIR)"


!ELSEIF  "$(CFG)" == "Zone - Win32 Debug"


"$(INTDIR)\perl_entity.obj"	"$(INTDIR)\perl_entity.sbr" : $(SOURCE) "$(INTDIR)"


!ELSEIF  "$(CFG)" == "Zone - Win32 Raid Addicts"


"$(INTDIR)\perl_entity.obj"	"$(INTDIR)\perl_entity.sbr" : $(SOURCE) "$(INTDIR)"


!ELSEIF  "$(CFG)" == "Zone - Win32 DebugPerl"


"$(INTDIR)\perl_entity.obj"	"$(INTDIR)\perl_entity.sbr" : $(SOURCE) "$(INTDIR)"


!ELSEIF  "$(CFG)" == "Zone - Win32 ReleasePerl"


"$(INTDIR)\perl_entity.obj" : $(SOURCE) "$(INTDIR)"


!ENDIF 

SOURCE=.\perl_groups.cpp

!IF  "$(CFG)" == "Zone - Win32 Release"


"$(INTDIR)\perl_groups.obj" : $(SOURCE) "$(INTDIR)"


!ELSEIF  "$(CFG)" == "Zone - Win32 Debug"


"$(INTDIR)\perl_groups.obj"	"$(INTDIR)\perl_groups.sbr" : $(SOURCE) "$(INTDIR)"


!ELSEIF  "$(CFG)" == "Zone - Win32 Raid Addicts"


"$(INTDIR)\perl_groups.obj"	"$(INTDIR)\perl_groups.sbr" : $(SOURCE) "$(INTDIR)"


!ELSEIF  "$(CFG)" == "Zone - Win32 DebugPerl"


"$(INTDIR)\perl_groups.obj"	"$(INTDIR)\perl_groups.sbr" : $(SOURCE) "$(INTDIR)"


!ELSEIF  "$(CFG)" == "Zone - Win32 ReleasePerl"


"$(INTDIR)\perl_groups.obj" : $(SOURCE) "$(INTDIR)"


!ENDIF 

SOURCE=.\perl_mob.cpp

!IF  "$(CFG)" == "Zone - Win32 Release"


"$(INTDIR)\perl_mob.obj" : $(SOURCE) "$(INTDIR)"


!ELSEIF  "$(CFG)" == "Zone - Win32 Debug"


"$(INTDIR)\perl_mob.obj"	"$(INTDIR)\perl_mob.sbr" : $(SOURCE) "$(INTDIR)"


!ELSEIF  "$(CFG)" == "Zone - Win32 Raid Addicts"


"$(INTDIR)\perl_mob.obj"	"$(INTDIR)\perl_mob.sbr" : $(SOURCE) "$(INTDIR)"


!ELSEIF  "$(CFG)" == "Zone - Win32 DebugPerl"


"$(INTDIR)\perl_mob.obj"	"$(INTDIR)\perl_mob.sbr" : $(SOURCE) "$(INTDIR)"


!ELSEIF  "$(CFG)" == "Zone - Win32 ReleasePerl"


"$(INTDIR)\perl_mob.obj" : $(SOURCE) "$(INTDIR)"


!ENDIF 

SOURCE=.\perl_npc.cpp

!IF  "$(CFG)" == "Zone - Win32 Release"


"$(INTDIR)\perl_npc.obj" : $(SOURCE) "$(INTDIR)"


!ELSEIF  "$(CFG)" == "Zone - Win32 Debug"


"$(INTDIR)\perl_npc.obj"	"$(INTDIR)\perl_npc.sbr" : $(SOURCE) "$(INTDIR)"


!ELSEIF  "$(CFG)" == "Zone - Win32 Raid Addicts"


"$(INTDIR)\perl_npc.obj"	"$(INTDIR)\perl_npc.sbr" : $(SOURCE) "$(INTDIR)"


!ELSEIF  "$(CFG)" == "Zone - Win32 DebugPerl"


"$(INTDIR)\perl_npc.obj"	"$(INTDIR)\perl_npc.sbr" : $(SOURCE) "$(INTDIR)"


!ELSEIF  "$(CFG)" == "Zone - Win32 ReleasePerl"


"$(INTDIR)\perl_npc.obj" : $(SOURCE) "$(INTDIR)"


!ENDIF 

SOURCE=.\perl_perlpacket.cpp

!IF  "$(CFG)" == "Zone - Win32 Release"


"$(INTDIR)\perl_perlpacket.obj" : $(SOURCE) "$(INTDIR)"


!ELSEIF  "$(CFG)" == "Zone - Win32 Debug"


"$(INTDIR)\perl_perlpacket.obj"	"$(INTDIR)\perl_perlpacket.sbr" : $(SOURCE) "$(INTDIR)"


!ELSEIF  "$(CFG)" == "Zone - Win32 Raid Addicts"


"$(INTDIR)\perl_perlpacket.obj"	"$(INTDIR)\perl_perlpacket.sbr" : $(SOURCE) "$(INTDIR)"


!ELSEIF  "$(CFG)" == "Zone - Win32 DebugPerl"


"$(INTDIR)\perl_perlpacket.obj"	"$(INTDIR)\perl_perlpacket.sbr" : $(SOURCE) "$(INTDIR)"


!ELSEIF  "$(CFG)" == "Zone - Win32 ReleasePerl"


"$(INTDIR)\perl_perlpacket.obj" : $(SOURCE) "$(INTDIR)"


!ENDIF 

SOURCE=.\perl_PlayerCorpse.cpp

!IF  "$(CFG)" == "Zone - Win32 Release"


"$(INTDIR)\perl_PlayerCorpse.obj" : $(SOURCE) "$(INTDIR)"


!ELSEIF  "$(CFG)" == "Zone - Win32 Debug"


"$(INTDIR)\perl_PlayerCorpse.obj"	"$(INTDIR)\perl_PlayerCorpse.sbr" : $(SOURCE) "$(INTDIR)"


!ELSEIF  "$(CFG)" == "Zone - Win32 Raid Addicts"


"$(INTDIR)\perl_PlayerCorpse.obj"	"$(INTDIR)\perl_PlayerCorpse.sbr" : $(SOURCE) "$(INTDIR)"


!ELSEIF  "$(CFG)" == "Zone - Win32 DebugPerl"


"$(INTDIR)\perl_PlayerCorpse.obj"	"$(INTDIR)\perl_PlayerCorpse.sbr" : $(SOURCE) "$(INTDIR)"


!ELSEIF  "$(CFG)" == "Zone - Win32 ReleasePerl"


"$(INTDIR)\perl_PlayerCorpse.obj" : $(SOURCE) "$(INTDIR)"


!ENDIF 

SOURCE=.\perlpacket.cpp

!IF  "$(CFG)" == "Zone - Win32 Release"


"$(INTDIR)\perlpacket.obj" : $(SOURCE) "$(INTDIR)"


!ELSEIF  "$(CFG)" == "Zone - Win32 Debug"


"$(INTDIR)\perlpacket.obj"	"$(INTDIR)\perlpacket.sbr" : $(SOURCE) "$(INTDIR)"


!ELSEIF  "$(CFG)" == "Zone - Win32 Raid Addicts"


"$(INTDIR)\perlpacket.obj"	"$(INTDIR)\perlpacket.sbr" : $(SOURCE) "$(INTDIR)"


!ELSEIF  "$(CFG)" == "Zone - Win32 DebugPerl"


"$(INTDIR)\perlpacket.obj"	"$(INTDIR)\perlpacket.sbr" : $(SOURCE) "$(INTDIR)"


!ELSEIF  "$(CFG)" == "Zone - Win32 ReleasePerl"


"$(INTDIR)\perlpacket.obj" : $(SOURCE) "$(INTDIR)"


!ENDIF 

SOURCE=.\perlparser.cpp

!IF  "$(CFG)" == "Zone - Win32 Release"


"$(INTDIR)\perlparser.obj" : $(SOURCE) "$(INTDIR)"


!ELSEIF  "$(CFG)" == "Zone - Win32 Debug"


"$(INTDIR)\perlparser.obj"	"$(INTDIR)\perlparser.sbr" : $(SOURCE) "$(INTDIR)"


!ELSEIF  "$(CFG)" == "Zone - Win32 Raid Addicts"


"$(INTDIR)\perlparser.obj"	"$(INTDIR)\perlparser.sbr" : $(SOURCE) "$(INTDIR)"


!ELSEIF  "$(CFG)" == "Zone - Win32 DebugPerl"


"$(INTDIR)\perlparser.obj"	"$(INTDIR)\perlparser.sbr" : $(SOURCE) "$(INTDIR)"


!ELSEIF  "$(CFG)" == "Zone - Win32 ReleasePerl"


"$(INTDIR)\perlparser.obj" : $(SOURCE) "$(INTDIR)"


!ENDIF 

SOURCE=.\petitions.cpp

!IF  "$(CFG)" == "Zone - Win32 Release"


"$(INTDIR)\petitions.obj" : $(SOURCE) "$(INTDIR)"


!ELSEIF  "$(CFG)" == "Zone - Win32 Debug"


"$(INTDIR)\petitions.obj"	"$(INTDIR)\petitions.sbr" : $(SOURCE) "$(INTDIR)"


!ELSEIF  "$(CFG)" == "Zone - Win32 Raid Addicts"


"$(INTDIR)\petitions.obj"	"$(INTDIR)\petitions.sbr" : $(SOURCE) "$(INTDIR)"


!ELSEIF  "$(CFG)" == "Zone - Win32 DebugPerl"


"$(INTDIR)\petitions.obj"	"$(INTDIR)\petitions.sbr" : $(SOURCE) "$(INTDIR)"


!ELSEIF  "$(CFG)" == "Zone - Win32 ReleasePerl"


"$(INTDIR)\petitions.obj" : $(SOURCE) "$(INTDIR)"


!ENDIF 

SOURCE=.\pets.cpp

!IF  "$(CFG)" == "Zone - Win32 Release"


"$(INTDIR)\pets.obj" : $(SOURCE) "$(INTDIR)"


!ELSEIF  "$(CFG)" == "Zone - Win32 Debug"


"$(INTDIR)\pets.obj"	"$(INTDIR)\pets.sbr" : $(SOURCE) "$(INTDIR)"


!ELSEIF  "$(CFG)" == "Zone - Win32 Raid Addicts"


"$(INTDIR)\pets.obj"	"$(INTDIR)\pets.sbr" : $(SOURCE) "$(INTDIR)"


!ELSEIF  "$(CFG)" == "Zone - Win32 DebugPerl"


"$(INTDIR)\pets.obj"	"$(INTDIR)\pets.sbr" : $(SOURCE) "$(INTDIR)"


!ELSEIF  "$(CFG)" == "Zone - Win32 ReleasePerl"


"$(INTDIR)\pets.obj" : $(SOURCE) "$(INTDIR)"


!ENDIF 

SOURCE=.\PlayerCorpse.cpp

!IF  "$(CFG)" == "Zone - Win32 Release"


"$(INTDIR)\PlayerCorpse.obj" : $(SOURCE) "$(INTDIR)"


!ELSEIF  "$(CFG)" == "Zone - Win32 Debug"


"$(INTDIR)\PlayerCorpse.obj"	"$(INTDIR)\PlayerCorpse.sbr" : $(SOURCE) "$(INTDIR)"


!ELSEIF  "$(CFG)" == "Zone - Win32 Raid Addicts"


"$(INTDIR)\PlayerCorpse.obj"	"$(INTDIR)\PlayerCorpse.sbr" : $(SOURCE) "$(INTDIR)"


!ELSEIF  "$(CFG)" == "Zone - Win32 DebugPerl"


"$(INTDIR)\PlayerCorpse.obj"	"$(INTDIR)\PlayerCorpse.sbr" : $(SOURCE) "$(INTDIR)"


!ELSEIF  "$(CFG)" == "Zone - Win32 ReleasePerl"


"$(INTDIR)\PlayerCorpse.obj" : $(SOURCE) "$(INTDIR)"


!ENDIF 

SOURCE=..\common\ptimer.cpp

!IF  "$(CFG)" == "Zone - Win32 Release"


"$(INTDIR)\ptimer.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Zone - Win32 Debug"


"$(INTDIR)\ptimer.obj"	"$(INTDIR)\ptimer.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Zone - Win32 Raid Addicts"


"$(INTDIR)\ptimer.obj"	"$(INTDIR)\ptimer.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Zone - Win32 DebugPerl"


"$(INTDIR)\ptimer.obj"	"$(INTDIR)\ptimer.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Zone - Win32 ReleasePerl"


"$(INTDIR)\ptimer.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ENDIF 

SOURCE=.\questmgr.cpp

!IF  "$(CFG)" == "Zone - Win32 Release"


"$(INTDIR)\questmgr.obj" : $(SOURCE) "$(INTDIR)"


!ELSEIF  "$(CFG)" == "Zone - Win32 Debug"


"$(INTDIR)\questmgr.obj"	"$(INTDIR)\questmgr.sbr" : $(SOURCE) "$(INTDIR)"


!ELSEIF  "$(CFG)" == "Zone - Win32 Raid Addicts"


"$(INTDIR)\questmgr.obj"	"$(INTDIR)\questmgr.sbr" : $(SOURCE) "$(INTDIR)"


!ELSEIF  "$(CFG)" == "Zone - Win32 DebugPerl"


"$(INTDIR)\questmgr.obj"	"$(INTDIR)\questmgr.sbr" : $(SOURCE) "$(INTDIR)"


!ELSEIF  "$(CFG)" == "Zone - Win32 ReleasePerl"


"$(INTDIR)\questmgr.obj" : $(SOURCE) "$(INTDIR)"


!ENDIF 

SOURCE=.\spawn2.cpp

!IF  "$(CFG)" == "Zone - Win32 Release"


"$(INTDIR)\spawn2.obj" : $(SOURCE) "$(INTDIR)"


!ELSEIF  "$(CFG)" == "Zone - Win32 Debug"


"$(INTDIR)\spawn2.obj"	"$(INTDIR)\spawn2.sbr" : $(SOURCE) "$(INTDIR)"


!ELSEIF  "$(CFG)" == "Zone - Win32 Raid Addicts"


"$(INTDIR)\spawn2.obj"	"$(INTDIR)\spawn2.sbr" : $(SOURCE) "$(INTDIR)"


!ELSEIF  "$(CFG)" == "Zone - Win32 DebugPerl"


"$(INTDIR)\spawn2.obj"	"$(INTDIR)\spawn2.sbr" : $(SOURCE) "$(INTDIR)"


!ELSEIF  "$(CFG)" == "Zone - Win32 ReleasePerl"


"$(INTDIR)\spawn2.obj" : $(SOURCE) "$(INTDIR)"


!ENDIF 

SOURCE=.\spawngroup.cpp

!IF  "$(CFG)" == "Zone - Win32 Release"


"$(INTDIR)\spawngroup.obj" : $(SOURCE) "$(INTDIR)"


!ELSEIF  "$(CFG)" == "Zone - Win32 Debug"


"$(INTDIR)\spawngroup.obj"	"$(INTDIR)\spawngroup.sbr" : $(SOURCE) "$(INTDIR)"


!ELSEIF  "$(CFG)" == "Zone - Win32 Raid Addicts"


"$(INTDIR)\spawngroup.obj"	"$(INTDIR)\spawngroup.sbr" : $(SOURCE) "$(INTDIR)"


!ELSEIF  "$(CFG)" == "Zone - Win32 DebugPerl"


"$(INTDIR)\spawngroup.obj"	"$(INTDIR)\spawngroup.sbr" : $(SOURCE) "$(INTDIR)"


!ELSEIF  "$(CFG)" == "Zone - Win32 ReleasePerl"


"$(INTDIR)\spawngroup.obj" : $(SOURCE) "$(INTDIR)"


!ENDIF 

SOURCE=.\spdat.cpp

!IF  "$(CFG)" == "Zone - Win32 Release"


"$(INTDIR)\spdat.obj" : $(SOURCE) "$(INTDIR)"


!ELSEIF  "$(CFG)" == "Zone - Win32 Debug"


"$(INTDIR)\spdat.obj"	"$(INTDIR)\spdat.sbr" : $(SOURCE) "$(INTDIR)"


!ELSEIF  "$(CFG)" == "Zone - Win32 Raid Addicts"


"$(INTDIR)\spdat.obj"	"$(INTDIR)\spdat.sbr" : $(SOURCE) "$(INTDIR)"


!ELSEIF  "$(CFG)" == "Zone - Win32 DebugPerl"


"$(INTDIR)\spdat.obj"	"$(INTDIR)\spdat.sbr" : $(SOURCE) "$(INTDIR)"


!ELSEIF  "$(CFG)" == "Zone - Win32 ReleasePerl"


"$(INTDIR)\spdat.obj" : $(SOURCE) "$(INTDIR)"


!ENDIF 

SOURCE=.\special_attacks.cpp

!IF  "$(CFG)" == "Zone - Win32 Release"


"$(INTDIR)\special_attacks.obj" : $(SOURCE) "$(INTDIR)"


!ELSEIF  "$(CFG)" == "Zone - Win32 Debug"


"$(INTDIR)\special_attacks.obj"	"$(INTDIR)\special_attacks.sbr" : $(SOURCE) "$(INTDIR)"


!ELSEIF  "$(CFG)" == "Zone - Win32 Raid Addicts"


"$(INTDIR)\special_attacks.obj"	"$(INTDIR)\special_attacks.sbr" : $(SOURCE) "$(INTDIR)"


!ELSEIF  "$(CFG)" == "Zone - Win32 DebugPerl"


"$(INTDIR)\special_attacks.obj"	"$(INTDIR)\special_attacks.sbr" : $(SOURCE) "$(INTDIR)"


!ELSEIF  "$(CFG)" == "Zone - Win32 ReleasePerl"


"$(INTDIR)\special_attacks.obj" : $(SOURCE) "$(INTDIR)"


!ENDIF 

SOURCE=.\spell_effects.cpp

!IF  "$(CFG)" == "Zone - Win32 Release"


"$(INTDIR)\spell_effects.obj" : $(SOURCE) "$(INTDIR)"


!ELSEIF  "$(CFG)" == "Zone - Win32 Debug"


"$(INTDIR)\spell_effects.obj"	"$(INTDIR)\spell_effects.sbr" : $(SOURCE) "$(INTDIR)"


!ELSEIF  "$(CFG)" == "Zone - Win32 Raid Addicts"


"$(INTDIR)\spell_effects.obj"	"$(INTDIR)\spell_effects.sbr" : $(SOURCE) "$(INTDIR)"


!ELSEIF  "$(CFG)" == "Zone - Win32 DebugPerl"


"$(INTDIR)\spell_effects.obj"	"$(INTDIR)\spell_effects.sbr" : $(SOURCE) "$(INTDIR)"


!ELSEIF  "$(CFG)" == "Zone - Win32 ReleasePerl"


"$(INTDIR)\spell_effects.obj" : $(SOURCE) "$(INTDIR)"


!ENDIF 

SOURCE=.\spells.cpp

!IF  "$(CFG)" == "Zone - Win32 Release"


"$(INTDIR)\spells.obj" : $(SOURCE) "$(INTDIR)"


!ELSEIF  "$(CFG)" == "Zone - Win32 Debug"


"$(INTDIR)\spells.obj"	"$(INTDIR)\spells.sbr" : $(SOURCE) "$(INTDIR)"


!ELSEIF  "$(CFG)" == "Zone - Win32 Raid Addicts"


"$(INTDIR)\spells.obj"	"$(INTDIR)\spells.sbr" : $(SOURCE) "$(INTDIR)"


!ELSEIF  "$(CFG)" == "Zone - Win32 DebugPerl"


"$(INTDIR)\spells.obj"	"$(INTDIR)\spells.sbr" : $(SOURCE) "$(INTDIR)"


!ELSEIF  "$(CFG)" == "Zone - Win32 ReleasePerl"


"$(INTDIR)\spells.obj" : $(SOURCE) "$(INTDIR)"


!ENDIF 

SOURCE=.\titles.cpp

!IF  "$(CFG)" == "Zone - Win32 Release"


"$(INTDIR)\titles.obj" : $(SOURCE) "$(INTDIR)"


!ELSEIF  "$(CFG)" == "Zone - Win32 Debug"


"$(INTDIR)\titles.obj"	"$(INTDIR)\titles.sbr" : $(SOURCE) "$(INTDIR)"


!ELSEIF  "$(CFG)" == "Zone - Win32 Raid Addicts"


"$(INTDIR)\titles.obj"	"$(INTDIR)\titles.sbr" : $(SOURCE) "$(INTDIR)"


!ELSEIF  "$(CFG)" == "Zone - Win32 DebugPerl"


"$(INTDIR)\titles.obj"	"$(INTDIR)\titles.sbr" : $(SOURCE) "$(INTDIR)"


!ELSEIF  "$(CFG)" == "Zone - Win32 ReleasePerl"


"$(INTDIR)\titles.obj" : $(SOURCE) "$(INTDIR)"


!ENDIF 

SOURCE=.\tradeskills.cpp

!IF  "$(CFG)" == "Zone - Win32 Release"


"$(INTDIR)\tradeskills.obj" : $(SOURCE) "$(INTDIR)"


!ELSEIF  "$(CFG)" == "Zone - Win32 Debug"


"$(INTDIR)\tradeskills.obj"	"$(INTDIR)\tradeskills.sbr" : $(SOURCE) "$(INTDIR)"


!ELSEIF  "$(CFG)" == "Zone - Win32 Raid Addicts"


"$(INTDIR)\tradeskills.obj"	"$(INTDIR)\tradeskills.sbr" : $(SOURCE) "$(INTDIR)"


!ELSEIF  "$(CFG)" == "Zone - Win32 DebugPerl"


"$(INTDIR)\tradeskills.obj"	"$(INTDIR)\tradeskills.sbr" : $(SOURCE) "$(INTDIR)"


!ELSEIF  "$(CFG)" == "Zone - Win32 ReleasePerl"


"$(INTDIR)\tradeskills.obj" : $(SOURCE) "$(INTDIR)"


!ENDIF 

SOURCE=.\trading.cpp

!IF  "$(CFG)" == "Zone - Win32 Release"


"$(INTDIR)\trading.obj" : $(SOURCE) "$(INTDIR)"


!ELSEIF  "$(CFG)" == "Zone - Win32 Debug"


"$(INTDIR)\trading.obj"	"$(INTDIR)\trading.sbr" : $(SOURCE) "$(INTDIR)"


!ELSEIF  "$(CFG)" == "Zone - Win32 Raid Addicts"


"$(INTDIR)\trading.obj"	"$(INTDIR)\trading.sbr" : $(SOURCE) "$(INTDIR)"


!ELSEIF  "$(CFG)" == "Zone - Win32 DebugPerl"


"$(INTDIR)\trading.obj"	"$(INTDIR)\trading.sbr" : $(SOURCE) "$(INTDIR)"


!ELSEIF  "$(CFG)" == "Zone - Win32 ReleasePerl"


"$(INTDIR)\trading.obj" : $(SOURCE) "$(INTDIR)"


!ENDIF 

SOURCE=.\trap.cpp

!IF  "$(CFG)" == "Zone - Win32 Release"


"$(INTDIR)\trap.obj" : $(SOURCE) "$(INTDIR)"


!ELSEIF  "$(CFG)" == "Zone - Win32 Debug"


"$(INTDIR)\trap.obj"	"$(INTDIR)\trap.sbr" : $(SOURCE) "$(INTDIR)"


!ELSEIF  "$(CFG)" == "Zone - Win32 Raid Addicts"


"$(INTDIR)\trap.obj"	"$(INTDIR)\trap.sbr" : $(SOURCE) "$(INTDIR)"


!ELSEIF  "$(CFG)" == "Zone - Win32 DebugPerl"


"$(INTDIR)\trap.obj"	"$(INTDIR)\trap.sbr" : $(SOURCE) "$(INTDIR)"


!ELSEIF  "$(CFG)" == "Zone - Win32 ReleasePerl"


"$(INTDIR)\trap.obj" : $(SOURCE) "$(INTDIR)"


!ENDIF 

SOURCE=.\tribute.cpp

!IF  "$(CFG)" == "Zone - Win32 Release"


"$(INTDIR)\tribute.obj" : $(SOURCE) "$(INTDIR)"


!ELSEIF  "$(CFG)" == "Zone - Win32 Debug"


"$(INTDIR)\tribute.obj"	"$(INTDIR)\tribute.sbr" : $(SOURCE) "$(INTDIR)"


!ELSEIF  "$(CFG)" == "Zone - Win32 Raid Addicts"


"$(INTDIR)\tribute.obj"	"$(INTDIR)\tribute.sbr" : $(SOURCE) "$(INTDIR)"


!ELSEIF  "$(CFG)" == "Zone - Win32 DebugPerl"


"$(INTDIR)\tribute.obj"	"$(INTDIR)\tribute.sbr" : $(SOURCE) "$(INTDIR)"


!ELSEIF  "$(CFG)" == "Zone - Win32 ReleasePerl"


"$(INTDIR)\tribute.obj" : $(SOURCE) "$(INTDIR)"


!ENDIF 

SOURCE=.\waypoints.cpp

!IF  "$(CFG)" == "Zone - Win32 Release"


"$(INTDIR)\waypoints.obj" : $(SOURCE) "$(INTDIR)"


!ELSEIF  "$(CFG)" == "Zone - Win32 Debug"


"$(INTDIR)\waypoints.obj"	"$(INTDIR)\waypoints.sbr" : $(SOURCE) "$(INTDIR)"


!ELSEIF  "$(CFG)" == "Zone - Win32 Raid Addicts"


"$(INTDIR)\waypoints.obj"	"$(INTDIR)\waypoints.sbr" : $(SOURCE) "$(INTDIR)"


!ELSEIF  "$(CFG)" == "Zone - Win32 DebugPerl"


"$(INTDIR)\waypoints.obj"	"$(INTDIR)\waypoints.sbr" : $(SOURCE) "$(INTDIR)"


!ELSEIF  "$(CFG)" == "Zone - Win32 ReleasePerl"


"$(INTDIR)\waypoints.obj" : $(SOURCE) "$(INTDIR)"


!ENDIF 

SOURCE=.\worldserver.cpp

!IF  "$(CFG)" == "Zone - Win32 Release"


"$(INTDIR)\worldserver.obj" : $(SOURCE) "$(INTDIR)"


!ELSEIF  "$(CFG)" == "Zone - Win32 Debug"


"$(INTDIR)\worldserver.obj"	"$(INTDIR)\worldserver.sbr" : $(SOURCE) "$(INTDIR)"


!ELSEIF  "$(CFG)" == "Zone - Win32 Raid Addicts"


"$(INTDIR)\worldserver.obj"	"$(INTDIR)\worldserver.sbr" : $(SOURCE) "$(INTDIR)"


!ELSEIF  "$(CFG)" == "Zone - Win32 DebugPerl"


"$(INTDIR)\worldserver.obj"	"$(INTDIR)\worldserver.sbr" : $(SOURCE) "$(INTDIR)"


!ELSEIF  "$(CFG)" == "Zone - Win32 ReleasePerl"


"$(INTDIR)\worldserver.obj" : $(SOURCE) "$(INTDIR)"


!ENDIF 

SOURCE=.\zone.cpp

!IF  "$(CFG)" == "Zone - Win32 Release"


"$(INTDIR)\zone.obj" : $(SOURCE) "$(INTDIR)"


!ELSEIF  "$(CFG)" == "Zone - Win32 Debug"


"$(INTDIR)\zone.obj"	"$(INTDIR)\zone.sbr" : $(SOURCE) "$(INTDIR)"


!ELSEIF  "$(CFG)" == "Zone - Win32 Raid Addicts"


"$(INTDIR)\zone.obj"	"$(INTDIR)\zone.sbr" : $(SOURCE) "$(INTDIR)"


!ELSEIF  "$(CFG)" == "Zone - Win32 DebugPerl"


"$(INTDIR)\zone.obj"	"$(INTDIR)\zone.sbr" : $(SOURCE) "$(INTDIR)"


!ELSEIF  "$(CFG)" == "Zone - Win32 ReleasePerl"


"$(INTDIR)\zone.obj" : $(SOURCE) "$(INTDIR)"


!ENDIF 

SOURCE=.\zonedbasync.cpp

!IF  "$(CFG)" == "Zone - Win32 Release"


"$(INTDIR)\zonedbasync.obj" : $(SOURCE) "$(INTDIR)"


!ELSEIF  "$(CFG)" == "Zone - Win32 Debug"


"$(INTDIR)\zonedbasync.obj"	"$(INTDIR)\zonedbasync.sbr" : $(SOURCE) "$(INTDIR)"


!ELSEIF  "$(CFG)" == "Zone - Win32 Raid Addicts"


"$(INTDIR)\zonedbasync.obj"	"$(INTDIR)\zonedbasync.sbr" : $(SOURCE) "$(INTDIR)"


!ELSEIF  "$(CFG)" == "Zone - Win32 DebugPerl"


"$(INTDIR)\zonedbasync.obj"	"$(INTDIR)\zonedbasync.sbr" : $(SOURCE) "$(INTDIR)"


!ELSEIF  "$(CFG)" == "Zone - Win32 ReleasePerl"


"$(INTDIR)\zonedbasync.obj" : $(SOURCE) "$(INTDIR)"


!ENDIF 

SOURCE=.\zoning.cpp

!IF  "$(CFG)" == "Zone - Win32 Release"


"$(INTDIR)\zoning.obj" : $(SOURCE) "$(INTDIR)"


!ELSEIF  "$(CFG)" == "Zone - Win32 Debug"


"$(INTDIR)\zoning.obj"	"$(INTDIR)\zoning.sbr" : $(SOURCE) "$(INTDIR)"


!ELSEIF  "$(CFG)" == "Zone - Win32 Raid Addicts"


"$(INTDIR)\zoning.obj"	"$(INTDIR)\zoning.sbr" : $(SOURCE) "$(INTDIR)"


!ELSEIF  "$(CFG)" == "Zone - Win32 DebugPerl"


"$(INTDIR)\zoning.obj"	"$(INTDIR)\zoning.sbr" : $(SOURCE) "$(INTDIR)"


!ELSEIF  "$(CFG)" == "Zone - Win32 ReleasePerl"


"$(INTDIR)\zoning.obj" : $(SOURCE) "$(INTDIR)"


!ENDIF 

SOURCE=..\common\classes.cpp

!IF  "$(CFG)" == "Zone - Win32 Release"


"$(INTDIR)\classes.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Zone - Win32 Debug"


"$(INTDIR)\classes.obj"	"$(INTDIR)\classes.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Zone - Win32 Raid Addicts"


"$(INTDIR)\classes.obj"	"$(INTDIR)\classes.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Zone - Win32 DebugPerl"


"$(INTDIR)\classes.obj"	"$(INTDIR)\classes.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Zone - Win32 ReleasePerl"


"$(INTDIR)\classes.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ENDIF 

SOURCE=..\common\Condition.cpp

!IF  "$(CFG)" == "Zone - Win32 Release"


"$(INTDIR)\Condition.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Zone - Win32 Debug"


"$(INTDIR)\Condition.obj"	"$(INTDIR)\Condition.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Zone - Win32 Raid Addicts"


"$(INTDIR)\Condition.obj"	"$(INTDIR)\Condition.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Zone - Win32 DebugPerl"


"$(INTDIR)\Condition.obj"	"$(INTDIR)\Condition.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Zone - Win32 ReleasePerl"


"$(INTDIR)\Condition.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ENDIF 

SOURCE=..\common\CRC16.cpp

!IF  "$(CFG)" == "Zone - Win32 Release"


"$(INTDIR)\CRC16.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Zone - Win32 Debug"


"$(INTDIR)\CRC16.obj"	"$(INTDIR)\CRC16.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Zone - Win32 Raid Addicts"


"$(INTDIR)\CRC16.obj"	"$(INTDIR)\CRC16.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Zone - Win32 DebugPerl"


"$(INTDIR)\CRC16.obj"	"$(INTDIR)\CRC16.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Zone - Win32 ReleasePerl"


"$(INTDIR)\CRC16.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ENDIF 

SOURCE=..\common\crc32.cpp

!IF  "$(CFG)" == "Zone - Win32 Release"


"$(INTDIR)\crc32.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Zone - Win32 Debug"


"$(INTDIR)\crc32.obj"	"$(INTDIR)\crc32.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Zone - Win32 Raid Addicts"


"$(INTDIR)\crc32.obj"	"$(INTDIR)\crc32.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Zone - Win32 DebugPerl"


"$(INTDIR)\crc32.obj"	"$(INTDIR)\crc32.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Zone - Win32 ReleasePerl"


"$(INTDIR)\crc32.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ENDIF 

SOURCE=..\common\database.cpp

!IF  "$(CFG)" == "Zone - Win32 Release"

CPP_SWITCHES=/nologo /MT /w /W0 /Gm /GX /Zi /O2 /Ob2 /I "c:\mysql\include" /I "c:\eqemu\include" /D "i386" /D "SHAREMEM" /D _WIN32_WINNT=0x0400 /D "ZONE" /D "INVERSEXY" /D "WIN32" /D "_CONSOLE" /D "_MBCS" /D EQDEBUG=0 /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\" /FD /c 

"$(INTDIR)\database.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) @<<
  $(CPP_SWITCHES) $(SOURCE)
<<


!ELSEIF  "$(CFG)" == "Zone - Win32 Debug"

CPP_SWITCHES=/nologo /Gd /MTd /Gm /GX /Zi /Od /I "c:\mysql\include" /I "c:\eqemu\include" /D "i386" /D "SHAREMEM" /D _WIN32_WINNT=0x0400 /D "_EQDEBUG" /D "ZONE" /D "INVERSEXY" /D "WIN32" /D "_CONSOLE" /D "_MBCS" /D "EQDEBUG" /D "FIELD_ITEMS" /FR"$(INTDIR)\\" /Fp"$(INTDIR)\Zone.pch" /YX /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\" /FD /GZ /c 

"$(INTDIR)\database.obj"	"$(INTDIR)\database.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) @<<
  $(CPP_SWITCHES) $(SOURCE)
<<


!ELSEIF  "$(CFG)" == "Zone - Win32 Raid Addicts"

CPP_SWITCHES=/nologo /MT /w /W0 /GX /Zi /O2 /Ob2 /I "c:\mysql\include" /I "c:\eqemu\include" /D "i386" /D "SHAREMEM" /D "CATCH_CRASH" /D _WIN32_WINNT=0x0400 /D "NDEBUG" /D "ZONESERVER" /D "ZONE" /D "INVERSEXY" /D "WIN32" /D "_CONSOLE" /D "_MBCS" /D "FIELD_ITEMS" /D EQDEBUG=0 /FR"$(INTDIR)\\" /Fp"$(INTDIR)\Zone.pch" /YX /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\" /FD /c 

"$(INTDIR)\database.obj"	"$(INTDIR)\database.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) @<<
  $(CPP_SWITCHES) $(SOURCE)
<<


!ELSEIF  "$(CFG)" == "Zone - Win32 DebugPerl"

CPP_SWITCHES=/nologo /Gd /MTd /Gm /GX /Zi /Od /I "C:\perl\lib\core" /I "c:\mysql\include" /I "c:\eqemu\include" /D "EMBPERL" /D "EMBPERL_PLUGIN" /D "i386" /D "SHAREMEM" /D _WIN32_WINNT=0x0400 /D "ZONE" /D "INVERSEXY" /D "WIN32" /D "_CONSOLE" /D "_MBCS" /D "EQDEBUG" /D "FIELD_ITEMS" /FR"$(INTDIR)\\" /Fp"$(INTDIR)\Zone.pch" /YX /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\" /FD /GZ /c 

"$(INTDIR)\database.obj"	"$(INTDIR)\database.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) @<<
  $(CPP_SWITCHES) $(SOURCE)
<<


!ELSEIF  "$(CFG)" == "Zone - Win32 ReleasePerl"

CPP_SWITCHES=/nologo /Gd /MD /Gm /GX /Zi /O2 /Ob2 /I "C:\perl\lib\core" /I "c:\mysql\include" /I "c:\eqemu\include" /D "EMBPERL" /D "EMBPERL_PLUGIN" /D "i386" /D "SHAREMEM" /D _WIN32_WINNT=0x0400 /D "ZONE" /D "INVERSEXY" /D "WIN32" /D "_CONSOLE" /D "_MBCS" /D "EQDEBUG" /D "FIELD_ITEMS" /Fp"$(INTDIR)\Zone.pch" /YX /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\" /FD /c 

"$(INTDIR)\database.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) @<<
  $(CPP_SWITCHES) $(SOURCE)
<<


!ENDIF 

SOURCE=..\common\dbasync.cpp

!IF  "$(CFG)" == "Zone - Win32 Release"


"$(INTDIR)\dbasync.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Zone - Win32 Debug"


"$(INTDIR)\dbasync.obj"	"$(INTDIR)\dbasync.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Zone - Win32 Raid Addicts"


"$(INTDIR)\dbasync.obj"	"$(INTDIR)\dbasync.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Zone - Win32 DebugPerl"


"$(INTDIR)\dbasync.obj"	"$(INTDIR)\dbasync.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Zone - Win32 ReleasePerl"


"$(INTDIR)\dbasync.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ENDIF 

SOURCE=..\common\dbcore.cpp

!IF  "$(CFG)" == "Zone - Win32 Release"


"$(INTDIR)\dbcore.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Zone - Win32 Debug"


"$(INTDIR)\dbcore.obj"	"$(INTDIR)\dbcore.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Zone - Win32 Raid Addicts"


"$(INTDIR)\dbcore.obj"	"$(INTDIR)\dbcore.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Zone - Win32 DebugPerl"


"$(INTDIR)\dbcore.obj"	"$(INTDIR)\dbcore.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Zone - Win32 ReleasePerl"


"$(INTDIR)\dbcore.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ENDIF 

SOURCE=..\common\DBMemLeak.cpp

!IF  "$(CFG)" == "Zone - Win32 Release"


"$(INTDIR)\DBMemLeak.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Zone - Win32 Debug"


"$(INTDIR)\DBMemLeak.obj"	"$(INTDIR)\DBMemLeak.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Zone - Win32 Raid Addicts"


"$(INTDIR)\DBMemLeak.obj"	"$(INTDIR)\DBMemLeak.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Zone - Win32 DebugPerl"


"$(INTDIR)\DBMemLeak.obj"	"$(INTDIR)\DBMemLeak.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Zone - Win32 ReleasePerl"


"$(INTDIR)\DBMemLeak.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ENDIF 

SOURCE=..\common\debug.cpp

!IF  "$(CFG)" == "Zone - Win32 Release"


"$(INTDIR)\debug.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Zone - Win32 Debug"


"$(INTDIR)\debug.obj"	"$(INTDIR)\debug.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Zone - Win32 Raid Addicts"


"$(INTDIR)\debug.obj"	"$(INTDIR)\debug.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Zone - Win32 DebugPerl"


"$(INTDIR)\debug.obj"	"$(INTDIR)\debug.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Zone - Win32 ReleasePerl"


"$(INTDIR)\debug.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ENDIF 

SOURCE=..\common\emu_opcodes.cpp

!IF  "$(CFG)" == "Zone - Win32 Release"


"$(INTDIR)\emu_opcodes.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Zone - Win32 Debug"


"$(INTDIR)\emu_opcodes.obj"	"$(INTDIR)\emu_opcodes.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Zone - Win32 Raid Addicts"


"$(INTDIR)\emu_opcodes.obj"	"$(INTDIR)\emu_opcodes.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Zone - Win32 DebugPerl"


"$(INTDIR)\emu_opcodes.obj"	"$(INTDIR)\emu_opcodes.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Zone - Win32 ReleasePerl"


"$(INTDIR)\emu_opcodes.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ENDIF 

SOURCE=..\common\EMuShareMem.cpp

!IF  "$(CFG)" == "Zone - Win32 Release"


"$(INTDIR)\EMuShareMem.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Zone - Win32 Debug"


"$(INTDIR)\EMuShareMem.obj"	"$(INTDIR)\EMuShareMem.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Zone - Win32 Raid Addicts"


"$(INTDIR)\EMuShareMem.obj"	"$(INTDIR)\EMuShareMem.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Zone - Win32 DebugPerl"


"$(INTDIR)\EMuShareMem.obj"	"$(INTDIR)\EMuShareMem.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Zone - Win32 ReleasePerl"


"$(INTDIR)\EMuShareMem.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ENDIF 

SOURCE=..\common\EQChatPacket.cpp

!IF  "$(CFG)" == "Zone - Win32 Release"


"$(INTDIR)\EQChatPacket.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Zone - Win32 Debug"


"$(INTDIR)\EQChatPacket.obj"	"$(INTDIR)\EQChatPacket.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Zone - Win32 Raid Addicts"


"$(INTDIR)\EQChatPacket.obj"	"$(INTDIR)\EQChatPacket.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Zone - Win32 DebugPerl"


"$(INTDIR)\EQChatPacket.obj"	"$(INTDIR)\EQChatPacket.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Zone - Win32 ReleasePerl"


"$(INTDIR)\EQChatPacket.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ENDIF 

SOURCE=..\common\EQLoginPacket.cpp

!IF  "$(CFG)" == "Zone - Win32 Release"


"$(INTDIR)\EQLoginPacket.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Zone - Win32 Debug"


"$(INTDIR)\EQLoginPacket.obj"	"$(INTDIR)\EQLoginPacket.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Zone - Win32 Raid Addicts"


"$(INTDIR)\EQLoginPacket.obj"	"$(INTDIR)\EQLoginPacket.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Zone - Win32 DebugPerl"


"$(INTDIR)\EQLoginPacket.obj"	"$(INTDIR)\EQLoginPacket.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Zone - Win32 ReleasePerl"


"$(INTDIR)\EQLoginPacket.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ENDIF 

SOURCE=..\common\EQMailPacket.cpp

!IF  "$(CFG)" == "Zone - Win32 Release"


"$(INTDIR)\EQMailPacket.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Zone - Win32 Debug"


"$(INTDIR)\EQMailPacket.obj"	"$(INTDIR)\EQMailPacket.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Zone - Win32 Raid Addicts"


"$(INTDIR)\EQMailPacket.obj"	"$(INTDIR)\EQMailPacket.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Zone - Win32 DebugPerl"


"$(INTDIR)\EQMailPacket.obj"	"$(INTDIR)\EQMailPacket.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Zone - Win32 ReleasePerl"


"$(INTDIR)\EQMailPacket.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ENDIF 

SOURCE=..\common\EQPacket.cpp

!IF  "$(CFG)" == "Zone - Win32 Release"


"$(INTDIR)\EQPacket.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Zone - Win32 Debug"


"$(INTDIR)\EQPacket.obj"	"$(INTDIR)\EQPacket.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Zone - Win32 Raid Addicts"


"$(INTDIR)\EQPacket.obj"	"$(INTDIR)\EQPacket.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Zone - Win32 DebugPerl"


"$(INTDIR)\EQPacket.obj"	"$(INTDIR)\EQPacket.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Zone - Win32 ReleasePerl"


"$(INTDIR)\EQPacket.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ENDIF 

SOURCE=..\common\EQStream.cpp

!IF  "$(CFG)" == "Zone - Win32 Release"


"$(INTDIR)\EQStream.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Zone - Win32 Debug"


"$(INTDIR)\EQStream.obj"	"$(INTDIR)\EQStream.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Zone - Win32 Raid Addicts"


"$(INTDIR)\EQStream.obj"	"$(INTDIR)\EQStream.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Zone - Win32 DebugPerl"


"$(INTDIR)\EQStream.obj"	"$(INTDIR)\EQStream.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Zone - Win32 ReleasePerl"


"$(INTDIR)\EQStream.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ENDIF 

SOURCE=..\common\EQStreamFactory.cpp

!IF  "$(CFG)" == "Zone - Win32 Release"


"$(INTDIR)\EQStreamFactory.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Zone - Win32 Debug"


"$(INTDIR)\EQStreamFactory.obj"	"$(INTDIR)\EQStreamFactory.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Zone - Win32 Raid Addicts"


"$(INTDIR)\EQStreamFactory.obj"	"$(INTDIR)\EQStreamFactory.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Zone - Win32 DebugPerl"


"$(INTDIR)\EQStreamFactory.obj"	"$(INTDIR)\EQStreamFactory.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Zone - Win32 ReleasePerl"


"$(INTDIR)\EQStreamFactory.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ENDIF 

SOURCE=..\common\eqtime.cpp

!IF  "$(CFG)" == "Zone - Win32 Release"


"$(INTDIR)\eqtime.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Zone - Win32 Debug"


"$(INTDIR)\eqtime.obj"	"$(INTDIR)\eqtime.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Zone - Win32 Raid Addicts"


"$(INTDIR)\eqtime.obj"	"$(INTDIR)\eqtime.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Zone - Win32 DebugPerl"


"$(INTDIR)\eqtime.obj"	"$(INTDIR)\eqtime.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Zone - Win32 ReleasePerl"


"$(INTDIR)\eqtime.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ENDIF 

SOURCE=..\common\EQWorldPacket.cpp

!IF  "$(CFG)" == "Zone - Win32 Release"


"$(INTDIR)\EQWorldPacket.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Zone - Win32 Debug"


"$(INTDIR)\EQWorldPacket.obj"	"$(INTDIR)\EQWorldPacket.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Zone - Win32 Raid Addicts"


"$(INTDIR)\EQWorldPacket.obj"	"$(INTDIR)\EQWorldPacket.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Zone - Win32 DebugPerl"


"$(INTDIR)\EQWorldPacket.obj"	"$(INTDIR)\EQWorldPacket.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Zone - Win32 ReleasePerl"


"$(INTDIR)\EQWorldPacket.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ENDIF 

SOURCE=..\common\EQZonePacket.cpp

!IF  "$(CFG)" == "Zone - Win32 Release"


"$(INTDIR)\EQZonePacket.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Zone - Win32 Debug"


"$(INTDIR)\EQZonePacket.obj"	"$(INTDIR)\EQZonePacket.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Zone - Win32 Raid Addicts"


"$(INTDIR)\EQZonePacket.obj"	"$(INTDIR)\EQZonePacket.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Zone - Win32 DebugPerl"


"$(INTDIR)\EQZonePacket.obj"	"$(INTDIR)\EQZonePacket.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Zone - Win32 ReleasePerl"


"$(INTDIR)\EQZonePacket.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ENDIF 

SOURCE=..\common\extprofile.cpp

!IF  "$(CFG)" == "Zone - Win32 Release"


"$(INTDIR)\extprofile.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Zone - Win32 Debug"


"$(INTDIR)\extprofile.obj"	"$(INTDIR)\extprofile.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Zone - Win32 Raid Addicts"


"$(INTDIR)\extprofile.obj"	"$(INTDIR)\extprofile.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Zone - Win32 DebugPerl"


"$(INTDIR)\extprofile.obj"	"$(INTDIR)\extprofile.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Zone - Win32 ReleasePerl"


"$(INTDIR)\extprofile.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ENDIF 

SOURCE=..\common\Item.cpp

!IF  "$(CFG)" == "Zone - Win32 Release"


"$(INTDIR)\Item.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Zone - Win32 Debug"


"$(INTDIR)\Item.obj"	"$(INTDIR)\Item.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Zone - Win32 Raid Addicts"


"$(INTDIR)\Item.obj"	"$(INTDIR)\Item.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Zone - Win32 DebugPerl"


"$(INTDIR)\Item.obj"	"$(INTDIR)\Item.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Zone - Win32 ReleasePerl"


"$(INTDIR)\Item.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ENDIF 

SOURCE=..\common\logsys.cpp

!IF  "$(CFG)" == "Zone - Win32 Release"


"$(INTDIR)\logsys.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Zone - Win32 Debug"


"$(INTDIR)\logsys.obj"	"$(INTDIR)\logsys.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Zone - Win32 Raid Addicts"


"$(INTDIR)\logsys.obj"	"$(INTDIR)\logsys.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Zone - Win32 DebugPerl"


"$(INTDIR)\logsys.obj"	"$(INTDIR)\logsys.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Zone - Win32 ReleasePerl"


"$(INTDIR)\logsys.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ENDIF 

SOURCE=..\common\md5.cpp

!IF  "$(CFG)" == "Zone - Win32 Release"


"$(INTDIR)\md5.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Zone - Win32 Debug"


"$(INTDIR)\md5.obj"	"$(INTDIR)\md5.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Zone - Win32 Raid Addicts"


"$(INTDIR)\md5.obj"	"$(INTDIR)\md5.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Zone - Win32 DebugPerl"


"$(INTDIR)\md5.obj"	"$(INTDIR)\md5.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Zone - Win32 ReleasePerl"


"$(INTDIR)\md5.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ENDIF 

SOURCE=..\common\misc.cpp

!IF  "$(CFG)" == "Zone - Win32 Release"


"$(INTDIR)\misc.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Zone - Win32 Debug"


"$(INTDIR)\misc.obj"	"$(INTDIR)\misc.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Zone - Win32 Raid Addicts"


"$(INTDIR)\misc.obj"	"$(INTDIR)\misc.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Zone - Win32 DebugPerl"


"$(INTDIR)\misc.obj"	"$(INTDIR)\misc.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Zone - Win32 ReleasePerl"


"$(INTDIR)\misc.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ENDIF 

SOURCE=..\common\MiscFunctions.cpp

!IF  "$(CFG)" == "Zone - Win32 Release"

CPP_SWITCHES=/nologo /MT /w /W0 /Gm /GX /Zi /O2 /Ob2 /I "c:\mysql\include" /I "c:\eqemu\include" /D "i386" /D "SHAREMEM" /D _WIN32_WINNT=0x0400 /D "ZONE" /D "INVERSEXY" /D "WIN32" /D "_CONSOLE" /D "_MBCS" /D EQDEBUG=0 /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\" /FD /c 

"$(INTDIR)\MiscFunctions.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) @<<
  $(CPP_SWITCHES) $(SOURCE)
<<


!ELSEIF  "$(CFG)" == "Zone - Win32 Debug"

CPP_SWITCHES=/nologo /MTd /w /W0 /Gm /GX /Zi /Od /I "c:\mysql\include" /I "c:\eqemu\include" /D "i386" /D "SHAREMEM" /D _WIN32_WINNT=0x0400 /D "_EQDEBUG" /D "ZONE" /D "INVERSEXY" /D "WIN32" /D "_CONSOLE" /D "_MBCS" /D "EQDEBUG" /D "FIELD_ITEMS" /FR"$(INTDIR)\\" /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\" /FD /GZ /c 

"$(INTDIR)\MiscFunctions.obj"	"$(INTDIR)\MiscFunctions.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) @<<
  $(CPP_SWITCHES) $(SOURCE)
<<


!ELSEIF  "$(CFG)" == "Zone - Win32 Raid Addicts"

CPP_SWITCHES=/nologo /MT /w /W0 /GX /Zi /O2 /Ob2 /I "c:\mysql\include" /I "c:\eqemu\include" /D "i386" /D "SHAREMEM" /D "CATCH_CRASH" /D _WIN32_WINNT=0x0400 /D "NDEBUG" /D "ZONESERVER" /D "ZONE" /D "INVERSEXY" /D "WIN32" /D "_CONSOLE" /D "_MBCS" /D "FIELD_ITEMS" /D EQDEBUG=0 /FR"$(INTDIR)\\" /Fp"$(INTDIR)\Zone.pch" /YX /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\" /FD /c 

"$(INTDIR)\MiscFunctions.obj"	"$(INTDIR)\MiscFunctions.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) @<<
  $(CPP_SWITCHES) $(SOURCE)
<<


!ELSEIF  "$(CFG)" == "Zone - Win32 DebugPerl"

CPP_SWITCHES=/nologo /MTd /w /W0 /Gm /GX /Zi /Od /I "C:\perl\lib\core" /I "c:\mysql\include" /I "c:\eqemu\include" /D "EMBPERL" /D "EMBPERL_PLUGIN" /D "i386" /D "SHAREMEM" /D _WIN32_WINNT=0x0400 /D "ZONE" /D "INVERSEXY" /D "WIN32" /D "_CONSOLE" /D "_MBCS" /D "EQDEBUG" /D "FIELD_ITEMS" /FR"$(INTDIR)\\" /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\" /FD /GZ /c 

"$(INTDIR)\MiscFunctions.obj"	"$(INTDIR)\MiscFunctions.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) @<<
  $(CPP_SWITCHES) $(SOURCE)
<<


!ELSEIF  "$(CFG)" == "Zone - Win32 ReleasePerl"

CPP_SWITCHES=/nologo /MD /w /W0 /Gm /GX /Zi /O2 /Ob2 /I "C:\perl\lib\core" /I "c:\mysql\include" /I "c:\eqemu\include" /D "EMBPERL" /D "EMBPERL_PLUGIN" /D "i386" /D "SHAREMEM" /D _WIN32_WINNT=0x0400 /D "ZONE" /D "INVERSEXY" /D "WIN32" /D "_CONSOLE" /D "_MBCS" /D "EQDEBUG" /D "FIELD_ITEMS" /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\" /FD /c 

"$(INTDIR)\MiscFunctions.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) @<<
  $(CPP_SWITCHES) $(SOURCE)
<<


!ENDIF 

SOURCE=..\common\moremath.cpp

!IF  "$(CFG)" == "Zone - Win32 Release"


"$(INTDIR)\moremath.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Zone - Win32 Debug"


"$(INTDIR)\moremath.obj"	"$(INTDIR)\moremath.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Zone - Win32 Raid Addicts"


"$(INTDIR)\moremath.obj"	"$(INTDIR)\moremath.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Zone - Win32 DebugPerl"


"$(INTDIR)\moremath.obj"	"$(INTDIR)\moremath.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Zone - Win32 ReleasePerl"


"$(INTDIR)\moremath.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ENDIF 

SOURCE=..\common\Mutex.cpp

!IF  "$(CFG)" == "Zone - Win32 Release"


"$(INTDIR)\Mutex.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Zone - Win32 Debug"


"$(INTDIR)\Mutex.obj"	"$(INTDIR)\Mutex.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Zone - Win32 Raid Addicts"


"$(INTDIR)\Mutex.obj"	"$(INTDIR)\Mutex.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Zone - Win32 DebugPerl"


"$(INTDIR)\Mutex.obj"	"$(INTDIR)\Mutex.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Zone - Win32 ReleasePerl"


"$(INTDIR)\Mutex.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ENDIF 

SOURCE=..\common\opcodemgr.cpp

!IF  "$(CFG)" == "Zone - Win32 Release"


"$(INTDIR)\opcodemgr.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Zone - Win32 Debug"


"$(INTDIR)\opcodemgr.obj"	"$(INTDIR)\opcodemgr.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Zone - Win32 Raid Addicts"


"$(INTDIR)\opcodemgr.obj"	"$(INTDIR)\opcodemgr.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Zone - Win32 DebugPerl"


"$(INTDIR)\opcodemgr.obj"	"$(INTDIR)\opcodemgr.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Zone - Win32 ReleasePerl"


"$(INTDIR)\opcodemgr.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ENDIF 

SOURCE=..\common\packet_dump.cpp

!IF  "$(CFG)" == "Zone - Win32 Release"


"$(INTDIR)\packet_dump.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Zone - Win32 Debug"


"$(INTDIR)\packet_dump.obj"	"$(INTDIR)\packet_dump.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Zone - Win32 Raid Addicts"


"$(INTDIR)\packet_dump.obj"	"$(INTDIR)\packet_dump.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Zone - Win32 DebugPerl"


"$(INTDIR)\packet_dump.obj"	"$(INTDIR)\packet_dump.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Zone - Win32 ReleasePerl"


"$(INTDIR)\packet_dump.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ENDIF 

SOURCE=..\common\packet_dump_file.cpp

!IF  "$(CFG)" == "Zone - Win32 Release"


"$(INTDIR)\packet_dump_file.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Zone - Win32 Debug"


"$(INTDIR)\packet_dump_file.obj"	"$(INTDIR)\packet_dump_file.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Zone - Win32 Raid Addicts"


"$(INTDIR)\packet_dump_file.obj"	"$(INTDIR)\packet_dump_file.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Zone - Win32 DebugPerl"


"$(INTDIR)\packet_dump_file.obj"	"$(INTDIR)\packet_dump_file.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Zone - Win32 ReleasePerl"


"$(INTDIR)\packet_dump_file.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ENDIF 

SOURCE=..\common\packet_functions.cpp

!IF  "$(CFG)" == "Zone - Win32 Release"


"$(INTDIR)\packet_functions.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Zone - Win32 Debug"


"$(INTDIR)\packet_functions.obj"	"$(INTDIR)\packet_functions.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Zone - Win32 Raid Addicts"


"$(INTDIR)\packet_functions.obj"	"$(INTDIR)\packet_functions.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Zone - Win32 DebugPerl"


"$(INTDIR)\packet_functions.obj"	"$(INTDIR)\packet_functions.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Zone - Win32 ReleasePerl"


"$(INTDIR)\packet_functions.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ENDIF 

SOURCE=..\common\races.cpp

!IF  "$(CFG)" == "Zone - Win32 Release"


"$(INTDIR)\races.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Zone - Win32 Debug"


"$(INTDIR)\races.obj"	"$(INTDIR)\races.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Zone - Win32 Raid Addicts"


"$(INTDIR)\races.obj"	"$(INTDIR)\races.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Zone - Win32 DebugPerl"


"$(INTDIR)\races.obj"	"$(INTDIR)\races.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Zone - Win32 ReleasePerl"


"$(INTDIR)\races.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ENDIF 

SOURCE=..\common\rdtsc.cpp

!IF  "$(CFG)" == "Zone - Win32 Release"


"$(INTDIR)\rdtsc.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Zone - Win32 Debug"


"$(INTDIR)\rdtsc.obj"	"$(INTDIR)\rdtsc.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Zone - Win32 Raid Addicts"


"$(INTDIR)\rdtsc.obj"	"$(INTDIR)\rdtsc.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Zone - Win32 DebugPerl"


"$(INTDIR)\rdtsc.obj"	"$(INTDIR)\rdtsc.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Zone - Win32 ReleasePerl"


"$(INTDIR)\rdtsc.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ENDIF 

SOURCE=..\common\serverinfo.cpp

!IF  "$(CFG)" == "Zone - Win32 Release"


"$(INTDIR)\serverinfo.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Zone - Win32 Debug"


"$(INTDIR)\serverinfo.obj"	"$(INTDIR)\serverinfo.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Zone - Win32 Raid Addicts"


"$(INTDIR)\serverinfo.obj"	"$(INTDIR)\serverinfo.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Zone - Win32 DebugPerl"


"$(INTDIR)\serverinfo.obj"	"$(INTDIR)\serverinfo.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Zone - Win32 ReleasePerl"


"$(INTDIR)\serverinfo.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ENDIF 

SOURCE=..\common\SharedLibrary.cpp

!IF  "$(CFG)" == "Zone - Win32 Release"


"$(INTDIR)\SharedLibrary.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Zone - Win32 Debug"


"$(INTDIR)\SharedLibrary.obj"	"$(INTDIR)\SharedLibrary.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Zone - Win32 Raid Addicts"


"$(INTDIR)\SharedLibrary.obj"	"$(INTDIR)\SharedLibrary.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Zone - Win32 DebugPerl"


"$(INTDIR)\SharedLibrary.obj"	"$(INTDIR)\SharedLibrary.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Zone - Win32 ReleasePerl"


"$(INTDIR)\SharedLibrary.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ENDIF 

SOURCE=..\common\TCPConnection.cpp

!IF  "$(CFG)" == "Zone - Win32 Release"


"$(INTDIR)\TCPConnection.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Zone - Win32 Debug"


"$(INTDIR)\TCPConnection.obj"	"$(INTDIR)\TCPConnection.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Zone - Win32 Raid Addicts"


"$(INTDIR)\TCPConnection.obj"	"$(INTDIR)\TCPConnection.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Zone - Win32 DebugPerl"


"$(INTDIR)\TCPConnection.obj"	"$(INTDIR)\TCPConnection.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Zone - Win32 ReleasePerl"


"$(INTDIR)\TCPConnection.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ENDIF 

SOURCE=..\common\timeoutmgr.cpp

!IF  "$(CFG)" == "Zone - Win32 Release"


"$(INTDIR)\timeoutmgr.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Zone - Win32 Debug"


"$(INTDIR)\timeoutmgr.obj"	"$(INTDIR)\timeoutmgr.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Zone - Win32 Raid Addicts"


"$(INTDIR)\timeoutmgr.obj"	"$(INTDIR)\timeoutmgr.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Zone - Win32 DebugPerl"


"$(INTDIR)\timeoutmgr.obj"	"$(INTDIR)\timeoutmgr.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Zone - Win32 ReleasePerl"


"$(INTDIR)\timeoutmgr.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ENDIF 

SOURCE=..\common\timer.cpp

!IF  "$(CFG)" == "Zone - Win32 Release"


"$(INTDIR)\timer.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Zone - Win32 Debug"


"$(INTDIR)\timer.obj"	"$(INTDIR)\timer.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Zone - Win32 Raid Addicts"


"$(INTDIR)\timer.obj"	"$(INTDIR)\timer.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Zone - Win32 DebugPerl"


"$(INTDIR)\timer.obj"	"$(INTDIR)\timer.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Zone - Win32 ReleasePerl"


"$(INTDIR)\timer.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ENDIF 

SOURCE=..\common\unix.cpp

!ENDIF 

