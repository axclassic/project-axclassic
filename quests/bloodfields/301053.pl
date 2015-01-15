sub EVENT_SAY {
    if($ulevel >= 51 && $text=~/hail/i) {
   quest::say("Are you Looking for something?? Ah, here it is.. Your death!!!");
   quest::spawn2(301059,0,0,581.5,133.6,-951.7,6.6);
   quest::signalwith(301059,301,0);
   quest::spawn2(301054,0,0,607.4,176.4,-951.7,16.2);
   quest::spawn2(301055,0,0,575,178.1,-952,23);
   quest::spawn2(301056,0,0,568.1,223.3,-944,68.1);
   quest::spawn2(301056,0,0,639.2,197.8,-946.7,213.5);
   quest::spawn2(301057,0,0,627.8,168.9,-951,240.2);
   quest::depop();
   }
 }