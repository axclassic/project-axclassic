#zone: gunthak NPC: Craegin_Coldtongue (224195)
#Angelox

sub EVENT_SAY { 
if ($text=~/Hail/i){
   quest::emote("shivers quietly.  You have a hard time believing that a barbarian of his stature could possibly think this climate to be cold.  He stares into your eyes for a moment and then shuffles away.");
 }
}