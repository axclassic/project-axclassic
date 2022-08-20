##water_trigger this is an invisible controller that triggers #water_event.pl
# #water_trigger (223172)

my $phase2_water_npctrigger = 1;

#This spawns water 2nd grp + boss for phase 2
sub EVENT_SPAWN {
    $phase2_water_npctrigger = 1;
    # A_Watercrafted_Hunter (223148)
    quest::spawn2(223148,0,0,242.0,859.0,491.5,192.5);
    quest::spawn2(223148,0,0,252.0,854.0,491.0,192.5);
    quest::spawn2(223148,0,0,252.0,874.0,491.1,192.5);
    quest::spawn2(223148,0,0,242.0,869.0,491.6,192.5);
    # Champion_of_Korascian (223123)
    quest::spawn2(223123,0,0,252.0,884.0,491.0,192.5);
    # A_Watercrafted_Hunter (223153)
    quest::spawn2(223153,0,0,232.0,874.0,491.7,192.5);
    quest::spawn2(223153,0,0,232.0,864.0,492.0,192.5);
    # A_Crustacean_Champion (223132)
    quest::spawn2(223132,0,0,252.0,864.0,491.3,192.5);
    # A_Deepwater_Assassin (223126)
    quest::spawn2(223126,0,0,242.0,879.0,491.3,192.5);
    #Boss War_Shapen_Emissary
    quest::spawn2(223096,0,0,262.0,869.0,491.0,192.5);
    quest::ze(15, "Congdar pawning 6 A_Watercrafted_Hunter, 1 Champion_of_Korascian, 2 A_Watercrafted_Hunter, A_Crustacean_Champion, A_Deepwater_Assassin and War_Shapen_Emissary."); 
}

#like water_counter.pl starts a counter forwhen all are dead, then opens inner doors!
sub EVENT_SIGNAL {
    if($signal == 14035) {
        quest::ze(15, "Congdar water_trigger signaled phase2_water_npctrigger is $phase2_water_npctrigger out of 10."); 
        #This signal are from these mobs upon death!
        $phase2_water_npctrigger = $phase2_water_npctrigger + 1;
    }
    #phase_trigger script npcid - 223191
    if($phase2_water_npctrigger >= 11) {
        quest::ze(15, "Congdar phase2_water_npctrigger 10 of 10 so signal phase2_trigger.");
        quest::signalwith(223191, 14035, 2000);
        $phase2_water_npctrigger = 1;
        quest::depop();
    }
}

