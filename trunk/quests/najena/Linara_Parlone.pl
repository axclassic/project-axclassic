sub EVENT_SAY { 
if($text=~/Hail/i){
quest::say("Please [help] me out of this horrid place! My family must be terribly worried!");
}
if($text=~/help/i){
quest::say("If you can find the [key] to my restraints. I should be able to escape.");
}
if($text=~/key/i){
quest::say("Last I knew. Najena's priest had the key.  I fear he has left this place though.  I heard talk of traveling to some estate.  I know not where.  Oh dear. oh dear!  I shall never leave this place!"); }
}

sub EVENT_ITEM {
  if(plugin::check_handin(\%itemcount, 12269 => 1)) { #Tarnished Bronze Key
    quest::say("Thank you, $name! Take this note to my father Tolkar Parlone in Felwithe. He will be grateful to hear of my escape!");
    quest::summonitem(5573); #folded note

    quest::depop();
  }
  else {
    quest::say("I have no need for this, $name.");
    plugin::return_items(\%itemcount);
  }
}
#END of FILE Zone:najena  ID:44020 -- Linara_Parlone 
