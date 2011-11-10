#zone: gunthak NPC: Xoomix_Haroinoddin
#Angelox

sub EVENT_SAY { 
if ($text=~/Hail/i){
  quest::say("Please. Please help me. I am quite weak and am being [held captive] here against my will");
 }
}