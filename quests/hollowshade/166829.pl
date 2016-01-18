sub EVENT_SPAWN{
  quest::depop(166974);
  quest::depop(166975);
  quest::depop(166976);
  quest::spawn2(166974,0,0,-158.4,-2898.1,115.2,255.8);
  quest::spawn2(166975,0,0,-168,-2898.7,114.4,18.5);
  quest::signalwith(166974,813,0);
  quest::signalwith(166975,814,0);
}
sub EVENT_DEATH{
quest::signalwith(166582,547,250000);
}
