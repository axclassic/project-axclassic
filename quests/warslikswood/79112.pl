sub EVENT_WAYPOINT { 
  if($wp == 11) {                 
    quest::emote(' wipes the sweat from his forehead and spits some flarefire seeds on the ground near your feet.');
    quest::spawn2(79132,0,0,-719,-2023,263,150); 
	quest::depop();
	}
}