LOAD DATA INFILE '/home/samba/public/updates/data/botinventory.txt' INTO TABLE botinventory
FIELDS TERMINATED BY ',' ENCLOSED BY '"' LINES TERMINATED BY '\n';

LOAD DATA INFILE '/home/samba/public/updates/data/botgroups.txt' INTO TABLE botgroups
FIELDS TERMINATED BY ',' ENCLOSED BY '"' LINES TERMINATED BY '\n';

LOAD DATA INFILE '/home/samba/public/updates/data/botgroups_b.txt' INTO TABLE botgroups_b
FIELDS TERMINATED BY ',' ENCLOSED BY '"' LINES TERMINATED BY '\n';

LOAD DATA INFILE '/home/samba/public/updates/data/botgroups_c.txt' INTO TABLE botgroups_c
FIELDS TERMINATED BY ',' ENCLOSED BY '"' LINES TERMINATED BY '\n';

LOAD DATA INFILE '/home/samba/public/updates/data/botbank.txt' INTO TABLE botbank
FIELDS TERMINATED BY ',' ENCLOSED BY '"' LINES TERMINATED BY '\n';

LOAD DATA INFILE '/home/samba/public/updates/data/botleader.txt' INTO TABLE botleader
FIELDS TERMINATED BY ',' ENCLOSED BY '"' LINES TERMINATED BY '\n';

LOAD DATA INFILE '/home/samba/public/updates/data/botsowners.txt' INTO TABLE botsowners
FIELDS TERMINATED BY ',' ENCLOSED BY '"' LINES TERMINATED BY '\n';

LOAD DATA INFILE '/home/samba/public/updates/data/buyer.txt' INTO TABLE buyer
FIELDS TERMINATED BY ',' ENCLOSED BY '"' LINES TERMINATED BY '\n';

LOAD DATA INFILE '/home/samba/public/updates/data/player_titlesets.txt' INTO TABLE player_titlesets
FIELDS TERMINATED BY ',' ENCLOSED BY '"' LINES TERMINATED BY '\n';

LOAD DATA INFILE '/home/samba/public/updates/data/mail.txt' INTO TABLE mail
FIELDS TERMINATED BY ',' ENCLOSED BY '"' LINES TERMINATED BY '\n';

LOAD DATA INFILE '/home/samba/public/updates/data/character_enabledtasks.txt' INTO TABLE character_enabledtasks
FIELDS TERMINATED BY ',' ENCLOSED BY '"' LINES TERMINATED BY '\n';

LOAD DATA INFILE '/home/samba/public/updates/data/character_tasks.txt' INTO TABLE character_tasks
FIELDS TERMINATED BY ',' ENCLOSED BY '"' LINES TERMINATED BY '\n';

LOAD DATA INFILE '/home/samba/public/updates/data/chatchannels.txt' INTO TABLE chatchannels
FIELDS TERMINATED BY ',' ENCLOSED BY '"' LINES TERMINATED BY '\n';

LOAD DATA INFILE '/home/samba/public/updates/data/completed_tasks.txt' INTO TABLE completed_tasks
FIELDS TERMINATED BY ',' ENCLOSED BY '"' LINES TERMINATED BY '\n';

LOAD DATA INFILE '/home/samba/public/updates/data/account.txt' INTO TABLE account
FIELDS TERMINATED BY ',' ENCLOSED BY '"' LINES TERMINATED BY '\n';

LOAD DATA INFILE '/home/samba/public/updates/data/character_.txt' INTO TABLE character_
FIELDS TERMINATED BY ',' ENCLOSED BY '"' LINES TERMINATED BY '\n';

## LOAD DATA INFILE '/home/samba/public/updates/data/character_backup.txt' INTO TABLE character_backup
## FIELDS TERMINATED BY ',' ENCLOSED BY '"' LINES TERMINATED BY '\n';

LOAD DATA INFILE '/home/samba/public/updates/data/character_activities.txt' INTO TABLE character_activities
FIELDS TERMINATED BY ',' ENCLOSED BY '"' LINES TERMINATED BY '\n';

LOAD DATA INFILE '/home/samba/public/updates/data/eventlog.txt' INTO TABLE eventlog
FIELDS TERMINATED BY ',' ENCLOSED BY '"' LINES TERMINATED BY '\n';

LOAD DATA INFILE '/home/samba/public/updates/data/faction_values.txt' INTO TABLE faction_values
FIELDS TERMINATED BY ',' ENCLOSED BY '"' LINES TERMINATED BY '\n';

LOAD DATA INFILE '/home/samba/public/updates/data/graveyard.txt' INTO TABLE graveyard
FIELDS TERMINATED BY ',' ENCLOSED BY '"' LINES TERMINATED BY '\n';

LOAD DATA INFILE '/home/samba/public/updates/data/guild_members.txt' INTO TABLE guild_members
FIELDS TERMINATED BY ',' ENCLOSED BY '"' LINES TERMINATED BY '\n';

LOAD DATA INFILE '/home/samba/public/updates/data/guild_ranks.txt' INTO TABLE guild_ranks
FIELDS TERMINATED BY ',' ENCLOSED BY '"' LINES TERMINATED BY '\n';

