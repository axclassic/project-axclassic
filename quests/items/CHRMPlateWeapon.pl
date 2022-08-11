#-- CHRMPlateWeapon
#-- Array: Class,Skill,Max_Skill
#-- Classes: Warrior(1), Paladin(3), Shadow Knight(5), Bard(8)
#-- Skill_ID: 1HB(0), 1HS(1), 2HB(2), 2HS(3), Archery(7), Piercing(36), Throwing(51)

sub EVENT_SCALE_CALC {
    my $max_skills = 0;
    my $total_count = 0;

    %skill_matrix = (
        1 => [1,0,250],
        2 => [1,1,250],
        3 => [1,2,250],
        4 => [1,3,250],
        5 => [1,7,240],
        6 => [1,36,240],
        7 => [1,51,200],
        8 => [3,0,225],
        9 => [3,1,225],
        10 => [3,2,225],
        11 => [3,3,225],
        12 => [3,7,75],
        13 => [3,36,230],
        14 => [5,0,225],
        15 => [5,1,225],
        16 => [5,2,225],
        17 => [5,3,225],
        18 => [5,7,75],
        19 => [5,36,230],
        20 => [8,0,270],
        21 => [8,1,270],
        22 => [8,36,270],
        23 => [8,51,120]
    );

    for(my $i=1; $i<=23; $i++) {
        if($itemWearer->GetClass() == $skill_matrix{$i}->[1]) {
            if($itemWearer->GetSkill($skill_matrix{$i}->[2]) >= $skill_matrix{$i}->[3]) {
                $max_skills = $max_skills + 1;
            }
            $total_count = $total_count + 1;
        }
    }

    if($total_count <= 0) {
        $total_count = 0.1;
    }

    $questitem->SetScale($max_skills / $total_count);
}
