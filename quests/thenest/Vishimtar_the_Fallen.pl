sub EVENT_SPAWN {

 quest::setnexthpevent(75);

 }

sub EVENT_HP {
 quest::signalwith(343255,620,10);
 quest::signalwith(343257,621,10);
   }

