#############
#NPC: Twippie_Diggs
#Quest Name: Kevlin's Bride (appears to be incomplete on Live)
#Quest by: 
#Revised: Olhadon
#NPCs Involved: Kevlin Diggs, Meeka Diggs, Sonsa Fromp, Lashinda Hoggletop (never added to game), Lindo (never added to game)
#Items Involved:
#zone: rivervale

sub EVENT_SAY { 
  if($text=~/who is Kevlin/i){
    quest::say("Kevlin is my older brother. Together with my sister, Meeka, we run Kevlin's Gear, the number one dealers in armor in Rivervale. Well, the only armoror in Rivervale. Not counting Sonsa Fromp. Ahh... Beautiful Sonsa Fromp...");
  }
  elsif($text=~/who is Sonsa/i) {
    quest::say("Sonsa Fromp used to be married to my older brother Kevlin. She accidentally overcharged a customer once and my brother used that as an excuse to take the name of Diggs away from her so he could wed Lashinda Hoggletop. Now poor, beautiful Sonsa must charge a fortune for leather items just to make ends meet.");
  }
  elsif($text=~/who is Lashinda/i) {
    quest::say("Lashinda Hoggletop? She is the new bride of my older brother Kevlin. She works at the Fool's Gold. I don't like her much. I think she is cheating on my brother. I have seen her hanging around a traveling merchant named Lindo. He is a dwarf and frequents the Fool's Gold a lot at night. I could have sworn I saw them holding hands.");
  }
  elsif($text=~/who is Meeka/i) {
    quest::say("Meeka Diggs is my older sister. She primarily deals with cloth armor.");
  }
}

sub EVENT_ITEM {
  plugin::return_items(\%itemcount);
  quest::say("I have no need for this $name, you can have it back.");
}

#END of FILE Zone:rivervale  ID:19050 -- Twippie_Diggs 

