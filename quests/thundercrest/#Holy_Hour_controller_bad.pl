my $holy_hour_event = 0;

 
  sub EVENT_SPAWN {
  $holy_hour_event = 0;
  $counter = undef;
  }
sub EVENT_SIGNAL {
    if ($signal == 565) {
	 $holy_hour_event += 1; # adds one to spawn variable # 
	 }
	if($signal == 566) { ##signal 566 is from each mob reaching the other side of bridge##
    $counter += 1;
	   if($counter == 10) {
	quest::shout("You have failed to keep 10 from reaching the Temple!"),   
	quest::depop(340081);
	quest::depop(340082);
	quest::depop(340083);
    quest::depop(340084);
    quest::depop(340085);
	quest::depop(340086);
	quest::depop(340087);
	quest::depop(340080);
    quest::depop();	
    }
   }
 }
