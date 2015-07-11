sub EVENT_SAY {
if ($text=~/hail/i && $faction < 5 && $ulevel <= 10){ 
   quest::say("I am sorry, you have either waited too long to get a free sample or I have given you your free sample already. I will sell you the needed components for the Coroded Axe Disipline if you need more.");
 }
 else{
   quest::say("So you want a free sample eh? OK learn well young Berserker");
   quest::faction(2804,120);
   quest::faction(175,10);
    quest::faction(2806,10);
   quest::summonitem(59933,20);
   }
}
}