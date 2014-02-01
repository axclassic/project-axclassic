# Quest for Greta Terrilon in halas
# NPC ID UNK -- Greta

sub EVENT_SAY { 
  if($text=~/hail/i){ 
    quest::say("Welcome to my humble shop."); 
  }
  if($text=~/ink/i) { 
    quest::say("On an errand for Jinkus eh? No - no money, consider this a donation to the church");
    quest::summonitem(quest::12619);
  }
} 

 

#END of FILE Zone:halas  ID:UNK -- Greta Terrilon
