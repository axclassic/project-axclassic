sub EVENT_SPAWN {
 $x = $npc->GetX();
	$y = $npc->GetY();
	quest::set_proximity($x - 75, $x + 75, $y - 75, $y + 75);
    }
sub EVENT_ENTER {
quest::summonitem(120167);
quest::signalwith(340103,880,10);
quest::depop(340106);
quest::depop(340105);
quest::depop();
}