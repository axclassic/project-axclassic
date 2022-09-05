# Avatar_of_the_Elements.pl npcid - 223073

sub EVENT_DEATH {
    quest::signalwith(223154, 11090, 4000);
    quest::emote(" teeters, then comes crashing down. The force of impact is tremendous, shaking what you imagine to be the entire plane.");
}

