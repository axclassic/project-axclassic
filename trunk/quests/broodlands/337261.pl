# Zone: broodlands to Delveb
# Aardil

sub EVENT_SPAWN {
 $x = $npc->GetX();
	$y = $npc->GetY();
	quest::set_proximity($x - 25, $x + 25, $y - 25, $y + 25);
	}
sub EVENT_ENTER {
    quest::movepc(342,-148.8,-308.7,17.3,249.8);
 }

