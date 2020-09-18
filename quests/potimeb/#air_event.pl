#This is an invisible controller which spawns the air phoneix
#npcid - 223187

my $anpccounter = 0;
my $airc = 0;

sub EVENT_SPAWN {
	$anpccounter = 0;
	quest::spawn2(quest::ChooseRandom(223087),0,0,67,1364,494.8,185.5); #An_Air_Phoenix_Noble
	quest::spawn2(quest::ChooseRandom(223087),0,0,67,1347,494.8,185.5);
	quest::spawn2(quest::ChooseRandom(223087),0,0,62,1364,494.8,185.5);
	quest::spawn2(quest::ChooseRandom(223087),0,0,62,1347,494.8,185.5);
}  

sub EVENT_SIGNAL {
	if($signal == 14058) {
		$anpccounter += 1;
		$airc = $anpccounter;
        #quest::ze(15, "okay i signaled and my counte ris now $airc.");
	}

	if($anpccounter == 4) {
		# at 4 set at 2
		quest::spawn2(223120,0,0,68,1355,494.8,185.5); #Neimon_of_Air
		quest::spawn2(223995,0,0,68,1365,494.8,185.5); #servitor_of_xegony
        #quest::spawn2(223995,0,0,68,1375,494.8,185.5);
        #quest::spawn2(223995,0,0,68,1345,494.8,185.5);
        #quest::spawn2(223995,0,0,68,1335,494.8,185.5);
		$anpccounter = 0;
	}
	if($signal == 14050) {
		quest::signalwith(223177,14060,0); #tell main about event success
		quest::depop();
	}
}

