#############
#NPC: Gaffin_Deeppockets
#Quest Name:
#Quest by: 
#Revised: Olhadon
#NPCs Involved:
#Items Involved: 
#zone: rivervale

sub EVENT_SPAWN {
  quest::settimer(1, 480); # 8 minute timer
}

sub EVENT_ITEM {
  #do all other handins first with plugin, then let it do disciplines
  plugin::try_tome_handins(\%itemcount, $class, 'Rogue');
  plugin::return_items(\%itemcount);
}

sub EVENT_TIMER {
    # checking if Lendel_Deeppockets is spawned.
    my $npccheck = $entity_list->GetMobByNpcTypeID(19062);
    if ($npccheck != 0) {
      quest::say("Lenny, we have a problem. Stanos is back, and he ain't happy. He told me to tell ya that he would be calling in his markers soon. I reckon ya know what that means, and that's bad business with the Circle. Whatcha wanna do?");
      quest::signalwith(19062, 1, 2); #event_signal for Lendel to chat.
      quest::stoptimer(1);
      #Generating random number for timer.
      my $lower = 2200; # ~36minutes
      my $upper = 2900; # ~48minutes
      my $randnum = int($lower+rand($upper-$lower));
      quest::settimer(1,$randnum);
    }
}

#END of FILE Zone:rivervale ID:19070 -- Gaffin_Deeppockets

 