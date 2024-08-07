#######################################
## NPC: Melissa Ravenheart           ##
## Zone: Plane of Knowledge          ##
## Quest: The Rathe Prestige Quest   ##
## Created by Caved for AXClassic    ##
## EQWorld Server     29-07-2014     ##
#######################################
sub EVENT_SAY {
    my $prestige = quest::saylink("prestige", 1); 
    my $send = quest::saylink("send", 1); 

    if($text=~/hail/i && $ulevel >= 65) {
        quest::say("Hello $name , I am Melissa Ravenheart the famous Magician. Please tell me that you heard of me in the past. I can $send you on your $prestige quest if you like.");
    }
    elsif($text=~/hail/i && $ulevel < 65) {
        quest::say("You are not old enough for this quest yet, you simply cannot survive. Come back when you are lvl 65++");
        return 1;
    }

    if($text=~/prestige/i && $ulevel >= 65) {
        quest::say("The Rathe Prestige quest is a very very hard quest (mega epic style) for what could very well be THE most powerfull item in the game. I won\'t tell you what the reward is but I can tell you that you absolutely want to do this quest $name.");
    }
    if($text=~/send/i && $ulevel >= 65) {
        quest::say("For more details regarding this quest you will have to bring me 1 Rathe Prestige Token. It can be purchased nearby. Giving me this token shows me that you are motivated and dedicated enough to start on your journey.");
    }
}


sub EVENT_ITEM {
    if(($ulevel >= 65) && plugin::check_handin(\%itemcount, 119932 => 1)) {
        quest::say("Very well $class, prepare yourself for the biggest adventures of all. You are going to do the Rathe Prestige Quest. I cannot say that I envy you. It will be a LONG and very HARD journey... Give this coin to Mehir. He can be found in the ice regions of Velious."); #prestige token handin
        quest::summonitem(119933);   
        return 1;
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
