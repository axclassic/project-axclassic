##Shaker 211151 ##
sub EVENT_SIGNAL { 
if($signal == 222) {
 $npc->CameraEffect(3000, 4, 1); 
 quest::ze(15, "You feel the ground begin to shake as the Guardians of the Seals step forth from the shadows.");
 quest::spawn2(211141,0,0,-1165.8,2115.2,1,170.9);
 quest::spawn2(211152,0,0,-1144.2,1800.2,1,208.5);
  }
 elsif($signal == 223) {
 $npc->CameraEffect(3000, 6, 1); 
 quest::ze(15, "You feel the ground begin to shake as Zenurix appears around the corner.");
 quest::signalwith(211124,225,100);
}
 elsif($signal == 255) {
 $npc->CameraEffect(3000, 4, 1); 
  }
  elsif($signal == 355) {
 $npc->CameraEffect(3000, 4, 1); 
  }
  elsif($signal == 356) {
 $npc->CameraEffect(3000, 4, 1); 
  }
  elsif($signal == 357) {
 $npc->CameraEffect(3000, 4, 1); 
  }
  elsif($signal == 358) {
 $npc->CameraEffect(3000, 4, 1); 
  }
  elsif($signal == 359) {
 $npc->CameraEffect(3000, 4, 1); 
  }
 }
 else {
 #do Nothing;
 }
}