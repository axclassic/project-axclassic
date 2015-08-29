sub EVENT_SPAWN { 
   my $a = quest::ChooseRandom(66198,66201,66204,66201,66204,66198,66201,66204,66201,66204,66195); 
   quest::spawn2($a,0,0,-1056.4,1014.5,-192.8,125.9); 
   } 
   sub EVENT_SIGNAL { 
   if ($signal == 664){ 
   quest::depop(66195); 
   quest::depop(66198); 
   quest::depop(66201);
   quest::depop(66204);   
   quest::depop(); 
   } 
   } 
