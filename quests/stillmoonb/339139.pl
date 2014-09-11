sub EVENT_SPAWN {

 quest::setnexthpevent(90);

 }

 sub EVENT_HP {
 quest::depop(339130);
 quest::spawn2(339136,0,0,1133.9,6402.2,738.4,88.9);
 quest::spawn2(339110,0,0,1200,6368.7,746.1,40.5);
 quest::depop();
 
 } 