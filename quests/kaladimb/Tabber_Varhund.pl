sub EVENT_SAY {
if ($text=~/hail/i && $faction < 5 && $ulevel <= 10){ 
   quest::say("I am sorry, ye have either waited too long to get a free sample or I already gave ye yer free sample. I will sell ye the needed components for the Coroded Axe Disipline if ye need more.");
 }
 else{
   quest::say("So ye want a free sample eh? OK learn well young Berserker");
   quest::faction(2804,120);
   quest::summonitem(59934,20);
   }
}
}