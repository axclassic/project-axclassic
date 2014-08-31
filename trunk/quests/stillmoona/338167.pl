my $perseverance_event = 0;
 
  sub EVENT_SPAWN {
  $perseverance_event = 0;
  }
sub_EVENT_SIGNAL {
  	if ($signal == 422) {
	 $perseverance_event += 1 # adds one to spawn variable # 
	 }
	if ($signal == 423) {
	quest::spawn2(388171,0,0,8.4,51,-32.9,135.6);
	}
	if ($signal == 424) {
	quest::spawn2(388172,0,0,-27,36.6,-31.7,76.6);
	}
	if ($signal == 425) {
	quest::spawn2(388173,0,0,-27,51,-32.9,110.5);
	}
	if ($signal == 426) {
	quest::spawn2(388174,0,0,8.4,51,-32.9,135.6);
	}
	if ($signal == 427) {
    if ($perseverance_event == 4){ # looks for 4 dead#
    quest::spawn2(338000,0,0,-8.2,30.6,-32.9,123.6);
	quest::depop();
    } 
  }
 } 