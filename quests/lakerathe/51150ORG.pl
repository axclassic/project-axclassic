# lakerathe night and day spawns
#Angelox's reasoning :)

sub EVENT_WAYPOINT{
if (($shifter>=20)&&($shifter<=24)){			#night
	quest::spawn_condition(lakerathe, 2,0); #live are 2
	quest::spawn_condition(lakerathe, 1,1);} #undead are 1
elsif (($shifter>=1)&&($shifter<=7)){			#night
	quest::spawn_condition(lakerathe, 2,0); #live are 2
	quest::spawn_condition(lakerathe, 1,1);} #undead are 1
elsif (($shifter >=8)&&($shifter <=19)){		#day
	quest::spawn_condition(lakerathe,2,1);
	quest::spawn_condition(lakerathe,1,0);}}
## End spawn Script
