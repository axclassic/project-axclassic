# Construct_of_Power (308013)

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
    # a_diminutive_construct
    quest::spawn2(308017, 0, 0, -315, 317, 59, 80);
    quest::spawn2(308017, 0, 0, -164, 379, 59, 150);
    quest::spawn2(308017, 0, 0, -249, 165, 59, 20);
    quest::spawn2(308017, 0, 0, -159, 165, 59, 0);
    quest::spawn2(308017, 0, 0, -314, 228, 59, 50);
}

sub EVENT_DEATH {
    #-- Spawn Shell of the Master
    quest::spawn2(308018, 0, 0, $x, $y, $z, $h);
    quest::depopall(308017);
    quest::signalwith(308009, 308013);
}

sub EVENT_COMBAT {
    if(!$npc->IsEngaged()) {
        quest::settimer("leftcombat", 120);
    }
}

sub EVENT_TIMER {
    if($timer eq "leftcombat") {
        quest::stoptimer("leftcombat");
        quest::repopzone();
    }
}

