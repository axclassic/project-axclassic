sub EVENT_SAY {
  if($text=~/Hail/i){
    quest::say("Brrrr.. It.. Is sooo.. c-cold!! I never.. sh-should've j-joined.. the.. the W-wolves of the N-north!!");
  }
}

sub EVENT_ITEM {
  # 13244 :  One Quarter Bottle of Elixir
  if ($itemcount{13244} == 1){
    quest::say("Oh thank you. Sorry, but the bottle is empty now. I hope you did't need any. Take the empty bottle back to Dargon. He may refill it for you.");
     quest::ding(); quest::exp(125);
    quest::faction(213,10); # 213 : Faction Merchant's of Halas
    quest::faction(294,10); # 294 : Faction Shaman of Justice
    quest::faction(311,10); # 311 : Faction Steel Warriors
    quest::faction(361,10); # 361 : Faction Wolves of the North
    quest::summonitem(13245); # 13245 :  Empty Bottle of Elixir
  }
}

#END of FILE Zone:everfrost  ID:30029, 30096, 30119 -- Megan_OReilly

