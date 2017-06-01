##Gurzan_the_Death_Bringer 211119##
sub EVENT_SPAWN {
quest::signalwith(211151,355,0);
quest::ze(15, "The ground trembles and shakes as Gurzan springs for from the shadows.");
quest::settimer("Gurzanpop",1800);
}
sub EVENT_TIMER {
   if($timer eq "Gurzanpop"){
  quest::ze(15, "Gurzan slips back into the shadows, waiting for another chance to bring death."); 
  quest::stoptimer("Gurzanpop");
  quest::depop();
  }
 } 