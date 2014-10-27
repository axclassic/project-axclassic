##Greed controller 2##
sub EVENT_SIGNAL {
   if ($signal == 92){
   quest::spawn2(341117,0,0,-1574,-839,21.1,29.7);
   quest::spawn2(341118,0,0,-1667,-1165,-38.7,153.8);
   quest::spawn2(341120,0,0,-964,-1339,-80,223.8);
   quest::spawn2(341119,0,0,-1263,-1681,-35.5,43);
   }
   elsif ($signal == 111){
   quest::ze(14, "You have failed to solve the puzzle.");
   quest::depop(341117);
   quest::depop(341118);
   quest::depop(341119);
   quest::depop(341120);
   quest::depop();
   }
   elsif ($signal == 112){
   quest::ze(14, "You have correctly opened the second chest in the proper order.");
   quest::depop(341117);
   quest::depop(341118);
   quest::depop(341119);
   quest::depop(341120);
   quest::spawn2(341115,0,0,-1161,-955.4,-20.5,103.5);
   quest::signalwith(341115,93,12000);
   quest::depop();
   }
   elsif ($signal == 113){
   quest::ze(14, "You have failed to solve the puzzle.");
   quest::depop(341117);
   quest::depop(341118);
   quest::depop(341119);
   quest::depop(341120);
   quest::depop();
   }
   elsif ($signal == 114){
   quest::ze(14, "You have failed to solve the puzzle.");
   quest::depop(341117);
   quest::depop(341118);
   quest::depop(341119);
   quest::depop(341120);
   quest::depop();
   }
   }