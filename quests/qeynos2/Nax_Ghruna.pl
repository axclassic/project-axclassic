#############
#NPC: Nax_Ghruna
#Quest Name:
#Quest by: 
#Revised: Olhadon
#NPCs Involved: Stanos Herkanor
#Items Involved: 
#zone: qeynos2

sub EVENT_SAY { 
  if($text=~/stanos/i){
    quest::say("Come over here, bub. Listen to me, and don't say a word. That name is one that can get you killed. Hanns wants Stanos dead, Renux wants to please Hanns, and everyone else wants to keep their spinal column intact, you know? So, $name, now you can speak. Where did you hear that name, or did you actually see Stanos somewhere?"); # no other responses available.
  }
}

sub EVENT_ITEM {
  #do all other handins first with plugin, then let it do disciplines
  plugin::try_tome_handins(\%itemcount, $class, 'Rogue');
  plugin::return_items(\%itemcount);
}
#END of FILE Zone:qeynos2  ID:2061 -- Nax_Ghruna

