sub EVENT_SAY {
	if ($text =~ /hail/i) {
		quest::say("Hello, $name.  What can I do for you?");
	} elsif ($text =~ /morin sent me/i) {
		quest::say("Morin Shadowbane, the great ranger, sent you to assist us? A strong ranger you must be if he has sent you personally. There is a great evil stalking the land, and it has spread its tendrils into Kithicor Forest. We believe the [shadowed men] are involved with this somehow.");
	} elsif ($text =~ /shadowed men/i) {
		quest::say("The shadowed men have recently begun to appear, with vile purposes unknown to us. Their leader wanders these woods with a contingent of guards. Bring us his code book, and we may learn more of their plans.");
	}
}

sub EVENT_ITEM {
	#Handin: 1x Shadowed Code Book (20636)
	if (plugin::check_handin(\%itemcount, 20636 => 1)) {
		quest::say("Excellent work, $name! According to these codes, it seems the Ghoul Boss has been alerted to our probes now that his messenger is missing. We have a scout, Glidara Myllar, that may be in danger. Give her this note as soon as you can, she is in grave danger!");
		quest::summonitem('20635'); #Summon: Warning to Glidara (20635)
	}
	#Handin: 1x Orders for Bryn (20639)
	elsif (plugin::check_handin(\%itemcount, 20639 => 1)) {
		quest::say("The vile Ghoul Boss has been defeated! My new orders state to arm you with our finest weaponry. Take this, the mighty Orc Impaler. Safe journeys, brave adventurer.");
		quest::summonitem('7330'); #Summon: Orc Impaler (7330)
	}
	#Return items
	else {
		quest::say("I have no need for this.");
		plugin::return_items(\%itemcount);
	}
}

sub EVENT_AGGRO {
	quest::say("How dare you!");
}

sub EVENT_DEATH {
	quest::say("My comrades will avenge my death.");
}
