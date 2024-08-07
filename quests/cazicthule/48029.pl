# RoF Event a_Tae_Ew_Justicar (48029)

my $tragedy_at_cazic_thule_spell_id = 2127;
my $unstable_rift_id = 48126;

sub EVENT_SPAWN {
    quest::settimer("version", 20);
}

sub EVENT_SIGNAL {
    # signal 1 = emote and blow up lizards
    if($signal == 1) {
        quest::settimer(1, 15);
        quest::emote(" looks paniced as planar forces shoot through it's body.");
        $npc->CastSpell($tragedy_at_cazic_thule_spell_id, 48029);
    }
}

sub EVENT_TIMER {
    # timer 1 = waiting for Justicars to finish casting
    if($timer == 1) {
        quest::stoptimer(1);
        quest::depopall(48029);
    }
    if($timer eq "version") {
        if(defined $cazpop) {
            if($cazpop eq 1) {
                quest::stoptimer("version");
                quest::depop();
            }
        }
    }
}

sub EVENT_DEATH {
    quest::stoptimer(1);
    quest::stoptimer("version");
}

