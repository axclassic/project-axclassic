sub EVENT_SPAWN { 
   my $a = quest::ChooseRandom(66191,66192,66193,66192,66193,66191,66192,66193,66192,66193,66190); 
   quest::spawn2($a,0,0,-71.5,311.4,234.8,210.5); 
   } 
   sub EVENT_SIGNAL { 
   if ($signal == 663){ 
   quest::depop(66190); 
   quest::depop(66191); 
   quest::depop(66192);
   quest::depop(66193);   
   quest::depop(); 
   } 
   } 
