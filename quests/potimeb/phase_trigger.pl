# phase_trigger script npcid - 223177 This is required for signals of all 5 trials

my $Icounter = 1;

sub EVENT_SPAWN {
    $Icounter = 1;
}

sub EVENT_SIGNAL {
    #phase 1 signals
	if($signal == 14060) {
        quest::ze(15, "Congdar Phase1 signal is Icounter $Icounter of 5.");
		$Icounter = $Icounter + 1;
	}

    if($Icounter >= 10) {
        quest::ze(15, "Congdar Phase1 count is 9 of 9, shake the world, open doors, spawn phase2_trigger (223191).");
        #Worlwide camera shake
		$npc->CameraEffect(3000, 6, 0, 1);
        #5 seconds
		quest::settimer("opendoors", 5);
        #phase 2 trigger
		quest::spawn2(223191,0,0,-140,1737,547,0);
		$Icounter = 1;
	}
}
#END sub_EVENT_SIGNAL

sub EVENT_TIMER {
	if($timer eq "opendoors") {
        quest::ze(15, "Congdar Opening doors, bye.");
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
        quest::depop();
	}
}

