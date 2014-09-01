sub EVENT_SAY { 
my $ready = quest::saylink("ready", 1);
    if($text=~/Hail/i) {
    quest::emote(' sniffs the air.');
	quest::say("I smell weakness. You may think you are strong to have ventured this far, but we shall see. It is my duty to give the Trial of Perseverance. Tel me when you are $ready and the trial will begin. We will then see how you heroes fare.");
    }
	if($text=~/ready/i) {
	quest::say("And so it begins");
	quest::spawn2(338167,0,0,71.1,-12.7,-30.4,216.1);
	quest::spawn2(388001,0,0,8.4,36.6,-31.7,175.9);
	quest::spawn2(388168,0,0,-27,36.6,-31.7,76.6);
	quest::spawn2(388169,0,0,-27,51,-32.9,110.5);
	quest::spawn2(388170,0,0,8.4,51,-32.9,135.6);
	quest::signalwith(338167,421,0);
	quest::depop();
    }
 }
