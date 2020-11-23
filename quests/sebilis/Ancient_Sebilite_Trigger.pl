##Ancient_Sebilite_Trigger ID 89197##
my $jugcounter = 0;
my $guardcounter = 0;

sub EVENT_SPAWN  {
    $jugcounter = 0;
    $guardcounter = 0;
    quest::settimer("start_event", 10);
}

sub EVENT_TIMER {
	if($timer eq "start_event") {
        quest::stoptimer("start_event");
        # spawn 4 a_sebilite_ juggernaut (89193)
        quest::spawn2(89193,0,0,-332.7,-1391.3,-107,126.5);
        quest::spawn2(89193,0,0,-362.6,-1431.3,-107,26.2);
        quest::spawn2(89193,0,0,-332,-1434.5,-107,0.8);
        quest::spawn2(89193,0,0,-297.8,-1425.3,-107,217.3);
    }
}

sub EVENT_SIGNAL {
    if($signal == 891) {
        ##signal 891 is from a_sebilite_juggernaut##
        $jugcounter += 1;
        if($jugcounter >= 4) {
            # A_Sebilite_ Guardian (89194)
            quest::spawn2(89194,0,0,-307.3,-1409.9,-107,192.6);

            # A_Sebilite_ Guardian (89195)
            quest::spawn2(89195,0,0,-359.2,-1411.5,-107,67.8);

            # An_Ancient_Sebilite_Protector (89196)
            quest::spawn2(89196,0,0,-334,-1433.3,-107,255.5);
        }
    }
    if($signal == 892) {
        ##signal 892 is from A_Sebilite_ Guardian##
        $guardcounter += 1;
        if($guardcounter >= 2) {
            quest::depop();
        }
    }
}

