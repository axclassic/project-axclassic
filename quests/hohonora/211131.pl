##a_Flame_Licked_Aracnhid 211131 This is the trigger npc for Enji##
sub EVENT_DEATH {
  my $randomroll = int(rand(100));  #Random roll
   if ($randomroll < '34') {
    quest::signalwith(211132,211,0);
   }
   elsif ($randomroll > '35'){
    #do nothing;
   }
   else {
   #do Nothing;
   }
 }