#southkarana night and day, spawns werewolf and sentry
#Angelox, Qadar
sub EVENT_SPAWN{
if (($zonetime >= 0)&&($zonetime <= 800)){          
	quest::spawn_condition("southkarana", 2,0);     
	quest::spawn_condition("southkarana", 1,1);}     
elsif (($zonetime >= 2000)&&($zonetime <= 2359)){   
	quest::spawn_condition("southkarana", 2,0);    
	quest::spawn_condition("southkarana", 1,1);}   
else{		#daytime
	quest::spawn_condition("southkarana",2,1);
	quest::spawn_condition("southkarana",1,0);}}

sub EVENT_WAYPOINT{
if (($zonetime >= 0)&&($zonetime <= 800)){           #nighttime
	quest::spawn_condition("southkarana", 2,0);  #Sentry is 2
	quest::spawn_condition("southkarana", 1,1);} #Werewolf is 1
elsif (($zonetime >= 2000)&&($zonetime <= 2359)){    #nighttime
	quest::spawn_condition("southkarana", 2,0);  #Sentry is 2
	quest::spawn_condition("southkarana", 1,1);} #Werewolf is 1
else{		#daytime
	quest::spawn_condition("southkarana",2,1);
	quest::spawn_condition("southkarana",1,0);}}
## End of script
