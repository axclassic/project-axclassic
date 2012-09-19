#define BASEDIR			"./"

#ifndef SPELLS_FILE
  #define SPELLS_FILE		BASEDIR "spells_us.txt"
#endif

#ifndef DB_INI_FILE
  #define DB_INI_FILE		BASEDIR "db.ini"
#endif

#ifndef MAIN_INI_FILE
  #define MAIN_INI_FILE		BASEDIR "LoginServer.ini"
#endif

#ifndef ADDON_INI_FILE
  #define ADDON_INI_FILE	BASEDIR "addon.ini"
#endif

#ifndef LOG_INI_FILE
  #define LOG_INI_FILE	BASEDIR "log.ini"
#endif

#ifndef OPCODES_FILE
  #define OPCODES_FILE	BASEDIR "opcodes.conf"
#endif

#ifndef CFG_DIR
  #define CFG_DIR		BASEDIR "cfg"
  #define CFG_DIR_NAME		CFG_DIR
#endif

#ifndef QUEST_DIR
  #define QUEST_DIR		BASEDIR "quests"
#endif

#ifndef MAP_DIR
  #define MAP_DIR		BASEDIR "Maps"
#endif

#ifndef EQTIME_INI
  #define EQTIME_INI		BASEDIR "eqtime.cfg"
#endif

//yea yea, not a file, dont care
#define WORLDSERVER_PORT		9000
