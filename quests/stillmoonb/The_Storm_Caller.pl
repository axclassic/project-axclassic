sub EVENT_SPAWN {
 $x = $npc->GetX();
	$y = $npc->GetY();
	quest::set_proximity($x - 50, $x + 50, $y - 50, $y + 50);
    }
sub EVENT_ENTER {
    quest::say("The Dragon Scales are mine! I will not give them up easily!");
    quest::spawn2(339126,0,0,2055,5752.1,102.5,148.4);
	quest::spawn2(339126,0,0,2050.8,5827.2,100.3,177);
	quest::spawn2(339126,0,0,2002,5749.8,96.5,100.2);
	quest::spawn2(339126,0,0,1993.2,5705.3,94.6,40.6);
	}