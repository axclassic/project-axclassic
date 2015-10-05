my $young_wolf_event = 0;

 
  sub EVENT_SPAWN {
  $young_wolf_event = 0;
  $counter = undef;
  }
sub EVENT_SIGNAL {
    if ($signal == 101) {
	$young_wolf_event += 1;	# adds one to spawn variable # 
	}
	if($signal == 102) { ##signal 102 is from each young_sonic_wolf##
    $counter += 1;
	   if($counter == 15) {
	quest::depopall(166297); 
	quest::depopall(166298); 
	quest::depopall(166299);
	quest::depopall(166300);
	quest::depopall(166301);
	quest::depop(166302);
	quest::depopall(166303);
	quest::depopall(166304);
	quest::depopall(166305);
	quest::depop();
	}
   }
 }