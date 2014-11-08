## Zoner from Broodlands to thenest ##
# Aardil #

sub EVENT_SPAWN {
 $x = $npc->GetX();
	$y = $npc->GetY();
	quest::set_proximity($x - 10, $x + 10, $y - 10, $y + 10);
	}
sub EVENT_ENTER {
    quest::movepc(343,21.3,133.6,-41,149.6);
 }