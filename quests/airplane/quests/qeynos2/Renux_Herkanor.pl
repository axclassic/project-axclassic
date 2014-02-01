#############
#NPC: Renux_Herkanor
#Quest Name:
#Quest by: 
#Revised: Olhadon
#NPCs Involved: Stanos Herkanor, Hanns Kreighor
#Items Involved: 
#zone: qeynos2

sub EVENT_SPAWN {
  quest::settimer(1,480); #8 minute timer
}

sub EVENT_SAY { 
  if($text=~/Hail/i){
    quest::say("You need something. or are you just browsing?");
  }
  if($text=~/stanos/i){
    # background story
    quest::say("What? (she looks shaken) I see it is time to make my choices. Forget you mentioned that name, $name. Leave me."); 
  }
}

sub EVENT_ITEM {
  #do all other handins first with plugin, then let it do disciplines
  plugin::try_tome_handins(\%itemcount, $class, 'Rogue');
  plugin::return_items(\%itemcount);
}

sub EVENT_TIMER {
    # checking if Hanns_Kreighor is spawned.
    my $npccheck = $entity_list->GetMobByNpcTypeID(2074);
    if ($npccheck != 0) {
      quest::say("Hanns, you are not going to want to hear this, but one of our boys in Donovon's gang swears he saw Stanos in the Karanas a week ago. And we still haven't cornered Malka Rale.");
      quest::signalwith(2074, 1, 2); #event_signal for Hanns to chat.
      quest::stoptimer(1);
      #Generating random number for timer.
      my $lower = 2200; # ~36minutes
      my $upper = 2900; # ~48minutes
      my $randnum = int($lower+rand($upper-$lower));
      quest::settimer(1,$randnum);
    }
}

sub EVENT_SIGNAL {
  # event_signal from Hanns_Krieghor to continue dialog
  if ($signal == 1) {
    quest::say("Very well, Father is as good as dead. Did I ever mention that I really hate family reunions? <chuckle>. I am gone!");
  }
}
#END of FILE Zone:qeynos2  ID:2033 -- Renux_Herkanor 

