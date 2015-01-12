sub EVENT_SAY {
if($text=~/hail/i) {
   quest::say("$name!! Watch out, there are aggressive orcs here! Be careful. . .Aiiiieeeeeeeeee.");
   quest::spawn2(37162,0,0,1432.9,1952.3,11,255.2);
   quest::signalwith(37162,371,0);
   quest::spawn2(37165,0,0,1435.9,2048.8,25.5,196.1);
   quest::spawn2(37166,0,0,1433,2093.2,32.9,167.5);
   quest::spawn2(37166,0,0,1436,2070.4,28.5,186.2);
   quest::spawn2(37166,0,0,1431.8,2033.2,21.2,196.8);
   quest::spawn2(37166,0,0,1426.4,2009.6,16.5,228.1);
   quest::depop();
   }
 }  