# #Emperor_Ssraeshza_ (162227)

sub EVENT_SPAWN {
    quest::settimer("EmpDepop1", 60);
}

sub EVENT_TIMER {
    if($timer eq "EmpDepop1") {
        #Golem dead but killed by snakes before Emp became targetable.
        quest::stoptimer("EmpDepop1");
        quest::signalwith(162582, 4); #EmpCycle
        quest::depop();
    }
    if($timer eq "EmpDepop2") {
        #Failed to kill Emp before 40 minute timer 
        quest::stoptimer("EmpDepop2");
        quest::signalwith(162582, 3); #EmpCycle
        quest::depop();
    }
}

sub EVENT_COMBAT {
    if($npc->IsEngaged()) {
        quest::stoptimer("EmpDepop1");
        quest::settimer("EmpDepop2", 2400);
    }
}
  
sub EVENT_DEATH {
    quest::stoptimer("EmpDepop1");
    quest::stoptimer("EmpDepop2");
    quest::emote("'s corpse says 'How...did...ugh...'");
    quest::spawn2(162210,0,0,877, -326, 408, 190); # NPC: A_shissar_wraith
    quest::spawn2(162210,0,0,953, -293, 404, 190); # NPC: A_shissar_wraith
    quest::spawn2(162210,0,0,953, -356, 404, 190); # NPC: A_shissar_wraith
    quest::spawn2(162210,0,0,773, -360, 403, 64); # NPC: A_shissar_wraith
    quest::spawn2(162210,0,0,770, -289, 403, 64); # NPC: A_shissar_wraith
    quest::signalwith(162582, 2); #EmpCycle
}

sub EVENT_SLAY {
    quest::say("Your god has found you lacking.");
}
# EOF zone: ssartemple ID: 162227 NPC: #Emperor_Ssraeshza_

