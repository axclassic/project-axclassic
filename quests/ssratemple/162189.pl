# #Blood_of_Ssraeshza (162189)

sub EVENT_COMBAT {
    if($npc->IsEngaged()) {
        quest::spawn2(162280, 0, 0, 625, -356,  403,  0); #--Ssraezsha (162280)
        quest::spawn2(162280, 0, 0, 689, -356,  403,  0); #--Ssraezsha (162280)
        quest::spawn2(162280, 0, 0, 689, -293,  403,  0); #--Ssraezsha (162280)
        quest::spawn2(162280, 0, 0, 625, -293,  403,  0); #--Ssraezsha (162280)
    }
}

sub EVENT_DEATH {
    quest::signal(162582, 1); # Emp_Event_Controller
}
#EOF zone: ssratemple ID: 162189 NPC: #Blood_of_Ssraeshza

