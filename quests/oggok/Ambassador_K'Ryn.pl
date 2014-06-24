sub EVENT_SAY {
 if($text =~ /Hail/i) {
quest::say("Begone from my sight unless you have business with the Indigo Brotherhood.");
}
}
sub EVENT_ITEM {
 if (plugin::check_handin(\%itemcount, 119865 => 1)) {
	quest::say("Ah! I have been waiting for this report, what took you so long?");
	quest::say("Nevermind I dont have time to hear your sorry excuses.");
	quest::summonitem(18843);
	quest::faction(155, 10); #Indigo Brotherhood
	quest::ding();
	quest::givecash(1,1,0,0);
	quest::exp(100);
	quest::say("Here take this letter and return it to Seloxia.");
	quest::say("Try to be a little faster $name.");
}
}