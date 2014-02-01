#############
#NPC: Daleen_Leafsway
#Quest Name: Hungry Deputy
#Quest by: 
#Revised: Olhadon
#NPCs Involved: Deputy_Eigon
#Items Involved: Sack of Turnip ID:16165
#zone: rivervale

sub EVENT_SPAWN {
  #Generating random number for timer.
  my $lower = 1080; # ~18minutes
  my $upper = 2160; # ~36minutes
  my $randnum = int($lower+rand($upper-$lower));
  quest::settimer(1,$randnum); 
}

sub EVENT_SAY { 
  if($text=~/Hail/i){
    quest::say("Greetings. $name! Welcome to Tagglefoot's Farm.  We grow nothing but the finest vegetables in our field.  We even manage to harvest the mystical jumjum stalk in our fields. Karana has blessed us indeed.");
  }
  elsif($text=~/who.*?starving/i) {
	quest::say("Deputy Eigon! I forgot! I was supposed to bring him some turnips to eat while he is on patrol! Oh... He asked so nicely, too. I feel bad that I forgot. If only someone would take these [turnips] to the Deputy..");
  }
  elsif($text=~/take.*?turnips/i) {
	quest::say("Oh, thank you so much! You can keep any payment he gives you. Be sure to tell him I'm sorry.");
	#Sack of Turnips ID:16165
	quest::summonitem(16165);
  }
}

sub EVENT_TIMER {
  if ($timer == 1) {
  quest::say("Oh dear.. I can't believe I forgot.. He must be [starving]!");
  quest::stoptimer(1);
  #Generating random number for timer.
  my $lower = 1080; # ~18minutes
  my $upper = 2160; # ~36minutes
  my $randnum = int($lower+rand($upper-$lower));
  quest::settimer(1,$randnum);
  }
}

sub EVENT_ITEM {
  plugin::return_items(\%itemcount);
  quest::say("I have no need for this $name, you can have it back.");
}

#END of FILE Zone:rivervale  ID:19079 -- Daleen_Leafsway 

