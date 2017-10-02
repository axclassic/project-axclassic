#qey2hh1 night and day, spawns night or day NPCs.
#Angelox
#Update- 10/2/2017 patrikpatrik
#Added spawn_conditions for a_brigand and Vilnius the Small (rogue epic)
sub EVENT_SPAWN {
	if (($zonetime >= 0)&&($zonetime <= 800)) {      	 #nighttime
		quest::spawn_condition("qey2hh1", 2,0);      	 #Day is 2
		quest::spawn_condition("qey2hh1", 1,1);      	 #Night is 1
	} elsif (($zonetime >= 0)&&($zonetime <= 600)) {	 # 12am - 6am
		quest::spawn_condition("qey2hh1", 3,1);			 # vilnius is up
	} elsif (($zonetime >= 2200)&&($zonetime <= 2359)) { # 10pm - 12am
		quest::spawn_condition("qey2hh1", 3,1);          # vilnius is up
	} elsif (($zonetime >= 2000)&&($zonetime <= 2359)) { #nighttime
		quest::spawn_condition("qey2hh1", 2,0);      	 #Day is 2
		quest::spawn_condition("qey2hh1", 1,1);      	 #night is 1
	} else {											 #daytime
		quest::spawn_condition("qey2hh1",2,1);
		quest::spawn_condition("qey2hh1",1,0);
		quest::spawn_condition("qey2hh1",3,0); 			 #vilnius is NOT up
	}
}

sub EVENT_WAYPOINT {
	if (($zonetime >= 0)&&($zonetime <= 800)) {          #nighttime
		quest::spawn_condition("qey2hh1", 2,0);   		 #Day is 2
		quest::spawn_condition("qey2hh1", 1,1);  		 #Night is 1
	} elsif (($zonetime >= 0)&&($zonetime <= 600)) {	 # 12am - 6am
		quest::spawn_condition("qey2hh1", 3,1);			 # vilnius is up
	} elsif (($zonetime >= 2200)&&($zonetime <= 2359)) { # 10pm - 12am
		quest::spawn_condition("qey2hh1", 3,1);          # vilnius is up	
	} elsif (($zonetime >= 2000)&&($zonetime <= 2359)) { #nighttime
		quest::spawn_condition("qey2hh1", 2,0);   		 #Day is 2
		quest::spawn_condition("qey2hh1", 1,1);  		 #Night is 1
	} else {											 #daytime
		quest::spawn_condition("qey2hh1",2,1);
		quest::spawn_condition("qey2hh1",1,0);
		quest::spawn_condition("qey2hh1",3,0); 			 #vilnius is NOT up
	}
}
## End of script
