# phase_trigger script npcid - 223191 This is required for signals for phase 2

my $IIcounter = 0;
my $groupboss = 0;
my $savedc2 = 0;
my $savedg = 0;

sub EVENT_ZONE { #when zoning out, counters must be reset!
    $savedg = 0;
	$savedc2 = 0;
	$IIcounter = 0;
	$groupboss = 0;
}

sub EVENT_SPAWN {
    # $IIacounter = 0;
	quest::signalwith(223111,1001,0); #flavor triggers invisible _ 223111.pl
    #spawning phase 2's 1st group no boss
    #Earth group using #earth_counter.pl
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
		#keeps track of group mob #1
		$groupboss += 1;
		$savedg = $groupboss;
	}

    if($groupboss == 5) {
		quest::spawn2(223169,0,0,-129.6,1720,547,0); #earth boss group
		quest::spawn2(223170,0,0,-129.6,1720,547,0); #air boss group
		quest::spawn2(223171,0,0,-129.6,1720,547,0); #undead boss group
		quest::spawn2(223172,0,0,-129.6,1720,547,0); #water boss group
		quest::spawn2(223173,0,0,-129.6,1720,547,0); #fire boss group
		quest::ze(15, "You are now halfway through phase 2.");
		$groupboss = 0;
	}

    #This signal keeps track of the groups dead to open inner doors
	if($signal == 14035) {
		#phase 2 boss signals
        #quest::ze(15, "Mob+boss earth grp for phase 2 is dead, door should open!");
		$IIcounter += 1;
		$savedc2 = $IIcounter;
        #quest::ze(15, "testing signal 14035 and counter is $savedc2.");
	}

    if($IIcounter == 5) {
		#Inner doors open!
		$npc->CameraEffect(3000, 6, 0, 1); #Worlwide camera shake
        ##quest::we is bugged
        ##quest::we(14, "Congratulations to $name! Phase 2 has been completed, move through the clock door to phase 3.");
        #inner connecting doors
		quest::forcedooropen(13); #connecting door water and fire lower right panel
		quest::forcedooropen(14); # upper right
		quest::forcedooropen(15); # upper left
		quest::forcedooropen(16); # lower left
		quest::forcedooropen(33); #undead subdoor lower right panel
		quest::forcedooropen(34); # upper right
		quest::forcedooropen(35); # upper left
		quest::forcedooropen(36); # lower left
		quest::forcedooropen(38); #connecting door earth and air lower right panel
		quest::forcedooropen(39); # upper right
		quest::forcedooropen(40); # upper left
		quest::forcedooropen(41); # lower left
		quest::settimer("twoopens",20); #20 seconds
		quest::spawn2(223154,0,0,-129.6,1720,547,0); #triggers phase3_trigger.pl
		$IIcounter = 0;
        #quest::depop();#depops phase2_trigger
        #quest::stoptimer($timer); #repop resets everything anyway
        #quest::starttimer("closealld",1);
	}
}

sub EVENT_TIMER {
	if($timer eq "twoopens") {
        #inner connecting doors
        quest::stoptimer("twoopens");
		quest::forcedooropen(13); #connecting door water and fire lower right panel
		quest::forcedooropen(14); # upper right
		quest::forcedooropen(15); # upper left
		quest::forcedooropen(16); # lower left
		quest::forcedooropen(33); #undead subdoor lower right panel
		quest::forcedooropen(34); # upper right
		quest::forcedooropen(35); # upper left
		quest::forcedooropen(36); # lower left
		quest::forcedooropen(38); #connecting door earth and air lower right panel
		quest::forcedooropen(39); # upper right
		quest::forcedooropen(40); # upper left
		quest::forcedooropen(41); # lower left
	}
}

