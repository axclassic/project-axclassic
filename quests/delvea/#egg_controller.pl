my $egg_event = 0;

 
  sub EVENT_SPAWN {
  $egg_event = 0;
  $counter = undef;
  }
sub EVENT_SIGNAL {
  	if ($signal == 540) {
	 $egg_event += 1 # adds one to spawn variable # 
    }
    if($signal == 541) { #signal 427 is from each of the goblins
    $counter += 1;
      if($counter == 10) {
	quest::spawn2(341085,0,0,-1048.4,-1252.2,-96.2,220.4);
	}
	if($signal == 541) { #signal 427 is from each of the goblins
      if($counter == 15) {
	quest::spawn2(341086,0,0,-1154.1,-954.8,-21.6,105.4);
    }
if($signal == 541) { #signal 427 is from each of the goblins
      if($counter == 20) {
	quest::spawn2(341087,0,0,-1497,-1507.9,-102.7,114.4);
    }
	if($signal == 541) { #signal 427 is from each of the goblins
      if($counter == 25) {
	quest::spawn2(341088,0,0,-1750,-1777.9,-182.9,49.9);
	quest::depop(341081);
	quest::depop();
    } 
  }
 }
}
}
}
