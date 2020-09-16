# Shissar_broodlings (162199)

sub EVENT_COMBAT {
    if($npc->IsEngaged()) {
        quest::castspell(2902, $userid); #-- Spell: Shissar Broodling Poison
        quest::settimer("depopper", 5);
    }
}

sub EVENT_TIMER {
    quest::depop();
}
#EOF zone: ssratemple ID: 162199 NPC: Shissar_broodlings

