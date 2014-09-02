sub EVENT_SAY { 
my $worthy = quest::saylink("worthy", 1);
    if($text=~/Hail/i) {
    quest::say("Greetings $name, There is only one excuse for breaking my meditation, you think you $worthy of the Trial of Wisdom?"); 
    }
	if($text=~/worthy/i) {
    quest::say("So you have found the four scrolls of wisdom and wish to begin the Trial of Wisdom? So be it. Do what you must to defeat An Animated Statue!");
	quest::spawn2(338177,0,0,190.3,433.8,-8.3,4.4);
	quest::depop();
 }
}	