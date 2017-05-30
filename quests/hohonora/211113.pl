##Armor_of_the_Gods 211113 This is the trigger npc for Emperor Csarth ##
 sub EVENT_DEATH {
  my $randomroll = int(rand(100));  #Random roll
    if ($randomroll < '34') {
    quest::signalwith(211170,233,0);
	}
   elsif ($randomroll > '35'){
      #do nothing;
   }
    else {
   #do Nothing;
   }
}
   
 