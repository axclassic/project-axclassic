sub EVENT_SAY {
if ($ulevel <= 60 && $ulevel >= 51 && $text=~/Hail/i){
   quest::say("Yes outsider, I have been foretold of your arrival. The scroll you seek, however, was stolen from here but mere moments before you arrived. Find the thieves and you will find the scroll you need!");
   quest::spawn2(338228,0,0,-723.7,1101.3,4.3,61.6);
   quest::spawn2(338229,0,0,-703.2,1134.5,2.9,107.9);
   quest::spawn2(338230,0,0,-696.9,1070.2,2.9,17.8);
   quest::depop();
   }
   }