#Temple of Droga (droga) >> Digmaster_Duggert (81336)
#Free the Drogan Slaves

sub EVENT_SPAWN {
    $named_up = 3;
}

sub EVENT_TIMER {
    if($timer eq "Drogan_Slaves_Round_1") {
        $check_a_goblin_blood_soldier = $entity_list->GetMobByNpcTypeID(81331);
        $check_a_goblin_spirit_master = $entity_list->GetMobByNpcTypeID(81332);
        if($check_a_goblin_blood_soldier || $check_a_goblin_spirit_master) {
            $named_up = 2;
        }
        else {
            $named_up = 1;
        }
        if($named_up == 1) {
            quest::stoptimer("Drogan_Slaves_Round_1");
            $named_up = 3;
            # a_goblin_blood_soldier (81331)
            quest::spawn2(81331,0,0,1232.9,-228.9,-252.2,67.8);
            quest::spawn2(81331,0,0,1236.4,-188.6,-252.2,67.9);
            # a_goblin_spirit_master (81332)
            quest::spawn2(81332,0,0,1206.3,-210.5,-252.2,64.4);
            quest::spawn2(81332,0,0,1206.3,-175.5,-252.2,64.4);
            quest::settimer("Drogan_Slaves_Round_2", 10);
        }
    }
    if($timer eq "Drogan_Slaves_Round_2") {
        $check_a_goblin_blood_soldier = $entity_list->GetMobByNpcTypeID(81331);
        $check_a_goblin_spirit_master = $entity_list->GetMobByNpcTypeID(81332);
        if($check_a_goblin_blood_soldier || $check_a_goblin_spirit_master) {
            $named_up = 2;
        }
        else {
            $named_up = 1;
        }
        if($named_up == 1) {
            quest::stoptimer("Drogan_Slaves_Round_2");
            $named_up = 3;
            # a_goblin_blood_soldier (81331)
            quest::spawn2(81331,0,0,1232.9,-228.9,-252.2,67.8);
            quest::spawn2(81331,0,0,1236.4,-188.6,-252.2,67.9);
            # a_goblin_spirit_master (81332)
            quest::spawn2(81332,0,0,1206.3,-210.5,-252.2,64.4);
            quest::spawn2(81332,0,0,1206.3,-175.5,-252.2,64.4);
            # Assistant_Jailor_Dravian (81337)
            quest::spawn2(81337,0,0,1206.3,-210.5,-252.2,64.4);
            quest::settimer("Drogan_Slaves_Round_3", 10);
        }
    }
    if($timer eq "Drogan_Slaves_Round_3") {
        $check_a_goblin_blood_soldier = $entity_list->GetMobByNpcTypeID(81331);
        $check_a_goblin_spirit_master = $entity_list->GetMobByNpcTypeID(81332);
        $check_Assistant_Jailor_Dravian = $entity_list->GetMobByNpcTypeID(81337);
        if($check_a_goblin_blood_soldier || $check_a_goblin_spirit_master || $check_Assistant_Jailor_Dravian) {
            $named_up = 2;
        }
        else {
            $named_up = 1;
        }
        if($named_up == 1) {
            quest::stoptimer("Drogan_Slaves_Round_3");
            $named_up = 3;
            # a_goblin_blood_soldier (81331)
            quest::spawn2(81331,0,0,1232.9,-228.9,-252.2,67.8);
            quest::spawn2(81331,0,0,1236.4,-188.6,-252.2,67.9);
            quest::spawn2(81331,0,0,1236.4,-168.6,-252.2,67.9);
            # a_goblin_spirit_master (81332)
            quest::spawn2(81332,0,0,1206.3,-210.5,-252.2,64.4);
            quest::spawn2(81332,0,0,1206.3,-175.5,-252.2,64.4);
            quest::settimer("Drogan_Slaves_Round_4", 10);
        }
    }
    if($timer eq "Drogan_Slaves_Round_4") {
        $check_a_goblin_blood_soldier = $entity_list->GetMobByNpcTypeID(81331);
        $check_a_goblin_spirit_master = $entity_list->GetMobByNpcTypeID(81332);
        if($check_a_goblin_blood_soldier || $check_a_goblin_spirit_master) {
            $named_up = 2;
        }
        else {
            $named_up = 1;
        }
        if($named_up == 1) {
            quest::stoptimer("Drogan_Slaves_Round_4");
            $named_up = 3;
            # a_goblin_blood_soldier (81331)
            quest::spawn2(81331,0,0,1232.9,-228.9,-252.2,67.8);
            quest::spawn2(81331,0,0,1236.4,-188.6,-252.2,67.9);
            quest::spawn2(81331,0,0,1236.4,-168.6,-252.2,67.9);
            # a_goblin_spirit_master (81332)
            quest::spawn2(81332,0,0,1206.3,-210.5,-252.2,64.4);
            quest::spawn2(81332,0,0,1206.3,-175.5,-252.2,64.4);
            quest::spawn2(81332,0,0,1206.3,-195.5,-252.2,64.4);
            quest::settimer("Drogan_Slaves_Round_5", 10);
        }
    }
    if($timer eq "Drogan_Slaves_Round_5") {
        $check_a_goblin_blood_soldier = $entity_list->GetMobByNpcTypeID(81331);
        $check_a_goblin_spirit_master = $entity_list->GetMobByNpcTypeID(81332);
        if($check_a_goblin_blood_soldier || $check_a_goblin_spirit_master) {
            $named_up = 2;
        }
        else {
            $named_up = 1;
        }
        if($named_up == 1) {
            quest::stoptimer("Drogan_Slaves_Round_5");
            $named_up = 3;
            # a_goblin_blood_soldier (81331)
            quest::spawn2(81331,0,0,1232.9,-228.9,-252.2,67.8);
            quest::spawn2(81331,0,0,1236.4,-188.6,-252.2,67.9);
            quest::spawn2(81331,0,0,1236.4,-168.6,-252.2,67.9);
            # a_goblin_spirit_master (81332)
            quest::spawn2(81332,0,0,1206.3,-210.5,-252.2,64.4);
            quest::spawn2(81332,0,0,1206.3,-175.5,-252.2,64.4);
            quest::spawn2(81332,0,0,1206.3,-195.5,-252.2,64.4);
            # Jailor_Frixok (81338)
            quest::spawn2(81338,0,0,1206.3,-210.5,-252.2,64.4);
            quest::settimer("Drogan_Slaves_Round_6", 10);
        }
    }
    if($timer eq "Drogan_Slaves_Round_6") {
        $check_a_goblin_blood_soldier = $entity_list->GetMobByNpcTypeID(81331);
        $check_a_goblin_spirit_master = $entity_list->GetMobByNpcTypeID(81332);
        $check_Jailor_Frixok = $entity_list->GetMobByNpcTypeID(81338);
        if($check_a_goblin_blood_soldier || $check_a_goblin_spirit_master || $check_Jailor_Frixok) {
            $named_up = 2;
        }
        else {
            $named_up = 1;
        }
        if($named_up == 1) {
            quest::stoptimer("Drogan_Slaves_Round_6");
            $named_up = 3;
            quest::setglobal("DroganSlave", 5, 7, "F");
            quest::ze("Jailor Frixok has Fallen to ground, a Prisoner has escaped the Torment of Droga Goblins!");
            quest::shout("Free at last!");
            quest::depop();
        }
    }
}

