sub EVENT_SAY { 
my $worthy = quest::saylink("worthy", 1);
    if($text=~/Hail/i) {
    quest::say("You have found the four scrolls of strength and wish to begin the Trial of Strength? So be it. Long ago, a council of five warriors protected this temple from those that would harm it. However, one day they were bested in battle and were destroyed. This monument behind me is all that remains to remind the temple inhabitants of their deeds. However, the spirits of the fallen warriors long to do battle again. If you believe you are $worthy, I will raise them from the dead so that you may begin the Trial of Strength.");
    }
	if($text=~/worthy/i) {
    quest::say("Rise, warriors of the past! Experience the glory of combat once more!");
	quest::spawn2(338165,0,0,-7.3,976.6,39.6,128.8);
	quest::signalwith(338165,322,0);
	quest::signalwith(338165,321,5);
	quest::depop();
 }
}	