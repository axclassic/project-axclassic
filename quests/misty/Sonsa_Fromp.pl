#############
#NPC: Sonsa_Fromp
#Quest Name: 
#Quest by: 
#Revised: Olhadon
#NPCs Involved: Kevlin_Diggs, Lashinda_Hoggletop
#Items Involved:
#zone: misty

sub EVENT_SAY { 
  if($text=~/Hail/i){
    quest::say("Hello, traveler. It is so  good to meet you. I am  Sonsa Fromp, tailor supreme. I have been known to make the finest leather armor this sside of the wall. Feel free to inspect my merchandise. Buy plenty. This is how I put food on the table.");
  }
  elsif($text=~/who is Kevlin Diggs/i) {
    quest::say("Oooh!! Do not speak that name in this burrow! He used to be my husband. Now he has left me for that trollop, Lashinda Hoggletop!");
  }
  elsif($text=~/who is Lashinda Hoggletop/i) {
    quest::say("Never mention that name in this burrow!!");
  }
}

sub EVENT_ITEM {
  plugin::return_items(\%itemcount);
  quest::say("I have no need for this $name, you can have it back.");
}

#END of FILE Zone:misty  ID:33088 -- Sonsa_Fromp 

