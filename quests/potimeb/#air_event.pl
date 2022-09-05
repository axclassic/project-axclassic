#This is an invisible controller which spawns the air phoneix
# #air_event (223187)

my $phase1_air_npcevent = 1;

sub EVENT_SPAWN {
    $phase1_air_npcevent = 1;
    # An_Air_Phoenix_Noble (223087)
	quest::spawn2(223087,0,0,67,1364,494.8,185.5);
	quest::spawn2(223087,0,0,67,1347,494.8,185.5);
	quest::spawn2(223087,0,0,62,1364,494.8,185.5);
	quest::spawn2(223087,0,0,62,1347,494.8,185.5);
    quest::ze(15, "Congdar air_event spawned 4 An_Air_Phoenix_Noble.");
} 

sub EVENT_SIGNAL {
	if($signal == 14058) {
        quest::ze(15, "Congdar air_event received a signal $phase1_air_npcevent of 12.");
		$phase1_air_npcevent = $phase1_air_npcevent + 1;
        if($phase1_air_npcevent == 13) {
            quest::ze(15, "Congdar phase1_air_npcevent 12 of 12 so spawn Neimon_of_Air and 4 Servitor_of_Xegony.");
            # Neimon_of_Air (223120)
            quest::spawn2(223120,0,0,68,1355,494.8,185.5);
            # Servitor_of_Xegony (223995)
            quest::spawn2(223995,0,0,68+5,1365,494.8,185.5);
            quest::spawn2(223995,0,0,68-5,1375,494.8,185.5);
            quest::spawn2(223995,0,0,68,1345+5,494.8,185.5);
            quest::spawn2(223995,0,0,68,1335-5,494.8,185.5);
            $phase1_air_npcevent = 14;
        }
	}
	if($signal == 14050) {
        quest::ze(15, "Congdar air_event Neimon_of_Air dead signalling phase_trigger, bye.");
        # Time_Companion
        quest::spawn2(223228,0,0,75.4,1404.9,493.7,171.89);
        #tell main about event success
		quest::signalwith(223177, 14060, 2000);
		quest::depop();
	}
}

