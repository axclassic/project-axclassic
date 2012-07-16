SELECT * FROM botinventory INTO OUTFILE '/home/samba/public/updates/data/botinventory.txt'
FIELDS TERMINATED BY ',' ENCLOSED BY '"' LINES TERMINATED BY '\n';

SELECT * FROM botbank INTO OUTFILE '/home/samba/public/updates/data/botbank.txt'
FIELDS TERMINATED BY ',' ENCLOSED BY '"' LINES TERMINATED BY '\n';

SELECT * FROM botgroups INTO OUTFILE '/home/samba/public/updates/data/botgroups.txt'
FIELDS TERMINATED BY ',' ENCLOSED BY '"' LINES TERMINATED BY '\n';

SELECT * FROM botgroups INTO OUTFILE '/home/samba/public/updates/data/botgroups_b.txt'
FIELDS TERMINATED BY ',' ENCLOSED BY '"' LINES TERMINATED BY '\n';

SELECT * FROM botgroups INTO OUTFILE '/home/samba/public/updates/data/botgroups_c.txt'
FIELDS TERMINATED BY ',' ENCLOSED BY '"' LINES TERMINATED BY '\n';

SELECT * FROM botleader INTO OUTFILE '/home/samba/public/updates/data/botleader.txt'
FIELDS TERMINATED BY ',' ENCLOSED BY '"' LINES TERMINATED BY '\n';

SELECT * FROM botsowners INTO OUTFILE '/home/samba/public/updates/data/botsowners.txt'
FIELDS TERMINATED BY ',' ENCLOSED BY '"' LINES TERMINATED BY '\n';

SELECT * FROM player_titlesets INTO OUTFILE '/home/samba/public/updates/data/player_titlesets.txt'
FIELDS TERMINATED BY ',' ENCLOSED BY '"' LINES TERMINATED BY '\n';

SELECT * FROM buyer INTO OUTFILE '/home/samba/public/updates/data/buyer.txt'
FIELDS TERMINATED BY ',' ENCLOSED BY '"' LINES TERMINATED BY '\n';

SELECT * FROM character_enabledtasks INTO OUTFILE '/home/samba/public/updates/data/character_enabledtasks.txt'
FIELDS TERMINATED BY ',' ENCLOSED BY '"' LINES TERMINATED BY '\n';

SELECT * FROM character_tasks INTO OUTFILE '/home/samba/public/updates/data/character_tasks.txt'
FIELDS TERMINATED BY ',' ENCLOSED BY '"' LINES TERMINATED BY '\n';

SELECT * FROM chatchannels INTO OUTFILE '/home/samba/public/updates/data/chatchannels.txt'
FIELDS TERMINATED BY ',' ENCLOSED BY '"' LINES TERMINATED BY '\n';

SELECT * FROM completed_tasks INTO OUTFILE '/home/samba/public/updates/data/completed_tasks.txt'
FIELDS TERMINATED BY ',' ENCLOSED BY '"' LINES TERMINATED BY '\n';

SELECT * FROM mail INTO OUTFILE '/home/samba/public/updates/data/mail.txt'
FIELDS TERMINATED BY ',' ENCLOSED BY '"' LINES TERMINATED BY '\n';

SELECT * FROM account INTO OUTFILE '/home/samba/public/updates/data/account.txt'
FIELDS TERMINATED BY ',' ENCLOSED BY '"' LINES TERMINATED BY '\n';

SELECT * FROM character_ INTO OUTFILE '/home/samba/public/updates/data/character_.txt'
FIELDS TERMINATED BY ',' ENCLOSED BY '"' LINES TERMINATED BY '\n';

SELECT * FROM character_backup INTO OUTFILE '/home/samba/public/updates/data/character_backup.txt'
FIELDS TERMINATED BY ',' ENCLOSED BY '"' LINES TERMINATED BY '\n';

SELECT * FROM character_activities INTO OUTFILE '/home/samba/public/updates/data/character_activities.txt'
FIELDS TERMINATED BY ',' ENCLOSED BY '"' LINES TERMINATED BY '\n';

SELECT * FROM eventlog INTO OUTFILE '/home/samba/public/updates/data/eventlog.txt'
FIELDS TERMINATED BY ',' ENCLOSED BY '"' LINES TERMINATED BY '\n';

SELECT * FROM faction_values INTO OUTFILE '/home/samba/public/updates/data/faction_values.txt'
FIELDS TERMINATED BY ',' ENCLOSED BY '"' LINES TERMINATED BY '\n';

SELECT * FROM graveyard INTO OUTFILE '/home/samba/public/updates/data/graveyard.txt'
FIELDS TERMINATED BY ',' ENCLOSED BY '"' LINES TERMINATED BY '\n';

SELECT * FROM guild_members INTO OUTFILE '/home/samba/public/updates/data/guild_members.txt'
FIELDS TERMINATED BY ',' ENCLOSED BY '"' LINES TERMINATED BY '\n';

SELECT * FROM guild_ranks INTO OUTFILE '/home/samba/public/updates/data/guild_ranks.txt'
FIELDS TERMINATED BY ',' ENCLOSED BY '"' LINES TERMINATED BY '\n';

