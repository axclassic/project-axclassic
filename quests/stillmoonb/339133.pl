sub EVENT_SPAWN {

 quest::setnexthpevent(90);

 }

 sub EVENT_HP {
 quest::depop(339128);
 quest::spawn2(339134,0,0,1286,6853.2,745.9,200.3);
 quest::spawn2(339110,0,0,1200,6368.7,746.1,40.5);
 quest::depop();

 } 