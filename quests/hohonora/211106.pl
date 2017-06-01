##Guardian_of_Death 211106 This is the trigger npc for Gurzan_the_Death_Bringer ##
 sub EVENT_DEATH {
  my $randomroll = int(rand(100));  #Random roll
   if ($randomroll < '34') {
    quest::signalwith(211136,215,0);
   }
   elsif ($randomroll > '35'){
       #do nothing;
   }
   else {
   #do Nothing;
   }
 }