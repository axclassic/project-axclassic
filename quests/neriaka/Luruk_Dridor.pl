sub EVENT_SAY {
if ($text=~/hail/i && $faction < 5 && $ulevel <= 10){ 
   quest::say("Go Away! You have either waited too long to get a free sample or You got your free sample already. I could sell you the needed components for the Coroded Axe Disipline if you want more.");
 }
 else{
   quest::say("So you want a free sample eh? OK learn well young Berserker");
   quest::faction(2804,120);
   quest::summonitem(59933,20);
   }
}
}