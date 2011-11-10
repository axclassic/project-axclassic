#commons night and day, spawns night or day NPCs.
#Angelox, Qadar
sub EVENT_SPAWN{
if (($zonetime >= 0)&&($zonetime <= 800)){           #nighttime
	quest::spawn_condition(lakerathe, 2,0);      #live are 2
	quest::spawn_condition(lakerathe, 1,1);}     #undead are 1
elsif (($zonetime >= 2000)&&($zonetime <= 2359)){    #nighttime
	quest::spawn_condition(lakerathe, 2,0);      #live are 2
	quest::spawn_condition(lakerathe, 1,1);}     #undead are 1
else{		#daytime
	quest::spawn_condition(lakerathe,2,1);
	quest::spawn_condition(lakerathe,1,0);}}

sub EVENT_WAYPOINT{
if (($zonetime >= 0)&&($zonetime <= 800)){           #nighttime
	quest::spawn_condition(commons, 2,0);       #Day is 2
	quest::spawn_condition(commons, 1,1);}      #Night is 1
elsif (($zonetime >= 2000)&&($zonetime <= 2359)){    #nighttime
	quest::spawn_condition(commons, 2,0);       #Day is 2
	quest::spawn_condition(commons, 1,1);}      #Night is 1
else{		#daytime
	quest::spawn_condition(commons,2,1);
	quest::spawn_condition(commons,1,0);}}
