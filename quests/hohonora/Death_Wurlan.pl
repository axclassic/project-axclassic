##Death_Wurlan 211108 This is the trigger npc for Duke Cruthz##
sub EVENT_DEATH {
  my $randomroll = int(rand(100));  #Random roll
   if ($randomroll < '34') {
    quest::signalwith(211171,244,0);
   }
   elsif ($randomroll > '35'){
    #do nothing;
   }
   else {
   #do Nothing;
   }
 }