LOAD DATA INFILE '/home/samba/public/updates/data/guild_relations.txt' INTO TABLE guild_relations
FIELDS TERMINATED BY ',' ENCLOSED BY '"' LINES TERMINATED BY '\n';

LOAD DATA INFILE '/home/samba/public/updates/data/guilds.txt' INTO TABLE guilds
FIELDS TERMINATED BY ',' ENCLOSED BY '"' LINES TERMINATED BY '\n';

LOAD DATA INFILE '/home/samba/public/updates/data/inventory.txt' INTO TABLE inventory
FIELDS TERMINATED BY ',' ENCLOSED BY '"' LINES TERMINATED BY '\n';

LOAD DATA INFILE '/home/samba/public/updates/data/keyring.txt' INTO TABLE keyring
FIELDS TERMINATED BY ',' ENCLOSED BY '"' LINES TERMINATED BY '\n';

LOAD DATA INFILE '/home/samba/public/updates/data/peq_admin.txt' INTO TABLE peq_admin
FIELDS TERMINATED BY ',' ENCLOSED BY '"' LINES TERMINATED BY '\n';

LOAD DATA INFILE '/home/samba/public/updates/data/petitions.txt' INTO TABLE petitions
FIELDS TERMINATED BY ',' ENCLOSED BY '"' LINES TERMINATED BY '\n';

LOAD DATA INFILE '/home/samba/public/updates/data/player_corpses.txt' INTO TABLE player_corpses
FIELDS TERMINATED BY ',' ENCLOSED BY '"' LINES TERMINATED BY '\n';

LOAD DATA INFILE '/home/samba/public/updates/data/player_corpses_backup.txt' INTO TABLE player_corpses_backup
FIELDS TERMINATED BY ',' ENCLOSED BY '"' LINES TERMINATED BY '\n';

LOAD DATA INFILE '/home/samba/public/updates/data/sharedbank.txt' INTO TABLE sharedbank
FIELDS TERMINATED BY ',' ENCLOSED BY '"' LINES TERMINATED BY '\n';

LOAD DATA INFILE '/home/samba/public/updates/data/zone_flags.txt' INTO TABLE zone_flags
FIELDS TERMINATED BY ',' ENCLOSED BY '"' LINES TERMINATED BY '\n';

LOAD DATA INFILE '/home/samba/public/updates/data/quest_globals.txt' INTO TABLE quest_globals
FIELDS TERMINATED BY ',' ENCLOSED BY '"' LINES TERMINATED BY '\n';

LOAD DATA INFILE '/home/samba/public/updates/data/account_ip.txt' INTO TABLE account_ip
FIELDS TERMINATED BY ',' ENCLOSED BY '"' LINES TERMINATED BY '\n';

LOAD DATA INFILE '/home/samba/public/updates/data/banned_ips.txt' INTO TABLE banned_ips
FIELDS TERMINATED BY ',' ENCLOSED BY '"' LINES TERMINATED BY '\n';

LOAD DATA INFILE '/home/samba/public/updates/data/bugs.txt' INTO TABLE bugs
FIELDS TERMINATED BY ',' ENCLOSED BY '"' LINES TERMINATED BY '\n';

LOAD DATA INFILE '/home/samba/public/updates/data/commands.txt' INTO TABLE commands
FIELDS TERMINATED BY ',' ENCLOSED BY '"' LINES TERMINATED BY '\n';

LOAD DATA INFILE '/home/samba/public/updates/data/hackers.txt' INTO TABLE hackers
FIELDS TERMINATED BY ',' ENCLOSED BY '"' LINES TERMINATED BY '\n';

LOAD DATA INFILE '/home/samba/public/updates/data/qed_admin.txt' INTO TABLE qed_admin
FIELDS TERMINATED BY ',' ENCLOSED BY '"' LINES TERMINATED BY '\n';

LOAD DATA INFILE '/home/samba/public/updates/data/qed_quests.txt' INTO TABLE qed_quests
FIELDS TERMINATED BY ',' ENCLOSED BY '"' LINES TERMINATED BY '\n';

LOAD DATA INFILE '/home/samba/public/updates/data/qed_zone.txt' INTO TABLE qed_zone
FIELDS TERMINATED BY ',' ENCLOSED BY '"' LINES TERMINATED BY '\n';

LOAD DATA INFILE '/home/samba/public/updates/data/timers.txt' INTO TABLE timers
FIELDS TERMINATED BY ',' ENCLOSED BY '"' LINES TERMINATED BY '\n';

LOAD DATA INFILE '/home/samba/public/updates/data/titles.txt' INTO TABLE titles
FIELDS TERMINATED BY ',' ENCLOSED BY '"' LINES TERMINATED BY '\n';

LOAD DATA INFILE '/home/samba/public/updates/data/variables.txt' INTO TABLE variables
FIELDS TERMINATED BY ',' ENCLOSED BY '"' LINES TERMINATED BY '\n';

LOAD DATA INFILE '/home/samba/public/updates/data/bots.txt' INTO TABLE npc_types
FIELDS TERMINATED BY ',' ENCLOSED BY '"' LINES TERMINATED BY '\n';
