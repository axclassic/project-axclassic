sub EVENT_SAY {
  if ($ulevel <= 50 && $text=~/Hail/i){
   quest::say("Be gone youngster! There is nothing for you here but death.");
   }
  if($ulevel >= 51 && $text=~/hail/i) {
   quest::say("The Letter? I may have it but I will never surrender it to the likes of you! Prepare to die scum!");
   quest::spawn2(57137,0,0,-1771.9,-910.3,-2.3,242.4);
   quest::spawn2(57141,0,0,-1746.7,-918.9,0.4,217);
   quest::spawn2(57140,0,0,-1786.8,-936.5,0.1,9);
   quest::spawn2(57139,0,0,-1741.8,-899.8,-1,213.5);
   quest::spawn2(57141,0,0,-1801.7,-894.1,-3.9,73.6);
   quest::spawn2(57141,0,0,-1765.2,-875.8,-4,136.4);
   quest::depop();
   }
 }