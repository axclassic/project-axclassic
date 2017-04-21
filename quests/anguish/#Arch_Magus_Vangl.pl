##Arch_Magus_Vangl 317001 is the fifth encounter in the Asylum of Anguish raid expedition. He may only be accessed after recieving flag for killing the first four events (Keldovan, Ture, Jelvan, Hanvar). Arch Magus Vangl is another Bot epic mob which may drop Globe of Discordant Energy##
sub EVENT_SPAWN {
   quest::setnexthpevent(80);
 }
sub EVENT_HP {
  if($hpevent == 80){
   quest::spawn2(317110,12,0,509,5137,278,124.1);
   quest::setnexthpevent(70);
   }
  if($hpevent == 70){
   quest::spawn2(317110,13,0,384.6,5084.8,278,106.1);
   quest::setnexthpevent(60);
   }
  if($hpevent == 60){
   quest::spawn2(317110,14,0,342.2,4959.6,278,63.8);
   quest::setnexthpevent(50);
   }
  if($hpevent == 50){
   quest::spawn2(317110,15,0,386.6,4844.6,278,37.3);
   quest::signalwith(317127,900,0);
   quest::setnexthpevent(40);
   }
  if($hpevent == 40){
   quest::spawn2(317110,16,0,630.8,4844.9,278,223.3);
   quest::setnexthpevent(30);
   }
  if($hpevent == 30){
   quest::spawn2(317110,17,0,673.2,4972.4,278,200);
   quest::spawn2(317128,0,0,442.4,4926,278,20.4);
   quest::signalwith(317127,901,0);
   quest::setnexthpevent(20);
   }
  if($hpevent == 20){
   quest::spawn2(317110,18,0,621.9,5088,278,162.8);
   }
 } 
sub EVENT_DEATH {
   quest::depopall(317110);
   quest::signalwith(317127,903,0);
   $client->Message(14,"As the Arch Magus corpse falls to the ground, you feel the magical aura filling the room collapse, and hear a deep guttural laugh growing louder."); 
  } 