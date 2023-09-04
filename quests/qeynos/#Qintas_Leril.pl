#######################################
## NPC: Qintas_Leril                 ##
## Zone: Qeynos                      ##
## Quest: The Rathe Prestige Quest   ##
## Created by Caved for AXClassic    ##
## EQWorld Server     30-08-2014     ##
#######################################
sub EVENT_SAY {
    if($text=~/hail/i && $ulevel >= 65) {
        quest::say("Hello $name who are you?");
    }
    elsif($text=~/hail/i && $ulevel < 65) {
        quest::say("I dont think I should talk to you. Move along now!");
    }
}

sub EVENT_ITEM {
    if(($ulevel >= 65) && plugin::check_handin(\%itemcount, 119963 => 1, 119962 => 1)) {
        quest::say("Hello $name, Desree told me that you were on the way to see me and here you are. Well met my friend. You are only moments away from getting your great quest reward. I just wanted you to do 1 more thing for me. Return my Token of trust to me together with 3 Drachnid Leg tips. I need to make a half decent dagger so I can defend myself. Do this for me and I will send you to your final fight!");
        quest::summonitem("119964");
    }
    elsif(($ulevel >= 65) && plugin::check_handin(\%itemcount, 119964 => 1, 11937 => 3)) {
        quest::say("Ok $name. You are ready for the final fight. I give you this coin for Eldor Torbele. He can be found in the icy regions of Velious. Be prepared to fight once you give it to him.");
        quest::summonitem("119965");
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
