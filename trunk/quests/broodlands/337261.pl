# Zone loop fix untill we open the remaining zones
# Zone: broodlands to nowhere it was a looping zone point
# Aardil

sub EVENT_SPAWN {
 $x = $npc->GetX();
	$y = $npc->GetY();
	quest::set_proximity($x - 5, $x + 5, $y - 5, $y + 5);
	}
sub EVENT_ENTER {
    quest::shout("You you have entered my parameter again!");
 }

