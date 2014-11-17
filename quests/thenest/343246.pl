sub EVENT_SPAWN {

 quest::setnexthpevent(80);

 }
 sub EVENT_HP {
 if (hpevent == 80){
 quest::signalwith(343249,511,0);
 }
 }