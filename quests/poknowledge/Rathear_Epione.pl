#######################################
## NPC: Rathear Epione ##
## Zone: Plane of Knowledge ##
## Quest: Server Challenge Tier 5 ##
## Created by Caved for AXClassic ##
## Revised by Silent 09-24-2023 ##
#######################################
sub EVENT_SAY {
    my $open = quest::saylink("open", 1);
    my $back = quest::saylink("back", 1);
    my $here = quest::saylink("here", 1);
    my $aatotal = $client->GetSpentAA();

    if($text=~/hail/i && $ulevel == 65 && $aatotal >= 500) {
        quest::say("Hello $name, I am Rathear Epione. This is the hardest challenge I can offer you. This challenge will offer you rewards far different than you are used to. I require 500 AA points and 10k platinum");
        quest::say("In the event that you would die in your Tier 5 quest instance, I can port you $back for as long as the instance is active. In case your instance has already expired, your corpse will end up $here.");
        return 1;
    }
    if($text=~/hail/i && $ulevel < 65 || $aatotal < 500) {
        quest::say("Hello $name, the Tier 5 server challenge is for people who are lvl 65 and have spent in total 500 AA points. Come back when you meet those requirements.");
        return 1;
    }
    if($text=~/open/i && $ulevel >= 65 && !defined($qglobals{$name."chambersc9"}) && $aatotal >= 500) {
        quest::say("Just hand me 10000pp and I will create the instance for your challenge and port you there.");
        return 1;
    }
    if($text=~/open/i && $ulevel >= 65 && defined($qglobals{$name."chambersc9"}) && $aatotal >= 500) {
        quest::say("You already have an existing Tier 5 instance. You can't purchase a new one until it has expired, but I can port you $back to it if you'd like.");
        return 1;
    }
    if($text=~/back/i && $ulevel >= 64 && $aatotal >= 500) {
        if(defined($qglobals{$name."chambersc9"})) {
            quest::say("Going to send you back to your Tier 5 instance now.");
            my $QGlobalValue = $qglobals{$name."chambersc9"};
            quest::MovePCInstance(306, $QGlobalValue, 0.00, -37.00, -1.7, 0);
            return 1;
        }
        else {
            quest::say("You seem to have no Tier 5 instance.");
        }
        return 1;
    }
    if($text=~/here/i && $ulevel >= 64 && $aatotal >= 500) {
        quest::say("I am sending you to the graveyard for your corpse recovery.");
        quest::movepc(316, -2105, -4361, -307, 0);
    }
}

sub EVENT_ITEM {
    my $aatotal = $client->GetSpentAA();

    if(($platinum == 10000) && $ulevel >= 65 && !defined($qglobals{$name."chambersc9"}) && $aatotal >= 500) {
        quest::say("Thank you $class, you are on the way to your Tier 5 Challenge, good luck!"); #Money handin forinstance creation and porting to it.
        my $instanceID = quest::CreateInstance("chambersc", 9, 50800);
        quest::AssignToInstance($instanceID);
        quest::setglobal($name."chambersc9", $instanceID, 7, "H12");
        quest::MovePCInstance(306, $instanceID, 0.00, -37.00, -1.7, 0);
        return 1;
    }
    elsif(($platinum == 10000) && $ulevel >= 65 && defined($qglobals{$name."chambersc9"}) && $aatotal >= 500) {
        quest::say("You already have a Tier 5 instance that hasn't expired yet, here is your money back $name."); #Instance exists Money back.
        quest::givecash(0,0,0,10000);
        return 1;
    }
    elsif(($platinum == 10000) && $ulevel >= 65 && !defined($qglobals{$name."chambersc9"}) && $aatotal < 500) {
        quest::say("You lack the AA requirement to enter Tier 5 $name."); #Instance exists Money back.
        quest::givecash(0,0,0,10000);
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

