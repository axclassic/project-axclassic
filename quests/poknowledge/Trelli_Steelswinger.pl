#Trelli_Steelswinger.pl
#Berserkter Tomes/Planar Armor Exchange

sub EVENT_ITEM {
	if((plugin::check_handin(\%itemcount, 55601 => 1)) ||
		(plugin::check_handin(\%itemcount, 55602 => 1)) ||
		(plugin::check_handin(\%itemcount, 55603 => 1)) ||
		(plugin::check_handin(\%itemcount, 55604 => 1)) ||
		(plugin::check_handin(\%itemcount, 55605 => 1)) ||
		(plugin::check_handin(\%itemcount, 55606 => 1)) ||
		(plugin::check_handin(\%itemcount, 55607 => 1))) {#Shadow Rage Armor
    	quest::say("Thank you, $name.");#Text made up
    	quest::summonitem(quest::ChooseRandom(10028, 10037, 22503, 15981));#Random gem: Peridot, Diamond, Blue Diamond, Raw Diamond
    	 quest::ding(); quest::exp(3493875);
  }
#Tome hand-ins are NOT live like!
  if(plugin::check_handin(\%itemcount, 29112 => 1)) {#Ethereal Parchment
    quest::summonitem(quest::ChooseRandom(59902,59904,78022)); #Level 55 or 60 Ber Discipline (Tome of Rage Axe, Tome of Battlerage Axe, Tome of Aura of Rage)
  }
 
    elsif(plugin::check_handin(\%itemcount, 29131 => 1)) {#Spectral Parchment
    quest::summonitem(76052); #Level 61 Ber Discipline (Tome of Rage Volley)
  }
 
    elsif(plugin::check_handin(\%itemcount, 29132 => 1)) {#Glyphed Rune Word
    quest::summonitem(quest::ChooseRandom(59919,59891,68774,59905)); #Level 65 Ber Discipline (Tome of Ancient: Cry of Chaos, Tome of Confusing Strike, Tome of Tainted Axe of Hatred, Tome of Deathfury Axe)
  }
  else {
   plugin::try_tome_handins(\%itemcount, $class, 'Berserker');
   my $stuff = (\%itemcount);
   my $yes = 2;
   foreach my $k (keys(%{$stuff})) {
      next if($k == 0);
      $yes = 1;
   }
   if($yes == 1) {
       $client->Message(14, "I don't need this $name. Take it back.");
      plugin::return_items(\%itemcount);
   }
   if($platinum != 0 || $gold !=0 || $silver != 0 || $copper != 0) {
      $client->Message(14, "Thanks for the coin!");
   }
  }
}#Done