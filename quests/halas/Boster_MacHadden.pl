sub EVENT_SAY {
if($ulevel <= 10 && $text=~/Hail/i) {
     if ($faction <=5){
   quest::say("I am sorry, you have either waited too long to get a free sample or I have given you your free sample already. I will sell you the needed components for the Coroded Axe Disipline if you need more.");
 }
 else{
   quest::say("So you want a free sample eh? OK learn well young Berserker");
   quest::faction(2804,120);
   quest::sumonitem(59934);
   }
}
}