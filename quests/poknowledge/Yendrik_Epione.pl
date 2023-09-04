#######################################
## NPC: Yendrik Epione               ##
## Zone: Plane of Knowledge          ##
## Quest: Server Challenge Tier 2    ##
## Created by Caved for AX Classic   ##
##   Revised           04-11-2014    ##
#######################################

sub EVENT_SAY {
    my $open = quest::saylink("open", 1);
    my $back = quest::saylink("back", 1);
    my $here = quest::saylink("here", 1);
    my $aatotal = $client->GetSpentAA();

    if($text=~/hail/i && $ulevel == 65 && $aatotal >= 75) {
        quest::say("Hello $name , I am Yendrik Epione. I am here to tell you about Tier 2 armor, it is called Rathe Armor (Tier 2) it can be found in a special instanced dungeon. You can find all the pieces there exept for the chest pieces. You wil have to bring me 3 The Rathe Server Doll (Tier 2)'s and I wil give you a random Tier 2 chestpiece, either Leather, Plate, Chain or Silk. These dolls drop in this quest dungeon to occasionaly. If you are lvl 65 and have spend 75 AA points I can $open a zone instance for you to begin your Tier 2 challenge, it will stay open for 3.5 hours. I charge 1000pp per zone instance. You can purchase a new instance after the old one has expired.");
        quest::say("In the event that you would die in your Tier 2 quest instance, I can port you $back for as long as the instance is active. In case your instance has already expired, your corpse will end up $here.");
        return 1;
    }
    if($text=~/hail/i && $ulevel < 65 || $aatotal < 75) {
        quest::say("Hello $name , the Tier 2 server challenge and quest I am offering is for people who are lvl 65 and have spend in all 75 AA points as a minimum. Come back when you meet those requirements.");
        return 1;
    }
    if($text=~/open/i && $ulevel >= 65 && !defined($qglobals{$name."chambersf9"}) && $aatotal >= 75) {
        quest::say("Just hand me 1000pp and I will create the instance for your challenge and port you there.");
    }
    if($text=~/open/i && $ulevel >= 65 && defined($qglobals{$name."chambersf9"}) && $aatotal >= 75) {
        quest::say("You already have an existing Tier 2 zone instance. You can't purchase a newone until it has expired, but I can port you $back to it if you like.");
        return 1;
    }
    if($text=~/back/i && $ulevel >= 64 && $aatotal >= 75) {
        if(defined($qglobals{$name."chambersf9"})) {
            quest::say("Going to send you back to your Tier 2 instance now.");
            my $QGlobalValue = $qglobals{$name."chambersf9"};
            quest::MovePCInstance(309, $QGlobalValue, 0.00, -37.00, -1.7, 0);
            return 1;
        }
        else {
            quest::say("You seem to have no Tier 3 instance.");
        }
        return 1;
    }
    if($text=~/here/i && $ulevel >= 64 && $aatotal >= 75) {
        quest::say("I am sending you graveyard for your instance.corpse recovery instance.");
        quest::movepc(316, -3065, -1009, -307, 0);
        return 1;
    }
}

sub EVENT_ITEM {
    my $aatotal = $client->GetSpentAA();

    if(plugin::check_handin(\%itemcount, 119592 => 3)) {
        quest::say("Thank you $class , here is your Tier 2 chest piece."); #random tier 2 chest piece handin.
        my @items = (119584,119591,119599,119606); #All BP's
        my $total = $items[ rand @items ]; #Randomize
        quest::summonitem($total);
        return 1;
    }
    elsif(($platinum == 1000) && ($ulevel >= 65) && !defined($qglobals{$name."chambersf9"}) && ($aatotal >= 75)) {
        quest::say("Thank you $class , you are on the way to your Tier 2 Challenge, good luck!"); #Money handin for instance creation and porting to it.
        my $instanceID = quest::CreateInstance("chambersf", 9, 12800);
        quest::AssignToInstance($instanceID);
        quest::setglobal($name."chambersf9", $instanceID, 7, M213);
        quest::MovePCInstance(309, $instanceID, 0.00, -37.00, -1.7, 0);
        return 1;
    }
    elsif(($platinum == 1000) && $ulevel >= 65 && !defined($qglobals{$name."chambersf9"}) && $aatotal <= 74) {
        quest::say("You lack the AA requirement to enter Tier 2 $name."); #Instance exists Money back.
        quest::givecash(0,0,0,1000);
        return 1;
    }
    elsif(($platinum == 1000) && $ulevel >= 65 && defined($qglobals{$name."chambersf9"}) && $aatotal >= 75) {
        quest::say("You already have a Tier 2 instance that hasn't expired yet, here is your money back $name."); #Instance exists Money back.
        quest::givecash(0,0,0,1000);
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
        return 1;
    }
}
