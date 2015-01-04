my $t_shara_event = 0;

sub EVENT_SPAWN  {
  quest::settimer(1,1800);
  $t_shara_event = 0;
  $counter = undef;
}
sub EVENT_SIGNAL {
    if ($signal == 310) {
	 $t_shara_event += 1; # adds one to spawn variable # 
	 }
	if($signal == 311) { ##signal 311 is from each Aspect##
    $counter += 1;
	   if($counter == 5) {
	quest::spawn2(343181,0,0,-1588.9,-580.3,-179.7,253.2);
	quest::depop(343176);
	quest::depop();
	}
	sub EVENT_TIMER {
	quest::stoptimer(1);
	quest::depop(343179);
	quest::depop(343180);
	quest::depop(343177);
	quest::depop(343178);
	quest::depop(343181);
	quest::depop(343223);
    quest::depop();
   }
  }
 }
   