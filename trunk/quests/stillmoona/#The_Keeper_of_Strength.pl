sub EVENT_SAY { 
    if($text=~/Hail/i) {
    quest::emote(' sniffs the air.');
	quest::say("I smell weakness. You may think you are strong to have ventured this far, but we shall see. It is my duty to give the Trial of Strength. Should you find the four scrolls of strength, return them to me and the trial will begin. We will then see how you heroes fare.");
    }
 }
sub EVENT_ITEM {
    if (plugin::check_handin(\%itemcount, 49007 =>1, 49008 =>1, 49009 =>1, 49010 =>1 )) {
	quest::say("very well then $name, seek out a Spirit Keeper within this temple and he will start your trial of strength.");
	quest::spawn2(338163,0,0,-8.5,936.5,39.6,130.6);
	quest::depop();
	}
	else {
	plugin::return_items(\%itemcount);
    quest::say("These are not the Scrolls I aked you to find.");
   }
 }	