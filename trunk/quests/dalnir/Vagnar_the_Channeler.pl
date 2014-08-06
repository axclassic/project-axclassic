 sub EVENT_SPAWN {
 $x = $npc->GetX();
	$y = $npc->GetY();
	quest::set_proximity($x - 20, $x + 20, $y - 20, $y + 20);
	}
	sub EVENT_WAYPOINT { 
  if($wp == 1) { 
  quest::shout("Go to where the pines have been smashed. Must reach great heights!");
  }
  if($wp == 8) {
quest::depop();  
  }
  }