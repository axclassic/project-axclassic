#-- CHRMPlateWeapon
#-- Array: Class,Skill,Max_Skill
#-- Classes: Warrior(1), Paladin(3), Shadowknight(5), Bard(8)
#-- Skill_ID: 1HB(0), 1HS(1), 2HB(2), 2HS(3), Archery(7), Piercing(36), Throwing(51)

sub EVENT_SCALE_CALC {
    my %skill_matrix;
    my $max_skills = 0;
    my $total_count = 0;

    %skill_matrix = (
        1 => ["Warrior",0,250],
        2 => ["Warrior",1,250],
        3 => ["Warrior",2,250],
        4 => ["Warrior",3,250],
        5 => ["Warrior",7,240],
        6 => ["Warrior",36,240],
        7 => ["Warrior",51,200],
        8 => ["Paladin",0,225],
        9 => ["Paladin",1,225],
        10 => ["Paladin",2,225],
        11 => ["Paladin",3,225],
        12 => ["Paladin",7,75],
        13 => ["Paladin",36,230],
        14 => ["Shadowknight",0,225],
        15 => ["Shadowknight",1,225],
        16 => ["Shadowknight",2,225],
        17 => ["Shadowknight",3,225],
        18 => ["Shadowknight",7,75],
        19 => ["Shadowknight",36,230],
        20 => ["Bard",0,270],
        21 => ["Bard",1,270],
        22 => ["Bard",36,270],
        23 => ["Bard",51,120]
    );

    foreach my $id (keys %skill_matrix) {
        if($skill_matrix{$id}->[0] eq $class) {
            my $pc = $entity_list->GetMobID($userid);
            if($pc) {
                my $skillcheck = $pc->GetSkill($skill_matrix{$id}->[1]);
                if($skillcheck >= $skill_matrix{$id}->[2]) {
                    $max_skills = $max_skills + 1;
                }
                $total_count = $total_count + 1;
            }
        }
    }

    if($total_count <= 0) {
        $total_count = 0.1;
    }

    $questitem->SetScale($max_skills / $total_count);
}

