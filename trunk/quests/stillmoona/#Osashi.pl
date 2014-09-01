sub EVENT_SAY { 
my $ready = quest::saylink("ready", 1);
my $test = quest::saylink("test", 1);
    if($text=~/Hail/i) {
    quest::emote(' sniffs the air.');
	quest::say("I smell weakness. You may think you are strong to have ventured this far, but we shall see. Are you here to $test yourselves?");
	}
	if($text=~/test/i) {
	quest::say("It is my duty to give the Trial of Perseverance. Tell me when you are $ready and the trial will begin. We will then see how you heroes fare.");
    quest::spawn2(338167,0,0,71.1,-12.7,-30.4,216.1);
	quest::signalwith(338167,421,0);
	}
	if($text=~/ready/i) {
	quest::say("And so it begins");
	quest::signalwith(338167,422,5);
	quest::depop();
    }
 }
