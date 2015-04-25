#Vilnius_controller#
sub EVENT_SPAWN {
$x = $npc->GetX();
	$y = $npc->GetY();
	quest::set_proximity($x - 150, $x + 150, $y - 150, $y + 150);
    }
sub EVENT_TIMER {
    my $a = quest::ChooseRandom(12019,12123,12139);
  quest::spawn2($a,17,0,-6695.9,166.9,260.9,209.5);
    quest::stoptimer("vilniusswitch");
    quest::depop();
  }
