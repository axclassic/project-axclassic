#water_counter.pl used as phase2 mobs instead!
# #water_counter (223181)

my $phase2_water_npccounter = 1;

sub EVENT_SPAWN { #This spawns 1st mob group for Phase 2
    $phase2_water_npccounter = 1;
    #water group
    # A_Watercrafted_Hunter (223148)
	quest::spawn2(223148,0,0,252.0,884.0,491.0,192.5);
    quest::spawn2(223148,0,0,252.0,864.0,491.3,192.5);
	quest::spawn2(223148,0,0,242.0,879.0,491.3,192.5);
    # Champion_of_Korascian (223123)
    quest::spawn2(223123,0,0,232.0,864.0,492.0,192.5);
    quest::spawn2(223123,0,0,242.0,859.0,491.5,192.5);
    # Champion_of_Korascian (223099)
	quest::spawn2(223099,0,0,232.0,874.0,491.7,192.5);
    # A_Deepwater_Assassin (223141)
	quest::spawn2(223141,0,0,252.0,874.0,491.1,192.5);
    # A_Deepwater_Assassin (223126)
	quest::spawn2(223126,0,0,242.0,869.0,491.6,192.5);
    # A_Watercrafted_Hunter (223153)
	quest::spawn2(223153,0,0,252.0,854.0,491.0,192.5);
    quest::ze(15, "Congdar water_counter pawning 3 A_Watercrafted_Hunter, 3 Champion_of_Korascian, 2 A_Deepwater_Assassin and A_Watercrafted_Hunter."); 
}

sub EVENT_SIGNAL {
    #like water_event.pl starts a counter for when all are dead, spawns the next group!
	if($signal == 14058) {
        quest::ze(15, "Congdar water_counter received signal phase2_water_npccounter is $phase2_water_npccounter out of 8."); 
        #This signal are from these mobs upon death!
		$phase2_water_npccounter = $phase2_water_npccounter + 1;
        if($phase2_water_npccounter == 9) {
            quest::ze(15, "Congdar water_counter phase2_water_npccounter 9 of 9 so signal phase2_trigger.");
            # phase_trigger script npcid - 223191
            quest::signalwith(223191, 14034, 2000);
            $phase2_water_npccounter = 11;
            quest::depop();
        }
	}	
}

