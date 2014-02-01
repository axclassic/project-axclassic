#############
#NPC: Meeka_Diggs
#Quest Name: Kevlin's Bride (appears to be incomplete on Live)
#Quest by: 
#Revised: Olhadon
#NPCs Involved: Kevlin Diggs, Twippie Diggs, Sonsa Fromp, Lashinda Hoggletop (never added to game)
#Items Involved:
#zone: rivervale

sub EVENT_SAY { 
  if($text=~/who is Kevlin/i){
    quest::say("Kevlin is my brother. Our family has been in the armor business for many years.");
  }
  elsif($text=~/who is Sonsa/i) {
    quest::say("Oh, my! Do not mention that name to me! She used to be wed to my older brother, Kevlin. All I can say about her is that she would make a better rogue than a tailor.");
  }
  elsif($text=~/who is Lashinda/i) {
    quest::say("She is my brother Kevlin's  bride. She is very nice. She works at the Fool's Gold, but when she has time she will help out with the shop by cleaning up or taking the day's profit over to the vault in the Guardian Stronghold.");
  }
  elsif($text=~/who is Twippie/i) {
    quest::say("Twippie Diggs is my younger brother. He sells armor also. His speciality is leather armor.");
  }
}

sub EVENT_ITEM {
  plugin::return_items(\%itemcount);
  quest::say("I have no need for this $name, you can have it back.");
}

#END of FILE Zone:rivervale  ID:19051 -- Meeka_Diggs

