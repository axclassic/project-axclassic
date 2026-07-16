# A_shissar_wraith (162210)

sub EVENT_SPAWN {
    quest::settimer("depop", 1800);
}

sub EVENT_TIMER {
    if($timer eq "depop") {
        quest::depop(); 
    }
}

#EOF zone: ssratemple ID: 162210 NPC: A_shissar_wraith
