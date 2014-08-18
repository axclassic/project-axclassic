sub EVENT_SPAWN {
   quest::settimer("depop",600);
}
sub EVENT_SAY {
    if($text=~/hail/i) {
     quest::say("Glad you could help me. Evynd Firestorm must die!!");
	 quest::depop();
 }
}
	 sub EVENT_TIMER {
   quest::depop();
   quest::stoptimer("depop");
 }
