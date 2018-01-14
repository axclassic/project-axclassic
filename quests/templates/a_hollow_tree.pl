#####################################
## NPC: a_hollow_tree              ##
## Zone: All Takish-Hiz LDoN Zones ##
## By: Congdar                     ##
##                                 ##
## The Rathe Server 07-07-2017     ##
#####################################

sub EVENT_ATTACK {
    #Get the $TreeAttacker
    my $TreeAttacker = $entity_list->GetMobID($userid);

    #The $TreeAttacker could be a Pet, so we need its owner so we can get the group next.
    my $TreeAttackerPrime = $entity_list->GetMobID($TreeAttacker->GetOwnerID());
    if($TreeAttackerPrime) {
        #The Pet gets replaced with its Master
        $TreeAttacker = $TreeAttackerPrime; 

    }

    #$TreeAttacker should be a Bot or Client now, so get the group
    my $TreeAttackingGroup = $entity_list->GetGroupByMob($TreeAttacker);

    if($TreeAttackingGroup) {
        #There is a group so lets do stuff.  There is a one-third chance for any of the 3 things to happen
        my $random_result = int(rand(100));
        if($random_result > 75) {
            #The group members get full health
            for($count=0; $count<$TreeAttackingGroup->GroupCount(); $count++) {
                #Get a group member
                $TreeAttackingGroupMember = $TreeAttackingGroup->GetMember($count);

                #Set group member to full health
                $TreeAttackingGroupMember->SetHP($TreeAttackingGroupMember->GetMaxHP());

                #The Client only needs to get the message once because Bots will send the message up to the Bot Owner
                if($TreeAttackingGroupMember->IsClient()) {
                    $TreeAttackingGroupMember->Message(5, "Your Health is refreshed!");
                }
            }
        }
        elsif ($random_result > 50) {
            #The group members are attacked by up to 3 npc's
            $TreeAttacker->Message(5, "$mname explodes into wood and bark as it's hidden friends emerge to attack you!");

            # The list of npc's types we want to spawn
            my @specialmobs = ("spiritstorm", "a_Royal", "a_Flowkeeper", "a_Geomantic", "a_Jeweled", "a_Guardian");

            # The list of mobs in this zone
            my @moblist = $entity_list->GetMobList();

            # The list that will hold the id's of the npc's to spawn
            my @spawnlist = ();

            # Check @specialmobs entries against @moblist entries
            foreach $specialName (@specialmobs) {
               foreach $tempmob (@moblist) {
                  my $tempName = $tempmob->GetName();
                  if($tempName =~ /$specialName/) {
                     # if $specialName partially matches $tempName add its ID to @spawnlist
                     push(@spawnlist, $tempmob->GetNPCTypeID());

                     # We have one of type $specialName so lets break out of the inner foreach loop
                     # to the next $specialName (in perl use last; for break;)
                     last;
                  }
               }
               # 3 is a good number of surprise attackers so break out of the outer foreach loop
               last if((scalar @spawnlist) > 2);
            }

            # Spawn the npc's in the list
            foreach $id (@spawnlist) {
                my $entid1 = quest::spawn2($id, 0, 0, $npc->GetX(), $npc->GetY(), $npc->GetZ(), $npc->GetHeading());
                my $mob1 = $entity_list->GetMobID($entid1);
                my $mobnpc1 = $mob1->CastToNPC();
                $mobnpc1->AddToHateList($TreeAttacker, 1);
            }
        }
        elsif ($random_result > 25) {
           # Do Nothing
        }
        else {
            #The group members get full Mana
            for($count=0; $count<$TreeAttackingGroup->GroupCount(); $count++) {
                #Get a group member
                $TreeAttackingGroupMember = $TreeAttackingGroup->GetMember($count);

                #Set group member to full Mana
                $TreeAttackingGroupMember->SetMana($TreeAttackingGroupMember->GetMaxMana());

                #The Client only needs to get the message once because Bots will send the message up to the Bot Owner
                if($TreeAttackingGroupMember->IsClient()) {
                    $TreeAttackingGroupMember->Message(5, "Your Mana is refreshed!");
                }
            }
        }
    }
    # The tree has done it's thing, so depop it.
    quest::depop();
}

