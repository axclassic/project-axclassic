sub EVENT_SPAWN {
 $x = $npc->GetX();
	$y = $npc->GetY();
	quest::set_proximity($x - 75, $x + 75, $y - 75, $y + 75);
	quest::spawn2(166970,0,0,-3028.7,636.2,73.2,97.9);
	quest:;spawn2(166969,0,0,-3028.7,621.7,72.7,91.2);
	quest::signalwith(166970,812,0);
        quest::signalwith(166969,811,0);
	}
sub EVENT_ENTER {
    quest::shout("I see you $name! Nothing but death awaits you here!");
      quest::signalwith(166963,305,0);
  }

sub EVENT_DEATH{
quest::signalwith(166960,608,0); #Boss_Dead_Wolves
quest::signalwith(166799,10,0);
}
