sub EVENT_SPAWN{
  quest::depop(166968);
	quest::depop(166969);
	quest::depop(166970);
	quest::spawn2(166970,0,0,-3028.7,636.2,73.2,97.9);
	quest::spawn2(166968,0,0,-3028.4,610.1,72.4,86);	
  quest::signalwith(166970,812,0);
  quest::signalwith(166968,810,0);
}
sub EVENT_DEATH{
quest::signalwith(166582,517,250000);
}

