#######################################
## NPC: Helena_Kimang                ##
## Zone: Halls of Honor B            ##
## Quest: The Rathe Prestige Quest   ##
## Created by Caved for AXClassic    ##
## EQWorld Server     27-08-2014     ##
#######################################
sub EVENT_SAY {
    if($text=~/hail/i && $ulevel >= 65) {
        quest::say("Hello $name do I know you?");
    }
    elsif($text=~/hail/i && $ulevel < 65) {
        quest::say("I dont think I should talk to you. Bye now.");
    }
}

sub EVENT_ITEM {
    if(($ulevel >= 65) && plugin::check_handin(\%itemcount, 119954 => 1)) {
        quest::say("Hello $name, I see Melvin sent you so I can trust you.. A friend of Melvin is a friend of mine. I have a problem and I need your help. My bosses sent me out to observe in the most dangerous places. At the same time they try to cut down on the costs of this operation. My request for new armor was denied for the second time now and I feel so naked in this dangerous place. If only you could bring me some Tier 2 dolls so i could goto the Plain of Knowledge to snag me a new breastplate I would be forever gratefull and help you with your quest. Bring me back the token that I am about to give you together with 3 Tier 2 dolls to advance in your quest my friend.");
        quest::summonitem("119955");
    }
    elsif(($ulevel >= 65) && plugin::check_handin(\%itemcount, 119955 => 1, 119592 => 3)) {
        quest::say("WOW $name , I thank you so very much for the dolls. Go bring this coin to my sister she is trapped inside the Twilight zone. She needs your help too.");
        quest::summonitem("119956");
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
