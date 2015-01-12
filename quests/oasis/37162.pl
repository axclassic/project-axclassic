my $orc_ring_event = 0;

sub EVENT_SPAWN  {
  quest::settimer(1,1800);
  $orc_ring_event = 0;
  $counter = undef;
}
sub EVENT_SIGNAL {
    if ($signal == 371) {
	 $t_shara_event += 1; # adds one to spawn variable # 
	 }
	if($signal == 372) { ##signal 372 is from each guard##
    $counter += 1;
	   if($counter == 4) {
	quest::spawn2(37166,0,0,1433,2093.2,32.9,167.5);
	quest::spawn2(37166,0,0,1436,2070.4,28.5,186.2);
	quest::spawn2(37166,0,0,1431.8,2033.2,21.2,196.8);
	quest::spawn2(37166,0,0,1426.4,2009.6,16.5,228.1);
	}
	if($counter == 8) {
	quest::spawn2(37166,0,0,1433,2093.2,32.9,167.5);
	quest::spawn2(37166,0,0,1436,2070.4,28.5,186.2);
	quest::spawn2(37166,0,0,1431.8,2033.2,21.2,196.8);
	quest::spawn2(37166,0,0,1426.4,2009.6,16.5,228.1);
	}
	if($counter == 12) {
	quest::spawn2(37166,0,0,1433,2093.2,32.9,167.5);
	quest::spawn2(37166,0,0,1436,2070.4,28.5,186.2);
	quest::spawn2(37166,0,0,1431.8,2033.2,21.2,196.8);
	quest::spawn2(37166,0,0,1426.4,2009.6,16.5,228.1);
	}
	if($counter == 16) {
	quest::depop(37165);
	quest::depop(37161);
	quest::spawn2(37168,0,0,-757,2478.4,2.2,116.8);
	quest::depop();
	}
	}
	}
	sub EVENT_TIMER {
	quest::stoptimer(1);
	quest::depopall(37166);
	quest::depop(37165);
	quest::depop(37161);
	quest::depop(37168);
	quest::depop();
   }

   