sub EVENT_SPAWN {
 $x = $npc->GetX();
	$y = $npc->GetY();
	quest::set_proximity($x - 75, $x + 75, $y - 75, $y + 75);
  quest::depop(166968);
  quest::depop(166969);
  quest::depop(166970);
  quest::spawn2(166968,0,0,-3027.6,502,72,52.4);
  quest::spawn2(166970,0,0,-3028,510.2,72.2,65.8);
  quest::signalwith(166968,810,0);
  quest::signalwith(166970,812,0);
  quest::signalwith(166582,624,25000);
	}
sub EVENT_ENTER {
    quest::shout("I see you $name! Nothing but death awaits you here!");
      quest::signalwith(166961,405,0);
  }

sub EVENT_DEATH{
quest::signalwith(166962,607,0); #Boss_Dead_Owlbears
quest::signalwith(166799,12,0);
}
