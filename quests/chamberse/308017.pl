# a_diminutive_construct (308017)

sub EVENT_SPAWN {
    my $strong = -450;
    my $weak = 20;
    $npc->ModSkillDmgTaken(0,  $weak);   #1h blunt
    $npc->ModSkillDmgTaken(1,  $strong); #1h slashing
    $npc->ModSkillDmgTaken(2,  $weak);   #2h blunt
    $npc->ModSkillDmgTaken(3,  $strong); #2h slashing
    $npc->ModSkillDmgTaken(7,  $strong); #archery
    $npc->ModSkillDmgTaken(8,  $strong); #backstab
    $npc->ModSkillDmgTaken(10, $weak);   #bash
    $npc->ModSkillDmgTaken(21, $weak);   #dragon punch
    $npc->ModSkillDmgTaken(23, $weak);   #eagle strike
    $npc->ModSkillDmgTaken(26, $weak);   #flying kick
    $npc->ModSkillDmgTaken(28, $weak);   #hand to hand
    $npc->ModSkillDmgTaken(30, $weak);   #kick
    $npc->ModSkillDmgTaken(36, $strong); #piercing
    $npc->ModSkillDmgTaken(37, $strong); #riposte
    $npc->ModSkillDmgTaken(38, $weak);   #round kick
    $npc->ModSkillDmgTaken(51, $strong); #throwing
    $npc->ModSkillDmgTaken(52, $strong); #tiger claw
    quest::settimer("attack", 1);
}

sub EVENT_TIMER {
    if($timer eq "attack") {
        my $Power = $entity_list->GetMobByNpcTypeID(308013);
        if($Power) {
            my $HateTarget = $Power->GetHateRandom();
            if($HateTarget) {
                $npc->AddToHateList($HateTarget, 1);
            }
        }
    }
}

