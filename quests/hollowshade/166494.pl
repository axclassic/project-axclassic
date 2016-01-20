sub EVENT_SPAWN {
 $x = $npc->GetX();
	$y = $npc->GetY();
	quest::set_proximity($x - 75, $x + 75, $y - 75, $y + 75);
   quest::depop(166972);
  quest::depop(166973);
  quest::depop(166971);
  quest::spawn2(166971,0,0,1721.8,3552.1,188.9,90);
  quest::spawn2(166972,0,0,1722.1,3565.5,158.1,80.4);
  quest::signalwith(166971,816,0);
  quest::signalwith(166972,818,0);
  quest::signalwith(166582,3001,25000);
}
sub EVENT_ENTER {
    quest::shout("I see you $name! Nothing but death awaits you here!");
      quest::signalwith(166959,207,0);
  }

sub EVENT_DEATH{
quest::signalwith(166273,609,0); #Boss_Dead_Grimlings
quest::signalwith(166799,15,0);
}
