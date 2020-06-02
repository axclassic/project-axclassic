# Qvic Raid Event: Cynosure Kvanjji

sub SyncCast {
    $SpellToCast = quest::ChooseRandom(4567, 4723, 4749, 4748, 4734, 4121, 4722);
    quest::signalwith(295154, $SpellToCast);
    quest::signalwith(295153, $SpellToCast);
    quest::signalwith(295152, $SpellToCast);
    quest::signalwith(295151, $SpellToCast);
    quest::signalwith(295150, $SpellToCast);
    quest::signalwith(295149, $SpellToCast);
    quest::signalwith(295148, $SpellToCast);
    quest::signalwith(295147, $SpellToCast);
    $SpellTarget = $npc->GetHateMost();
    if($SpellTarget) {
        $npc->SendBeginCast($SpellToCast, 0);
        quest::castspell($SpellToCast, $SpellTarget->GetID());
    }
}

sub HealMe {
    quest::stoptimer("HealMe");
    $npc->SetHP($npc->GetHP() + ($npc->GetMaxHP() / 20));
    quest::signalwith(295150, 0);
    quest::signalwith(295149, 0);
    quest::signalwith(295148, 0);
    quest::signalwith(295147, 0);
}

sub EVENT_AGGRO {
    SyncCast();
    quest::settimer("CastSpell", 35);
}

sub EVENT_TIMER {
    if($timer eq "CastSpell") {
        SyncCast();
    }
    if($timer eq "HealMe") {
        HealMe();
    }
}

sub EVENT_DEATH {
    quest::stoptimer("CastSpell");
    quest::emote("'s corpse grins as a small seam opens before you, and it casts a dark ripple of energy through.");
    quest::signalwith(295154, 1);
    quest::signalwith(295153, 1);
    quest::signalwith(295152, 1);
    quest::signalwith(295151, 1);
    quest::signalwith(295150, 1);
    quest::signalwith(295149, 1);
    quest::signalwith(295148, 1);
    quest::signalwith(295147, 1);
}

sub EVENT_SIGNAL {
    # $signal 0 is for healing
    if($signal == 0) {
        quest::settimer("HealMe", 2);
    }

    # There will always be one healer up, otherwise spawn non-healer
    if($signal == 1) {
        $check_second = $entity_list->GetMobByNpcTypeID(295148);
        $check_third = $entity_list->GetMobByNpcTypeID(295149);
        $check_fourth = $entity_list->GetMobByNpcTypeID(295150);
        if(!$check_second && !$check_third && !$check_fourth) {
            quest::spawn2(295147,0,0,-216,-191,-467,192);
        }
        else {
            quest::spawn2(295151,0,0,-216,-191,-467,192);
        }
    }
    if($signal == 2) {
        $check_first = $entity_list->GetMobByNpcTypeID(295147);
        $check_third = $entity_list->GetMobByNpcTypeID(295149);
        $check_fourth = $entity_list->GetMobByNpcTypeID(295150);
        if(!$check_first && !$check_third && !$check_fourth) {
            quest::spawn2(295148,0,0,-316,-181,-464,64);
        }
        else {
            quest::spawn2(295152,0,0,-316,-181,-464,64);
        }
    }
    if($signal == 3) {
        $check_first = $entity_list->GetMobByNpcTypeID(295147);
        $check_second = $entity_list->GetMobByNpcTypeID(295148);
        $check_fourth = $entity_list->GetMobByNpcTypeID(295150);
        if(!$check_first && !$check_second && !$check_fourth) {
            quest::spawn2(295149,0,0,-243,-250,-439,248);
        }
        else {
            quest::spawn2(295153,0,0,-243,-250,-439,248);
        }
    }
    if($signal == 4) {
        $check_first = $entity_list->GetMobByNpcTypeID(295147);
        $check_second = $entity_list->GetMobByNpcTypeID(295148);
        $check_third = $entity_list->GetMobByNpcTypeID(295149);
        if(!$check_first && !$check_second && !$check_third) {
            quest::spawn2(295150,0,0,-249.1,-126.7,-490.8,128.5);
        }
        else {
            quest::spawn2(295154,0,0,-249.1,-126.7,-490.8,128.5);
        }
    }
}

# NPC ##Cynosure_Kvanjji (295146)
