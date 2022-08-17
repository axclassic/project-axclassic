# Dreamwarp.pl npcid - 223066

sub EVENT_AGGRO {
    quest::emote("senses your presence and ventures closer, the many mouths nipping at the air.");
}

sub EVENT_DEATH {
    quest::signalwith(223154,11080,4000);
    quest::emote("can support itself no longer and crashes to the ground in a writhing mass of flesh.");
}

