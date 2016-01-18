sub EVENT_SPAWN{
  quest::depop(166972);
  quest::depop(166973);
  quest::depop(166971);
  quest::spawn2(166971,0,0,1721.8,3552.1,188.9,90);
  quest::spawn2(166973,0,0,1727,3583.3,158.4,91.4);
  quest::signalwith(166971,816,0);
  quest::signalwith(166973,817,0);
}
sub EVENT_DEATH{
quest::signalwith(166582,400,250000);
}
