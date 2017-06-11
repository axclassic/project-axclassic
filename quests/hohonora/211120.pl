##Emperor_Csarth 211120##
sub EVENT_SPAWN {
quest::signalwith(211151,357,0);
quest::ze(15,"The walls seem to bend and break as Csarth marches down from his throne.");
quest::settimer("Csarthpop",1800);
}

sub EVENT_TIMER {
   if($timer eq "Csarthpop"){
      quest::ze(15,"Seeing it as an empty threat Csarth returns to his throne.");
      quest::stoptimer("Csarthpop");
      quest::depop();
   }
}