sub EVENT_SAY {
    if($text=~/Hail/i) {
        quest::say("Hail friend! Well at least I hope so. I was captured and imprisoned by the goblins while wandering the Frontier Mountains. I need to get back home. Will you help me get back home?");
    }
    if($text=~/get back home/i) {
        quest::say("For me to get home to Firiona Vie I will need to get these items to be freed from the goblin's clutches. I will need the master shackle key to free myself from these bonds. Also I will need some goblin rations and a drogan restorative so I have the strength to make the journey. Bring these back and I should be able to escape. Be warned though the goblins are sure to try to prevent my escape.");
    }
}

sub EVENT_ITEM {
    if(plugin::check_handin(\%itemcount, 62070 => 1, 62071 => 1, 62069 => 1)) {
        quest::emote(" cowers in fear at the sight of approching jail guards.");
        # a_goblin_blood_soldier (81331)
        quest::spawn2(81331,0,0,1232.9,-228.9,-252.2,67.8);
        quest::spawn2(81331,0,0,1236.4,-188.6,-252.2,67.9);
        # a_goblin_spirit_master (81332)
        quest::spawn2(81332,0,0,1206.3,-210.5,-252.2,64.4);
        quest::settimer("Drogan_Slaves_Round_1", 10);
    }
    else {
        quest::say("I don't need this.");
        plugin::return_items(\%itemcount);
    }
}

