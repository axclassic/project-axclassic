##earth_trigger this is an invisible controller for phase 2 last mob+boss encounter
# #earth_trigger (223169)

my $phase2_earth_npctrigger = 1;

#This spawns 2nd grp + boss forphase 2
sub EVENT_SPAWN {
    $phase2_earth_npctrigger = 1;
    # An_Unholy_Rock_Fiend (223125)
    quest::spawn2(223125,0,0,242.0,1654.0,491.6,192.5);
    quest::spawn2(223125,0,0,252.0,1649.0,491.3,192.5);
    quest::spawn2(223125,0,0,242.0,1644.0,491.5,192.5);
    quest::spawn2(223125,0,0,232.0,1639.0,491.6,192.5);
    # An_Elemental_Stonefist (223133)
    quest::spawn2(223133,0,0,252.0,1639.0,491.0,192.5);
    quest::spawn2(223133,0,0,242.0,1634.0,491.2,192.5);
    # #An_Unholy_Rock_Fiend (223110)
    quest::spawn2(223110,0,0,252.0,1659.0,491.0,192.5);
    # An_Elemental_Stonefist (223102)
    quest::spawn2(223102,0,0,232.0,1649.0,491.9,192.5);
    quest::spawn2(223102,0,0,252.0,1629.0,491.0,192.5);
    #Boss Earthen_Overseer (223134)
    quest::spawn2(223134,0,0,262.0,1644.0,491.0,192.5);
    #quest::ze(15, "Congdar spawned 5 An_Unholy_Rock_Fiend, 4 An_Elemental_Stonefist, and Earthen_Overseer.");
}

#like earth_counter.pl starts a counter for when all are dead, then opens inner doors!
sub EVENT_SIGNAL {
    #This signal are from these mobs upon death!
    if($signal == 14035) {
        #quest::ze(15, "Congdar earth_trigger signaled phase2_earth_npctrigger $phase2_earth_npctrigger of 10.");
        $phase2_earth_npctrigger = $phase2_earth_npctrigger + 1;
        #phase_trigger script npcid - 223191
        if($phase2_earth_npctrigger >= 11) {
            #quest::ze(15, "Congdar phase2_earth2_npctrigger 10 of 10 so signal phase2_trigger, bye.");
            quest::signalwith(223191, 14035, 2000);
            $phase2_earth_npctrigger = 1;
            quest::depop();
        }
    }
}

