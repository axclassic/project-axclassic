#############
#NPC: Klieb_Torne
#Quest Name: Paw of Opolla
#Quest by: 
#Revised: Olhadon
#NPCs Involved: Micc_Koter
#Items Involved: 
#zone: qeynos

sub EVENT_SPAWN {
  #Generating random number for timer.
  my $lower = 600; # ~10minutes
  my $upper = 1800; # ~30minutes
  my $randnum = int($lower+rand($upper-$lower));
  quest::settimer(1,$randnum);
}

sub EVENT_SAY { 
  if($text=~/Hail/i){
	quest::say("Hey, $name!  Do I know you from somewhere?  Highpass?  Nah, you ain't who I thought you were.  If I were you I would just keep my trap shut and buy some drinks.");	
  }
  elsif($text=~/what paw of opolla/i){
    quest::say("Heh? Why don't you mind your own business, bub?! Buzz off!");
	#check to see if Micc_Koter is spawned and send signal
	my $npccheck = $entity_list->GetMobByNpcTypeID(1072);
    if ($npccheck != 0) {
    quest::signalwith(1072, 1, 2);
    }
  }
}

sub EVENT_SIGNAL {
  #response to Micc_Koter
  if ($signal == 1) {
    quest::say("Shut your hole, Micc, you dirty son of a kobold!");
  }
}

sub EVENT_TIMER {
  quest::emote("Can you believe that? That guy actually thinks he is going to find the [Paw of Opolla]! Bwah ha ha ha!");
  #check to see if Micc_Koter is spawned and send signal
  my $npccheck = $entity_list->GetMobByNpcTypeID(1072);
  if ($npccheck != 0) {
    quest::signalwith(1072, 2, 2);
  }
  quest::stoptimer(1);
  #Generating random number for timer.
  my $lower = 600; # ~10minutes
  my $upper = 1800; # ~30minutes
  my $randnum = int($lower+rand($upper-$lower));
  quest::settimer(1,$randnum);
}

sub Event_ITEM {
  quest::emote("I have no need for this $name, you can have it back.");
  plugin::return_items(\%itemcount);
}

#END of FILE Zone:qeynos  ID:1071 -- Klieb_Torne 


