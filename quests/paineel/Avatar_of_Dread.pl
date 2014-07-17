sub EVENT_SPAWN {
  quest::settimer(1,1); #Pulse timer every second
  quest::settimer(2,600); #Timer to depop after 10 minutes
  quest::shout("'Grrrraaaaarrrrrg!! The stench of fear permeates the walls of this city! I will forge one item for the faithful of our Lord Cazic-Thule!! Make haste! My time here is short!");
 }
sub EVENT_ITEM {
 if($itemcount{14105} == 1) {
  quest::say("Wear this shield imbued with my very essence. Wear it in honor of your great services to our Lord Cazic-Thule!!");
  quest::summonitem(14107);
  quest::ding();
  quest::faction(143,10);  
  quest::faction(79,-10);   
  quest::faction(112,-10);  
  quest::faction(56,-10);  
  quest::faction(60,-10);  
  quest::exp(10000);
  quest::depop();
 }
 }