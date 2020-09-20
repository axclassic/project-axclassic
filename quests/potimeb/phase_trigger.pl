# phase_trigger script npcid - 223177 This is required for signals of all 5 trials

my $Icounter;
my $savedc = 0;

sub EVENT_ZONE { #when zoning out, counters must be reset!
	$savedc = 0;
	$Icounter = 0;
}

sub EVENT_ENTERZONE {
	$savedc = 0;
	$Icounter = 0;
}

sub EVENT_SIGNAL { #phase 1 signals
	if($signal == 14060) {
		$Icounter += 1;
		$savedc = $Icounter;
        #quest::ze(15, "Muahahah you have more to go mortal. and counter is $savedc.");
	}

    if($Icounter == 5) {
		#phase 1 success all doors should unlock
        # quest::settimer("zshake", 1);
		$npc->CameraEffect(3000, 6, 0, 1); #Worlwide camera shake
        ##quest::we is bugged
        ##quest::we(14, "Congratulations to $name! Phase 1 has been completed, move on to phase 2.");
		#quest::forcedooropen(5); #fire trial lower right panel
		#quest::forcedooropen(6); # upper right
		#quest::forcedooropen(7); # upper left
		#quest::forcedooropen(8); # lower left
		#quest::forcedooropen(25); #water trial lower right panel
		#quest::forcedooropen(26); # upper right
		#quest::forcedooropen(27); # upper left
		#quest::forcedooropen(28); # lower left
		#quest::forcedooropen(29); #undead trial lower right panel
		#quest::forcedooropen(30); # upper right
		#quest::forcedooropen(31); # upper left
		#quest::forcedooropen(32); # lower left
		#quest::forcedooropen(42); #earth trial lower right panel
		#quest::forcedooropen(43); # upper right
		#quest::forcedooropen(44); # upper left
		#quest::forcedooropen(45); # lower left
		#quest::forcedooropen(46); #air trial lower right panel
		#quest::forcedooropen(47); # upper right
		#quest::forcedooropen(48); # upper left
		#quest::forcedooropen(49); # lower left
		quest::settimer("opendoors", 5); #5 seconds
		quest::spawn2(223191,0,0,-140,1737,547,0); #phase 2 trigger
		$Icounter = 0;
        #quest::setglobal("bdoors", 1, 7, "H10"); #Sets qglobal bdoors for 10 hours. deletes upon dying/zoning
	}
}#END sub_EVENT_SIGNAL

sub EVENT_TIMER {
    # if($timer eq "zshake") {
	# $npc->CameraEffect(3000, 6, 0, 1); #Worlwide camera shake
	# }
	# quest::stoptimer("zshake");
	if($timer eq "opendoors") {
        #quest::ze(15, "Opening doors!");
        my $open_door = $entity_list->FindDoor(5);
        $open_door->ForceOpen($npc);
        $open_door = $entity_list->FindDoor(6);
        $open_door->ForceOpen($npc);
        $open_door = $entity_list->FindDoor(7);
        $open_door->ForceOpen($npc);
        $open_door = $entity_list->FindDoor(8);
        $open_door->ForceOpen($npc);
        $open_door = $entity_list->FindDoor(25);
        $open_door->ForceOpen($npc);
        $open_door = $entity_list->FindDoor(26);
        $open_door->ForceOpen($npc);
        $open_door = $entity_list->FindDoor(27);
        $open_door->ForceOpen($npc);
        $open_door = $entity_list->FindDoor(28);
        $open_door->ForceOpen($npc);
        $open_door = $entity_list->FindDoor(29);
        $open_door->ForceOpen($npc);
        $open_door = $entity_list->FindDoor(30);
        $open_door->ForceOpen($npc);
        $open_door = $entity_list->FindDoor(31);
        $open_door->ForceOpen($npc);
        $open_door = $entity_list->FindDoor(32);
        $open_door->ForceOpen($npc);
        $open_door = $entity_list->FindDoor(42);
        $open_door->ForceOpen($npc);
        $open_door = $entity_list->FindDoor(43);
        $open_door->ForceOpen($npc);
        $open_door = $entity_list->FindDoor(44);
        $open_door->ForceOpen($npc);
        $open_door = $entity_list->FindDoor(45);
        $open_door->ForceOpen($npc);
        $open_door = $entity_list->FindDoor(46);
        $open_door->ForceOpen($npc);
        $open_door = $entity_list->FindDoor(47);
        $open_door->ForceOpen($npc);
        $open_door = $entity_list->FindDoor(48);
        $open_door->ForceOpen($npc);
        $open_door = $entity_list->FindDoor(49);
        $open_door->ForceOpen($npc);
		#quest::forcedooropen(5); #fire trial lower right panel
		#quest::forcedooropen(6); # upper right
		#quest::forcedooropen(7); # upper left
		#quest::forcedooropen(8); # lower left
		#quest::forcedooropen(25); #water trial lower right panel
		#quest::forcedooropen(26); # upper right
		#quest::forcedooropen(27); # upper left
		#quest::forcedooropen(28); # lower left
		#quest::forcedooropen(29); #undead trial lower right panel
		#quest::forcedooropen(30); # upper right
		#quest::forcedooropen(31); # upper left
		#quest::forcedooropen(32); # lower left
		#quest::forcedooropen(42); #earth trial lower right panel
		#quest::forcedooropen(43); # upper right
		#quest::forcedooropen(44); # upper left
		#quest::forcedooropen(45); # lower left
		#quest::forcedooropen(46); #air trial lower right panel
		#quest::forcedooropen(47); # upper right
		#quest::forcedooropen(48); # upper left
		#quest::forcedooropen(49); # lower left
	}
	#quest::stoptimer($timer); #repop resets this anyway
}

