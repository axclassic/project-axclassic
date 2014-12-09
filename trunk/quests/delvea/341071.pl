##Greed controller 1##
sub EVENT_SIGNAL {
   if ($signal == 91){
   quest::spawn2(341072,0,0,-1574,-839,21.1,29.7);
   quest::spawn2(341073,0,0,-1667,-1165,-38.7,153.8);
   quest::spawn2(341074,0,0,-964,-1339,-80,223.8);
   quest::spawn2(341075,0,0,-1263,-1681,-35.5,43);
   }
   elsif ($signal == 101){
   quest::ze(14, "You have correctly opened the first chest in the proper order.");
   quest::depop(341072);
   quest::depop(341073);
   quest::depop(341074);
   quest::depop(341075);
   quest::spawn2(341114,0,0,-1161,-955.4,-20.5,103.5);
   quest::signalwith(341114,92,120);
   quest::depop();
   }
   elsif ($signal == 102){
   quest::ze(14, "You have failed to solve the puzzle.");
   quest::depop(341072);
   quest::depop(341073);
   quest::depop(341074);
   quest::depop(341075);
   quest::depop();
   }
   elsif ($signal == 103){
   quest::ze(14, "You have failed to solve the puzzle.");
   quest::depop(341072);
   quest::depop(341073);
   quest::depop(341074);
   quest::depop(341075);
   quest::depop();
   }
   elsif ($signal == 104){
   quest::ze(14, "You have failed to solve the puzzle.");
   quest::depop(341072);
   quest::depop(341073);
   quest::depop(341074);
   quest::depop(341075);
   quest::depop();
   }
   }
  
