sub EVENT_SPAWN { 
   my $a = quest::ChooseRandom(66200,66203,66206,66203,66206,66200,66203,66206,66206,66203,66197); 
   quest::spawn2($a,0,0,-1026.8,1042,-192.8,125.9); 
   } 
   sub EVENT_SIGNAL { 
   if ($signal == 666){ 
   quest::depop(66197); 
   quest::depop(66200); 
   quest::depop(66203);
   quest::depop(66206);   
   quest::depop(); 
   } 
   } 
