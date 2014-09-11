sub EVENT_SPAWN {
 $x = $npc->GetX();
	$y = $npc->GetY();
	quest::set_proximity($x - 200, $x + 200, $y - 250, $y + 250);
    }
sub EVENT_ENTER {
    quest::shout("The Dragon Scales are mine! I will not give them up easily!");
    quest::spawn2(339126,0,0,2055,5752.1,102.5,148.4);
	quest::spawn2(339126,0,0,2040.7,5712.9,98.8,244.2);
	quest::spawn2(339126,0,0,2002,5749.8,96.5,100.2);
	quest::spawn2(339126,0,0,1993.2,5705.3,94.6,40.6);
	}