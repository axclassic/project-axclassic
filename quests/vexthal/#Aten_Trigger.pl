#Spawns non-Destroy Aten if no boss mobs are up and global is not set.
#Spawns Destroy Aten if boss mobs are up and global is not set.

sub EVENT_SPAWN {
    quest::settimer("aten",10);
}

sub EVENT_TIMER {
    if($timer eq "aten") {
        if(!defined $qglobals{aten}) {
            my $random_result = int(rand(100));
            if(!$entity_list->GetMobByNpcTypeID(158007) && # #Kaas_Thox_Xi_Aten_Ha_Ra
               !$entity_list->GetMobByNpcTypeID(158008) && # #Thall_Va_Kelun
               !$entity_list->GetMobByNpcTypeID(158309) && # #The_Fabled_Thall_Va_Kelun
               !$entity_list->GetMobByNpcTypeID(158009) && # #Va_Xi_Aten_Ha_Ra
               (!$entity_list->GetMobByNpcTypeID(158011) || !$entity_list->GetMobByNpcTypeID(158010)) && # #Diabo_Xi_Va_Temariel or #Thall_Xundraux_Diabo
               !$entity_list->GetMobByNpcTypeID(158012) && # #Diabo_Xi_Xin_Thall
               !$entity_list->GetMobByNpcTypeID(158013) && # #Kaas_Thox_Xi_Ans_Dyek
               !$entity_list->GetMobByNpcTypeID(158307) && # #The_Fabled_Kaas_Thox_Xi_Ans_Dyek
               (!$entity_list->GetMobByNpcTypeID(158311) || !$entity_list->GetMobByNpcTypeID(158014)) && # #Diabo_Xi_Va or #Diabo_Xi_Xin
               !$entity_list->GetMobByNpcTypeID(158096) && # #Aten_Ha_Ra_
               !$entity_list->GetMobByNpcTypeID(158014)) {                
                quest::depopall(158306); # #Aten_Ha_Ra
                quest::depopall(158308); # #The_Fabled_Aten_Ha_Ra
                if($random_result < 90) {
                    # #Aten_Ha_Ra_
                    quest::spawn2(158096,0,0,1412,0,248.63,192);
                    quest::stoptimer("aten");
                }
                else {
                    # #The_Fabled_Aten_Ha_Ra_
                    quest::spawn2(158311,0,0,1412,0,248.63,192);
                    quest::stoptimer("aten");
                }
            }
            elsif(!$entity_list->GetMobByNpcTypeID(158306) && !$entity_list->GetMobByNpcTypeID(158308)) {
                if($random_result < 90) {
                    # #Aten_Ha_Ra Destroy
                    quest::spawn2(158306,0,0,1412,0,248.63,192);
                }
                else {
                    # #The_Fabled_Aten_Ha_Ra Destroy
                    quest::spawn2(158308,0,0,1412,0,248.63,192);
                }
            }
        }
    }
}

sub EVENT_SIGNAL {
    if($signal == 3) {
        quest::stoptimer("aten");
        $npc->kill(); # Forces respawn timer
    }
}
# #Aten_Trigger NPCID: 158095

