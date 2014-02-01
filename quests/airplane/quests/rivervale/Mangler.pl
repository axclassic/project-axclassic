#############
#NPC: Mangler
#Quest Name: 
#Quest by: 
#Revised: Olhadon
#NPCs Involved: Kevlin_Diggs
#Items Involved:
#zone: rivervale

sub EVENT_SPAWN {
  #Generating random number for timer.
  my $lower = 2520; # ~42minutes
  my $upper = 4500; # ~75minutes
  my $randnum = int($lower+rand($upper-$lower));
  quest::settimer(1,$randnum); 
}

sub EVENT_TIMER {
  quest::say("<Bark, bark, bark!  Hoooooowwwwwwl!>");
  # checking if Kevlin_Diggs is spawned.
  my $npccheck = $entity_list->GetMobByNpcTypeID(19049);
  if ($npccheck != 0) {
    #event_signal for Kevlin_Diggs to chat.
    quest::signalwith(19049, 1, 2);
    quest::stoptimer(1);
    #Generating random number for timer.
    my $lower = 2520; # ~42minutes
    my $upper = 4500; # ~75minutes
    my $randnum = int($lower+rand($upper-$lower));
    quest::settimer(1,$randnum);
  }
}

#END of FILE Zone:rivervale  ID:19115 -- Mangler

