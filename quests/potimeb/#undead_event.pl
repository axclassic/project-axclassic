#This is an invisible controller which spawns the undead guardians
# #undead_event (223188)

my $phase1_undead_npcevent = 1;

sub EVENT_SPAWN {
    $phase1_undead_npcevent = 1;
    # #an_undead_guardian (223105)
	quest::spawn2(223105,0,0,65.2,1109.7,494.8,185.5);
	quest::spawn2(223105,0,0,65.2,1119.7,494.8,185.5);
	quest::spawn2(223105,0,0,65.2,1099.7,494.8,185.5);
    quest::ze(15, "Congdar spawned 3 an_undead_guardian (223105).");
}

sub EVENT_SIGNAL {
	if($signal == 14048) {
        quest::ze(15, "Congdar undead_event signaled phase1_undead_npccounter $phase1_undead_npccounter of 21.");
		$phase1_undead_npcevent = $phase1_undead_npcevent + 1;
	}
	if($phase1_undead_npcevent == 9) {
        quest::ze(15, "Congdar phase1_undead_npccounter 9 of 21 so spawn 4 an_undead_guardian.");
        quest::spawn2(quest::ChooseRandom(223105,223116),0,0,67,1103,494.8,185.5);
        quest::spawn2(quest::ChooseRandom(223105,223116),0,0,67,1120,494.8,185.5);
		quest::spawn2(223105,0,0,62,1103,494.8,185.5);
		quest::spawn2(223105,0,0,62,1120,494.8,185.5);
	}
	elsif($phase1_undead_npcevent == 17) {
        quest::ze(15, "Congdar phase1_undead_npccounter 17 of 21 so spawn 4 an_undead_guardian.");
		quest::spawn2(223116,0,0,67,1103,494.8,185.5);
		quest::spawn2(223116,0,0,67,1120,494.8,185.5);
        quest::spawn2(223116,0,0,62,1103,494.8,185.5);
        quest::spawn2(223116,0,0,62,1120,494.8,185.5);
	}
	elsif($phase1_undead_npcevent == 21) {
        quest::ze(15, "Congdar phase1_undead_npcevent 21 of 21 so spawn Rythor_of_the_Undead and 2 an_undead_protector.");
        # Rythor_of_the_Undead (223129)
		quest::spawn2(223129,0,0,65.2,1109.7,494.8,185.5);
        # an_undead_protector (223150)
		quest::spawn2(223150,0,0,65.2,1119.7,494.8,185.5);
		quest::spawn2(223150,0,0,65.2,1099.7,494.8,185.5);
		$phase1_undead_npcevent = 22;
	}
	if($signal == 14040) {
        quest::ze(15, "Congdar Rythor_of_the_Undead dead signalling phase_trigger, bye.");
        #tell main about event success
		quest::signalwith(223177, 14060, 2000);
		quest::depop();
	}
}

