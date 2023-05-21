#############################################
## NPC: #Champion_Lightwater               ##
## Zone: Plane of Knowledge                ##
## AXClassic's risky ladder reward system  ##
## by Patrikpatrik                         ##
## UPDATE 1/1/2017 will reward shrink item ##
## upon random ticket from darkwater       ##
## 10/1/2017 22298 changed to 22294	   ##
## 7/21/2021 120216 changed to 120341      ##
## 12/15/2021 - Since oct Ladder revamp,   ##
## increased rewards and items for the     ##
## very best - patrikpatrik                ##
#############################################
sub EVENT_SPAWN {
	$x = $npc->GetX();
	$y = $npc->GetY();
	quest::set_proximity($x - 20, $x + 20, $y - 20, $y + 20);
	}
sub EVENT_ENTER {
	$npc->SetAppearance(0);
	$npc->SetAppearance(1);
	}
sub EVENT_EXIT {
	$npc->SetAppearance(3);
	$client->Message(263,"Champion Lightwater resumes her misery.");
	}
sub EVENT_SAY {
	if ($text=~/hail/i) {
	quest::doanim(24);
	$client->Message(14,"Champion Lightwater says, 'Can't you see I'm busy here? I'm coping with my losses.'");
	$client->Message(263,"Champion Lightwater looks somewhat startled and agigated at the same time.");
	}
}
sub EVENT_ITEM {
#If king card is handed in
	if (plugin::check_handin(\%itemcount, 22294 => 1)) { # changed from 22298
	$client->Message(14,"Champion Lightwater says, 'My God, you've found it! I haven't seen one of these in a long time!'");
	$client->Message(263,"Champion Lightwater waves her hand emphatically as a random item materializes out of thin air.");	
		# my $randomroll = int(rand(100));  #Random roll
		# if ($randomroll < '34') {
			quest::summonitem(17527); #satchel of legacies lost w/ items
			quest::summonitem(14727); #locket of escape
			#quest::summonitem(40605, 10); #10 potion of adventure
			quest::summonitem(17523); #book of knowledge
			#quest::summonitem(21813); #Run 2 speed horse black chain bridle
			quest::summonitem(21818); #Run 2 speed horse White chain bridle
			quest::summonitem(14009, 10); #10 potion of moderate healing
			quest::summonitem(14209, 10); #10 potion of serious healing
		#This outputs two items without duplicates to prevent lore bug!
		my @miniarray = ('21820', '21821', '21822', '21823'); #This array contains 4 platinum bags
				for (my $i = 0; $i< 2; $i++) { #This will loop twice
				my @randomnum = splice(@miniarray, int(rand(4)-$i), 1);
			quest::summonitem(@randomnum);
				}
		# This is for a random Elaborate Defiant piece 1 in 49 chance
		my @elabarray = (50179, 50180, 50181, 50182, 50183, 50184, 50185, 50186, 50187, 50188, 50189, 50190, 50191, 50192, 50193, 50194, 50195, 50196, 50197, 50198, 50199, 50200, 50201, 50202, 50203, 50204, 50205, 50206, 50207, 50208, 50209, 50210, 50211, 50212, 50602, 50603, 50604, 50605, 50606, 50607, 50608, 50609, 50610, 50611, 50612, 50613, 50614, 50615, 50616);
			my $final = $elabarray [rand @elabarray];
			quest::summonitem($final);
			$client->Message(263,"$name stumbles as the weight of the bag falls into your hands.");
			#$client->Message(14,"Champion Lightwater says, 'Farewell!'");
		#	}
		# elsif ($randomroll < '68') {
			my @epicarray = (10650, 8495, 14341, 11050, 20490, 68299, 28034, 14383, 10651, 10652, 11057, 20488, 5532, 20542, 10908, 20544);
			my $randomepic = $epicarray[rand @epicarray];
				if ($randomepic == 8495) { #If beastlord epic is chosen, must summon two items
				quest::summonitem(8495);
				quest::summonitem(8496);
				}
				else{
				quest::summonitem($randomepic);
				}
		#	$client->Message(14,"Champion Lightwater says, 'Farewell!'");
		# }
		# else {
		# quest::we(13, "Champion Lightwater shouts, 'Congratulations to $name for a risky proposition and came out victorious!'");
		#quest::summonitem(120341); # rathe server is 120216 test is 120199
		quest::summonitem(120346); # Improved Moonstone of Life for ladder revamp
		quest::summonitem(17702); #treasure hunter's satchel
		$client->Message(14,"Champion Lightwater says, 'Farewell!'");
		$client->Message(15,"*POOF* Champion Lightwater disappears into thin air.");
		# }
	quest::ding();
	#quest::depop(202389); #rathe & test is 202389 DONT DEPOP ANYMORE 1/1/17
#If random ticket is handed in
	} elsif (plugin::check_handin(\%itemcount, 51859=>1)) {
		quest::say("Not bad, but good enough.");
		quest::summonitem(19725); #wand of imperceptibility
		$item = quest::varlink(19725);
		##quest::we is bugged
		##quest::we(14, "The Rathe server congratulates $name, the uber $class for receiving a -$item-!");
	} elsif (plugin::check_handin(\%itemcount, 51860=>1)) {
		quest::say("Now be careful with this.");
		quest::summonitem(86735); #Earring of Diminutiveness
		$item = quest::varlink(86735);
	    ##quest::we(14, "The Rathe server congratulates $name, the uber $class for receiving a -$item-!");
	} elsif (plugin::check_handin(\%itemcount, 51861=>1)) {
		quest::say("Second best I say!");
		quest::summonitem(101362); #Humanoid reductionizer
		$item = quest::varlink(101362);
	    ##quest::we(14, "The Rathe server congratulates $name, the uber $class for receiving a -$item-!");
	} elsif (plugin::check_handin(\%itemcount, 66615=>1)) {
		quest::say("Best one ever!");
		quest::summonitem(62433); #shimmering Bauble of trickery
		$item = quest::varlink(62433);
	   ##quest::we(14, "The Rathe server congratulates $name, the uber $class for receiving a -$item-!");
	}
    else {
        my $stuff = (\%itemcount);
        my $yes = 2;
        foreach my $k (keys(%{$stuff})) {
            next if($k == 0);
            $yes = 1;
        }
        if($yes == 1) {
            $client->Message(14, "I don't need this $name. Take it back.");
            plugin::return_items(\%itemcount);
        }
        if($platinum != 0 || $gold !=0 || $silver != 0 || $copper != 0) {
            $client->Message(14, "Thanks for the coin!");
        }
    }
}#END sub EVENT_ITEM

#END of FILE Zone:poknowledge ID:202389 -- #Champion_Lightwater.pl
