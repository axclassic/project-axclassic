sub EVENT_SAY { 
if($text=~/Hail/i){
	quest::say("Yes, yes!! I am a very busy man. I've got blueprints to work on, [dwarven wire] to perfect and formulae to calculate. In between those tasks, I have to find time to head down to Irontoe's and down a few Tumpy Tonics.");
}
if($text=~/wire/i){
	quest::say("Oh!! Interested in my dwarven wire, are you? Many are. I have no problem letting you use a spool, but I have to warn you that I have not perfected the strength of it yet. I will make you a trade. A couple of [Tumpy Tonics] for a spool.");
}
if($text=~/tonics/i){
	quest::say("Aaah!! I love Tumpy Tonics. They were created by Tumpy Irontoe. He was once a member of the famed Irontoe Brigade. Since they disbanded and left for parts unknown he decided to stay in Kaladim and open Irontoe's, the finest well in Faydwer.");
}
}

sub EVENT_ITEM {
	if($itemcount{12114} == 1) {
		quest::say("Hey!! Only one?!!");
	} elsif($itemcount{12114} == 2) {
		quest::say("Great!! I did not have the time to get down to Irontoe's today. Here. Like I said. A spool of dwarven wire. Now go away. I ain't sharing these tonics.");
		quest::summonitem(12111);
		quest::ding(); quest::exp(1000);
		quest::faction(314,15); # +Storm Guard
		quest::faction(169,15); # +Kazon Stormhammer
		quest::faction(219,15); # +Miners Guild 249
		quest::faction(215,15); # +Merchants of Kaladim
		quest::faction(57,-15); # -Craknek Warriors
	}
}
#END of FILE Zone:kaladimb  ID:67033 -- Trantor_Everhot 

