## #Oshimai_Spirit_of_the_High_Air (317113) ##

sub EVENT_SPAWN {
    quest::say("So you are the one that I have been sensing all this time. I had hoped that you would come to rescue me. I am Oshimai of the High Air. I owe you and your guardian spirit my thanks. I think I know how I can repay you. Give me the Heartwood Blade, the Globe of Discordant Energy and that device you used to free me.");
    quest::settimer("depop", 1800);
}

sub EVENT_TIMER {
    if($timer eq "depop") {
        quest::depop();
    }
}

sub EVENT_ITEM {
    if(plugin::check_handin(\%itemcount, 120340=> 1, 47100 => 1, 62627 =>1)) {
        quest::shout("Everyone present shall know of your deeds. Each of you take notice of this ranger that has freed me! Oshimai of the High Air thanks you, friend and those that have aided you! 'Oshimai raises the blade to the level of his eyes. A cold wind stirs in the area. It gathers around him and then flows from him into the sword in his hands. When he hands the weapon back, it has an animate life in it, a power that you can see and sense. 'I have given your ally some of my strength. He, through this blade, will be better able to aid you in your work. Thank you.'");
        quest::summonitem(62649);
        quest::ding();
        quest::settimer("depop", 15);
        if(($class eq "Ranger") && (!defined($anguish_ranger))) {
            quest:setglobal("anguish_ranger", "1", 5, "F");
            $client->AddAAPoints(10);
            $client->Message(15, "You have gained 10 ability points!");
        }
    }
    plugin::return_items(\%itemcount);
}

