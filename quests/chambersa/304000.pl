# Master_of_Hate (304000)

my @raid_clients = 0;
my $warnings = 0;
my $hit_max = 5300;
my $org_max = 5300;
my $previous_target = 0;
my $current_target = 0;
my $event_started = 2;

sub EVENT_SPAWN {
    @raid_clients = 0;
    $warnings = 0;
    $hit_max = 0;
    $org_max = 0;
    $previous_target = 0;
    $current_target = 0;
}

sub EVENT_SAY {
    my $begin = quest::saylink("begin", 1);
    if($text=~/hail/i) {
        quest::say("This is the Mastery of Hate trial. You must incite your enemies to focus their rage on those who are best equpped to handle it. Should your force exhaust your defensive members at any point in time, you will fail. Are you ready to [ $begin ]?");
    }
    if($text=~/begin/i) {
        if($event_started == 2) {
            my $bot_raid_count = $entity_list->GetBotRaidCount($client);
            if(($bot_raid_count > 54) || ($bot_raid_count == 0)) {
                quest::say("The trial cannot start until you are in compilance with the rules.  Your raid does not meet the FIFTY-FOUR rule!");
            }
            else {
                @raid_clients = $entity_list->GetClientList();
                foreach(@raid_clients) {
                    if($_) {
                        #-- Update the lockout qglobal
                        quest::targlobal("mpg_raid_hatred_lockout", "1", "H3", 0, $_->CharacterID(), 0);
                    }
                }
                quest::say("Very well! Let the battle commence!");
                # Voracious_Feran (304001)
                quest::spawn2(304001, 0, 0, -161, 385, 60, 141);
                # Voracious_Feran (304002)
                quest::spawn2(304002, 0, 0, -255, 387, 60, 113);
                # Voracious_Feran (304003)
                quest::spawn2(304003, 0, 0, -315, 317, 60, 80);
                # Voracious_Feran (304004)
                quest::spawn2(304004, 0, 0, -319, 226, 60, 47);
                # Voracious_Feran (304005)
                quest::spawn2(304005, 0, 0, -258, 160, 60, 14);
                # Voracious_Feran (304006)
                quest::spawn2(304006, 0, 0, -158, 160, 60, 241);
                quest::settimer("tick", 6);
                quest::settimer("pups", 1);
                $event_started = 1;
            }
        }
    }
}

sub EVENT_TIMER {
    if($timer eq "tick") {
        @raid_clients = $entity_list->GetClientList();
        foreach(@raid_clients) {
            if($_) {
                if(($_->GetX() > -64) || ($_->GetY() < 122)) {
                    $_->Message(13, "A deep voice booms in your head, 'This breach of the rules will not be tolerated. You must face the trials. Return to the arena or be subjected to pain.'");
                    if($warnings >= 10) {
                        $_->Message(13, "A deep voice booms in your head, 'You have been warned.  You did not heed the warnings.  Now you Die!'");
                        # Spell: Cazic Touch
                        quest::castspell(982, $_->GetID());
                    }
                    $warnings++;
                }
                my $bot_raid_count = $entity_list->GetBotRaidCount($_);
                if(($bot_raid_count > 54) || ($bot_raid_count == 0)) {
                    $_->Message(13, "A deep voice booms in your head, 'This breach of the rules will not be tolerated. You must face the trials with up to FIFTY-FOUR raid members!'");
                    if($warnings >= 10) {
                        $_->Message(13, "A deep voice booms in your head, 'You have been warned.  You did not heed the warnings.  Now you Die!'");
                        # Spell: Cazic Touch
                        quest::castspell(982, $_->GetID());
                    }
                    $warnings++;
                }
            }
        }
        my $deadFeran = 0;
        my $Feran1 = $entity_list->GetMobByNpcTypeID(304001);
        my $Feran2 = $entity_list->GetMobByNpcTypeID(304002);
        my $Feran3 = $entity_list->GetMobByNpcTypeID(304003);
        my $Feran4 = $entity_list->GetMobByNpcTypeID(304004);
        my $Feran5 = $entity_list->GetMobByNpcTypeID(304005);
        my $Feran6 = $entity_list->GetMobByNpcTypeID(304006);
        if(!$Feran1) {
            $deadFeran++;
        }
        if(!$Feran2) {
            $deadFeran++;
        }
        if(!$Feran3) {
            $deadFeran++;
        }
        if(!$Feran4) {
            $deadFeran++;
        }
        if(!$Feran5) {
            $deadFeran++;
        }
        if(!$Feran6) {
            $deadFeran++;
        }
        if($deadFeran == 6) {
            quest::stoptimer("pups");
            quest::modifynpcstat("special_attacks", "SERTMCNIDf");
            quest::settimer("maxdps", 1);
            quest::settimer("new_target", 2);
        }
    }
    if($timer eq "pups") {
        quest::stoptimer("pups");
        my $feran_alive = 2;
        while($feran_alive == 2) {
            my $feran_choice = quest::ChooseRandom(304001, 304002, 304003, 304004, 304005, 304006);
            my $feran = $entity_list->GetMobByNpcTypeID($feran_choice);
            if($feran) {
                $feran_alive = 1;
                quest::signalwith($feran_choice, 222);
            }
        }
        quest::settimer("pups", 15);
    }
    if($timer eq "maxdps") {
        $hit_max = $hit_max + 40;
        quest::modifynpcstat("maxdmg", $hit_max);
    }
    if($timer eq "new_target") {
        $current_target = $npc->GetHateTop();
        if($current_target) {
            if($previous_target) {
                if($previous_target != $current_target) {
                    quest::modifynpcstat("maxdmg", $org_max);
                    $previous_target = $current_target;
                }
            }
            else {
                $previous_target = $current_target;
            }
        }
    }
}

sub EVENT_DEATH {
    quest::stoptimer("maxdps");
    quest::stoptimer("tick");
    quest::stoptimer("new_target");
    # Shell_of_the_Master (304010)
    quest::spawn2(304010, 0, 0, -204, 274, 66, 144);
    foreach(@raid_clients) {
        if($_) {
            #-- Update the win qgloabl
            quest::targlobal("mpg_raid_hatred_flag", "1", "F", 0, $_->CharacterID(), 0);
            quest::targlobal("mpg_raid_hatred_lockout", "1", "D3", 0, $_->CharacterID(), 0);

            # add 1 rune to Shell_of_the_Master for each client
            $Rune = $entity_list->GetMobByNpcTypeID(304010);
            if($Rune) {
                # Mastery of Mind Rune
                $Rune->CastToNPC()->AddItem(52407, 1);
            }
        }
    }
}

