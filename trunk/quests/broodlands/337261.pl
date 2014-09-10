# Zone loop fix untill we open the remaining zones
# Zone: broodlands to nowhere it was a looping zone point
# Aardil

sub EVENT_SPAWN {
 $x = $npc->GetX();
	$y = $npc->GetY();
	quest::set_proximity($x - 20, $x + 20, $y - 20, $y + 20);
	}
sub EVENT_ENTER {
    quest::shout("You you have entered my parameter!");
 }

