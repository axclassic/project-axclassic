sub EVENT_SPAWN { 
   my $a = quest::ChooseRandom(66182,66183,66182,66183,66182,66183,66182,66183,66182,66183,66181); 
   quest::spawn2($a,0,0,-451,622,190,105); 
   } 
   sub EVENT_SIGNAL { 
   if ($signal == 661){ 
   quest::depop(66181); 
   quest::depop(66182); 
   quest::depop(66183); 
   quest::depop(); 
   } 
   } 
