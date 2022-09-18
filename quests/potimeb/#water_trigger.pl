##water_trigger this is an invisible controller that triggers #water_event.pl
# #water_trigger (223172)

#This spawns water 2nd grp + boss for phase 2
sub EVENT_SPAWN {
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
    #quest::ze(15, "Congdar pawning 6 A_Watercrafted_Hunter, 1 Champion_of_Korascian, 2 A_Watercrafted_Hunter, A_Crustacean_Champion, A_Deepwater_Assassin and War_Shapen_Emissary."); 
    quest::depop();
}

