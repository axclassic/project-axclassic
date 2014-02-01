 sub EVENT_SAY { 
if($text=~/Hail/i){
	quest::say("Hello, $name.  Would you like [night], [day], or [repop] them?");}}

