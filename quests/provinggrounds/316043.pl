sub EVENT_SAY {
   if($text=~/hail/i) {
   quest::say("Uuugh. . .");
   }
   if($text=~/home/i) {
   quest::say("Duram sent you? Unbelievable. Before I go anywhere, I need my sword back, it was taken from me earlier. That beast in there took it and knocked me down. . .he thought I was dead because I didn't move. Defeat him and bring me back my sword and I will leave.");
   quest::spawn2(316063,0,0,-1861.4,-741.2,-309.8,153.9);
   }
 }
