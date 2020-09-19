# #Ssraeshzian_Blood_Golem (162064)

sub EVENT_COMBAT {
    if($npc->IsEngaged()) {
        quest::spawn2(162280, 0, 0, 625, -356,  403,  0); #--Ssraezsha (162280)
        quest::spawn2(162280, 0, 0, 689, -356,  403,  0); #--Ssraezsha (162280)
        quest::spawn2(162280, 0, 0, 689, -293,  403,  0); #--Ssraezsha (162280)
        quest::spawn2(162280, 0, 0, 625, -293,  403,  0); #--Ssraezsha (162280)
    }
    else {
        quest::depopall(162280);
        quest::signalwith(162582, 3); # Emp_Event_Controller
        quest::depop();
    }
}

sub EVENT_DEATH {
    quest::signalwith(162582, 1); # Emp_Event_Controller
}
#EOF zone: ssratemple ID: 162064 NPC: #Ssraeshzian_Blood_Golem

