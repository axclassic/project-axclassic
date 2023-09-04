#######################################
## NPC: Meneldor Epione              ##
## Zone: Plane of Knowledge          ##
## Quest: Server Challenge Tier 4    ##
## Created by Caved for AXClassic    ##
##   Revised          04-11-2014     ##
#######################################
sub EVENT_SAY {
	my $open = quest::saylink("open", 1);
	my $back = quest::saylink("back", 1);
	my $here = quest::saylink("here", 1);
	my $aatotal = $client->GetSpentAA();

	if($text=~/hail/i && $ulevel == 65 && $aatotal >= 250) {
		quest::say("Hello $name , I am Meneldor Epione. I am here to tell you about Tier 4 armor, it is called Rathe Armor (Tier 4) it can be found in a special instanced dungeon. You can find all the pieces there exept for the chest pieces. You wil have to bring me 3 The Rathe Server Doll (Tier 4)'s and I wil give you a random Tier 4 chestpiece, either Leather, Plate, Chain or Silk. These dolls drop in this quest dungeon to occasionaly. If you are lvl 65 and have spend 250 AA points I can $open a zone instance for you to begin your Tier 4 challenge, it will stay open for 8 hours. I charge 2000pp per zone instance. You can purchase a new instance after the old one has expired.");
		quest::say("In the event that you would die in your Tier 4 quest instance, I can port you $back for as long as the instance is active. In case your instance has already expired, your corpse will end up $here.");
		return 1;
	}
	if($text=~/hail/i && $ulevel < 65 || $aatotal < 250) {
		quest::say("Hello $name , the Tier 4 server challenge and quest I am offering is for people who are lvl 65 and have spend in all 250 AA points as a minimum.. Come back when you meet those requirements.");
		return 1;
	}
	if($text=~/open/i && $ulevel >= 65 && !defined($qglobals{$name."chamberse9"}) && $aatotal >= 250) {
		quest::say("Just hand me 2000pp and I will create the instance for your challenge and port you there.");
		return 1;
	}
	if($text=~/open/i && $ulevel >= 65 && defined($qglobals{$name."chamberse9"}) && $aatotal >= 250) {
		quest::say("You already have an existing Tier 4 zone instance. You can't purchase a newone until it has expired, but I can port you $back to it if you like.");
		return 1;
	}
	if($text=~/back/i && $ulevel >= 64 && $aatotal >= 250) {
		if(defined($qglobals{$name."chamberse9"})) {
			quest::say("Going to send you back to your Tier 4 instance now.");
			my $QGlobalValue = $qglobals{$name."chamberse9"};
			quest::MovePCInstance(308, $QGlobalValue, 0.00, -37.00, -1.7, 0);
			return 1;
		}
        else {
			quest::say("You seem to have no Tier 4 instance.");
		}
		return 1;
	}
	if($text=~/here/i && $ulevel >= 64 && $aatotal >= 250) {
		quest::say("I am sending you to the graveyard for your corpse recovery.");
		quest::movepc(316, -2105, -4361, -307, 0);
	}
}

sub EVENT_ITEM {
	my $aatotal = $client->GetSpentAA();
	if(plugin::check_handin(\%itemcount, 119651 => 3)) {
		quest::say("Thank you $class , here is your Tier 4 chest piece."); #random tier 2 chest piece handin.
		my @items = (119643,119650,119658,119665); #All BP's
		my $total = $items[ rand @items ]; #Randomize
		quest::summonitem($total);
		return 1;
	}
	elsif(($platinum == 2000) && $ulevel >= 65 && !defined($qglobals{$name."chamberse9"}) && $aatotal >= 250) {
		quest::say("Thank you $class , you are on the way to your Tier 4 Challenge, good luck!"); #Money handin forinstance creation and porting to it.
        my $instanceID = quest::CreateInstance("chamberse", 9, 28800);
		quest::AssignToInstance($instanceID);
		quest::setglobal($name."chamberse9", $instanceID, 7, "H8");
		quest::MovePCInstance(308, $instanceID, 0.00, -37.00, -1.7, 0);
		return 1;
	}
	elsif(($platinum == 2000) && $ulevel >= 65 && defined($qglobals{$name."chamberse9"}) && $aatotal >= 250) {
		quest::say("You already have a Tier 4 instance that hasn't expired yet, here is your money back $name."); #Instance exists Money back.
		quest::givecash(0,0,0,2000);
		return 1;
	}
	elsif(($platinum == 2000) && $ulevel >= 65 && !defined($qglobals{$name."chamberse9"}) && $aatotal < 250) {
		quest::say("You lack the AA requirement to enter Tier 4 $name."); #Instance exists Money back.
		quest::givecash(0,0,0,2000);
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

