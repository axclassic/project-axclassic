sub EVENT_SPAWN { 
   my $a = quest::ChooseRandom(18107,18108,18107,18107,18107,18107,18108,18107,18107,18107,18107,18106); 
   quest::spawn2($a,0,0,-450,719,4,117.5); 
   } 
   sub EVENT_SIGNAL { 
   if ($signal == 181){ 
   quest::depop(18106); 
   quest::depop(18107); 
   quest::depop(18108); 
   quest::depop(); 
   } 
   } 
