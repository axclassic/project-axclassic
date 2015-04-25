#East_freeport_mob_Controller#
sub EVENT_SPAWN {
$x = $npc->GetX();
	$y = $npc->GetY();
	quest::set_proximity($x - 25, $x + 25, $y - 25, $y + 25);
    }
sub EVENT_ENTER {
    my $a = quest::ChooseRandom(10156,10157,10160,10163,10164,10179,10186);
  quest::spawn2($a,0,0,-855,-236,-55,-246.5);
      quest::depop();
  }
