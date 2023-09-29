# a_hazard (306011)

my $warnings = 0;
my $event_started = 0;
my $raiders = 0;
my $raidCount = 0;
my $random_raider = 0;
my $random_equipment = 0;
my $last_hazard = 0;
my %hazards;
my %equipment;
my $timer_reduction = 0;
my $hazard_timer = 0;
my $equipment_timer = 0;

sub EVENT_SPAWN {
    setup();
    $warnings = 0;
    $event_started = 1;
    $timer_reduction = 1;
    $hazard_timer = (25 + int(rand(11)));
    $equipment_timer = (10 + int(rand(11)));
    quest::settimer("equipment", $equipment_timer - $timer_reduction);
    quest::settimer("event", 5);
    quest::settimer("hazard", $hazard_timer - $timer_reduction);
}

sub setup {
    %hazards = (
        1 => ["The room begins to heat up dramatically. The north side looks safe.", north_safe],
        2 => ["The room begins to heat up dramatically. The south side looks safe.", south_safe],
        3 => ["The room begins to heat up dramatically. The east side looks safe.", east_safe],
        4 => ["The room begins to heat up dramatically. The center looks safe.", center_safe]
    );

    %equipment = (
        1 => ["Your rings constrict and bite into your fingers. You should remove them.", check_rings],
        2 => ["The Weapon in your right hand begins to heat up dramatically. You should remove it.", check_weapon]
    );
}

sub check_weapon {
    if($random_raider) {
        if($random_raider->IsClient()) {
            my $client_raider = $random_raider->CastToClient();
            if($client_raider) {
                quest::ze(15, "client_raider");
                my $primary = $client_raider->GetItemAt(13);
                my $secondary = $client_raider->GetItemAt(14);
                if($primary || $secondary) {
                    $client_raider->Message(14, "Your weaponry becomes incredibly hot, searing your hands!");
                    $npc->SendBeginCast(2315, 0);
                    quest::castspell(2315, $client_raider->GetID());
                }
                else {
                    $client_raider->Message(14, "Your weaponry cools down.");
                }
            }
        }
        else {
            my $primary = $random_raider->GetItemAt(13);
            my $secondary = $random_raider->GetItemAt(14);
            my $random_name1 = $random_raider->GetCleanName();
            if($primary || $secondary) {
                quest::ze(14, "$random_name1's weaponry becomes incredibly hot, searing their hands!");
                $npc->SendBeginCast(2315, 0);
                quest::castspell(2315, $random_raider->GetID());
            }
            else {
                quest::ze(14, "$random_name1's weaponry cools down.");
            }
        }
    }
}

sub check_rings {
    if($random_raider) {
        my $dbgname2 = $random_raider->GetCleanName();
        if($random_raider->IsClient()) {
            quest::ze(15, "random_raider->IsClient()");
            my $client_raider = $random_raider->CastToClient();
            if($client_raider) {
                quest::ze(15, "client_raider");
                my $left_ring = $client_raider->GetItemAt(15);
                my $right_ring = $client_raider->GetItemAt(16);
                if($left_ring || $right_ring) {
                    $client_raider->Message(14, "Your rings clamp down, breaking fingers and disabling your manual dexterity.");
                    $npc->SendBeginCast(5695, 0);
                    quest::castspell(5695, $client_raider->GetID());
                }
                else {
                    $client_raider->Message(14, "Your regain the use of your fingers.");
                }
            }
        }
        else {
            my $left_ring = $random_raider->GetItemAt(15);
            my $right_ring = $random_raider->GetItemAt(16);
            my $random_name1 = $random_raider->GetCleanName();
            if($left_ring || $right_ring) {
                quest::ze(14, "$random_name1's rings clamp down, breaking fingers and disabling thier manual dexterity.");
                $npc->SendBeginCast(5695, 0);
                quest::castspell(5695, $random_raider->GetID());
            }
            else {
                quest::ze(14, "$random_name1 regains the use of their fingers.");
            }
        }
    }
}

sub north_safe {
    quest::settimer("north", 8);
}

sub center_safe {
    quest::settimer("center", 8);
}

sub south_safe {
    quest::settimer("south", 8);
}

sub east_safe {
    quest::settimer("east", 8);
}

