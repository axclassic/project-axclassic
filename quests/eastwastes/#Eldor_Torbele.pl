#######################################
## NPC: Eldor_Torbele                ##
## Zone: East Waste                  ##
## Quest: The Rathe Prestige Quest   ##
## Created by Caved for AXClassic    ##
## EQWorld Server     30-08-2014     ##
#######################################
sub EVENT_SAY {
    if($text=~/hail/i && $ulevel >= 65) {
        quest::say("Hello stranger, well met. I am Eldor. I have been send down here to observe. Rumor has it that there are special monsters roaming these lands. To be honest I dont trust those ice bunnies one bit.");
    }
    elsif($text=~/hail/i && $ulevel < 65) {
        quest::say("I dont think I should talk to you. Move along now!");
    }
}

sub EVENT_ITEM {
    if(plugin::check_handin(\%itemcount, 119965 => 1)) {
        quest::say("$name, you have to seek out A Very Mean Ice Bunny and kill him. He is in this zone. He posesses the Ring of Ice.");
        quest::spawn("116909","0","0","-1345.99","-272.67","185.83");
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
