#Doomshade_Controller#
sub EVENT_SPAWN {
 $x = $npc->GetX();
	$y = $npc->GetY();
	quest::set_proximity($x - 50, $x + 50, $y - 50, $y + 50);
	}
sub EVENT_ENTER {
    quest::emote(' casts a cold look upon you like something from the grave.');
    quest::say("Welcome to Broodlands may you fare better than I.");
 }