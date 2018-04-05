sub EVENT_SAY {
    my $busy = quest::saylink("busy", 1);
    my $help = quest::saylink("help", 1);
    my $mission = quest::saylink("mission", 1);
    my $war = quest::saylink("war", 1);
    my $willing = quest::saylink("willing", 1);
    if(defined($qglobals{pov_key_quest}) && ($qglobals{pov_key_quest} == 4)) {
        if($text=~/hail/i) {
            quest::say("I am very $busy at the moment. Perhaps you should come back at another time $name.");
        }
        if($text=~/busy/i) {
            quest::say("I can't go into any great detail, but the Crystalline Globe was taken from our command structure. It's believed to have been separated into three pieces. Unfortunately, we're having a lot of trouble relocating it. Perhaps you'd like to $help?");
        }
        if($text=~/help/i) {
            quest::say("That's good to hear $name. I wish we had more soldiers like yourself willing to help. I'm going to need you to locate the missing pieces of the globe and bring them back to me. After you've acquired the pieces perhaps you'd be able to rally enough people to lend us a hand with another $mission objective we've been unable to fulfill do to our diminished numbers.");
        }
        if($text=~/mission/i) {
            quest::say("Well, I can't go into any details as to our main purpose is, but one of our missions was to exterminate the crystalline dragon. However, due to our company being split we are unable to go forward with this part of the operation. It has been placed on hold, pending the outcome of the $war.");
        }
        if($text=~/war/i) {
            quest::say("Unfortunately, that is one of the things that I'm unable to speak of at this time. However, if you are $willing to help rally some people together I may be able to release some more information to you.");
        }
        if($text=~/willing/i) {
            quest::say("Please bring me three peices from the Crystaline Globe. You will find them in the nearby areas among various creatures. Once you have all three, let me have them.");
        }
    }
    elsif(defined($qglobals{pov_key_quest}) && ($qglobals{pov_key_quest} == 5)) {
        if($text=~/hail/i) {
            quest::say("Good luck!");
        }
    }
    else {
        quest::say("Not now soldier!");
    }
}

sub EVENT_ITEM {
    if(plugin::check_handin(\%itemcount, 25796 => 1, 25797 => 1, 25798 => 1)) {
        quest::say("I can't believe you brought the missing pieces back to me so quickly. I have a team of men who have been looking for these pieces for weeks now. That's quite a feat. Unfortunately, I will be unable to make use of the Crystalline Globe at this time. A message has been dispatched to my platoon asking us to return to the Halls of Honor. It looks as if we'll be joining up with the rest of our company fairly soon. Keep the globe. If you're able to rally enough people together to take on Aerin`Dar then perhaps you'll be able accomplish an objective that our platoon was unable to do. I must go now. Good luck to you $name.");
        quest::setglobal("pov_key_quest", 5, 5, "F");
        quest::summonitem(25596);
        quest::exp(50000);
    }
    else {
        plugin::return_items(\%itemcount);
    }
}