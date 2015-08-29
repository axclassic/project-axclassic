sub EVENT_SPAWN { 
   my $a = quest::ChooseRandom(66186,66187,66188,66187,66188,66186,66187,66188,66187,66188,66185); 
   quest::spawn2($a,0,0,22,-105,-229.1,169); 
   } 
   sub EVENT_SIGNAL { 
   if ($signal == 662){ 
   quest::depop(66185); 
   quest::depop(66186); 
   quest::depop(66187);
   quest::depop(66188);   
   quest::depop(); 
   } 
   } 
