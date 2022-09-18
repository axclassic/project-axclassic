#phase_one_trigger script npcid - 223177 This is required for signals of all 5 trials

my $noa_spawned = 1;
my $toe_spawned = 1;
my $kof_spawned = 1;
my $rotu_spawned = 1;
my $aow_spawned = 1;

sub EVENT_SPAWN {
    $noa_spawned = 1;
    $toe_spawned = 1;
    $kof_spawned = 1;
    $rotu_spawned = 1;
    $aow_spawned = 1;
    #quest::ze(15, "Congdar phase_trigger spawned.");
    quest::settimer("phase1_boss_check", 10);
}

sub EVENT_TIMER {
    if($timer eq "phase1_boss_check") {
        # Neimon_of_Air (223120)
        my $noa = $entity_list->GetMobByNpcTypeID(223120);
        # Terlok_of_Earth (223119)
        my $toe = $entity_list->GetMobByNpcTypeID(223119);
        # Kazrok_of_Fire (223090)
        my $kof = $entity_list->GetMobByNpcTypeID(223090);
        # Rythor_of_the_Undead (223129)
        my $rotu = $entity_list->GetMobByNpcTypeID(223129);
        # Anar_of_Water (223104)
        my $aow = $entity_list->GetMobByNpcTypeID(223104);
        if($noa) {
            $noa_spawned = undef;
        }
        if($toe) {
            $toe_spawned = undef;
        }
        if($kof) {
            $kof_spawned = undef;
        }
        if($rotu) {
            $rotu_spawned = undef;
        }
        if($aow) {
            $aow_spawned = undef;
        }
        if($noa_spawned || $toe_spawned || $kof_spawned || $rotu_spawned || $aow_spawned) {
            # Do Nothing
        }
        else {
            quest::stoptimer("phase1_boss_check");
            #quest::ze(15, "Congdar all 5 bosses spawned.");
            quest::settimer("phase1_boss_check2", 5);
        }
        $noa = undef;
        $toe = undef;
        $kof = undef;
        $rotu = undef;
        $aow = undef;
    }

    if($timer eq "phase1_boss_check2") {
        #Neimon_of_Air (223120)
        my $noa = $entity_list->GetMobByNpcTypeID(223120);
        #Terlok_of_Earth (223119)
        my $toe = $entity_list->GetMobByNpcTypeID(223119);
        #Kazrok_of_Fire (223090)
        my $kof = $entity_list->GetMobByNpcTypeID(223090);
        #Rythor_of_the_Undead (223129)
        my $rotu = $entity_list->GetMobByNpcTypeID(223129);
        #Anar_of_Water (223104)
        my $aow = $entity_list->GetMobByNpcTypeID(223104);
        if($noa || $toe || $kof || $rotu || $aow) {
            #Do Nothing
        }
        else {
            quest::stoptimer("phase1_boss_check2");
            #quest::ze(15, "Congdar all 5 bosses down, spawning phase2_trigger.");
            #phase2_trigger (223191)
            quest::spawn2(223191,0,0,-140,1737,547,0);
            quest::settimer("opendoors", 5);
        }
        $noa = undef;
        $toe = undef;
        $kof = undef;
        $rotu = undef;
        $aow = undef;
    }

    if($timer eq "opendoors") {
        quest::stoptimer("opendoors");
        #quest::ze(15, "Congdar opendoors $instanceversion.");
        #Worlwide camera shake
        $npc->CameraEffect(3000, 6, 0, 1);
        if($instanceversion == 1) {
            #quest::ze(15, "Congdar Opening version 1 doors, bye.");
            my $open_door = $entity_list->FindDoor(76);
            $open_door->SetOpenType(81);
            $open_door->ForceOpen($npc);
            $open_door = $entity_list->FindDoor(77);
            $open_door->SetOpenType(79);
            $open_door->ForceOpen($npc);
            $open_door = $entity_list->FindDoor(78);
            $open_door->SetOpenType(78);
            $open_door->ForceOpen($npc);
            $open_door = $entity_list->FindDoor(79);
            $open_door->SetOpenType(80);
            $open_door->ForceOpen($npc);
            $open_door = $entity_list->FindDoor(84);
            $open_door->SetOpenType(80);
            $open_door->ForceOpen($npc);
            $open_door = $entity_list->FindDoor(85);
            $open_door->SetOpenType(78);
            $open_door->ForceOpen($npc);
            $open_door = $entity_list->FindDoor(86);
            $open_door->SetOpenType(79);
            $open_door->ForceOpen($npc);
            $open_door = $entity_list->FindDoor(87);
            $open_door->SetOpenType(81);
            $open_door->ForceOpen($npc);
            $open_door = $entity_list->FindDoor(88);
            $open_door->SetOpenType(80);
            $open_door->ForceOpen($npc);
            $open_door = $entity_list->FindDoor(89);
            $open_door->SetOpenType(78);
            $open_door->ForceOpen($npc);
            $open_door = $entity_list->FindDoor(90);
            $open_door->SetOpenType(79);
            $open_door->ForceOpen($npc);
            $open_door = $entity_list->FindDoor(91);
            $open_door->SetOpenType(81);
            $open_door->ForceOpen($npc);
            $open_door = $entity_list->FindDoor(100);
            $open_door->SetOpenType(80);
            $open_door->ForceOpen($npc);
            $open_door = $entity_list->FindDoor(101);
            $open_door->SetOpenType(78);
            $open_door->ForceOpen($npc);
            $open_door = $entity_list->FindDoor(102);
            $open_door->SetOpenType(79);
            $open_door->ForceOpen($npc);
            $open_door = $entity_list->FindDoor(103);
            $open_door->SetOpenType(81);
            $open_door->ForceOpen($npc);
            $open_door = $entity_list->FindDoor(104);
            $open_door->SetOpenType(80);
            $open_door->ForceOpen($npc);
            $open_door = $entity_list->FindDoor(105);
            $open_door->SetOpenType(78);
            $open_door->ForceOpen($npc);
            $open_door = $entity_list->FindDoor(106);
            $open_door->SetOpenType(79);
            $open_door->ForceOpen($npc);
            $open_door = $entity_list->FindDoor(107);
            $open_door->SetOpenType(81);
            $open_door->ForceOpen($npc);
        }
        if($instanceversion == 2) {
            #quest::ze(15, "Congdar Opening version 2 doors, bye.");
            my $open_door = $entity_list->FindDoor(108);
            $open_door->SetOpenType(81);
            $open_door->ForceOpen($npc);
            $open_door = $entity_list->FindDoor(109);
            $open_door->SetOpenType(79);
            $open_door->ForceOpen($npc);
            $open_door = $entity_list->FindDoor(110);
            $open_door->SetOpenType(78);
            $open_door->ForceOpen($npc);
            $open_door = $entity_list->FindDoor(111);
            $open_door->SetOpenType(80);
            $open_door->ForceOpen($npc);
            $open_door = $entity_list->FindDoor(116);
            $open_door->SetOpenType(80);
            $open_door->ForceOpen($npc);
            $open_door = $entity_list->FindDoor(117);
            $open_door->SetOpenType(78);
            $open_door->ForceOpen($npc);
            $open_door = $entity_list->FindDoor(118);
            $open_door->SetOpenType(79);
            $open_door->ForceOpen($npc);
            $open_door = $entity_list->FindDoor(119);
            $open_door->SetOpenType(81);
            $open_door->ForceOpen($npc);
            $open_door = $entity_list->FindDoor(120);
            $open_door->SetOpenType(80);
            $open_door->ForceOpen($npc);
            $open_door = $entity_list->FindDoor(121);
            $open_door->SetOpenType(78);
            $open_door->ForceOpen($npc);
            $open_door = $entity_list->FindDoor(122);
            $open_door->SetOpenType(79);
            $open_door->ForceOpen($npc);
            $open_door = $entity_list->FindDoor(123);
            $open_door->SetOpenType(81);
            $open_door->ForceOpen($npc);
            $open_door = $entity_list->FindDoor(132);
            $open_door->SetOpenType(80);
            $open_door->ForceOpen($npc);
            $open_door = $entity_list->FindDoor(133);
            $open_door->SetOpenType(78);
            $open_door->ForceOpen($npc);
            $open_door = $entity_list->FindDoor(134);
            $open_door->SetOpenType(79);
            $open_door->ForceOpen($npc);
            $open_door = $entity_list->FindDoor(135);
            $open_door->SetOpenType(81);
            $open_door->ForceOpen($npc);
            $open_door = $entity_list->FindDoor(136);
            $open_door->SetOpenType(80);
            $open_door->ForceOpen($npc);
            $open_door = $entity_list->FindDoor(137);
            $open_door->SetOpenType(78);
            $open_door->ForceOpen($npc);
            $open_door = $entity_list->FindDoor(138);
            $open_door->SetOpenType(79);
            $open_door->ForceOpen($npc);
            $open_door = $entity_list->FindDoor(139);
            $open_door->SetOpenType(81);
            $open_door->ForceOpen($npc);
        }
        if($instanceversion == 3) {
            #quest::ze(15, "Congdar Opening version 3 doors, bye.");
            my $open_door = $entity_list->FindDoor(140);
            $open_door->SetOpenType(81);
            $open_door->ForceOpen($npc);
            $open_door = $entity_list->FindDoor(141);
            $open_door->SetOpenType(79);
            $open_door->ForceOpen($npc);
            $open_door = $entity_list->FindDoor(142);
            $open_door->SetOpenType(78);
            $open_door->ForceOpen($npc);
            $open_door = $entity_list->FindDoor(143);
            $open_door->SetOpenType(80);
            $open_door->ForceOpen($npc);
            $open_door = $entity_list->FindDoor(148);
            $open_door->SetOpenType(80);
            $open_door->ForceOpen($npc);
            $open_door = $entity_list->FindDoor(149);
            $open_door->SetOpenType(78);
            $open_door->ForceOpen($npc);
            $open_door = $entity_list->FindDoor(150);
            $open_door->SetOpenType(79);
            $open_door->ForceOpen($npc);
            $open_door = $entity_list->FindDoor(151);
            $open_door->SetOpenType(81);
            $open_door->ForceOpen($npc);
            $open_door = $entity_list->FindDoor(152);
            $open_door->SetOpenType(80);
            $open_door->ForceOpen($npc);
            $open_door = $entity_list->FindDoor(153);
            $open_door->SetOpenType(78);
            $open_door->ForceOpen($npc);
            $open_door = $entity_list->FindDoor(154);
            $open_door->SetOpenType(79);
            $open_door->ForceOpen($npc);
            $open_door = $entity_list->FindDoor(155);
            $open_door->SetOpenType(81);
            $open_door->ForceOpen($npc);
            $open_door = $entity_list->FindDoor(164);
            $open_door->SetOpenType(80);
            $open_door->ForceOpen($npc);
            $open_door = $entity_list->FindDoor(165);
            $open_door->SetOpenType(78);
            $open_door->ForceOpen($npc);
            $open_door = $entity_list->FindDoor(166);
            $open_door->SetOpenType(79);
            $open_door->ForceOpen($npc);
            $open_door = $entity_list->FindDoor(167);
            $open_door->SetOpenType(81);
            $open_door->ForceOpen($npc);
            $open_door = $entity_list->FindDoor(168);
            $open_door->SetOpenType(80);
            $open_door->ForceOpen($npc);
            $open_door = $entity_list->FindDoor(169);
            $open_door->SetOpenType(78);
            $open_door->ForceOpen($npc);
            $open_door = $entity_list->FindDoor(170);
            $open_door->SetOpenType(79);
            $open_door->ForceOpen($npc);
            $open_door = $entity_list->FindDoor(171);
            $open_door->SetOpenType(81);
            $open_door->ForceOpen($npc);
        }
        if($instanceversion == 4) {
            #quest::ze(15, "Congdar Opening version 4 doors, bye.");
            my $open_door = $entity_list->FindDoor(172);
            $open_door->SetOpenType(81);
            $open_door->ForceOpen($npc);
            $open_door = $entity_list->FindDoor(173);
            $open_door->SetOpenType(79);
            $open_door->ForceOpen($npc);
            $open_door = $entity_list->FindDoor(174);
            $open_door->SetOpenType(78);
            $open_door->ForceOpen($npc);
            $open_door = $entity_list->FindDoor(175);
            $open_door->SetOpenType(80);
            $open_door->ForceOpen($npc);
            $open_door = $entity_list->FindDoor(180);
            $open_door->SetOpenType(80);
            $open_door->ForceOpen($npc);
            $open_door = $entity_list->FindDoor(181);
            $open_door->SetOpenType(78);
            $open_door->ForceOpen($npc);
            $open_door = $entity_list->FindDoor(182);
            $open_door->SetOpenType(79);
            $open_door->ForceOpen($npc);
            $open_door = $entity_list->FindDoor(183);
            $open_door->SetOpenType(81);
            $open_door->ForceOpen($npc);
            $open_door = $entity_list->FindDoor(184);
            $open_door->SetOpenType(80);
            $open_door->ForceOpen($npc);
            $open_door = $entity_list->FindDoor(185);
            $open_door->SetOpenType(78);
            $open_door->ForceOpen($npc);
            $open_door = $entity_list->FindDoor(186);
            $open_door->SetOpenType(79);
            $open_door->ForceOpen($npc);
            $open_door = $entity_list->FindDoor(187);
            $open_door->SetOpenType(81);
            $open_door->ForceOpen($npc);
            $open_door = $entity_list->FindDoor(196);
            $open_door->SetOpenType(80);
            $open_door->ForceOpen($npc);
            $open_door = $entity_list->FindDoor(197);
            $open_door->SetOpenType(78);
            $open_door->ForceOpen($npc);
            $open_door = $entity_list->FindDoor(198);
            $open_door->SetOpenType(79);
            $open_door->ForceOpen($npc);
            $open_door = $entity_list->FindDoor(199);
            $open_door->SetOpenType(81);
            $open_door->ForceOpen($npc);
            $open_door = $entity_list->FindDoor(200);
            $open_door->SetOpenType(80);
            $open_door->ForceOpen($npc);
            $open_door = $entity_list->FindDoor(201);
            $open_door->SetOpenType(78);
            $open_door->ForceOpen($npc);
            $open_door = $entity_list->FindDoor(202);
            $open_door->SetOpenType(79);
            $open_door->ForceOpen($npc);
            $open_door = $entity_list->FindDoor(203);
            $open_door->SetOpenType(81);
            $open_door->ForceOpen($npc);
        }
        if($instanceversion == 5) {
            #quest::ze(15, "Congdar Opening version 5 doors, bye.");
            my $open_door = $entity_list->FindDoor(204);
            $open_door->SetOpenType(81);
            $open_door->ForceOpen($npc);
            $open_door = $entity_list->FindDoor(205);
            $open_door->SetOpenType(79);
            $open_door->ForceOpen($npc);
            $open_door = $entity_list->FindDoor(206);
            $open_door->SetOpenType(78);
            $open_door->ForceOpen($npc);
            $open_door = $entity_list->FindDoor(207);
            $open_door->SetOpenType(80);
            $open_door->ForceOpen($npc);
            $open_door = $entity_list->FindDoor(212);
            $open_door->SetOpenType(80);
            $open_door->ForceOpen($npc);
            $open_door = $entity_list->FindDoor(213);
            $open_door->SetOpenType(78);
            $open_door->ForceOpen($npc);
            $open_door = $entity_list->FindDoor(214);
            $open_door->SetOpenType(79);
            $open_door->ForceOpen($npc);
            $open_door = $entity_list->FindDoor(215);
            $open_door->SetOpenType(81);
            $open_door->ForceOpen($npc);
            $open_door = $entity_list->FindDoor(216);
            $open_door->SetOpenType(80);
            $open_door->ForceOpen($npc);
            $open_door = $entity_list->FindDoor(217);
            $open_door->SetOpenType(78);
            $open_door->ForceOpen($npc);
            $open_door = $entity_list->FindDoor(218);
            $open_door->SetOpenType(79);
            $open_door->ForceOpen($npc);
            $open_door = $entity_list->FindDoor(219);
            $open_door->SetOpenType(81);
            $open_door->ForceOpen($npc);
            $open_door = $entity_list->FindDoor(228);
            $open_door->SetOpenType(80);
            $open_door->ForceOpen($npc);
            $open_door = $entity_list->FindDoor(229);
            $open_door->SetOpenType(78);
            $open_door->ForceOpen($npc);
            $open_door = $entity_list->FindDoor(230);
            $open_door->SetOpenType(79);
            $open_door->ForceOpen($npc);
            $open_door = $entity_list->FindDoor(231);
            $open_door->SetOpenType(81);
            $open_door->ForceOpen($npc);
            $open_door = $entity_list->FindDoor(232);
            $open_door->SetOpenType(80);
            $open_door->ForceOpen($npc);
            $open_door = $entity_list->FindDoor(233);
            $open_door->SetOpenType(78);
            $open_door->ForceOpen($npc);
            $open_door = $entity_list->FindDoor(234);
            $open_door->SetOpenType(79);
            $open_door->ForceOpen($npc);
            $open_door = $entity_list->FindDoor(235);
            $open_door->SetOpenType(81);
            $open_door->ForceOpen($npc);
        }
        #quest::ze(15, "Congdar phase_trigger depop, bye.");
        $npc->Depop();
    }
}

