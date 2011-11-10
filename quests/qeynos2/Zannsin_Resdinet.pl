#############
#NPC: Zannsin_Resdinet
#Quest Name:
#Quest by: 
#Revised: Olhadon
#NPCs Involved: Stanos Herkanor
#Items Involved: 
#zone: qeynos2

sub EVENT_SAY { 
  if($text=~/Hail/i){
    # I don't have info on [Zan] response.
    quest::say("Hey..  My name's Zannsin. but you can call me [Zan].");
  }
  if($text=~/renux/i){
    quest::say("She is second in command around here. She and [Hanns] go way back, from what I hear.. Renux is probably the only person Hanns trusts.");
  }
  if($text=~/hanns/i){
    quest::say("Hanns, he runs things around here. Years ago, Hanns took over Ghil's old ring and started up the Circle of Unseen Hands. The Circle quickly took any market opposition out of Qeynos. We currently have connections in Erudin, Highpass and even Freeport.");
  }
}

sub EVENT_ITEM {
  #do all other handins first with plugin, then let it do disciplines
  plugin::try_tome_handins(\%itemcount, $class, 'Rogue');
  plugin::return_items(\%itemcount);
}
#END of FILE Zone:qeynos2  ID:2077 -- Zannsin_Resdinet 
