# phase2_trigger (223191) This is required for signals for phase 2

my $IIcounter = 1;
my $groupboss = 1;

sub EVENT_SPAWN {
    $IIcounter = 1;
    $groupboss = 1;

    #flavor triggers invisible _ 223111.pl
    quest::signalwith(223111, 1001, 2000);
    #Earth group using #earth_counter (223178)
    quest::spawn2(223178,0,0,-129.6,1720,547,0);
    #Air group using #air_counter.pl
    quest::spawn2(223179,0,0,-129.6,1720,547,0);
    #Undead group using #undead_counter.pl
    quest::spawn2(223180,0,0,-129.6,1720,547,0);
    #Water group using #water_counter.pl
    quest::spawn2(223181,0,0,-129.6,1720,547,0);
    #Fire group using #fire_counter.pl
    quest::spawn2(223182,0,0,-129.6,1720,547,0);
    #quest::ze(15, "Congdar phase2_trigger spawining earth_counter, air_counter, undead_counter, water_counter, fire_counter, ");
}

sub EVENT_SIGNAL {
    if($signal == 14034) {
        #quest::ze(15, "Congdar phase2_trigger received signal groupboss $groupboss of 5.");
        #keeps track of group mob #1
        $groupboss = $groupboss + 1;
        if($groupboss == 6) {
            #quest::ze(15, "Congdar phase2_trigger count is 5 of 5, spawn 5 bosses.");
            #earth boss group
            quest::spawn2(223169,0,0,-129.6,1720,547,0);
            #air boss group
            quest::spawn2(223170,0,0,-129.6,1720,547,0);
            #undead boss group
            quest::spawn2(223171,0,0,-129.6,1720,547,0);
            #water boss group
            quest::spawn2(223172,0,0,-129.6,1720,547,0);
            #fire boss group
            quest::spawn2(223173,0,0,-129.6,1720,547,0);
            $groupboss = 7;
        }
    }
    #This signal keeps track of the groups dead to open inner doors
    if($signal == 14035) {
        #quest::ze(15, "Congdar phase2_trigger received signal IIcounter $IIcounter of 5.");
        #phase 2 boss signals
        $IIcounter = $IIcounter + 1;
        if($IIcounter == 6) {
            #quest::ze(15, "Congdar phase2_trigger count is 5 of 5, shake the world, open doors, spawn phase3_trigger.");
            #Inner doors open!
            quest::settimer("twoopens", 5);
            #triggers phase3_trigger.pl
            quest::spawn2(223154,0,0,-129.6,1720,547,0);
            $IIcounter = 7;
        }
    }
}

