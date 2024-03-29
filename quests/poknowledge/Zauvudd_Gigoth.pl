# Zauvudd_Gigoth (202044)
#Beginner Combat Manual
#
#As a note, according to posts at Alla's (not the most reliable source I know, 
#but all I've got right now) the Beginner's quests eat the Planar Traveler's Manual, 
#so that quest must be completed 3 times in order to do all the Beginner's Manual 
#Quests.  This is intended behaviour.

sub EVENT_SAY {
	if($text=~/Hail/i) {
		quest::say("Hello. $name.  If you are looking for something in particular. I might be able to help you.  I spent many years teaching combat techniques to the finest warriors in Grobb.  I came to New Tanaan to further develop my teaching skills; it seems we all have our own lessons to learn.  I can teach you a few things if you are looking to be taught.  I will teach you the basics of planar combat if you are [willing to learn].");
	}
	if($text=~/willing to learn/i) {
		quest::say("This is good. One of the most important aspects to your battle readiness is your strong willpower and bravery. Years ago I discovered a particular concoction that will very readily put your willpower to the test. Unfortunately I ran out not too long ago and I am in need of some more [Planar Blood Brew]. If you can make some more for my students, it would certainly look favorably upon you in your future teachings. Bring me some along with your Planar Traveler's Manual.");
	}
	if($text=~/planar blood brew/i) {
		quest::say("To make the infamous Planar Blood Brew, you must attain some Nightmare Mephit Blood, Slarghilug Blood, Bubonian Blood, Soda Water, Grapes, a Cask, a Cork, and a Corking Device. Mix them in a Brew Barrel, and if you are skilled enough, the resulting swill should curl the hairs on even the hardiest of traveler's heads!");
	}
}

sub EVENT_ITEM {
	if(plugin::check_handin(\%itemcount, 28787 => 1, 28745 => 1)) {
		#Planar Blood Brew, Planar Traveler's Manual
		quest::say("How tasty!! You have done well here, I can't remember how long it's been since I've tasted a brew so fine. Take this book, it will certainly help you in combat. When you are ready, Gwiraba Gelrid will give you your next lesson, so be sure to speak to him. Do not lose your book or else he may not appreciate you coming to class unprepared.");#Adapting text from beginner magic manual, can't find this guys turn in text
		quest::summonitem(28788); #Beginner Combat Manual
		quest::exp(500000);
	}
    else {
        my $stuff = (\%itemcount);
        my $yes = 2;
        foreach my $k (keys(%{$stuff})) {
            next if($k == 0);
            $yes = 1;
        }
        if($yes == 1) {
            quest::say("I don't need this $name. Take it back.");
            plugin::return_items(\%itemcount);
        }
        if($platinum != 0 || $gold !=0 || $silver != 0 || $copper != 0) {
            quest::say("Thanks for the coin!");
        }
    }
}
#END of FILE Zone:poknowledge  ID:202044 -- Zauvudd_Gigoth 

