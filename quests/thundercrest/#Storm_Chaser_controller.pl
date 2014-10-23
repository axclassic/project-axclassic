my $storm_chaser_event = 0;

 
  sub EVENT_SPAWN {
  $storm_chaser_event = 0;
  $counter = undef;
  quest::shout("I am here");
  }
sub EVENT_SIGNAL {
  if($signal == 2005) {
  $storm_chaser_event += 1; 
  quest::shout("Recieved signal 2005 adding 1 to counter");
  }
  if($signal == 2010) { 
    $counter += 1;
	quest::shout("Recieved signal 2010");
	   if($counter == 3) {
	quest::shout("Counter reached 3 spawning Thunderheads");   
	quest::spawn2(340135,340077,0,199.2,1279.1,-23.9,126.1);
    quest::spawn2(340135,340078,0,218.8,1281.4,-20.7,111);
    quest::spawn2(340135,340079,0,240.3,1280.4,-16.3,131.9);
    }	
	if($signal == 2010) { 
	quest::shout("Recieved signal 2010");
      if($counter == 6) {
	  quest::shout("Counter reached 6 spawning Raging Thunderhead");
	quest::spawn2(340136,340078,0,218.8,1281.4,-20.7,111); 
	quest::depop(340137);
	quest::depop();
	}
	}
	}
	}