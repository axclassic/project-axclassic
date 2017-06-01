##Lord_Drizku 211190##
sub EVENT_SAY {
my $Gods = quest::saylink("Gods", 1);
my $magical = quest::saylink("magical", 1);
my $energy = quest::saylink("energy", 1);
my $offer = quest::saylink("offer", 1);
my $free = quest::saylink("free", 1);
my $pact = quest::saylink("pact", 1);
    if(($text=~/hail/i) && (!defined $qglobals{"Djinnone"})) {
	quest::emote(' Peers at you with piercing eyes that feel as if they are reading your very thoughts.');
	quest::say("Welcome $name, I am Drizku Master of the Djinn of this realm. My race were the original founders of this realm and up until the coming of the $Gods, we held sway over all the beings that reside within our walls.");
    quest::setglobal("Djinnone", 1, 5, "F");
	}
	elsif (($text=~/Hail/i) && defined $qglobals{"Djinntwo"} || defined $qglobals{"Djinnthree"} || defined $qglobals{"Djinnfour"} || defined $qglobals{"Djinnfive"} || defined $qglobals{"Djinnsix"} || defined $qglobals{"Djinnseven"} || defined $qglobals{"Djinneight"} || defined $qglobals{"Djinnine"} || defined $qglobals{"Djinnten"}) {
	quest::say("You have already accepted the Pact of the Djinn.");
	}
	elsif(($text=~/Gods/i) && $qglobals{"Djinnone"} == 1) {
	quest::say("It was not that long ago, I believe about 2 years in your mortal time, when they first came into our halls. First they came seeking advise and guidance on the $magical properties of this realm. They claimed it for themselves and banished many of my kind.");
	}
	elsif(($text=~/magical/i) && $qglobals{"Djinnone"} == 1) {
	quest::say("Yes $name, this realm was built by the Djinn and imbued with much of our strength and energy. The very walls glow with ancient runes and symbols of power that keep the stones from never agging and the trees and grass never die. It was this $energy that the gods wished to harvest for themselves and with all the might and wisdom of the Djinn, we stood no chance against them.");
	}
	elsif(($text=~/energy/i) && $qglobals{"Djinnone"} == 1) {
	quest::say("while the Gods may have taken this realm from us, the few that made it out of the attacks alive have joined forces with Queen Adrianne to help reclaim our lands. In our pact with the queen, we vowed to $offer her counsil and insight into the plans of the Chaos.");
	quest::say("As you know by now the Chaos is growing in power and strength and our visions show us of your home of Norrath being breached and attacked in the near future.");
	}
	elsif(($text=~/offer/i) && $qglobals{"Djinnone"} == 1) {
	quest::say("Of course, that is not all we offered to the Queen, while we are great seers and alchemists, our power does not end there. However the Djinn do not give away thier power and wisdom for $free.");
	}
	elsif(($text=~/free/i) && $qglobals{"Djinnone"} == 1) {
	quest::say("As we have made a deal with Queen Adrianne, we shall now make a deal with you. since you are willing to rid us of the creatures and minions of Chaos you will be allowed to trade with our merchants for the few items that may help you in this endevor.");
	quest::say("Do you accept this $pact?");
	}
	elsif(($text=~/pact/i) && $qglobals{"Djinnone"} == 1) {
	quest::say("Very well, you are now bound to your word to uphold our pact. Go forth and rid our temple of the minions of Chaos.");
	quest::ze(15, "You have accepted the Pact of the Djinn.");
	quest::delglobal("Djinnone");
	quest::setglobal("Djinntwo", 1, 5, "F");
	}
	else {
	#Do Nothing;
	}
	}
	 