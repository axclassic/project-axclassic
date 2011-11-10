#qey2hh1 night and day, spawns night or day NPCs.
#Angelox
sub EVENT_SPAWN{
if (($zonetime >= 0)&&($zonetime <= 800)){           #nighttime
	quest::spawn_condition(qey2hh1, 2,0);      #Day is 2
	quest::spawn_condition(qey2hh1, 1,1);}     #Night is 1
elsif (($zonetime >= 2000)&&($zonetime <= 2359)){    #nighttime
	quest::spawn_condition(qey2hh1, 2,0);      #Day is 2
	quest::spawn_condition(qey2hh1, 1,1);}     #night is 1
else{		#daytime
	quest::spawn_condition(qey2hh1,2,1);
	quest::spawn_condition(qey2hh1,1,0);}}

sub EVENT_WAYPOINT{
if (($zonetime >= 0)&&($zonetime <= 800)){           #nighttime
	quest::spawn_condition(qey2hh1, 2,0);   #Day is 2
	quest::spawn_condition(qey2hh1, 1,1);}  #Night is 1
elsif (($zonetime >= 2000)&&($zonetime <= 2359)){    #nighttime
	quest::spawn_condition(qey2hh1, 2,0);   #Day is 2
	quest::spawn_condition(qey2hh1, 1,1);}  #Night is 1
else{		#daytime
	quest::spawn_condition(qey2hh1,2,1);
	quest::spawn_condition(qey2hh1,1,0);}}
## End of script
