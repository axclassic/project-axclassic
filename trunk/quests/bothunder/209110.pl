sub EVENT_SPAWN {
   quest::settimer("depop",300);
}
sub EVENT_SAY {
    if($text=~/hail/i) {
     $client->Message(14,"Glad you could help me. Evynd Firestorm must die!!");
	 quest::depop();
 }
}
	 sub EVENT_TIMER {
   quest::depop();
   quest::stoptimer("depop");
 }
