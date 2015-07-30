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
	$npc->SetAppearance(1);
	}
sub EVENT_EXIT {
	$npc->SetAppearance(0);
	$client->Message(263,"Champion Darkwater resumes her misery.");
	}
sub EVENT_SAY {
	if ($text=~/hail/i) {
	quest::doanim(24);
	$client->Message(15,"Champion Lightwater says, 'Can't you see I'm busy here? I'm coping with my losses.'");
	$client->Message(263,"Champion Lightwater looks somewhat startled and agigated at the same time.");
	}
}
sub EVENT_ITEM {
#If king card is handed in
	if (plugin::check_handin(\%itemcount, 22298 => 1)) {
	$client->Message(15,"Champion Lightwater says, 'My God, you've found it! I haven't seen one of these in a long time!'");
	$client->Message(263,"Champion Lightwater waves her hand emphatically as a random item materializes out of thin air.");	
		my $randomroll = int(rand(100));
		if ($randomroll < '34') {
		quest::summonitem(17527); #satchel of legacies lost w/ items
		quest::summonitem(40605); #5 potion of adventure
		quest::summonitem(40605);
		quest::summonitem(40605);
		quest::summonitem(40605);
		quest::summonitem(40605);
		quest::summonitem(17523);#book of knowledge
		quest::summonitem(14534);#10 dose blood of the wolf
		quest::summonitem(14009);# 5 potion of moderate healing
		quest::summonitem(14009);
		quest::summonitem(14009);
		quest::summonitem(14009);
		quest::summonitem(14009);
		quest::summonitem(21822);# big bag of platinum
		$client->Message(263,"$name stumbles as the weight of the bag falls into your hands.");
		$client->Message(15,"Champion Lightwater says, 'Farewell!'");
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
			$client->Message(15,"Champion Lightwater says, 'Farewell!'");
		}
		else {
		quest::we(13, "Champion Lightwater shouts, 'Congratulations to $name for a risky proposition and came out victorious!'");
		quest::summonitem(120216); # rathe server is 120216 test is 120199
		$client->Message(15,"Champion Lightwater says, 'Farewell!'");
		}
		
	quest::ding();
	#quest::depop(202389); #rathe & test is 202389
	}
	else {
	$client->Message(15,"Champion Lightwater says, 'Now what would I do with this?'");
	plugin::return_items(\%itemcount); #returns item
	}
}

#END of FILE Zone:poknowledge ID:202389 -- #Champion_Lightwater.pl
