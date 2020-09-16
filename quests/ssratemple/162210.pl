# A_shissar_wraith (162210)

sub EVENT_SPAWN {
    quest::settimer("depop", 1800);
}

sub EVENT_COMBAT {
    if($npc->IsEngaged()) {
        quest::stoptimer("depop");
    }
}

sub EVENT_TIMER {
    quest::depop();
}
#EOF zone: ssratemple ID: 162210 NPC: A_shissar_wraith

