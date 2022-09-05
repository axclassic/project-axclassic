#This is an invisible controller which spawns the flame mephits
# #fire_event (223190)

my $phase1_fire_npcevent = 1;

sub EVENT_SPAWN {
    $phase1_fire_npcevent = 1;
    # #a_flame_mephit (223088)
    quest::spawn2(223088,0,0,68,573,504,185.5);
    quest::spawn2(223088,0,0,68,563,504,185.5);
    quest::spawn2(223088,0,0,68,583,504,185.5);
    quest::ze(15, "Congdar fire_event spawned 3 a_flame_mephit.");
}  

sub EVENT_SIGNAL {
	if($signal == 14028) {
        quest::ze(15, "Congdar fire_event received signal $phase1_fire_npcevent of 8.");
		$phase1_fire_npcevent = $phase1_fire_npcevent + 1;
        if($phase1_fire_npcevent == 9 ) {
            quest::ze(15, "Congdar phase1_fire_npcevent 9 of 9 so spawn Kazrok_of_Fire.");
            # Kazrok_of_Fire (223090)
            quest::spawn2(223090,0,0,68,573,504,185.5);
            $phase1_fire_npcevent = 11;
        }
	}
	if($signal == 14020) {
        # Time_Companion
        quest::spawn2(223228,0,0,76.59,617.2,495.2,177.8);
        quest::ze(15, "Congdar fire_event Kazrok_of_Fire dead signalling phase_trigger, bye.");
        #tell main about phase 1 success
		quest::signalwith(223177, 14060, 2000);
		quest::depop();
	}
}

