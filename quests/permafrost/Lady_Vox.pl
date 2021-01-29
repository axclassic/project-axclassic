# Attempt to limit players level 53 and over from engaging Lord Nagafen and Lady Vox.

# This is for bots and pets and players that do physical attack damage
sub EVENT_ATTACK {
    # Dragon attacker
    $DragonsTarget = $entity_list->GetMobID($userid);

    # Check if the attacker is a Pet and get the owner if true
    $DragonsTargetPetOwner = $entity_list->GetMobID($DragonsTarget->GetOwnerID());
    if($DragonsTargetPetOwner) {
        $DragonsTarget = $DragonsTargetPetOwner;
    }

    if($DragonsTarget && ($DragonsTarget->GetLevel() > 52)) {
        quest::shout("I will not fight you, but I will banish you!");
        if($DragonsTarget->IsBot()) {
            $BotsClient = $DragonsTarget->GetBotOwner();
            $BotsClient->MovePC(30, -7021.9, 2020.1, -59.8, 190.1);
        }
        elsif($DragonsTarget->IsClient()) {
            quest::movepc(30, -7021.9, 2020.1, -59.8, 190.1);
        }
    }
}

# A solo player of level 53+ will not get banished if they just stand there
# and don't attack, so we need to have EVENT_AGGRO for that condition
sub EVENT_AGGRO {
    quest::shout("I will not fight you, but I will banish you!");
    quest::movepc(30, -7021.9, 2020.1, -59.8, 190.1);
}

# EOF zone: permafrost ID: 73057 NPC: Lady_Vox

