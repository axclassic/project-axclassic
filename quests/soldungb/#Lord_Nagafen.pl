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
            $BotsClient->MovePC(27, 535.3, 955.9, 57.4, 228.8);
        }
        elsif($DragonsTarget->IsClient()) {
            quest::movepc(27, 535.3, 955.9, 57.4, 228.8);
        }
    }
}

# A solo player of level 53+ will not get banished if they just stand there
# and don't attack, so we need to have EVENT_AGGRO for that condition
sub EVENT_AGGRO {
    quest::shout("I will not fight you, but I will banish you!");
    quest::movepc(27, 535.3, 955.9, 57.4, 228.8);
}

# EOF zone: soldungb ID: 32040 NPC: #Lord_Nagafen

