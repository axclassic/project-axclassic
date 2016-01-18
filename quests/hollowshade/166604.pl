sub EVENT_SPAWN{
quest::spawn2(166970,0,0,-3028.7,636.2,73.2,97.9);
	quest::depop(166968);
	quest::depop(166969);
	quest::depop(166970);
	quest::spawn2(166970,0,0,-3028.7,636.2,73.2,97.9);
	quest:;spawn2(166969,0,0,-3028.7,621.7,72.7,91.2);	
	quest::signalwith(166970,812,0);
        quest::signalwith(166969,811,0);
}
sub EVENT_DEATH{
quest::signalwith(166582,435,250000);
}

