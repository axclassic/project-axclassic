#############
#NPC: Founy Jestands
#Quest Name: Ragebringer, Rogue Epic Quest
#Quest by: 
#Revised: Olhadon
#NPCs Involved: Stanos Herkanor
#Items Involved: Stained Parchment Top ID:28010
#zone: kaladimb

sub EVENT_SAY {
 if($text =~ /Hail/i) {
	quest::say('Hello. I am the guild master.');
 }
  # To make Rogue only, add in ($class eq "Rogue") to the if statement
  if($ulevel >= 50) { 
    if($text=~/note/i) {
      quest::say("'I don't know what you're talking about, if you know what I mean.' Founy fingers his belt pouch. 'You should leave now, if you know what's good for you. Don't make me sic the crew on you.");
    }
    elsif($text=~/stanos/i) {
      quest::say("Um, er.. <looks around nervously> Have you actually seen Stanos? How.. is he? Um, I have things I should be doing. I've got to figure out how this pottery wheel got stuck on my foot, for one thing. Er, I really don't have anything to tell you about Stanos, really, I swear it.");
	}
  }
}

sub EVENT_ITEM {
    #do all other handins first with plugin, then let it do disciplines
  plugin::try_tome_handins(\%itemcount, $class, 'Rogue');
  plugin::return_items(\%itemcount);
  quest::say("I have no need of this, take it back.");
}

#END of FILE Zone:kaladimb  ID:67000 -- Founy_Jestands

