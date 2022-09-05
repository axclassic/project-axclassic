##air_trigger this is an invisible controller that triggers #air_event.pl
# #air_trigger (223170)

my $phase2_air_npctrigger = 1;

#This spawns air grp + boss for phase 2
sub EVENT_SPAWN {
    $phase2_air_npctrigger = 1;
    # #An_Air_Phoenix_Noble (223226)
    quest::spawn2(223226,0,0,242.0,1364.0,491.3,192.5);
    quest::spawn2(223226,0,0,252.0,1359.0,491.1,192.5);
    quest::spawn2(223226,0,0,232.0,1359.0,491.9,192.5);
    quest::spawn2(223226,0,0,242.0,1354.0,491.7,192.5);
    quest::spawn2(223226,0,0,242.0,1344.0,491.4,192.5);
    # Servitor_of_Xegony (223216)
    quest::spawn2(223216,0,0,252.0,1369.0,491.0,192.5);
    quest::spawn2(223216,0,0,232.0,1349.0,491.9,192.5);
    quest::spawn2(223216,0,0,252.0,1339.0,491.0,192.5);
    quest::spawn2(223216,0,0,252.0,1349.0,491.3,192.5);
    #Boss Windshapen_Warlord_of_Air
    quest::spawn2(223118,0,0,262.0,1354.0,491.0,192.5);
    quest::ze(15, "Congdar spawned 5 An_Air_Phoenix_Noble, 4 Servitor_of_Xegony, and Windshapen_Warlord_of_Air.");
}

#like air_counter.pl starts a counter for when all are dead, then opens inner doors!
sub EVENT_SIGNAL {
    #This signal are from these mobs upon death!
    if($signal == 14035) {
        quest::ze(15, "Congdar air_trigger signaled phase2_air_npctrigger $phase2_air_npctrigger of 9.");
        $phase2_air_npctrigger = $phase2_air_npctrigger + 1;
        #phase_trigger script npcid - 223191
        if($phase2_air_npctrigger >= 10) {
            quest::ze(15, "Congdar phase2_air_npctrigger 9 of 9 so signal phase2_trigger, bye.");
            quest::signalwith(223191, 14035, 2000);
            $phase2_air_npctrigger = 1;
            quest::depop();
        }
    }
}

