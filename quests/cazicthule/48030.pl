# RoF Event Tahia_Felwah (48030)

my $unstable_rift_id = 48126;
my $greater_rejuv_spell_id = 2093;
my $rune_of_faceless_id = 8234;

# npcId = 48030
sub EVENT_SPAWN {
    quest::settimer("version", 20);
    quest::start(89);
}

sub EVENT_WAYPOINT {
    if($wp == 1) {
        quest::stop();
        quest::settimer("sit", 20);
        quest::moveto(573, 1005, -94, 0, 1);
    }
}

sub EVENT_ITEM {
    if(plugin::check_handin(\%itemcount, $rune_of_faceless_id => 1)) {
        quest::say("Wonderful! This Is precisely what I am seeking. May my magic heal your mind and body.");
        $npc->CastSpell($greater_rejuv_spell_id, 48030);
    }
}

sub EVENT_SIGNAL {
    # signal 1 = RoF Won 
    if($signal == 1) {
        quest::say("My rescuers, you have recovered the runes I need and my magic has been depleted. I shall take my leave now. May your forces stand against the corruption of the temple.");
        quest::depopall(48045);
        quest::depopall(48099);
        quest::depopall(48030);
    }
}

sub EVENT_TIMER {
    if($timer eq "sit") {
        quest::stoptimer("sit");
        quest::spawn2($unstable_rift_id, 0, 0, 587, 1090, -98, 360);
        $npc->SetAppearance(1)
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
    quest::stoptimer("sit");
    quest::stoptimer("version");
}

