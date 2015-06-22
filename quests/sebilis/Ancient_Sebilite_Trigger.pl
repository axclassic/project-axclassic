my $ancient_sebilite_event = 0;

sub EVENT_SPAWN  {
  $ancient_sebilite_event = 0;
  $counter = undef;
}
sub EVENT_SIGNAL {
    	if($signal == 891) { ##signal 981 is from each a_sebilite_juggernaut##
    $counter += 1;
	   if($counter == 4) {
	   quest::spawn2(89196,0,0,-334,-1433.3,-105.8,255.5);
	   quest::spawn2(89194,0,0,-307.3,-1409.9,-107,192.6);
	   quest::spawn2(89195,0,0,-359.2,-1411.5,-107,67.8);
	   quest::depopall(89193);
	  }
	 }
	 sub EVENT_TIMER {
	quest::depop(89196);
	quest::depop(89194);
	quest::depop(89195);
	quest::depop(89198);
	quest::depop();
	}
  }
