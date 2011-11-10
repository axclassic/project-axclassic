sub EVENT_SAY {
    if ($text=~/hail/i) {
        quest::say("Hello. Nice day, isn't it? It would be nicer if I didn't have to spend it killing these disgusting rodents that have infested town. Hey, I have an idea! How about you go kill some of them for me and collect four of their whiskers? I will reward you, of course.");
    }
}

sub EVENT_ITEM {
    if (plugin::check_handin(\%itemcount, 13071 => 4)) { # Rat Whiskers x4
        quest::say("Here are your coins as promised. Have a nice day. I wish I could.");
        quest::ding();
        quest::faction(212,5); # +Merchants of Felwithe
        quest::faction(8,5);   # +Anti-Mage
        quest::givecash(1,1,1,0);
    } else {
        quest::say("I have no need for this.");
        plugin::return_items(\%itemcount);
    }
}
#Submitted by Senzo : PEQ Quest Team
