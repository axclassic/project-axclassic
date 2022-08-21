#phase_trigger script phase2_trigger (223191) This is required for signals for phase 2

my $IIcounter = 1;
my $groupboss = 1;

sub EVENT_SPAWN {
    $IIcounter = 1;
    $groupboss = 1;

    #flavor triggers invisible _ 223111.pl
    quest::signalwith(223111, 1001, 2000);
    #spawning phase 2's 1st group no boss
    #Earth group using #earth_counter (223178)
    quest::spawn2(223178,0,0,-129.6,1720,547,0);
    #Air group using #air_counter.pl
    quest::spawn2(223179,0,0,-129.6,1720,547,0);
    #Water group using #water_counter.pl
    quest::spawn2(223181,0,0,-129.6,1720,547,0);
    #Fire group using #fire_counter.pl
    quest::spawn2(223182,0,0,-129.6,1720,547,0);
    #Undead group using #undead_counter.pl
    quest::spawn2(223180,0,0,-129.6,1720,547,0);
}

sub EVENT_SIGNAL {
    if($signal == 14034) {
        quest::ze(15, "Congdar Phase2 signal is groupboss $groupboss of 7.");
        #keeps track of group mob #1
        $groupboss = $groupboss + 1;
    }

    if($groupboss >= 8) {
        quest::ze(15, "Congdar Phase2 count is 7 of 7, spawn 5 bosses.");
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
        $groupboss = 1;
    }

    #This signal keeps track of the groups dead to open inner doors
    if($signal == 14035) {
        quest::ze(15, "Congdar Phase2 signal is IIcounter $IIcounter of 5.");
        #phase 2 boss signals
        #quest::ze(15, "Mob+boss earth grp for phase 2 is dead, door should open!");
        $IIcounter = $IIcounter + 1;
        #quest::ze(15, "testing signal 14035 and counter is $savedc2.");
    }

    if($IIcounter >= 6) {
        quest::ze(15, "Congdar Phase2 count is 5 of 5, shake the world, open doors, spawn phase3_trigger.");
        #Inner doors open!
        #Worlwide camera shake
        $npc->CameraEffect(3000, 6, 0, 1);
        quest::settimer("twoopens", 5);
        #triggers phase3_trigger.pl
        quest::spawn2(223154,0,0,-129.6,1720,547,0);
        $IIcounter = 1;
    }
}

sub EVENT_TIMER {
    if($timer eq "twoopens") {
        quest::ze(15, "Congdar Opening doors, bye.");
        #inner connecting doors
        my $open_door = $entity_list->FindDoor(13);
        $open_door->ForceOpen($npc);
        $open_door = $entity_list->FindDoor(14);
        $open_door->ForceOpen($npc);
        $open_door = $entity_list->FindDoor(15);
        $open_door->ForceOpen($npc);
        $open_door = $entity_list->FindDoor(16);
        $open_door->ForceOpen($npc);
        $open_door = $entity_list->FindDoor(33);
        $open_door->ForceOpen($npc);
        $open_door = $entity_list->FindDoor(34);
        $open_door->ForceOpen($npc);
        $open_door = $entity_list->FindDoor(35);
        $open_door->ForceOpen($npc);
        $open_door = $entity_list->FindDoor(36);
        $open_door->ForceOpen($npc);
        $open_door = $entity_list->FindDoor(38);
        $open_door->ForceOpen($npc);
        $open_door = $entity_list->FindDoor(39);
        $open_door->ForceOpen($npc);
        $open_door = $entity_list->FindDoor(40);
        $open_door->ForceOpen($npc);
        $open_door = $entity_list->FindDoor(41);
        $open_door->ForceOpen($npc);
        quest::depop();
    }
}

