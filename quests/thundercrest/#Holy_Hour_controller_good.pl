my $holy_hour_event = 0;

 
  sub EVENT_SPAWN {
  $holy_hour_event = 0;
  $counter = undef;
  }
sub EVENT_SIGNAL {
    if ($signal == 665) {
	 $holy_hour_event += 1; # adds one to spawn variable # 
	 }
	if($signal == 666) { ##signal 666 is from each mob who dies before reaching the other side of bridge##
    $counter += 1;
	   if($counter == 50) {
	quest::shout("Well done! Return to Bianca Galbraith and collect your reward."),   
	quest::depop(340081);
	quest::depop(340082);
	quest::depop(340083);
    quest::depop(340084);
    quest::depop(340085);
	quest::depop(340086);
	quest::depop(340079);
    quest::depop();	
	}
   }
 }