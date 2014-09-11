my $goblin_warlord_event = 0;


sub EVENT_SPAWN { 
    $goblin_warlord_event = 0;
    $counter = undef;
	}
sub EVENT_SIGNAL {
  	if ($signal == 621) {
	 $goblin_warlord_event += 1; # adds one to spawn variable # 
	}
	if ($signal == 623) {
	quest::depop(338181);
	quest::spawn2(338182,2780155,0,-412.7,696.9,5.2,189.8,);
	}
	if ($signal == 625) {
	$counter = 0; # Re-set counter	
	quest::depop();
    }
	if($signal == 622) { #signal 622 is from each of the dead npc's
    $counter += 1;
      if($counter == 15) {	
	quest::spawn2(338178,0,0,-467.6,1293.9,1.6,125.4); #a_goblin_warlord
    quest::spawn2(338179,2780154,0,-449.9,1307,1.6,125.4); #a_goblin_guard
  }
 }
} 
