sub EVENT_SPAWN {
 $x = $npc->GetX();
	$y = $npc->GetY();
	quest::set_proximity($x - 50, $x + 50, $y - 50, $y + 50);
    }
sub EVENT_ENTER {
quest::summonitem(120167);
quest::signalwith(340103,880,0);
quest::depop(340106);
quest::depop(340105);
quest::depop();
}