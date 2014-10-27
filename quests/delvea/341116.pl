##Greed controller 4##
sub EVENT_SIGNAL {
   if ($signal == 94){
   quest::spawn2(341125,0,0,-1574,-839,21.1,29.7);
   quest::spawn2(341126,0,0,-1667,-1165,-38.7,153.8);
   quest::spawn2(341127,0,0,-964,-1339,-80,223.8);
   quest::spawn2(341128,0,0,-1263,-1681,-35.5,43);
   }
   elsif ($signal == 131){
   quest::ze(14, "You have failed to solve the puzzle.");
   quest::depop(341125);
   quest::depop(341126);
   quest::depop(341127);
   quest::depop(341128);
   quest::depop();
   }
   elsif ($signal == 132){
   quest::ze(14, "You have failed to solve the puzzle.");
   quest::depop(341125);
   quest::depop(341126);
   quest::depop(341127);
   quest::depop(341128);
   quest::depop();
   }
   elsif ($signal == 133){
   quest::ze(14, "You have failed to solve the puzzle.");
   quest::depop(341125);
   quest::depop(341126);
   quest::depop(341127);
   quest::depop(341128);
   quest::depop();
   }
   elsif ($signal == 134){
   quest::ze(14, "You have correctly opened the forth and final chest in the proper order.");
   quest::depop(341125);
   quest::depop(341126);
   quest::depop(341127);
   quest::depop(341128);
   quest::signalwith(341070,79,20);
   quest::depop();
   }
   }