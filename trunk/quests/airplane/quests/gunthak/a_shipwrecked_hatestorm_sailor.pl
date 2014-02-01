#zone: gunthak NPC: a_shipwrecked_hatestorm_sailor (224198)
#Angelox

sub EVENT_SAY { 
if ($text=~/Hail/i){
  quest::say("Wot do you want?  I be tired after [big trouble].'  This Troll's speech gives you the impression that he is not the smartest being you have ever dealt with");
  }
}