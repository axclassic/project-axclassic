#Frontier Mountains (frontiermtns) >> #Digmaster_Duggert (92098)
#Free the Drogan Slaves

sub EVENT_SPAWN {
    if(!defined $qglobals{DroganSlave}) {
        quest::depop();
    }
    else {
        switch($qglobals{DroganSlave}) {
            case 1:
            case 2:
            case 3:
            case 4:
                quest::depop();
                break;
        }
    }
}

sub EVENT_SAY {
    if($text=~/Hail/i) {
        quest::say("I am certainly lucky to be alive this day hail and well met. The goblins in the Temple of Droga have been a constant thorn in my peoples side and we need to strike back at them. Will you help us strike back?");
    }
    if($text=~/strike back/i) {
        quest::say("I am glad you will help. Here is what I need for you to do for me. Find the goblin dust hoodlums within the depths of the Temple of Droga and bring back three Hoodlum Symbols of Dust they often have. Also seek out the famous thief, Dust Hoodlum Heaprit, and bring back his heart so I might use it in a ritual of protection. If you do this for me I will reward you well.");
    }
}

sub EVENT_ITEM {
    if(plugin::check_handin(\%itemcount, 62100 => 3, 62101 => 1)) {
        quest::say("May the blessing of the earth be with you. Here take this, it may prove useful to you.");
        quest::summonitem(62206);
    }
    else {
        quest::say("I don't need this.");
        plugin::return_items(\%itemcount);
    }
}
