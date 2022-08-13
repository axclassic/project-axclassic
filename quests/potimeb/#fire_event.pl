#This is an invisible controller which spawns the flame mephits
#npcid - 223190

my $fnpccounter = 0;
my $firec = 0;

sub EVENT_SPAWN {
    $fnpccounter = 0;
    $firec = 0;
    quest::spawn2(223088,0,0,68,573,504,185.5); #a_flame_mephit
    quest::spawn2(223088,0,0,68,563,504,185.5);
    quest::spawn2(223088,0,0,68,583,504,185.5);
}  

sub EVENT_SIGNAL {
	if($signal == 14028) {
		$fnpccounter = $fnpccounter + 1;
		$firec = $fnpccounter;
		#quest::ze(15, "okay i signaled and my counte ris now $firec.");
	}
	if($fnpccounter >= 3 ) { # was at 9, testing at 2.
		quest::spawn2(223090,0,0,68,573,504,185.5); #Kazrok_of_Fire
		$fnpccounter = 0;
	}
	if($signal == 14020) {
		quest::signalwith(223177,14060,0); #tell main about phase 1 success
		quest::depop();
	}
}

