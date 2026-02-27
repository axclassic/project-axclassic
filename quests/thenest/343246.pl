sub EVENT_SPAWN {

 quest::setnexthpevent(80);

 }
 sub EVENT_HP {
  quest::signalwith(343249,511,10);
  quest::depop();
 }