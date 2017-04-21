##Vangl's Focus 317108 this is a nasty thing during Arch Magus Vangl fight fight away from it and leave it alone.## 
sub EVENT_SPAWN {
 $x = $npc->GetX();
	$y = $npc->GetY();
	quest::set_proximity($x - 50, $x + 50, $y - 50, $y + 50);
    }
sub EVENT_ENTER {
     quest::shout("Fools! Death be upon you!");
   $npc->CastSpell(6812,$userid);
   }
