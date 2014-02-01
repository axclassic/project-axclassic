#############
#NPC: Lieutenant_Arathur ID:1085
#Quest Name:
#Quest by: 
#Revised: Olhadon
#NPCs Involved: Guard_Corshin, Guard_Beren, Guard_Calik, Guard_Cyrillian, Guard_Dunix, Guard_Forbly, Guard_Jerith, Guard_Kwint, Guard_Lasen, Guard_Mezzt, Guard_Naret, Guard_Phaeton, Guard_Relam, Guard_Urius, Guard_Wenbie
#Items Involved: 
#zone: qeynos

sub EVENT_SAY { 
  if($text=~/Hail/i){
	  quest::say("Hail, $name! Lieutenant Arathur Swelnik at your service. I take great pride in keeping Qeynos safe and proper. I also try to bring the word of [Mithaniel Marr] to the people of this fine city.");
  }
  elsif($text=~/who.*?Mithaniel Marr/i){
    quest::say("Mithaniel Marr is the Lord of Valor and my personal source of power and inspiration. You see, I was orphaned as a small child and raised by the Priests of Marr in [Freeport]. I have dedicated my life to protecting the innocent. I now use the glorius powers that my faith in the Truthbringer has provided to help bring honor to the city of Qeynos.");
  }
  elsif($text=~/who.*?Trumpy/i || $text=~/what.*?Freeport/i){
    quest::say("Freeport is the city of my birth. It is not what it once was, though. Thugs and bandits patrol its streets. <y comrades in the Knights of Truth have managed to protect the northern parts of the city but I fear they are outnumbered and will soon have to flee Freeport altogether. If it were not for my sworn duty here, I would join their noble [crusade].");
  }
  elsif($text=~/what crusade/i){
    quest::say("The Knights of Truth fight a neverending battle against the corrupt and vicious Freeport Militia. If you are going to Freeport, you might want to meet up with Knight Rolius and let him know you are a [friend of Arathur]. They can always use another able body.");
  }
}

sub EVENT_ATTACK {
  quest::shouts("Halt in the name of Antonius Bayle! Fleeing will only make me angry and your beating more severe!");
}

sub EVENT_COMBAT{
  my $random_result = int(rand(100));
  if(($combat_state == 1) &&($random_result<=50)){
    quest::say("Time to die $name.!");
  }elsif(($combat_state == 1) &&($random_result<50)){
    quest::say("How I loath to soil my blade with such filth.");
  }
}

sub EVENT_ITEM {
  quest::emote("I have no need for this $name, you can have it back.");
  plugin::return_items(\%itemcount);
}

sub EVENT_WAYPOINT {
  my $h = int($npc->GetHeading());    
  if(( $wp == 1 && $h == 93)    || # Maiden's Lure
	 ( $wp == 38 && $h == 191)    || # Clock
	 ( $wp == 40 && $h == 189)    || # Clock
	 ( $wp == 102 && $h == 62)    || # Dock
	 ( $wp == 104 && $h == 62)    || # Dock
	 ( $wp == 157 && $h == 105)   || # Maiden's Lure
	 ( $wp == 159 && $h == 94)    || # Maiden's Lure
	 ( $wp == 195 && $h == 190)   || # Clock
	 ( $wp == 197 && $h == 189)   || # Clock
	 ( $wp == 258 && $h == 63)    || # Dock
	 ( $wp == 260 && $h == 62)    || # Dock
	 ( $wp == 312 && $h == 95)    || # Maiden's Lure
	 ( $wp == 314 && $h == 109)   || # Maiden's Lure
	 ( $wp == 347 && $h == 228)   || # Clock
	 ( $wp == 349 && $h == 188)) {   # Clock
	  quest::say("Guard, stand up straight!");
	  #Qeynos Guards:
	  @GUARDS = (1090, #Guard_Beren
               1091, #Guard_Corshin
               1149, #Guard_Calik
               1006, #Guard_Cyrillian
               1181, #Guard_Dunix
               1174, #Guard_Forbly
               1002, #Guard_Jerith
               1151, #Guard_Kwint
               1150, #Guard_Lasen
               1001, #Guard_Mezzt
               1152, #Guard_Naret
               1189, #Guard_Phaeton
               1148, #Guard_Relam
               1200, #Guard_Urius
               1147, #Guard_Wenbie
              );
	  my $npccheck = 0;
	  foreach (@GUARDS){
	    #checking to see if the Guard is spawned and send signal	    
      $npccheck = $entity_list->GetMobByNpcTypeID($_);
      if (!defined($npccheck)){
        $npccheck = 0;
      }
      elsif ($npccheck != 0) {
        quest::signalwith($_, 1, 2);
      }
	  }	  
  }
}

#END of FILE Zone:qeynos  ID:1085 -- Lieutenant_Arathur

