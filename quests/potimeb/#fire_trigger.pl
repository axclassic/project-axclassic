##fire_trigger this is an invisible controller that triggers #fire_event.pl
#npcid - 223173

my $fnpccounter = 0;
my $firec = 0;

# This spawns fire grp + boss forphase 2
sub EVENT_SPAWN {
    $fnpccounter = 0;
    $firec = 0;
    quest::spawn2(223143,0,0,252.0,589.0,491.0,192.5);
    quest::spawn2(223109,0,0,242.0,584.0,491.2,192.5);
    quest::spawn2(223143,0,0,252.0,579.0,491.0,192.5);
    quest::spawn2(223109,0,0,232.0,579.0,491.6,192.5);
    quest::spawn2(223109,0,0,242.0,574.0,491.5,192.5);
    quest::spawn2(223137,0,0,252.0,569.0,491.3,192.5);
    quest::spawn2(223137,0,0,232.0,569.0,491.9,192.5);
    quest::spawn2(223117,0,0,242.0,564.0,491.6,192.5);
    quest::spawn2(223137,0,0,252.0,559.0,491.0,192.5);
    # Boss Gutripping_War_Beast
    quest::spawn2(223146,0,0,262.0,574.0,491.0,192.5);
}

#like fire_counter.pl starts a counter forwhen all are dead, then opens inner doors!
sub EVENT_SIGNAL {
        if($signal == 14035) {
            #This signal are from these mobs upon death!
            $fnpccounter = $fnpccounter + 1;
            $firec = $fnpccounter;
            #quest::ze(15, "okay i signaled and my counter is now $firec.");
        }
    if($fnpccounter >= 10) {
        # phase_trigger script npcid - 223191
        quest::signalwith(223191, 14035, 4000);
        $fnpccounter = 0;
        quest::depop();
    }
}

#sub EVENT_ENTER {
#quest::settimer("fire",1); #1 sec after first player enters event starts
#quest::clear_proximity();
#}

#sub EVENT_TIMER {
#if ($timer eq "fire") {
    #quest::spawn2(223190,0,0,-129.6,1720,547,0); #spawn event script
    #quest::signalwith(223211,23,0); #send signal to main trigger to start hour time limit
    #quest::stoptimer("fire");
    #quest::depop();
    #}
    #}

