sub EVENT_SPAWN {
 $x = $npc->GetX();
	$y = $npc->GetY();
	quest::set_proximity($x - 50, $x + 50, $y - 50, $y + 50);
    }
sub EVENT_ENTER {
quest::signalwith(340103,880,1);
quest::depop();
}
sub EVENT_SIGNAL {
if ($signal == 850) {
   quest::spawn2(340105,0,0,-39.9,-513.2,294.7,184.4);
   quest::spawn2(340105,0,0,-38,-464.8,294.7,203.6);
   quest::spawn2(340106,0,0,1090.9,-464.3,143.4,189.5);
   }
   }