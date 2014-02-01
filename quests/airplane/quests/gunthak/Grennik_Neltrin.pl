#zone: gunthak NPC: Grennik_Neltrin (224187)
#Angelox

sub EVENT_SAY { 
if ($text=~/Hail/i){
  quest::say("Hello, $name. Nice weather isn't it?  Well considering our location I mean.  I somehow doubt that the sun ever shines on this cursed rock.");
 }
}