SELECT * FROM guild_relations INTO OUTFILE '/home/samba/public/updates/data/guild_relations.txt'
FIELDS TERMINATED BY ',' ENCLOSED BY '"' LINES TERMINATED BY '\n';

SELECT * FROM guilds INTO OUTFILE '/home/samba/public/updates/data/guilds.txt'
FIELDS TERMINATED BY ',' ENCLOSED BY '"' LINES TERMINATED BY '\n';

SELECT * FROM inventory INTO OUTFILE '/home/samba/public/updates/data/inventory.txt'
FIELDS TERMINATED BY ',' ENCLOSED BY '"' LINES TERMINATED BY '\n';

SELECT * FROM keyring INTO OUTFILE '/home/samba/public/updates/data/keyring.txt'
FIELDS TERMINATED BY ',' ENCLOSED BY '"' LINES TERMINATED BY '\n';

SELECT * FROM peq_admin INTO OUTFILE '/home/samba/public/updates/data/peq_admin.txt'
FIELDS TERMINATED BY ',' ENCLOSED BY '"' LINES TERMINATED BY '\n';

SELECT * FROM petitions INTO OUTFILE '/home/samba/public/updates/data/petitions.txt'
FIELDS TERMINATED BY ',' ENCLOSED BY '"' LINES TERMINATED BY '\n';

SELECT * FROM player_corpses INTO OUTFILE '/home/samba/public/updates/data/player_corpses.txt'
FIELDS TERMINATED BY ',' ENCLOSED BY '"' LINES TERMINATED BY '\n';

SELECT * FROM player_corpses_backup INTO OUTFILE '/home/samba/public/updates/data/player_corpses_backup.txt'
FIELDS TERMINATED BY ',' ENCLOSED BY '"' LINES TERMINATED BY '\n';

SELECT * FROM sharedbank INTO OUTFILE '/home/samba/public/updates/data/sharedbank.txt'
FIELDS TERMINATED BY ',' ENCLOSED BY '"' LINES TERMINATED BY '\n';

SELECT * FROM zone_flags INTO OUTFILE '/home/samba/public/updates/data/zone_flags.txt'
FIELDS TERMINATED BY ',' ENCLOSED BY '"' LINES TERMINATED BY '\n';

SELECT * FROM quest_globals INTO OUTFILE '/home/samba/public/updates/data/quest_globals.txt'
FIELDS TERMINATED BY ',' ENCLOSED BY '"' LINES TERMINATED BY '\n';

SELECT * FROM account_ip INTO OUTFILE '/home/samba/public/updates/data/account_ip.txt'
FIELDS TERMINATED BY ',' ENCLOSED BY '"' LINES TERMINATED BY '\n';

SELECT * FROM banned_ips INTO OUTFILE '/home/samba/public/updates/data/banned_ips.txt'
FIELDS TERMINATED BY ',' ENCLOSED BY '"' LINES TERMINATED BY '\n';

SELECT * FROM bugs INTO OUTFILE '/home/samba/public/updates/data/bugs.txt'
FIELDS TERMINATED BY ',' ENCLOSED BY '"' LINES TERMINATED BY '\n';

SELECT * FROM commands INTO OUTFILE '/home/samba/public/updates/data/commands.txt'
FIELDS TERMINATED BY ',' ENCLOSED BY '"' LINES TERMINATED BY '\n';

SELECT * FROM hackers INTO OUTFILE '/home/samba/public/updates/data/hackers.txt'
FIELDS TERMINATED BY ',' ENCLOSED BY '"' LINES TERMINATED BY '\n';

SELECT * FROM qed_admin INTO OUTFILE '/home/samba/public/updates/data/qed_admin.txt'
FIELDS TERMINATED BY ',' ENCLOSED BY '"' LINES TERMINATED BY '\n';

SELECT * FROM qed_quests INTO OUTFILE '/home/samba/public/updates/data/qed_quests.txt'
FIELDS TERMINATED BY ',' ENCLOSED BY '"' LINES TERMINATED BY '\n';

SELECT * FROM qed_zone INTO OUTFILE '/home/samba/public/updates/data/qed_zone.txt'
FIELDS TERMINATED BY ',' ENCLOSED BY '"' LINES TERMINATED BY '\n';

SELECT * FROM timers INTO OUTFILE '/home/samba/public/updates/data/timers.txt'
FIELDS TERMINATED BY ',' ENCLOSED BY '"' LINES TERMINATED BY '\n';

SELECT * FROM titles INTO OUTFILE '/home/samba/public/updates/data/titles.txt'
FIELDS TERMINATED BY ',' ENCLOSED BY '"' LINES TERMINATED BY '\n';

SELECT * FROM variables INTO OUTFILE '/home/samba/public/updates/data/variables.txt'
FIELDS TERMINATED BY ',' ENCLOSED BY '"' LINES TERMINATED BY '\n';

SELECT * FROM npc_types WHERE isbot=1 INTO OUTFILE '/home/samba/public/updates/data/bots.txt'
FIELDS TERMINATED BY ',' ENCLOSED BY '"' LINES TERMINATED BY '\n';
