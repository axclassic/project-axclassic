#############
#NPC: Charlotte_Diggs
#Quest Name: 
#Quest by: 
#Revised: Olhadon
#NPCs Involved: 
#Items Involved:
#zone: rivervale

sub EVENT_SPAWN {
  #Generating random number for timer.
  my $lower = 720; # ~12minutes
  my $upper = 2400; # ~40minutes
  my $randnum = int($lower+rand($upper-$lower));
  quest::settimer(1,$randnum);
}

sub EVENT_TIMER {
  quest::emote("picks up something from the ground.");
  quest::stoptimer(1);
  #Generating random number for timer.
  my $lower = 720; # ~12minutes
  my $upper = 2400; # ~40minutes
  my $randnum = int($lower+rand($upper-$lower));
  quest::settimer(1,$randnum);
}

sub EVENT_ITEM {
  plugin::return_items(\%itemcount);
  quest::say("I have no need for this $name, you can have it back.");
}

#END of FILE Zone:rivervale  ID:19106 -- Charlotte_Diggs

