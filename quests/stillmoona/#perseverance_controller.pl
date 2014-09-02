my $perseverance_event = 0;

 
  sub EVENT_SPAWN {
  $perseverance_event = 0;
  $counter = undef;
  }
sub EVENT_SIGNAL {
  	if ($signal == 421) {
	 $perseverance_event += 1 # adds one to spawn variable # 
    }
    if ($signal == 422) {
	quest::spawn2(338001,0,0,8.4,36.6,-31.7,175.9);
	quest::spawn2(338001,0,0,-27,36.6,-31.7,76.6);
	quest::spawn2(338001,0,0,-27,51,-32.9,110.5);
	quest::spawn2(338001,0,0,8.4,51,-32.9,135.6);
	}
	if($signal == 427) { #signal 427 is from each of the goblins
    $counter += 1;
      if($counter == 4) {
	quest::spawn2(338001,0,0,8.4,36.6,-31.7,175.9);
	quest::spawn2(338001,0,0,-27,36.6,-31.7,76.6);
	quest::spawn2(338001,0,0,-27,51,-32.9,110.5);
	quest::spawn2(338001,0,0,8.4,51,-32.9,135.6);
	}
	if($signal == 427) { #signal 427 is from each of the goblins
      if($counter == 8) {
	quest::spawn2(338002,0,0,-8.2,30.6,-32.9,123.6);
	quest::depop(338001);
	quest::depop();
    } 
  }
 }
}