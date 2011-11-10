#zone: gunthak NPC:Nolwik_Barquin (224183)
#Angelox

sub EVENT_SAY { 
if ($text=~/Hail/i){
  quest::emote("glances up at you. 'Hello, $name.  I'm in no mood to talk, please leave me in peace.'  Nolwik turns and looks out across the water seemingly looking or perhaps listening for something.");
 #quest::say("Hello, $name.  I'm in no mood to talk, please leave me in peace.'  Nolwik turns and looks out across the water seemingly looking or perhaps listening for something.");
 }
}