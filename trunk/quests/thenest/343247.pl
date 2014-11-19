sub EVENT_SPAWN {

 quest::setnexthpevent(80);

 }
 sub EVENT_HP {
 quest::signalwith(343249,512,0);
 quest::depop();
 }
