#zone: gunthak NPC: Lairyn_Debeian (224189)
#Angelox

sub EVENT_SAY { 
if ($text=~/Hail/i){
  quest::emote("stares at you directly in the eyes. 'Greetings, $name.  I suppose you're here like everyone else in search of fame and fortune.  Good luck to you, and good day.  I have many things to attend to.'");
 # quest::say("Greetings, $name.  I suppose you're here like everyone else in search of fame and fortune.  Good luck to you, and good day.  I have many things to attend to.");
 }
}