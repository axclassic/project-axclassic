sub EVENT_SPAWN {
 $x = $npc->GetX();
	$y = $npc->GetY();
	quest::set_proximity($x - 75, $x + 75, $y - 75, $y + 75);
	}
sub EVENT_ENTER {
    quest::shout("I see you $name! Nothing but death awaits you here!");
      quest::signalwith(166963,305,0);
  }

sub EVENT_DEATH{
quest::signalwith(166960,608,0); #Boss_Dead_Wolves
quest::signalwith(166799,10,0);
}
