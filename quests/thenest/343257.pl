my $vish_event = 0;

sub EVENT_SPAWN  {
  $vish_event = 0;
  $counter = undef;
}
sub EVENT_SIGNAL {
    if ($signal == 621) {
	 $vish_event += 1; # adds one to spawn variable # 
	 }
	if($signal == 622) { 
    $counter += 1;
	   if($counter == 4) {
    quest::depop(343256)
    quest::spawn2(343259,0,0,-4570.5,-683.4,-129.7,87);
	}
	}
	}
	