sub EVENT_TIMER {
    if($timer eq "twoopens") {
        quest::stoptimer("twoopens");
        #Worlwide camera shake
        $npc->CameraEffect(3000, 6, 0, 1);
        if($instanceversion == 1) {
            #quest::ze(15, "Congdar Opening version 1 doors, bye.");
            #inner connecting doors
            my $open_door = $entity_list->FindDoor(80);
            $open_door->SetOpenType(80);
            $open_door->ForceOpen($npc);
            $open_door = $entity_list->FindDoor(81);
            $open_door->SetOpenType(78);
            $open_door->ForceOpen($npc);
            $open_door = $entity_list->FindDoor(82);
            $open_door->SetOpenType(79);
            $open_door->ForceOpen($npc);
            $open_door = $entity_list->FindDoor(83);
            $open_door->SetOpenType(81);
            $open_door->ForceOpen($npc);
            $open_door = $entity_list->FindDoor(92);
            $open_door->SetOpenType(80);
            $open_door->ForceOpen($npc);
            $open_door = $entity_list->FindDoor(93);
            $open_door->SetOpenType(78);
            $open_door->ForceOpen($npc);
            $open_door = $entity_list->FindDoor(94);
            $open_door->SetOpenType(79);
            $open_door->ForceOpen($npc);
            $open_door = $entity_list->FindDoor(95);
            $open_door->SetOpenType(81);
            $open_door->ForceOpen($npc);
            $open_door = $entity_list->FindDoor(96);
            $open_door->SetOpenType(80);
            $open_door->ForceOpen($npc);
            $open_door = $entity_list->FindDoor(97);
            $open_door->SetOpenType(78);
            $open_door->ForceOpen($npc);
            $open_door = $entity_list->FindDoor(98);
            $open_door->SetOpenType(79);
            $open_door->ForceOpen($npc);
            $open_door = $entity_list->FindDoor(99);
            $open_door->SetOpenType(81);
            $open_door->ForceOpen($npc);
            quest::depop();
        }
        if($instanceversion == 2) {
            #quest::ze(15, "Congdar Opening version 2 doors, bye.");
            #inner connecting doors
            my $open_door = $entity_list->FindDoor(112);
            $open_door->SetOpenType(80);
            $open_door->ForceOpen($npc);
            $open_door = $entity_list->FindDoor(113);
            $open_door->SetOpenType(79);
            $open_door->ForceOpen($npc);
            $open_door = $entity_list->FindDoor(114);
            $open_door->SetOpenType(79);
            $open_door->ForceOpen($npc);
            $open_door = $entity_list->FindDoor(115);
            $open_door->SetOpenType(81);
            $open_door->ForceOpen($npc);
            $open_door = $entity_list->FindDoor(124);
            $open_door->SetOpenType(80);
            $open_door->ForceOpen($npc);
            $open_door = $entity_list->FindDoor(125);
            $open_door->SetOpenType(78);
            $open_door->ForceOpen($npc);
            $open_door = $entity_list->FindDoor(126);
            $open_door->SetOpenType(79);
            $open_door->ForceOpen($npc);
            $open_door = $entity_list->FindDoor(127);
            $open_door->SetOpenType(81);
            $open_door->ForceOpen($npc);
            $open_door = $entity_list->FindDoor(128);
            $open_door->SetOpenType(80);
            $open_door->ForceOpen($npc);
            $open_door = $entity_list->FindDoor(129);
            $open_door->SetOpenType(78);
            $open_door->ForceOpen($npc);
            $open_door = $entity_list->FindDoor(130);
            $open_door->SetOpenType(79);
            $open_door->ForceOpen($npc);
            $open_door = $entity_list->FindDoor(131);
            $open_door->SetOpenType(81);
            $open_door->ForceOpen($npc);
            quest::depop();
        }
        if($instanceversion == 3) {
            #quest::ze(15, "Congdar Opening version 3 doors, bye.");
            #inner connecting doors
            my $open_door = $entity_list->FindDoor(144);
            $open_door->SetOpenType(80);
            $open_door->ForceOpen($npc);
            $open_door = $entity_list->FindDoor(145);
            $open_door->SetOpenType(78);
            $open_door->ForceOpen($npc);
            $open_door = $entity_list->FindDoor(146);
            $open_door->SetOpenType(79);
            $open_door->ForceOpen($npc);
            $open_door = $entity_list->FindDoor(147);
            $open_door->SetOpenType(81);
            $open_door->ForceOpen($npc);
            $open_door = $entity_list->FindDoor(156);
            $open_door->SetOpenType(80);
            $open_door->ForceOpen($npc);
            $open_door = $entity_list->FindDoor(157);
            $open_door->SetOpenType(78);
            $open_door->ForceOpen($npc);
            $open_door = $entity_list->FindDoor(158);
            $open_door->SetOpenType(79);
            $open_door->ForceOpen($npc);
            $open_door = $entity_list->FindDoor(159);
            $open_door->SetOpenType(81);
            $open_door->ForceOpen($npc);
            $open_door = $entity_list->FindDoor(160);
            $open_door->SetOpenType(80);
            $open_door->ForceOpen($npc);
            $open_door = $entity_list->FindDoor(161);
            $open_door->SetOpenType(78);
            $open_door->ForceOpen($npc);
            $open_door = $entity_list->FindDoor(162);
            $open_door->SetOpenType(79);
            $open_door->ForceOpen($npc);
            $open_door = $entity_list->FindDoor(163);
            $open_door->SetOpenType(81);
            $open_door->ForceOpen($npc);
            quest::depop();
        }
        if($instanceversion == 4) {
            #quest::ze(15, "Congdar Opening version 4 doors, bye.");
            #inner connecting doors
            my $open_door = $entity_list->FindDoor(176);
            $open_door->SetOpenType(80);
            $open_door->ForceOpen($npc);
            $open_door = $entity_list->FindDoor(177);
            $open_door->SetOpenType(78);
            $open_door->ForceOpen($npc);
            $open_door = $entity_list->FindDoor(178);
            $open_door->SetOpenType(79);
            $open_door->ForceOpen($npc);
            $open_door = $entity_list->FindDoor(179);
            $open_door->SetOpenType(81);
            $open_door->ForceOpen($npc);
            $open_door = $entity_list->FindDoor(188);
            $open_door->SetOpenType(80);
            $open_door->ForceOpen($npc);
            $open_door = $entity_list->FindDoor(189);
            $open_door->SetOpenType(78);
            $open_door->ForceOpen($npc);
            $open_door = $entity_list->FindDoor(190);
            $open_door->SetOpenType(79);
            $open_door->ForceOpen($npc);
            $open_door = $entity_list->FindDoor(191);
            $open_door->SetOpenType(81);
            $open_door->ForceOpen($npc);
            $open_door = $entity_list->FindDoor(192);
            $open_door->SetOpenType(80);
            $open_door->ForceOpen($npc);
            $open_door = $entity_list->FindDoor(193);
            $open_door->SetOpenType(78);
            $open_door->ForceOpen($npc);
            $open_door = $entity_list->FindDoor(194);
            $open_door->SetOpenType(79);
            $open_door->ForceOpen($npc);
            $open_door = $entity_list->FindDoor(195);
            $open_door->SetOpenType(81);
            $open_door->ForceOpen($npc);
            quest::depop();
        }
        if($instanceversion == 5) {
            #quest::ze(15, "Congdar Opening version 5 doors, bye.");
            #inner connecting doors
            my $open_door = $entity_list->FindDoor(208);
            $open_door->SetOpenType(80);
            $open_door->ForceOpen($npc);
            $open_door = $entity_list->FindDoor(209);
            $open_door->SetOpenType(78);
            $open_door->ForceOpen($npc);
            $open_door = $entity_list->FindDoor(210);
            $open_door->SetOpenType(79);
            $open_door->ForceOpen($npc);
            $open_door = $entity_list->FindDoor(211);
            $open_door->SetOpenType(81);
            $open_door->ForceOpen($npc);
            $open_door = $entity_list->FindDoor(220);
            $open_door->SetOpenType(80);
            $open_door->ForceOpen($npc);
            $open_door = $entity_list->FindDoor(221);
            $open_door->SetOpenType(78);
            $open_door->ForceOpen($npc);
            $open_door = $entity_list->FindDoor(222);
            $open_door->SetOpenType(79);
            $open_door->ForceOpen($npc);
            $open_door = $entity_list->FindDoor(223);
            $open_door->SetOpenType(81);
            $open_door->ForceOpen($npc);
            $open_door = $entity_list->FindDoor(224);
            $open_door->SetOpenType(80);
            $open_door->ForceOpen($npc);
            $open_door = $entity_list->FindDoor(225);
            $open_door->SetOpenType(78);
            $open_door->ForceOpen($npc);
            $open_door = $entity_list->FindDoor(226);
            $open_door->SetOpenType(79);
            $open_door->ForceOpen($npc);
            $open_door = $entity_list->FindDoor(227);
            $open_door->SetOpenType(81);
            $open_door->ForceOpen($npc);
            quest::depop();
        }
    }
}

