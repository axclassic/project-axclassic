sub EVENT_SPAWN { 
   my $a = quest::ChooseRandom(66199,66202,66205,66202,66205,66199,66202,66205,66202,66205,66196); 
   quest::spawn2($a,0,0,-1086,1041.8,-192.8,126.8); 
   } 
   sub EVENT_SIGNAL { 
   if ($signal == 665){ 
   quest::depop(66196); 
   quest::depop(66199); 
   quest::depop(66202);
   quest::depop(66205);   
   quest::depop(); 
   } 
   } 
