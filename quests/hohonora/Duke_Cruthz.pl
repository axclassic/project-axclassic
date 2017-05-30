##Duke_Cruthz 211118##
sub EVENT_SPAWN {
quest::signalwith(211151,359,0);
quest::ze(15, "The wind in the Temple picks up as Cruthz awakes from his slumber.");
quest::settimer("Cruthzpop",1800);
}
sub EVENT_TIMER {
   if($timer eq "Cruthzpop"){
  quest::ze(15, "Finding nothing to toy with Curthz goes back to his nap."); 
  quest::stoptimer("Crutzhpop");
  quest::depop();
  }
 } 