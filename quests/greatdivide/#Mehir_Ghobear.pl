#######################################
## NPC: Mehir Ghobear                ##
## Zone: Great Divide                ##
## Quest: The Rathe Prestige Quest   ##
## Created by Caved for AXClassic    ##
## EQWorld Server     29-07-2014     ##
#######################################
sub EVENT_SAY {
    if($text=~/hail/i && $ulevel >= 65) {
        quest::say("$name , please go away I dont need people like you skrewing up my hideout. I am trying to catch some vultures here and you are NOT helping my case at all!");
    }
    elsif($text=~/hail/i && $ulevel < 65) {
        quest::say("You are not someone I would like to talk to at all, BE GONE infidel!!");
        return 1;
    }
}

sub EVENT_ITEM {
    if(($ulevel >= 65) && plugin::check_handin(\%itemcount, 119933 => 1)) {
        quest::say("Very well $class, I see you are here to help me catch those damned vultures. I need you to bring me a coin, 1 from each of them. These coins will be the proof that you killed them. Were they are exacly? Noone knows. But I am confident that you will find them.");
        quest::spawn("118170","0","0","-1961.229980","-6358.689941","-411.079987");
        quest::spawn("118171","0","0","1572.400024","-1835.869995","137.740005");
        quest::spawn("118172","0","0","-1643.349976","-2462.590088","186.240005");
        quest::spawn("118173","0","0","2286.250000","-5496.649902","-162.460007");
    }
    elsif(($ulevel >= 65) && plugin::check_handin(\%itemcount, 119928 => 1, 119929 => 1, 119930 => 1, 119931 => 1)) {
        quest::say("Wow $sname, You really DID pull it off I commend you. Please seek out Melvin in the Karanas to proceed! Give him this token.");
        quest::summonitem("119946");
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
