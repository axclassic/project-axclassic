# a_kyv_sureshot (306013)

my $raiders = 0;
my $raidCount = 0;
my $random_raider = 0;
my %kyvs;
my $kyv_target = 0;
my $kyv_num = 0;
my $kyv_x = 0;
my $kyv_y = 0;
my $kyv_timer = 0;
my $timer_reduction = 0;

sub EVENT_SPAWN {
    setup();
    $timer_reduction = 1;
    $kyv_timer = (9 + int(rand(5)));
    quest::settimer("kyv", $kyv_timer - $timer_reduction);
}

sub setup {
    %kyvs = (
        1 => ["From the corner of your eye, you notice a Kyv taking aim at your position. You should move.", kyv_move, 5696, "You are struck by a stray arrow!"],
        2 => ["From the corner of your eye, you notice a Kyv taking aim near your position. He appears to be leading the target, anticipating your next movement. You should stand still.", kyv_stop, 5696 ,"You are struck by a stray arrow!"],
        3 => ["From the corner of your eye, you notice a Kyv taking aim at your head. You should duck.", kyv_duck, 5694 ,"Your head is struck by a deadly arrow!"]
    );
}

sub kyv_move {
    if($kyv_target) {
        my $new_x = $kyv_target->GetX();
        my $new_y = $kyv_target->GetY();
        if(($new_x == $kyv_x) && ($new_y == $kyv_y)) {
            return(0);
        }
        return(1);
    }
    return(0);
}

sub kyv_duck {
    if($kyv_target) {
        my $appearance = $kyv_target->GetAppearance();
        if($appearance != 2) {
            return(0);
        }
        return(1);
    }
    return(0);
}

sub kyv_stop {
    if($kyv_target) {
        if($kyv_target->IsMoving() || $kyv_target->IsEngaged()) {
            return(0);
        }
        return(1);
    }
    return(0);
}

sub EVENT_TIMER {
    my @raid_clients = $entity_list->GetClientList();
    if($timer eq "kyv") {
        if(@raid_clients) {
            foreach(@raid_clients) {
                if($_) {
                    $raiders = $entity_list->GetBotRaidByClient($_);
                    $raidCount = $entity_list->GetBotRaidCount($_);
                }
            }
        }
        if($raiders) {
            $random_raider = $raiders->GetBotRaidMember(1 + int(rand($raidCount)));
            if($random_raider) {
                $kyv_num = (1 + int(rand(3)));
                $kyv_target = $random_raider;
                $kyv_x = $random_raider->GetX();
                $kyv_y = $random_raider->GetY();
                if($random_raider->IsClient()) {
                    $random_raider->Message(14, "$kyvs{$kyv_num}->[0]");
                }
                else {
                    my $aim_name = $random_raider->GetCleanName();
                    if($kyv_num == 1) {
                        quest::ze(14, "From the corner of your eye, you notice a Kyv taking aim at $aim_name`s position. They should move.");
                    }
                    if($kyv_num == 2) {
                        quest::ze(14, "From the corner of your eye, you notice a Kyv taking aim near $aim_name`s position. He appears to be leading the target, anticipating $aim_name`s next movement. $aim_name should stand still.");
                    }
                    if($kyv_num == 3) {
                        quest::ze(14, "From the corner of your eye, you notice a Kyv taking aim at $aim_name`s head. $aim_name should duck.");
                    }
                }
                quest::settimer("kyv_action", 3);
            }
        }
    }
    if($timer eq "kyv_action") {
        quest::stoptimer("kyv_action");
        if($kyv_target) {
            my $arrow_name = $kyv_target->GetCleanName();
            if($kyvs{$kyv_num}->[1]() == 0) {
                if($kyv_target->IsClient()) {
                    $kyv_target->Message(14, "$kyvs{$kyv_num}->[3]");
                }
                else {
                    if(($kyv_num == 1) || ($kyv_num == 2)) {
                        quest::ze(14, "$arrow_name is struck by a stray arrow!");
                    }
                    if($kyv_num == 3) {
                        quest::ze(14, "$arrow_name`s head is struck by a deadly arrow!");
                    }
                }
                $npc->SendBeginCast($kyvs{$kyv_num}->[2], 0);
                quest::castspell($kyvs{$kyv_num}->[2], $kyv_target->GetID());
            }
            else {
                if($kyv_target->IsClient()) {
                    $kyv_target->Message(14, "An arrow narrowly misses you.");
                }
                else {
                    quest::ze(14, "An arrow narrowly misses $arrow_name.");
                }
            }
        }
        $kyv_timer = (15 + int(rand(6)));
        quest::settimer("kyv", $kyv_timer - $timer_reduction);
    }
}

sub EVENT_SIGNAL {
    if($signal == 666) {
        $timer_reduction += 2;
    }
}

sub EVENT_DEATH {
    signalwith(306003, 666);
    signalwith(306004, 666);
    signalwith(306005, 666);
    signalwith(306007, 666);
    signalwith(306008, 666);
    signalwith(306009, 666);
    signalwith(306010, 666);
    signalwith(306011, 666);
    signalwith(306012, 666);
    signalwith(306013, 666);
    signalwith(306014, 666);
}

