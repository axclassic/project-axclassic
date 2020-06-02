# Voracious_Feran (304005)

my $pup1 = 0;
my $pup1_spawned = 2;
my $pup1_id = 0;
my $pup2 = 0;
my $pup2_spawned = 2;
my $pup2_id = 0;
my $pup3 = 0;
my $pup3_spawned = 2;
my $pup3_id = 0;
my $pup4 = 0;
my $pup4_spawned = 2;
my $pup4_id = 0;
my $pup5 = 0;
my $pup5_spawned = 2;
my $pup5_id = 0;
my $pup6 = 0;
my $pup6_spawned = 2;
my $pup6_id = 0;

sub EVENT_SPAWN {
    quest::settimer("1pup", 2);
}

sub pup_death {
    if($npc->GetHPRatio() > 18) {
        $npc->SetHP($npc->GetHP() - 57000);
    }
}

sub EVENT_TIMER {
    if($timer eq "1pup") {
        if($pup1_spawned == 1) {
            $pup1 = $entity_list->GetMobByNpcTypeID($pup1_id);
            if(!$pup1) {
                $pup1 = 0;
                $pup1_spawned = 2;
                $pup1_id = 0;
                pup_death();
            }
        }
        if($pup2_spawned == 1) {
            $pup2 = $entity_list->GetMobByNpcTypeID($pup2_id);
            if(!$pup2) {
                $pup2 = 0;
                $pup2_spawned = 2;
                $pup2_id = 0;
                pup_death();
            }
        }
        if($pup3_spawned == 1) {
            $pup3 = $entity_list->GetMobByNpcTypeID($pup3_id);
            if(!$pup3) {
                $pup3 = 0;
                $pup3_spawned = 2;
                $pup3_id = 0;
                pup_death();
            }
        }
        if($pup4_spawned == 1) {
            $pup4 = $entity_list->GetMobByNpcTypeID($pup4_id);
            if(!$pup4) {
                $pup4 = 0;
                $pup4_spawned = 2;
                $pup4_id = 0;
                pup_death();
            }
        }
        if($pup5_spawned == 1) {
            $pup5 = $entity_list->GetMobByNpcTypeID($pup5_id);
            if(!$pup5) {
                $pup5 = 0;
                $pup5_spawned = 2;
                $pup5_id = 0;
                pup_death();
            }
        }
        if($pup6_spawned == 1) {
            $pup6 = $entity_list->GetMobByNpcTypeID($pup6_id);
            if(!$pup6) {
                $pup6 = 0;
                $pup6_spawned = 2;
                $pup6_id = 0;
                pup_death();
            }
        }
    }
}

sub EVENT_SIGNAL {
    if($signal == 222) {
        my $pup_choice = quest::ChooseRandom(304007, 304008, 304009);
        if($pup6_spawned == 2) {
            quest::spawn2($pup_choice, 0, 0, $x+10, $y+10, $z, 141);
        }
        if($pup1_spawned == 1) {
            if($pup2_spawned == 1) {
                if($pup3_spawned == 1) {
                    if($pup4_spawned == 1) {
                        if($pup5_spawned == 1) {
                            $pup6 = $entity_list->GetMobByNpcTypeID($pup_choice);
                            if($pup6) {
                                $pup6_spawned = 1;
                                $pup6_id = $pup_choice;
                            }
                        }
                        else {
                            $pup5 = $entity_list->GetMobByNpcTypeID($pup_choice);
                            if($pup5) {
                                $pup5_spawned = 1;
                                $pup5_id = $pup_choice;
                            }
                        }
                    }
                    else {
                        $pup4 = $entity_list->GetMobByNpcTypeID($pup_choice);
                        if($pup4) {
                            $pup4_spawned = 1;
                            $pup4_id = $pup_choice;
                        }
                    }
                }
                else {
                    $pup3 = $entity_list->GetMobByNpcTypeID($pup_choice);
                    if($pup3) {
                        $pup3_spawned = 1;
                        $pup3_id = $pup_choice;
                    }
                }
            }
            else {
                $pup2 = $entity_list->GetMobByNpcTypeID($pup_choice);
                if($pup2) {
                    $pup2_spawned = 1;
                    $pup2_id = $pup_choice;
                }
            }
        }
        else {
            $pup1 = $entity_list->GetMobByNpcTypeID($pup_choice);
            if($pup1) {
                $pup1_spawned = 1;
                $pup1_id = $pup_choice;
            }
        }
    }
}

