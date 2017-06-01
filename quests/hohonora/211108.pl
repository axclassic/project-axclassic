## Death_Wrulan 211108##
sub EVENT_SPAWN {
quest::SetRunning(1);
}
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