# #death_touch (305001)

my $warnings = 0;
my $event_started = 0;
my $wave = 0;
my $event = 0;

sub EVENT_SPAWN {
    $warnings = 0;
    $event_started = 1;
    quest::settimer("tick", 6);
    quest::settimer("event", 66);
    quest::settimer("pop", 180);
}

sub EVENT_TIMER {
    my @raid_clients = $entity_list->GetClientList();
    $boss_hp = $npc->GetHPRatio();
    my $new_time = 0;
    if($timer eq "tick") {
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
    }
    if($timer eq "event") {
        quest::settimer("event", 60);
        $event += 5;
        if($event < 100) {
            quest::signalwith(305000, 305001);
            quest::signalwith(305002, 305001);
        }
        else {
            $event_started = 0;
            quest::stoptimer("event");
            quest::stoptimer("pop");
            quest::depopall(305000);
            quest::depopall(305002);
            quest::depopall(305003);
            quest::depopall(305004);
            quest::depopall(305005);
            quest::depopall(305006);
            quest::depopall(305007);
            quest::depopall(305008);
            # Shell_of_the_Ancients (305009)
            quest::spawn2(305009, 0, 0, -204, 274, 66, 144);
            foreach(@raid_clients) {
                if($_) {
                    #-- Update the win qgloabl
                    quest::targlobal("mpg_raid_endurance_flag", "1", "F", 0, $_->CharacterID(), 0);
                    quest::targlobal("mpg_raid_endurance_lockout", "1", "D3", 0, $_->CharacterID(), 0);

                    # add 1 rune to Shell_of_the_Ancients for each client
                    $Rune = $entity_list->GetMobByNpcTypeID(305009);
                    if($Rune) {
                        # Mastery of Body Rune
                        $Rune->CastToNPC()->AddItem(52408, 1);
                    }
                }
            }
            quest::depop();
        }
    }
    if($timer eq "pop") {
        $wave++;
        my $defender1 = 0;
        my $defender2 = 0;
        if($wave > 1) {
            quest::depopall(305003);
            quest::depopall(305005);
            quest::depopall(305006);
            quest::depopall(305008);
            $defender1 = $entity_list->GetMobByNpcTypeID(305004);
            if($defender1) {
                if(!$defender1->IsMezzed()) {
                    quest::depopall(305004);
                }
            }
            # a_dragorn_antagonist (305005)
            quest::spawn2(305005, 0, 0, -318, 226, 58, 50);
            # a_frantic_discordling (305006)
            quest::spawn2(305006, 0, 0, -251, 161, 58, 16);
        }
        if($wave > 2) {
            $defender2 = $entity_list->GetMobByNpcTypeID(305007);
            if($defender2) {
                if(!$defender2->IsMezzed()) {
                    quest::depopall(305007);
                }
            }
            $defender2 = $entity_list->GetMobByNpcTypeID(305007);
            if(!defender2) {
                # a_dragorn_defender (305007)
                quest::spawn2(305007, 0, 0, -157, 158, 58, 239);
            }
        }
        if($wave > 3) {
            # a_muramite_sentinel (305008)
            quest::spawn2(305008, 0, 0, -204, 280, 65, 54);
            quest::spawn2(305008, 0, 0, -208, 265, 65, 54);
        }
        # a_dragorn_champion (305003)
        quest::spawn2(305003, 0, 0, -161, 386, 58, 146);
        quest::spawn2(305003, 0, 0, -254, 389, 58, 115);
        $defender1 = $entity_list->GetMobByNpcTypeID(305004);
        if(!defender1) {
            # a_dragorn_defender (305004)
            quest::spawn2(305004, 0, 0, -317, 319, 58, 82);
        }
    }
}

