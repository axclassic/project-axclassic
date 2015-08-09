#############################################
## NPC: #Champion_Lightwater               ##
## Zone: Plane of Knowledge                ##
## AXClassic's risky ladder reward system  ##
## by Patrikpatrik                         ##
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
	if (plugin::check_handin(\%itemcount, 22298 => 1)) {
	$client->Message(14,"Champion Lightwater says, 'My God, you've found it! I haven't seen one of these in a long time!'");
	$client->Message(263,"Champion Lightwater waves her hand emphatically as a random item materializes out of thin air.");	
		my $randomroll = int(rand(100));
		if ($randomroll < '34') {
			quest::summonitem(17527); #satchel of legacies lost w/ items
			quest::summonitem(40605, 5); #5 potion of adventure
			quest::summonitem(17523);#book of knowledge
			quest::summonitem(21813);#Run 2 speed horse black chain bridle
			quest::summonitem(14009, 5);# 5 potion of moderate healing
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
			$client->Message(14,"Champion Lightwater says, 'Farewell!'");
			}
		elsif ($randomroll < '68') {
			my @epicarray = (10650, 8495, 14341, 11050, 20490, 68299, 28034, 14383, 10651, 10652, 11057, 20488, 5532, 20542, 10908, 20544);
			my $randomepic = $epicarray[rand @epicarray];
				if ($randomepic == 8495) { #If beastlord epic is chosen, must summon two items
				quest::summonitem(8495);
				quest::summonitem(8496);
				}
				else{
				quest::summonitem($randomepic);
				}
			$client->Message(14,"Champion Lightwater says, 'Farewell!'");
		}
		else {
		quest::we(13, "Champion Lightwater shouts, 'Congratulations to $name for a risky proposition and came out victorious!'");
		quest::summonitem(120216); # rathe server is 120216 test is 120199
		$client->Message(14,"Champion Lightwater says, 'Farewell!'");
		}
		
	quest::ding();
	quest::depop(202389); #rathe & test is 202389
	}
	else {
	$client->Message(14,"Champion Lightwater says, 'Now what would I do with this?'");
	plugin::return_items(\%itemcount); #returns item
	}
}

#END of FILE Zone:poknowledge ID:202389 -- #Champion_Lightwater.pl
