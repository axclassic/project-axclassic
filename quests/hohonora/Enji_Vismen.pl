##Enji_Vismen 211117##
sub EVENT_SPAWN {
quest::signalwith(211151,356,0);
quest::ze(14,"The trees begin to shake with terror as Enji climbs down to the ground.");
quest::settimer("Enjipop",1800);
}

sub EVENT_TIMER {
   if($timer eq "Enjipop"){
      quest::ze(14,"After finding no one in its trap, Enji returns to it's lair.");
      quest::stoptimer("Enjipop");
      quest::depop();
   }
}