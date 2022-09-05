##undead_trigger this is an invisible controller that triggers #undead_event.pl
# #undead2_trigger (223175)

my $undead_npc_counter = 1;

# This spawns undead 2nd grp + boss phase 2
sub EVENT_SPAWN {
    $undead_npc_counter = 1;
    # an_undead_guardian_ (223107)
    quest::spawn2(223107,0,0,232.0,1114.0,491.2,192.5);
    quest::spawn2(223107,0,0,242.0,1119.0,491.3,192.5);
    quest::spawn2(223107,0,0,242.0,1109.0,491.5,192.5);
    quest::spawn2(223107,0,0,252.0,1104.0,491.7,192.5);
    quest::spawn2(223107,0,0,242.0,1099.0,491.2,192.5);
    quest::spawn2(223107,0,0,252.0,1094.0,491.4,192.5);
    # an_undead_guardian_ (223138)
    quest::spawn2(223138,0,0,232.0,1104.0,491.1,192.5);
    quest::spawn2(223138,0,0,252.0,1124.0,491.4,192.5);
    quest::spawn2(223138,0,0,252.0,1114.0,491.8,192.5);
    #Boss Ralthos_Enrok
    quest::spawn2(223127,0,0,262.0,1109.0,492.1,192.5);
    quest::ze(15, "Congdar spawned 9 an_undead_guardian_, and Ralthos_Enrok.");
}

#like undead_counter.pl starts a counter forwhen all are dead, then opens inner doors!
sub EVENT_SIGNAL {
    if($signal == 14035) {
        #This signal are from these mobs upon death!
        $undead_npc_counter = $undead_npc_counter + 1;
        if($undead_npc_counter >= 10) {
            # phase_trigger script npcid - 223191
            quest::signalwith(223191, 14035, 4000);
            $undead_npc_counter = 1;
            quest::depop();
        }
    }
}

