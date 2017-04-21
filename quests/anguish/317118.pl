## Raging_Pit_Hound 317118 ##
sub EVENT_SPAWN { 
 
  quest::setnexthpevent(95);
  
 
  } 
 
 sub EVENT_COMBAT {
   quest::depop(317117);
   quest::depop(317119);
   quest::depop(317120);
   quest::spawn2(317124,0,0,-37.2,751.2,-244.5,218.5);
   quest::spawn2(317122,0,0,44.3,656.1,-244.5,97);
   quest::spawn2(317125,0,0,40.9,748.5,-244.5,30.3);
   }
sub EVENT_HP { 
  if($hpevent == 95){
   quest::signalwith(317005,95,0);
   quest::setnexthpevent(90);
  }
  if($hpevent == 90){
  quest::signalwith(317005,90,0);
  quest::setnexthpevent(85);
  }
  if($hpevent == 85){
  quest::signalwith(317005,85,0);
  quest::setnexthpevent(80);
  }
  if($hpevent == 80){
  quest::signalwith(317005,80,0);
  quest::setnexthpevent(75);
  }
  if($hpevent == 75){
  quest::signalwith(317005,75,0);
  quest::emote("Keldovan the Harrier reels in pain as his protection from magic wavers.");
  quest::setnexthpevent(70);
  }
  if($hpevent == 70){
  quest::signalwith(317005,70,0);
  quest::setnexthpevent(65);
  }
  if($hpevent == 65){
  quest::signalwith(317005,65,0);
  quest::setnexthpevent(60);
  }
  if($hpevent == 60){
  quest::signalwith(317005,60,0);
  quest::setnexthpevent(55);
  }
  if($hpevent == 55){
  quest::signalwith(317005,55,0);
  quest::setnexthpevent(50);
  }
  if($hpevent == 50){
  quest::signalwith(317005,50,0);
  quest::emote("Keldovan the Harrier howls as his protection from slow dwindles.");
  quest::setnexthpevent(45);
  }
  if($hpevent == 45){
  quest::signalwith(317005,45,0);
  quest::setnexthpevent(40);
  }
  if($hpevent == 40){
  quest::signalwith(317005,40,0);
  quest::setnexthpevent(35);
  }
  if($hpevent == 35){
  quest::signalwith(317005,35,0);
  quest::setnexthpevent(30);
  }
  if($hpevent == 30){
  quest::signalwith(317005,30,0);
  quest::setnexthpevent(25);
  }
  if($hpevent == 25){
  quest::signalwith(317005,25,0);
  quest::emote("Keldovan the Harrier appears less able to sense those around him.");
   quest::setnexthpevent(20);
  }
  if($hpevent == 20){
  quest::signalwith(317005,20,0);
  quest::setnexthpevent(15);
  }
  if($hpevent == 15){
  quest::signalwith(317005,15,0);
  quest::setnexthpevent(10);
  }
  if($hpevent == 10){
  quest::signalwith(317005,10,0);
  quest::setnexthpevent(05);
  }
  if($hpevent == 05){
  quest::signalwith(317005,05,0);
  }
 }
 
sub EVENT_DEATH {
   $client->Message(14,"The air around you vanishes as Keldovan gasps for his last breath.");
   quest::signalwith(317005,380,0);
   quest::setglobal("FKeldovan", 1, 5, "F");
   $client->Message(14,"You recieve a character flag!");
 }