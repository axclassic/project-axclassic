my $Lhranc_event = 0;

  sub EVENT_SPAWN {
  $defunct_sentry_event = 0;
  $counter = undef;
  }
  sub EVENT_SIGNAL {
    if ($signal == 1007) {
	 $defunct_sentry_event += 1; # adds one to spawn variable # 
	 }
	 if($signal == 1008) { ##signal 1008 is from each a_minion_of_Lhranc##
    $counter += 1;
	   if($counter == 6) {
	quest::spawn2(336531,0,0,1038.1,2367.9,-26.1,229.1);
	quest::depop(336101);
	quest::depop();
	}
	}
	}