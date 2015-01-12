sub EVENT_SAY {
   if($text=~/hail/i) {
   quest::say("Sanait?");
   }
   if($text=~/Sanait Sanaiij Tsulum/i) {
   quest::emote(' implodes, blinding you with a bright flash of light, Three horrendous creatures now appear before you, and they dont look happy...');
   quest::spawn2(336536,0,0,1381,2687.8,-17.9,91.6);
   quest::spawn2(336535,0,0,1396.5,2624.1,-27.2,14.1);
   quest::spawn2(336533,0,0,1391.9,2655.9,-27.2,54.2);
   quest::spawn2(336534,0,0,1414.8,2680.1,-27.2,150.1);
   quest::depop();
   }
 }

 