sub EVENT_TIMER {
    my @raid_clients = $entity_list->GetClientList();
    if(@raid_clients) {
        foreach(@raid_clients) {
            if($_) {
                $raiders = $entity_list->GetBotRaidByClient($_);
                $raidCount = $entity_list->GetBotRaidCount($_);
            }
        }
    }
    if($timer eq "event") {
        my $deadDragorns = 0;
        my $Annihilator = $entity_list->GetMobByNpcTypeID(306003);
        my $Adept       = $entity_list->GetMobByNpcTypeID(306004);
        my $Acolyte     = $entity_list->GetMobByNpcTypeID(306005);
        my $Flamecaster = $entity_list->GetMobByNpcTypeID(306007);
        my $Incinerator = $entity_list->GetMobByNpcTypeID(306008);
        my $Spellscribe = $entity_list->GetMobByNpcTypeID(306009);
        if(!$Annihilator) {
            $deadDragorns++;
        }
        if(!$Adept) {
            $deadDragorns++;
        }
        if(!$Acolyte) {
            $deadDragorns++;
        }
        if(!$Flamecaster) {
            $deadDragorns++;
        }
        if(!$Incinerator) {
            $deadDragorns++;
        }
        if(!$Spellscribe) {
            $deadDragorns++;
        }
        if($deadDragorns == 6) {
            $event_started = 0;
            quest::stoptimer("tick");
            quest::stoptimer("equipment");
            quest::stoptimer("event");
            quest::stoptimer("hazard");
            quest::stoptimer("north");
            quest::stoptimer("south");
            quest::stoptimer("east");
            quest::stoptimer("center");
            quest::depopall(306002);
            quest::depopall(306003);
            quest::depopall(306004);
            quest::depopall(306005);
            quest::depopall(306007);
            quest::depopall(306008);
            quest::depopall(306009);
            quest::depopall(306010);
            quest::depopall(306011);
            quest::depopall(306012);
            quest::depopall(306013);
            quest::depopall(306014);
            # Shell_of_the_Master (306006)
            quest::spawn2(306006, 0, 0, -204, 274, 66, 144);
            foreach(@raid_clients) {
                if($_) {
                    #-- Update the win qgloabl
                    quest::targlobal("mpg_raid_foresight_flag", "1", "F", 0, $_->CharacterID(), 0);
                    quest::targlobal("mpg_raid_foresight_lockout", "1", "D3", 0, $_->CharacterID(), 0);

                    # add 1 rune to Shell_of_the_Master for each client
                    $Rune = $entity_list->GetMobByNpcTypeID(306006);
                    if($Rune) {
                        # Mastery of Tactics Rune
                        $Rune->CastToNPC()->AddItem(52409, 1);
                    }
                }
            }
            quest::depop();
        }
    }
    if($timer eq "hazard") {
        quest::stoptimer("hazard");
        Do_Hazard();
        quest::settimer("hazard", $hazard_timer - $timer_reduction);
    }
    if($timer eq "north") {
        quest::stoptimer("north");
        ae_check(-327, -89, 270, 398);
    }
    if($timer eq "center") {
        quest::stoptimer("center");
        ae_check(-206, -89, 150, 398);
    }
    if($timer eq "south") {
        quest::stoptimer("south");
        ae_check(-327, -89, 150, 270);
    }
    if($timer eq "east") {
        quest::stoptimer("east");
        ae_check(-327, -206, 150, 398);
    }
    if($timer eq "equipment") {
        quest::stoptimer("equipment");
        if($raiders) {
            my $rng1 = (1 + int(rand($raidCount)));
            $random_raider = $raiders->GetBotRaidMember($rng1);
            if($random_raider) {
                my $equip_num = (1 + int(rand(2)));
                $random_equipment = $equip_num;
                if($random_raider->IsClient()) {
                    $random_raider->Message(14, "$equipment{$equip_num}->[0]");
                }
                else {
                    my $non_client_name = $random_raider->GetCleanName();
                    if($random_equipment == 1) {
                        quest::ze(14, "$non_client_name's rings constrict and bite into their fingers. They should remove them.");
                    }
                    if($random_equipment == 2) {
                        quest::ze(14, "The Weapon in $non_client_name's right hand begins to heat up dramatically. They should remove it.");
                    }
                }
                quest::settimer("equipment_action", 5);
            }
        }
    }
    if($timer eq "equipment_action") {
        quest::stoptimer("equipment_action");
        if($random_raider) {
            $equipment{$random_equipment}->[1]();
        }
        quest::settimer("equipment", $equipment_timer - $timer_reduction);
    }
}

sub ae_check {
    my $victim_x = 0;
    my $victim_y = 0;
    my $msg_spam = 1;
    my $spell_spam = 1;
    for($i=1; $i<=$raidCount; $i++) {
        $raid_member = $raiders->GetBotRaidMember($i);
        if($raid_member) {
            $victim_x = $raid_member->GetX();
            $victim_y = $raid_member->GetY();
            if(($victim_x < $_[0]) || ($victim_x > $_[1]) || ($victim_y < $_[2]) || ($victim_y > $_[3])) {
                if($msg_spam == 1) {
                    $msg_spam = 2;
                    quest::ze(14, "The room explodes with chaotic energy.");
                }
                if($spell_spam == 1) {
                    $spell_spam = 2;
                    $npc->SendBeginCast(5693, 0);
                }
                quest::castspell(5693, $raid_member->GetID());
            }
            else {
                my $blast_name = $raid_member->GetCleanName();
                if(!$msg_spam) {
                    $msg_spam = 1;
                    quest::ze(14, "The room explodes with chaotic energy.");
                }
                quest::ze(14, "$blast_name escapes the blast unscathed.");
            }
        }
    }
}

sub Do_Hazard {
    my $msg_num = (1 + int(rand(4)));
    if(defined($last_hazard)) {
        if($msg_num == $last_hazard) {
            Do_Hazard();
        }
        else {
            $last_hazard = $msg_num;
            quest::ze(14, "$hazards{$msg_num}->[0]");
            $hazards{$msg_num}->[1]();
        }
    }
    else {
        $last_hazard = $msg_num;
        quest::ze(14, "$hazards{$msg_num}->[0]");
        $hazards{$msg_num}->[1]();
    }
}

sub EVENT_SIGNAL {
    if($signal == 666) {
        $timer_reduction += 2;
    }
}

