# northkarana night and day, spawns Grimtooth and Gouls at night
#Angelox
sub EVENT_SPAWN{
if (($zonetime >= 0)&&($zonetime <= 800)){
	quest::spawn_condition(northkarana, 2,0);
	quest::spawn_condition(northkarana, 1,1);}
elsif (($zonetime >= 2000)&&($zonetime <= 2359)){
	quest::spawn_condition(northkarana, 2,0);
	quest::spawn_condition(northkarana, 1,1);}
else{		#daytime
	quest::spawn_condition(northkarana,2,1);
	quest::spawn_condition(northkarana,1,0);}}

sub EVENT_WAYPOINT{
if (($zonetime >= 0)&&($zonetime <= 800)){           #nighttime
	quest::spawn_condition(northkarana, 2,0);  #Daystuff is 2
	quest::spawn_condition(northkarana, 1,1);} #Nightstuff is 1
elsif (($zonetime >= 2000)&&($zonetime <= 2359)){    #nighttime
	quest::spawn_condition(northkarana, 2,0);  #Daystuff is 2
	quest::spawn_condition(northkarana, 1,1);} #Nightstuff is 1
else{		#daytime
	quest::spawn_condition(northkarana,2,1);
	quest::spawn_condition(northkarana,1,0);}}
## End of script
