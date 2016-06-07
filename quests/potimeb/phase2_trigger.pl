# phase_trigger script npcid - 223191 This is required for signals for phase 2
sub EVENT_ZONE { #when zoning out, counters must be reset!
	$savedc2 = 0;
	$IIcounter = 0;
}

my $IIcounter;

sub EVENT_SPAWN {
    # $IIacounter = 0;
    quest::signalwith(223111,1001,0); #flavor triggers invisible _ 223111.pl
	#spawning phase 2's 1st group no boss
	#Earth group using #earth_counter.pl
		quest::spawn2(223178,0,0,-129.6,1720,547,0);
	#Air group using #air_counter.pl
		quest::spawn2(223179,0,0,-129.6,1720,547,0);
	#Water group using #water_counter.pl
		quest::spawn2(223181,0,0,-129.6,1720,547,0);
	#Fire group using #fire_counter.pl
		quest::spawn2(223182,0,0,-129.6,1720,547,0);
	#Undead group using #undead_counter.pl
		quest::spawn2(223180,0,0,-129.6,1720,547,0);
	

}
    
sub EVENT_SIGNAL {

	if ($signal == 14028) { #counts # of kills from phase 2 earth 1st group
	 #This should spawn the Earth 2nd mob group + boss for phase 2
	 #quest::ze(15, "I see you completed Earth!, this signal should spawn the boss's group!");
	#Use earth_trigger.pl as the last group+boss phase 2
	quest::spawn2(223169,0,0,-129.6,1720,547,0);
	}
	if ($signal == 14038) { # counts # of kills from air groups 1st grp
	#quest::ze(15, "I see you completed air!, this signal should spawn the boss's group!");
	#Use air_trigger.pl as the last group+boss phase 2
	quest::spawn2(223170,0,0,-129.6,1720,547,0);
	}
	if ($signal == 14048) { # counts # of kills from undead groups 1st grp
	#quest::ze(15, "I see you completed undead!, this signal should spawn the boss's group!");
	#Use undead_trigger.pl as the last group+boss phase 2
	quest::spawn2(223171,0,0,-129.6,1720,547,0);
	}	
	if ($signal == 14058) { # counts # of kills from water groups 1st grp
	#quest::ze(15, "I see you completed water!, this signal should spawn the boss's group!");
	#Use water_trigger.pl as the last group+boss phase 2
	quest::spawn2(223172,0,0,-129.6,1720,547,0);
	}
	if ($signal == 14068) { # counts # of kills from water groups 1stgrp
	#quest::ze(15, "I see you completed fire!, this signal should spawn the boss's group!");
	#Use fire_trigger.pl as the last group+boss phase 2
	quest::spawn2(223173,0,0,-129.6,1720,547,0);
	}
	
	
	#This signal keeps track of the groups dead to open inner doors
	if ($signal == 14035) { #phase 2 boss signals
	#quest::ze(15, "Mob+boss earth grp for phase 2 is dead, door should open!");
	$IIcounter+=1;
	$savedc2 = $IIcounter;
	#quest::ze(15, "testing signal 14035 and counter is $savedc2.");
	}
	if ($IIcounter == 5) { #Inner doors open!
	$npc->CameraEffect(3000, 6, 0, 1); #Worlwide camera shake
	quest::we(14, "Congratulations, phase 2 has been completed! Move on to phase 3.");
	
	#inner connecting doors
	quest::forcedooropen(13); #connecting door water and fire lower right panel
    quest::forcedooropen(14); # upper right
    quest::forcedooropen(15); # upper left
    quest::forcedooropen(16); # lower left
    quest::forcedooropen(33); #undead subdoor lower right panel
    quest::forcedooropen(34); # upper right
    quest::forcedooropen(35); # upper left
    quest::forcedooropen(36); # lower left
    quest::forcedooropen(38); #connecting door earth and air lower right panel
    quest::forcedooropen(39); # upper right
    quest::forcedooropen(40); # upper left
    quest::forcedooropen(41); # lower left
	
	quest::spawn2(223154,0,0,-129.6,1720,547,0); #triggers phase3_trigger.pl
	#quest::depop();#depops phase2_trigger
	
	#quest::stoptimer($timer); #repop resets everything anyway
	#quest::starttimer("closealld",1);
	
	}
 
 }

sub EVENT_TIMER {
	
 }