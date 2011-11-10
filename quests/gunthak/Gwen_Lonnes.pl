#zone: gunthak NPC: Gwen_Lonnes (224185)
#Angelox

sub EVENT_SAY { 
if ($text=~/Hail/i){
  quest::emote("glances at you for a moment, then sneers and turns back around. 'Go away whelp, before I decide to use you for a sparring dummy.'");
  #quest::say("Go away whelp, before I decide to use you for a sparring dummy.");
 }
}