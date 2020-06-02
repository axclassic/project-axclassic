# #death_touch (309069)

my $warnings = 0;
my $event_started = 0;
my $deathcount = 0;

sub EVENT_SPAWN {
    $warnings = 0;
    $event_started = 1;
    quest::settimer("tick", 6);
}

sub EVENT_TIMER {
    my @raid_clients = $entity_list->GetClientList();
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
}

sub Spawn_Shell {
    quest::stoptimer("tick");
    #-- Spawn Shell_of_the_Corrupted (309034)
    quest::spawn2(309034, 0, 0, -212, 270, 66, $npc->GetHeading());
    my @raid_clients = $entity_list->GetClientList();
    my $clientCount = @raid_clients;
    foreach(@raid_clients) {
        if($_) {
            #-- Update the win qgloabl
            quest::targlobal("mpg_raid_corruption_flag", "1", "F", 0, $_->CharacterID(), 0);
        }
    }
    # add 1 rune to Shell_of_the_Corrupted for each client
    $Rune = $entity_list->GetMobByNpcTypeID(309034);
    if($Rune) {
        # Mastery of Power Rune
        $Rune->CastToNPC()->AddItem(52412, $clientCount);
    }
    $event_started = 0;
    quest::depop();
}

sub Spawn_Group2 {
    quest::spawn2(309040, 0, 0, -210, 290, 65, 70);
    quest::spawn2(309052, 0, 0, -221, 292, 65, 70);
    quest::spawn2(309022, 0, 0, -224, 283, 65, 70);
    quest::spawn2(309042, 0, 0, -216, 282, 65, 70);
    quest::spawn2(309032, 0, 0, -215, 277, 65, 70);
    quest::spawn2(309045, 0, 0, -225, 276, 65, 70);
    quest::spawn2(309050, 0, 0, -214, 261, 65, 35);
    quest::spawn2(309013, 0, 0, -220, 255, 65, 35);
    quest::spawn2(309023, 0, 0, -210, 254, 65, 35);
    quest::spawn2(309004, 0, 0, -216, 248, 65, 35);
    quest::spawn2(309054, 0, 0, -205, 252, 65, 25);
    quest::spawn2(309058, 0, 0, -209, 246, 65, 25);
}

sub Spawn_Group3 {
    quest::spawn2(309008, 0, 0, -210, 290, 65, 70);
    quest::spawn2(309003, 0, 0, -221, 292, 65, 70);
    quest::spawn2(309039, 0, 0, -224, 283, 65, 70);
    quest::spawn2(309010, 0, 0, -216, 282, 65, 70);
    quest::spawn2(309036, 0, 0, -215, 277, 65, 70);
    quest::spawn2(309028, 0, 0, -225, 276, 65, 70);
    quest::spawn2(309020, 0, 0, -197, 279, 65, 57);
    quest::spawn2(309026, 0, 0, -207, 277, 65, 57);
    quest::spawn2(309009, 0, 0, -194, 274, 65, 57);
    quest::spawn2(309033, 0, 0, -200, 272, 65, 57);
    quest::spawn2(309001, 0, 0, -196, 267, 65, 57);
    quest::spawn2(309017, 0, 0, -201, 264, 65, 57);
    quest::spawn2(309049, 0, 0, -214, 261, 65, 35);
    quest::spawn2(309038, 0, 0, -220, 255, 65, 35);
    quest::spawn2(309051, 0, 0, -210, 254, 65, 35);
    quest::spawn2(309031, 0, 0, -216, 248, 65, 35);
    quest::spawn2(309046, 0, 0, -205, 252, 65, 25);
    quest::spawn2(309057, 0, 0, -209, 246, 65, 25);
}

sub EVENT_SIGNAL {
    $deathcount++;
    if($deathcount == 36) {
        Spawn_Shell();
    }
    if($deathcount == 18) {
        Spawn_Group3();
    }
    if($deathcount == 6) {
        Spawn_Group2();
    }
}

