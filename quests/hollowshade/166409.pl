sub EVENT_SPAWN {
 $x = $npc->GetX();
	$y = $npc->GetY();
	quest::set_proximity($x - 75, $x + 75, $y - 75, $y + 75);
  quest::depop(166972);
  quest::depop(166973);
  quest::depop(166971);
  quest::spawn2(166971,0,0,1721.8,3552.1,188.9,90);
  quest::spawn2(166973,0,0,1727,3583.3,158.4,91.4);
  quest::signalwith(166971,816,0);
  quest::signalwith(166973,817,0);
}
sub EVENT_ENTER {
    quest::shout("I see you $name! Nothing but death awaits you here!");
      quest::signalwith(166961,405,0);
  }

sub EVENT_DEATH{
quest::signalwith(166962,607,0); #Boss_Dead_Owlbears
quest::signalwith(166799,15,0);
}

