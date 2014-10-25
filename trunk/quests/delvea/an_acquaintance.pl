sub EVENT_SAY {
if ($text=~/Hail/i){
   quest::say("So you you were sent to me to see if I have further information? All I can tell you is be quick and do not wake the queen or your fate could be like mine or worse.");
   quest::say("In order to get the egg sacks to spawn you must kill reclusive and elder lavaspinners. That is all I know.");
   quest::spawn2(341082,0,0,-653.6,-1086.7,25.4,240.8);
   quest::signalwith(341082,540,0);
   }
   }