#############
#NPC: Nillipus
#Quest Name: 
#Quest by: 
#Revised: Olhadon
#NPCs Involved: 
#Items Involved:
#zone: rivervale

sub EVENT_SPAWN {
  #Generating random number for timer.
  my $lower = 660; # ~12minutes
  my $upper = 1920; # ~32minutes
  my $randnum = int($lower+rand($upper-$lower));
  quest::settimer(1,$randnum);   
}

sub EVENT_TIMER {
  if ($timer == 1) {
    quest::say("Look what I've found! What a great find! It used to be yours, but now it is mine!");
    quest::stoptimer(1);
    #Generating random number for timer.
    my $lower = 660; # ~12minutes
    my $upper = 1920; # ~32minutes
    my $randnum = int($lower+rand($upper-$lower));
    quest::settimer(1,$randnum); 
  }
}

sub EVENT_DEATH {
	quest::say("My body lies broken by your wicked hand. I place a curse on your soul and a pox on this land!");
}

#END of FILE Zone:rivervale  ID:19015 -- Nillipus

