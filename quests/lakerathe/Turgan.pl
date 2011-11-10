# Part of the quest for Boots of the Reliant

sub EVENT_SAY { 
  if($text=~/Hail/i){
    quest::say("Hail!  What brings you here?");
  }
  if($text=~/icon of the reliant/i){
    quest::say("Where did you hear... I don't know what you are talking about.  Begone!  Back to Kithicor with you!"); 
  }
}

sub EVENT_ITEM {
  if ($itemcount{19001} == 1) {
    quest::say("I am that Turgan, but I am no longer worth of this title.  Take this in hopes that you become a better steward than I was.");
  }
}

# Quest by mystic414

