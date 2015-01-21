sub EVENT_SPAWN {
$x = $npc->GetX();
	$y = $npc->GetY();
	quest::set_proximity($x - 50, $x + 50, $y - 50, $y + 50);
  }
sub EVENT_ENTER {
  quest::say("What business do you have with the Elite Sun Revenant?");
  }
sub EVENT_SAY {  
   if ($text=~/gem/i){
   quest::settimer(175,600);
   quest::say("So be it the master approaches!");
   quest::spawn2(175606,1533507,0,-384.6,1083.2,153.8,132.2);
  }
 }
sub EVENT_TIMER (
   quest::stoptimer(175);
   quest::depop(175606);
   quest::depop(0);
 )