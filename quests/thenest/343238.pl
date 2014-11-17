sub EVENT_SPAWN {
 $x = $npc->GetX();
	$y = $npc->GetY();
	quest::set_proximity($x - 25, $x + 25, $y - 25, $y + 25);
    }
sub EVENT_SAY {
   if ($ulevel <= 50 && $ulevel >= 41 && $text=~/Hail/i){
   quest::shout("'Halt! You have invaded our lands and killed our people. This one here claims that this conflict is a misunderstanding and that peace is possible between your people and the great dragons of this land. I do not believe what she has to say. I do not believe that your people will be able to come forward in peace, nor do I believe that the rage you have caused our masters will ever be soothed. Prove to me that you can come forward in peace. Put away your weapons and all of you come forward with your hands empty and stand between my guards or leave. Those are your choices if you wish to live."); 
   }
   }
   sub EVENT_ENTER {
   quest::say("I knew you could not be trusted! Kill the invaders!");
   quest::spawn2(343241,0,0,752.5,-3294.4,-357.1,181.9);
   quest::spawn2(343242,0,0,757.3,-3298.5,-356.1,174.8);
   quest::spawn2(343243,0,0,751.3,-3284.8,-359.6,175.1);
   quest::spawn2(343243,0,0,763.9,-3511.7,-359.5,163.2);
   quest::signalwith(343241,480,3);
   quest::depop(343240);
   quest::depopall(343244);
   quest::depop();
   }
   