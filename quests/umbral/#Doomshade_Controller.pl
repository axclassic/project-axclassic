#Doomshade_Controller#
sub EVENT_SPAWN {
 $x = $npc->GetX();
	$y = $npc->GetY();
	quest::set_proximity($x - 75, $x + 75, $y - 75, $y + 75);
	}
sub EVENT_ENTER {
    quest::emote(' casts a cold look upon you like something from the grave.');
    quest::say("Welcome to Broodlands may you fare better than I.");
 }