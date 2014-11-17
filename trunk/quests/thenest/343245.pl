sub EVENT_SPAWN {

 quest::setnexthpevent(85);

 }
 sub EVENT_HP {
 if (hpevent == 85){
 quest::signalwith(343249,510,0);
 }
 }