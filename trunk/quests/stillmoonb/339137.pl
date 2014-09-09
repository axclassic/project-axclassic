sub EVENT_SPAWN {

 quest::setnexthpevent(90);

 }

 sub EVENT_HP {
 quest::depop(339108);
 quest::spawn2(339109,0,0,1215,6310,852.6,252);
 quest::spawn2(339110,0,0,1200,6368.7,746.1,40.5);
 quest::depop();

 } 