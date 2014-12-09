##Greed controller 3##
sub EVENT_SIGNAL {
   if ($signal == 93){
   quest::spawn2(341121,0,0,-1574,-839,21.1,29.7);
   quest::spawn2(341122,0,0,-1667,-1165,-38.7,153.8);
   quest::spawn2(341123,0,0,-964,-1339,-80,223.8);
   quest::spawn2(341124,0,0,-1263,-1681,-35.5,43);
   }
   elsif ($signal == 121){
   quest::ze(14, "You have failed to solve the puzzle.");
   quest::depop(341121);
   quest::depop(341122);
   quest::depop(341123);
   quest::depop(341124);
   quest::depop();
   }
   elsif ($signal == 122){
   quest::ze(14, "You have failed to solve the puzzle.");
   quest::depop(341121);
   quest::depop(341122);
   quest::depop(341123);
   quest::depop(341124);
   quest::depop();
   }
   elsif ($signal == 123){
   quest::ze(14, "You have correctly opened the third chest in the proper order.");
   quest::depop(341121);
   quest::depop(341122);
   quest::depop(341123);
   quest::depop(341124);
   quest::spawn2(341116,0,0,-1161,-955.4,-20.5,103.5);
   quest::signalwith(341116,94,120);
   quest::depop();
   }
   elsif ($signal == 124){
   quest::ze(14, "You have failed to solve the puzzle.");
   quest::depop(341121);
   quest::depop(341122);
   quest::depop(341123);
   quest::depop(341124);
   quest::depop();
   }
   }