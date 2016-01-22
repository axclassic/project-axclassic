sub EVENT_SPAWN{
 quest::depop(166968);
  quest::depop(166969);
  quest::depop(166970);
  quest::spawn2(166968,0,0,-3027.6,502,72,52.4);
  quest::spawn2(166970,0,0,-3028,510.2,72.2,65.8);
  quest::signalwith(166968,810,0);
  quest::signalwith(166970,812,0);
  quest::signalwith(166582,624,25000);
}
sub EVENT_DEATH{
quest::signalwith(166582,517,250000);
}

