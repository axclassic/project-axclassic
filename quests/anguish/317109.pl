##This is the final encounter in the Asylum of Anguish raid expedition. Overlord Mata Muram 317109 becomes active once Arch Magus Vangl is dead. ##
sub EVENT_SPAWN {
   quest::setnexthpevent(80);
 }
sub EVENT_HP {
  if($hpevent == 80){
   quest::ze(15, "You hear a strange buzzing around your head, and feel as though something is creeping toward you.");
   quest::spawn2(317133,0,0,650,4847.9,278,222.4);
   quest::spawn2(317133,0,0,601,4884.5,278,147.4);
   quest::spawn2(317133,0,0,414.7,4880.3,278,101.5);
   quest::spawn2(317133,0,0,385.1,4837.5,280,69.4);
   quest::setnexthpevent(70);
   }
  if($hpevent == 70){
   quest::ze(15, "You hear a buzzing in the distance.");
   quest::spawn2(317133,12,0,650,4847.9,278,222.4);
   quest::spawn2(317133,13,0,601,4884.5,278,147.4);
   quest::spawn2(317133,14,0,414.7,4880.3,278,101.5);
   quest::spawn2(317133,15,0,385.1,4837.5,280,69.4);
   quest::setnexthpevent(60);
   }
  if($hpevent == 60){
   quest::ze(15, "You hear a strange buzzing around your head, and feel as though something is creeping toward you.");
   quest::spawn2(317133,12,0,650,4847.9,278,222.4);
   quest::spawn2(317133,13,0,601,4884.5,278,147.4);
   quest::spawn2(317133,14,0,414.7,4880.3,278,101.5);
   quest::spawn2(317133,15,0,385.1,4837.5,280,69.4);
   quest::setnexthpevent(50);
   }
  if($hpevent == 50){
   quest::ze(15, "You hear a buzzing in the distance.");
   quest::spawn2(317133,12,0,650,4847.9,278,222.4);
   quest::spawn2(317133,13,0,601,4884.5,278,147.4);
   quest::spawn2(317133,14,0,414.7,4880.3,278,101.5);
   quest::spawn2(317133,15,0,385.1,4837.5,280,69.4);
   quest::setnexthpevent(40);
   }
  if($hpevent == 40){
   quest::ze(15, "You hear a strange buzzing around your head, and feel as though something is creeping toward you.");
   quest::spawn2(317133,12,0,650,4847.9,278,222.4);
   quest::spawn2(317133,13,0,601,4884.5,278,147.4);
   quest::spawn2(317133,14,0,414.7,4880.3,278,101.5);
   quest::spawn2(317133,15,0,385.1,4837.5,280,69.4);
   quest::setnexthpevent(30);
   }
  if($hpevent == 30){
  quest::spawn2(317134,12,0,506.8,4931.5,293.7,1.1);
  quest::spawn2(317135,13,0,537.3,4969.3,295.1,186);
  quest::spawn2(317137,14,0,501.9,5003,294,125.1);
  quest::spawn2(317136,15,0,467.1,4967.9,293.3,65.5);
  quest::signalwith(317136,959,20);
   }
  } 
  sub EVENT_COMBAT { 
   quest::ze(15, "You would have made fine additions to my army, were you not so willful. Prepare yourself for power beyond your greatest nightmares.");
   quest::spawn2(317129,13,0,384.6,5084.8,278,106.1);
   quest::spawn2(317130,14,0,342.2,4959.6,278,63.8);
   quest::spawn2(317131,16,0,630.8,4844.9,278,223.3);
   quest::spawn2(317132,17,0,673.2,4972.4,278,200);
   quest::spawn2(317148,0,0,423.7,4909.4,277.5,34.9);
   }
 sub EVENT_SIGNAL {
   if($signal == 968) {
   quest::shout("So. You are the mighty god killers. I am not surprised you managed to make it this far. I did expect there to be more of you, do you really think so little of me? I have destroyed worlds where animals roam with power that would cause your gods to tremble.");
   }
   elsif($signal == 9000) {
   quest::emote(' breaks free of his bonds, killing the Riftseekers with the magic.');
   quest::shout("You dare betray me! When I am done with them I shall see that all of your kind meet the same fate.");
   quest::ze(15,"The world shifts around you as the riftseeker's are consumed by their magic.");
   quest::movepc(317,590.6,3167.9,-13.4);
   quest::spawn2(317138,0,0,507,4969,294.3,129.4);
   quest::depop();
   }
   else {
   #quest::shout(Do Nothing);
   }
  }  


