sub EVENT_SPAWN {

 quest::setnexthpevent(50);

 }

 sub EVENT_HP {
 quest::spawn2(342067,0,0,-868.9,2944.9,41.6,65.8);
 quest::signalwith(342067,101,0);
 quest::spawn2(342065,0,0,-788.3,2883.4,40.6,40.9);
 quest::spawn2(342065,0,0,-734.2,2846.9,40,5.9);
 quest::spawn2(342065,0,0,-687.7,2895.2,37.7,208.1);
 quest::spawn2(342065,0,0,-747,2946.3,40.5,104.9);
 quest::spawn2(342066,0,0-747.7,2889.5,38.8,37.8);
 quest::depop();
 
 } 