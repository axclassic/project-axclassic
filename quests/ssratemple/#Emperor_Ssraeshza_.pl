# #Emperor_Ssraeshza_ (162227)

sub EVENT_SPAWN {
    quest::settimer("EmpDepop", 1800);
}

sub EVENT_TIMER {
    quest::stoptimer("EmpDepop");
    quest::signalwith(162260,3); #EmpCycle
    quest::depop();
}

sub EVENT_COMBAT {
    if($npc->IsEngaged()) {
        quest::settimer("EmpDepop", 2400);
    }
}
  
sub EVENT_DEATH {
    quest::emote("'s corpse says 'How...did...ugh...'");
    quest::spawn2(162210,0,0,877, -326, 408, 190); # NPC: A_shissar_wraith
    quest::spawn2(162210,0,0,953, -293, 404, 190); # NPC: A_shissar_wraith
    quest::spawn2(162210,0,0,953, -356, 404, 190); # NPC: A_shissar_wraith
    quest::spawn2(162210,0,0,773, -360, 403, 64); # NPC: A_shissar_wraith
    quest::spawn2(162210,0,0,770, -289, 403, 64); # NPC: A_shissar_wraith
    quest::signalwith(162260,2); #EmpCycle
}

sub EVENT_SLAY {
    quest::say("Your god has found you lacking.");
}
# EOF zone: ssartemple ID: 162227 NPC: #Emperor_Ssraeshza_

