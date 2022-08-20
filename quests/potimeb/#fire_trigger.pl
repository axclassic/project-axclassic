##fire_trigger this is an invisible controller that triggers #fire_event.pl
# #fire_trigger (223173)

my $phase2_fire_npctrigger = 1;

# This spawns fire grp + boss forphase 2
sub EVENT_SPAWN {
    $phase2_fire_npctrigger = 1;
    # A_Ferocious_War_Boar (223143)
    quest::spawn2(223143,0,0,252.0,589.0,491.0,192.5);
    quest::spawn2(223143,0,0,252.0,579.0,491.0,192.5);
    # A_Smoldering_Elemental (223109)
    quest::spawn2(223109,0,0,232.0,579.0,491.6,192.5);
    quest::spawn2(223109,0,0,242.0,584.0,491.2,192.5);
    quest::spawn2(223109,0,0,242.0,574.0,491.5,192.5);
    # A_Fire_Etched_Doombringer (223137)
    quest::spawn2(223137,0,0,252.0,569.0,491.3,192.5);
    quest::spawn2(223137,0,0,232.0,569.0,491.9,192.5);
    quest::spawn2(223137,0,0,252.0,559.0,491.0,192.5);
    # A_Ferocious_War_Boar (223117)
    quest::spawn2(223117,0,0,242.0,564.0,491.6,192.5);
    # Boss Gutripping_War_Beast
    quest::spawn2(223146,0,0,262.0,574.0,491.0,192.5);
    quest::ze(15, "Congdar spawned 3 A_Ferocious_War_Boar, 3 A_Smoldering_Elemental, 3 A_Fire_Etched_Doombringer, and Gutripping_War_Beast.");
}

#like fire_counter.pl starts a counter forwhen all are dead, then opens inner doors!
sub EVENT_SIGNAL {
    if($signal == 14035) {
        quest::ze(15, "Congdar fire_trigger signaled phase2_fire_npctrigger $phase2_fire_npctrigger of 9.");
        #This signal are from these mobs upon death!
        $phase2_fire_npctrigger = $phase2_fire_npctrigger + 1;
    }
    if($phase2_fire_npctrigger >= 10) {
        quest::ze(15, "Congdar Gutripping_War_Beast dead signalling phase2_trigger, bye.");
        # phase_trigger script npcid - 223191
        quest::signalwith(223191, 14035, 2000);
        $phase2_fire_npctrigger = 1;
        quest::depop();
    }
}

