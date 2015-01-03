my $ancient_sebilite_event = 0;

sub EVENT_SPAWN  {
  $ancient_sebilite_event = 0;
  $counter = undef;
}
sub EVENT_SIGNAL {
    	if($signal == 891) { ##signal 981 is from each a_sebilite_juggernaut##
    $counter += 1;
	   if($counter == 3) {
	   quest::spawn2(891960,0,0,-343,-1436.2,-107,5.6);
	   quest::spawn2(89194,0,0,-307.3,-1409.9,-107,192.6);
	   quest::spawn2(89195,0,0,-332.7,-1391.3,-107,126.50);
	   quest::depopall(89193);
	   quest::depop();
	   
	}
  }
}  