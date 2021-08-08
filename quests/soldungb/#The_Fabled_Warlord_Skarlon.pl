# Fabled depop

# This is for bots and pets and players that do physical attack damage
sub EVENT_ATTACK {
    # Dragon attacker
    $DragonsTarget = $entity_list->GetMobID($userid);

    # Check if the attacker is a Pet and get the owner if true
    $DragonsTargetPetOwner = $entity_list->GetMobID($DragonsTarget->GetOwnerID());
    if($DragonsTargetPetOwner) {
        $DragonsTarget = $DragonsTargetPetOwner;
    }

    if($DragonsTarget && ($DragonsTarget->GetLevel() < 52)) {
        quest::shout("We shall meet again $name! When you are a worthy opponent!!");
        quest::depop();
    }
}

sub EVENT_AGGRO {
   if($ulevel < 52) {
      quest::shout("We shall meet again $name! When you are a worthy opponent!!");
      quest::depop();
   }
}

# EOF zone: soldungb ID: 32082 NPC: #The_Fabled_Warlord_Skarlon

