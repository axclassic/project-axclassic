sub EVENT_SAY { 
my $ready = quest::saylink("ready", 1);
    if($text=~/Hail/i) {
    quest::emote(' sniffs the air.');
	quest::say("I smell weakness. You may think you are strong to have ventured this far, but we shall see. It is my duty to give the Trial of Perseverance. Tel me when you are $ready and the trial will begin. We will then see how you heroes fare.");
    }
	if($text=~/ready/i) {
	quest::say("And so it begins");
	quest::spawn2(338167,0,0,-8.2,30.6,-32.9,123.6);
	quest::signalwith(338167,421,0);
	quest::depop();
    }
 }
