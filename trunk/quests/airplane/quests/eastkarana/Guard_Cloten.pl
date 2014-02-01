# East Karana night and day, spawns Undead Reavers
#Angelox, Qadar
sub EVENT_SPAWN{
if (($zonetime >= 0)&&($zonetime <= 800)){          
	#quest::spawn_condition("eastkarana", 2,0);     
	quest::spawn_condition("eastkarana", 1,1);}     
elsif (($zonetime >= 2000)&&($zonetime <= 2359)){   
	#quest::spawn_condition("eastkarana", 2,0);    
	quest::spawn_condition("eastkarana", 1,1);}   
else{		#daytime
	#quest::spawn_condition("eastkarana",2,1);
	quest::spawn_condition("eastkarana",1,0);}}

sub EVENT_WAYPOINT{
if (($zonetime >= 0)&&($zonetime <= 800)){           #nighttime
	#quest::spawn_condition("eastkarana", 2,0);  #Live is 2
	quest::spawn_condition("eastkarana", 1,1);} #Undead Reaver is 1
elsif (($zonetime >= 2000)&&($zonetime <= 2359)){    #nighttime
	#quest::spawn_condition("eastkarana", 2,0);  #Live is 2
	quest::spawn_condition("eastkarana", 1,1);} #Undead Reaver is 1
else{		#daytime
	#quest::spawn_condition("eastkarana",2,1);
	quest::spawn_condition("eastkarana",1,0);}}
## End of script
 
