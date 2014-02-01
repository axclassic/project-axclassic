sub EVENT_SAY {
	if ($text =~ /hail/i) {
		quest::say("Hello, $name.  What can I do for you?");
	}
}

sub EVENT_ITEM {
	#Handin: 1x Warning to Glidara (20635)
	if (plugin::check_handin(\%itemcount, 20635 => 1)) {
		quest::say("So the Ghoul Boss knows of our inquiries? I fear that villain not! In fact, we must find out how much information he has received. Invade the undead ruins nearby and retrieve his log. Take this Ring it will protect from his spells. Return my ring with his log book and we will hopefully crack the mystery of Kithicor.");
		quest::summonitem('20640'); #Summon: Glidara's Ring (20640)
	}
	#Handin: 1x Ghoul Boss's Log Book (20637), 1x Glidara's Ring (20640)
	elsif (plugin::check_handin(\%itemcount, 20640 => 1, 20637 => 1)) {
		quest::say("Daring work, $name. I have imprinted my seal on this log so that only Morin may open it. Deliver the log to Morin.");
		quest::summonitem('20638'); #Summon: Sealed Ghoul Boss' Log Book (20638)
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
