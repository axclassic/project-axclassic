my $fertile_event = 0;

sub EVENT_SPAWN  {
  quest::settimer(1,1800);
  $fertile_event = 0;
  $counter = undef;
}
sub EVENT_SIGNAL {
    if ($signal == 301) {
	 $fertile_event += 1; # adds one to spawn variable # 
	 }
	if($signal == 311) { ##signal 311 is from each guard##
    $counter += 1;
	   if($counter == 5) {
	my $a = quest::ChooseRandom(301061,301058,301061,301061,301061,301061,301061,301061,301061,301061,301061,301061,301061,301061,301061,301061,301061,301061,301061,301061,);
    quest::spawn2($a,0,0,607.4,176.4,-951.1,16.2);
	}
   }
   }
	sub EVENT_TIMER {
	quest::stoptimer(1);
	quest::depopall(301056);
	quest::depop(301054);
	quest::depop(301055);
	quest::depop(301057);
	quest::depop();
   }