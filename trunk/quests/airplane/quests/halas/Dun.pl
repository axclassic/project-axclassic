# Quest for Dun in S Qeynos 
# NPC ID UNK ---- DUN at bank
sub EVENT_SAY { 
  #Wanted Poster
  if (plugin::check_handin(\%itemcount, 12620 => 1)) {
      quest::say("Thank you for this. Please take this list of Qeynos' most wanted criminals back to Jinkus. We suspect that some of these may have slipped into Halas");
      quest::summonitem(quest::12622);
    }
  }

#END of FILE Zone:halas  ID:UNK -- Dun at bank
