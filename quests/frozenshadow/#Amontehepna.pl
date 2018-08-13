#npc - Spawns #Cara_Omica (111163) upon Amontehepna's death.
#zone - FrozenShadow
#Angelox
sub EVENT_DEATH {
    if(!$entity_list->GetMobByNpcTypeID(111163)&&!$entity_list->GetMobByNpcTypeID(111177)) { #Omica not up yet
        my $random_result = int(rand(100));
        if(($random_result <= 20) && ($ulevel >= 40)) {
            quest::spawn2(111177,0,0,199.12,984.39,186.16,135);  #Spawn Fabled Omica
        }
        else {
            quest::spawn2(111163,0,0,199.12,984.39,186.16,135); #Spawn normal Omica
        }
    }
}

