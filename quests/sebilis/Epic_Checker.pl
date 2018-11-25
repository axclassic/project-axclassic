##Epic_Checker ID 89199##
sub EVENT_SPAWN {
 $x = $npc->GetX();
	$y = $npc->GetY();
	quest::set_proximity($x - 40, $x + 40, $y - 40, $y + 40);
	}
sub EVENT_ENTER {
if(defined $qglobals{"EpicBox"} == 1) {
quest::shout("I see you!");
quest::spawn2(89197,0,0,-352.2,-1389.9,-105.8,98.5);
quest::spawn2(89198,0,0,-315.3,-1386.5,-105.8,131.5);
quest::depop();
}
elsif(!defined $qglobals{"EpicBox"}) {
quest::shout("Not gonna happen!");
}
}