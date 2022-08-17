#This is an invisible controller which spawns the earth rubbles.
#npcid - 223186

my $enpccounter = 0;
my $earthc = 0;

sub EVENT_SPAWN {
    $enpccounter = 0;
    $earthc = 0;
    quest::spawn2(223106,0,0,70.3,1644.5,493.7,185.5); #a_pile_of_living_rubble
    quest::spawn2(223106,0,0,70.3,1654.5,493.7,185.5);
    quest::spawn2(223106,0,0,70.3,1634.5,493.7,185.5);
}  

sub EVENT_SIGNAL {
	if($signal == 14018) {
		$enpccounter = $enpccounter + 1;
		$earthc = $enpccounter;
		#quest::ze(15, "okay i signaled and my counte ris now $earthc.");
	}
	if($enpccounter >= 3 ) { #was at 8 testing at 3 In other words 3 must be killed to pop boss.
		quest::spawn2(223119,0,0,70.3,1644.5,493.7,185.5); #Terlok_of_Earth
		$enpccounter = 0;
	}
	if($signal == 14010) {
		quest::signalwith(223177,14060,4000); #tell phase_trigger about event success (earth boss is dead)
		quest::depop();
		
	}
}

