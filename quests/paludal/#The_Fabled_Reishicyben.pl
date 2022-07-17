# Fabled depop

# This is for bots and pets and players that do physical attack damage
sub EVENT_ATTACK {
    # Reishicyben attacker
    $ReishicybenTarget = $entity_list->GetMobID($userid);

    # Check if the attacker is a Pet and get the owner if true
    $ReishicybenTargetPetOwner = $entity_list->GetMobID($Reishicyben->GetOwnerID());
    if($ReishicybenTargetPetOwner) {
        $ReishicybenTarget = $ReishicybenTargetPetOwner;
    }

    if($ReishicybenTarget && ($ReishicybenTarget->GetLevel() < 28)) {
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

# EOF zone: soldungb ID: 32081 NPC: #The_Fabled_Reishicyben (156119)

