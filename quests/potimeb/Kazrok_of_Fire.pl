
sub EVENT_AGGRO {
	quest::emote(" roars, 'Mortals, here? I will torch you alive for this atrocity!'");
}

sub EVENT_DEATH {
	quest::signalwith(223190, 14020, 4000);
	quest::say("You can extinguish the flame of my existence, but you are nothing compared to the might of Fennin Ro!");
}

