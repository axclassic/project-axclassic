##Test pathing for Sleeper##
sub EVENT_SAY {
if($text=~/hail/i){
           quest::say("Very well releasing The Sleeper.");
		   quest::spawn2(128106,1,0,-1499,-2344.8,-1052.8,0);
		   }
		   }