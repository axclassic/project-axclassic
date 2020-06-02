# Construct_of_Pain (308014)

sub EVENT_SPAWN {
    my $strong = -550;
    my $weak = 50;
    $npc->ModSkillDmgTaken(0,  $strong); #1h blunt
    $npc->ModSkillDmgTaken(1,  $strong); #1h slashing
    $npc->ModSkillDmgTaken(2,  $strong); #2h blunt
    $npc->ModSkillDmgTaken(3,  $strong); #2h slashing
    $npc->ModSkillDmgTaken(7,  $weak);   #archery
    $npc->ModSkillDmgTaken(8,  $weak);   #backstab
    $npc->ModSkillDmgTaken(10, $strong); #bash
    $npc->ModSkillDmgTaken(21, $strong); #dragon punch
    $npc->ModSkillDmgTaken(23, $strong); #eagle strike
    $npc->ModSkillDmgTaken(26, $strong); #flying kick
    $npc->ModSkillDmgTaken(28, $strong); #hand to hand
    $npc->ModSkillDmgTaken(30, $strong); #kick
    $npc->ModSkillDmgTaken(36, $weak);   #piercing
    $npc->ModSkillDmgTaken(37, $strong); #riposte
    $npc->ModSkillDmgTaken(38, $strong); #round kick
    $npc->ModSkillDmgTaken(51, $strong); #throwing
    $npc->ModSkillDmgTaken(52, $strong); #tiger claw
}

sub EVENT_DEATH {
    #-- Spawn Shell of the Master
    quest::spawn2(308018, 0, 0, $x, $y, $z, $h);
    quest::signalwith(308009, 308014);
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

