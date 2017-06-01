##A_servant_Djinn 211112 This is the trigger npc for Arch Bishop Ikliz ##
 sub EVENT_DEATH {
  my $randomroll = int(rand(100));  #Random roll
 # my $addrandomroll = int(rand(100));  #add Random roll
   if ($randomroll < '34') {
    quest::signalwith(211167,263,0);
	}
   elsif ($randomroll > '35'){
      #do nothing;
   }
    else {
   #do Nothing;
   }
}