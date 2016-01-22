sub EVENT_SPAWN{
  quest::depop(166968);
  quest::depop(166969);
  quest::depop(166970);
  quest::spawn2(166969,0,0,-3027.7,510.1,72,61.9);
  quest::spawn2(166970,0,0,-3027.6,502,72,52.4);
  quest::signalwith(166969,811,0);
  quest::signalwith(166970,812,0);
  quest::signalwith(166582,623,25000);
  quest::signalwith(166988,4004,0);
}
sub EVENT_DEATH{
quest::signalwith(166582,435,250000);
}

