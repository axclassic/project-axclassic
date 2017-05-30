##Dolgrem, Guardian of the Elements 211157 Trigger for the Crytsal Shards##
sub EVENT_SPAWN {
quest::setnexthpevent(50);
  }
sub EVENT_HP {
  if($hpevent == 50){
  quest::modifynpcstat("special_attacks",ABfHG);
  quest::spawn2(211127,0,0,-976.1,1128.9,1,92.6);
  quest::spawn2(211127,0,0,-942,1151.5,1,120.9);
  quest::spawn2(211127,0,0,-896.4,1138.4,1,161.5);
  quest::spawn2(211127,0,0,-870,1103.9,1,188.4);
  quest::spawn2(211127,0,0,-890.6,1056.7,1,223.8);
  quest::spawn2(211127,0,0,-921.8,1019.2,1,250.5);
  quest::spawn2(211127,0,0,-975,1045.6,1,29.1);
  quest::spawn2(211127,0,0,-1001.4,1087.6,1,62.3);
  }
  } 
