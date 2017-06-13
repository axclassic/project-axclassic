##Arch_Bishop_Ikliz 211116##
sub EVENT_SPAWN {
quest::signalwith(211151,358,0);
quest::ze(15, "The halls flare with fire as Ikliz begins weaving dark magic.");
quest::settimer("Bishoppop",1800);
}
sub EVENT_TIMER {
   if($timer eq "Bishoppop"){
  quest::ze(15, "The flames die sown as Ikliz returns to where he came."); 
  quest::stoptimer("Bishoppop");
  quest::depop();
  }
 } 
 sub EVENT_DEATH {
 	quest::stoptimer("Bishoppop");
  }