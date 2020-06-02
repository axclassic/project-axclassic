# #death_touch (308009)

my $warnings = 0;
my $event_started = 0;
my $boss_hp = 0;
my $BrutalityCount;
my $FireCount;
my $IceCount;
my $PowerCount;
my $Brutality = 0;
my $Fire = 0;
my $Ice = 0;
my $Power = 0;
my $Pain = 0;
my $newX = 0;
my $newY = 0;
my $newZ = 0;
my $newH = 0;

sub EVENT_SPAWN {
    $warnings = 0;
    $event_started = 1;
    quest::settimer("tick", 6);
    my $shifttime = (90 + int(rand(61)));
    quest::settimer("shapeshift", $shifttime);
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
    if($timer eq "shapeshift") {
        quest::stoptimer("shapeshift");
        ShapeShift();
        if($boss_hp <= 10) {
            $new_time = (25 + int(rand(11)));
        }
        elsif($boss_hp <= 20) {
            $new_time = (35 + int(rand(11)));
        }
        elsif($boss_hp <= 30) {
            $new_time = (45 + int(rand(11)));
        }
        elsif($boss_hp <= 40) {
            $new_time = (55 + int(rand(11)));
        }
        elsif($boss_hp <= 50) {
            $new_time = (65 + int(rand(11)));
        }
        elsif($boss_hp <= 60) {
            $new_time = (70 + int(rand(21)));
        }
        elsif($boss_hp <= 70) {
            $new_time = (75 + int(rand(31)));
        }
        elsif($boss_hp <= 80) {
            $new_time = (80 + int(rand(41)));
        }
        elsif($boss_hp <= 90) {
            $new_time = (85 + int(rand(41)));
        }
        else {
            $new_time = (90 + int(rand(61)));
        }
        quest::settimer("shapeshift", $new_time);
    }
}

sub ShapeShift {
    $Brutality = $entity_list->GetMobByNpcTypeID(308010);
    $Fire = $entity_list->GetMobByNpcTypeID(308011);
    $Ice = $entity_list->GetMobByNpcTypeID(308012);
    $Power = $entity_list->GetMobByNpcTypeID(308013);
    $Pain = $entity_list->GetMobByNpcTypeID(308014);
    my $NewHitPoints = 0;
    my $NextSpawn = 0;
    if(defined($Brutality)) {
        $NewHitPoints = $Brutality->GetHP();
        $newX = $Brutality->GetX();
        $newY = $Brutality->GetY();
        $newZ = $Brutality->GetZ();
        $newH = $Brutality->GetHeading();
        quest::depopall(308010);
        $NextSpawn = quest::ChooseRandom(308011,308012,308013,308014)
    }
    if(defined($Fire)) {
        $NewHitPoints = $Fire->GetHP();
        $newX = $Fire->GetX();
        $newY = $Fire->GetY();
        $newZ = $Fire->GetZ();
        $newH = $Fire->GetHeading();
        quest::depopall(308015);
        quest::depopall(308011);
        $NextSpawn = quest::ChooseRandom(308010,308012,308013,308014)
    }
    if(defined($Ice)) {
        $NewHitPoints = $Ice->GetHP();
        $newX = $Ice->GetX();
        $newY = $Ice->GetY();
        $newZ = $Ice->GetZ();
        $newH = $Ice->GetHeading();
        quest::depopall(308016);
        quest::depopall(308012);
        $NextSpawn = quest::ChooseRandom(308010,308011,308013,308014)
    }
    if(defined($Power)) {
        $NewHitPoints = $Power->GetHP();
        $newX = $Power->GetX();
        $newY = $Power->GetY();
        $newZ = $Power->GetZ();
        $newH = $Power->GetHeading();
        quest::depopall(308017);
        quest::depopall(308013);
        $NextSpawn = quest::ChooseRandom(308010,308011,308012,308014)
    }
    if(defined($Pain)) {
        $NewHitPoints = $Pain->GetHP();
        $newX = $Pain->GetX();
        $newY = $Pain->GetY();
        $newZ = $Pain->GetZ();
        $newH = $Pain->GetHeading();
        quest::depopall(308014);
        $NextSpawn = quest::ChooseRandom(308010,308011,308012,308013)
    }
    if(!defined($BrutalityCount)) {
        quest::spawn2(308010, 0, 0, $newX, $newY, $newZ, $newH);
        $BrutalityCount = 1;
    }
    elsif(!defined($FireCount)) {
        quest::spawn2(308011, 0, 0, $newX, $newY, $newZ, $newH);
        $FireCount = 1;
    }
    elsif(!defined($IceCount)) {
        quest::spawn2(308012, 0, 0, $newX, $newY, $newZ, $newH);
        $IceCount = 1;
    }
    elsif(!defined($PowerCount)) {
        quest::spawn2(308013, 0, 0, $newX, $newY, $newZ, $newH);
        $PowerCount = 1;
    }
    else {
        quest::spawn2($NextSpawn, 0, 0, $newX, $newY, $newZ, $newH);
    }
    $Brutality = $entity_list->GetMobByNpcTypeID(308010);
    $Fire = $entity_list->GetMobByNpcTypeID(308011);
    $Ice = $entity_list->GetMobByNpcTypeID(308012);
    $Power = $entity_list->GetMobByNpcTypeID(308013);
    $Pain = $entity_list->GetMobByNpcTypeID(308014);
    if(defined($Brutality)) {
        $Brutality->SetHP($NewHitPoints);
    }
    if(defined($Fire)) {
        $Fire->SetHP($NewHitPoints);
    }
    if(defined($Ice)) {
        $Ice->SetHP($NewHitPoints);
    }
    if(defined($Power)) {
        $Power->SetHP($NewHitPoints);
    }
    if(defined($Pain)) {
        $Pain->SetHP($NewHitPoints);
    }
}

sub EVENT_SIGNAL {
    quest::stoptimer("tick");
    quest::stoptimer("shapeshift");
    my @raid_clients = $entity_list->GetClientList();
    my $clientCount = @raid_clients;
    foreach(@raid_clients) {
        if($_) {
            #-- Update the win qgloabl
            quest::targlobal("mpg_raid_adaptation_flag", "1", "F", 0, $_->CharacterID(), 0);
            quest::targlobal("mpg_raid_adaptation_lockout", "1", "D3", 0, $_->CharacterID(), 0);
        }
    }
    # add 1 rune to Shell of the Master for each client
    $Rune = $entity_list->GetMobByNpcTypeID(308018);
    if($Rune) {
        # Mastery of Realms Rune
        $Rune->CastToNPC()->AddItem(52411, $clientCount);
    }
    quest::depop();
}

