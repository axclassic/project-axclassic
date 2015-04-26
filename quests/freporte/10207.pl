#Efreeport_mob_Controller#
sub EVENT_SPAWN {
$x = $npc->GetX();
	$y = $npc->GetY();
	quest::set_proximity($x - 50, $x + 50, $y - 50, $y + 50);
    }
sub EVENT_ENTER {
    my $a = quest::ChooseRandom(10012,10182,10203,10204);
    quest::depop(10012);
    quest::depop(10182;
    quest::depop(10203);
    quest::depop(10204);
  quest::spawn2($a,0,0,-883.1,-209.2,-52.2,68);
  quest::depop();
  }
