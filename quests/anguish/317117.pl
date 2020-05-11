## zone_status 317117##

my $lockout_bit;
my $instance_id = 0;
my @charid_list;
my $current_bit = 0;
my %Anguish_Lockouts;
my $AugsTotal = 0;
my $qblobalchecker = 0;
my $qblobalsetter = 0;

sub setup_lockouts {
	%Anguish_Lockouts = (
		317005 => ['Anguish_keldovan',  1,   Spawn_keldovan],
		317004 => ['Anguish_jelvan',    2,   Spawn_jelvan],
		317003 => ['Anguish_ture',      4,   Spawn_ture],
		317143 => ['Anguish_hanvar',    8,   Spawn_hanvar],
		317001 => ['Anguish_amv',       16,  PH_amv],
		317000 => ['Anguish_omm',       32,  Spawn_omm],
		1	   => ['Anguish_lower_orb', 64,  PH_lorb],
		2	   => ['Anguish_upper_orb', 128, PH_uorb],
		3	   => ['Anguish_augs'	  , 256, PH_augs]
	);
}

sub EVENT_SPAWN {
    $AugsTotal = 0;
    $qblobalchecker = 0;
    $qblobalsetter = 0;
    $instance_id = $instanceid;
    @charid_list = $entity_list->GetClientList();
    $qblobalsetter = $instance_id."_anguish_bit";
    $lockout_bit = $qglobals{$qblobalsetter};
    setup_lockouts();
    if(!defined($lockout_bit)) {
        $lockout_bit = 0;
        $current_bit = 0;
        Check_Player_Lockouts();
    }
    else {
        $current_bit = $lockout_bit;
        Check_Aug_Farming();
    }
    foreach my $id (keys %Anguish_Lockouts) {
        my $tmplkt = ($lockout_bit & $Anguish_Lockouts{$id}->[1]);
        if((($lockout_bit & $Anguish_Lockouts{$id}->[1]) == 0) && defined($Anguish_Lockouts{$id}->[2])) {
            $Anguish_Lockouts{$id}->[2]();
        }
    }
}

sub Check_Aug_Farming {
    my $PlayerLockout_Augs = 0;
    foreach(@charid_list) {
        my $Check_Aug_Lockout = $_->GetQGlobal("Anguish_augs");
        if(!$Check_Aug_Lockout) {
            if(!$PlayerLockout_Augs) {
                my $augbit = ($lockout_bit & $Anguish_Lockouts{3}->[1]);
                if($augbit != 0) {
                    $lockout_bit = ($lockout_bit ^ $Anguish_Lockouts{3}->[1]);
                    $current_bit = $lockout_bit;
                    $PlayerLockout_Augs = 1;
                }
            }
        }
    }
}

sub Check_Player_Lockouts {
    my $CheckPlayerLockout = 0;
    my $PlayerLockout_Keldovan = 0;
    my $PlayerLockout_Jelvan = 0;
    my $PlayerLockout_Ture = 0;
    my $PlayerLockout_AMV = 0;
    my $PlayerLockout_OOM = 0;
    my $PlayerLockout_Lower_Orb = 0;
    my $PlayerLockout_Upper_Orb = 0;
    foreach(@charid_list) {
        my $checklockout = $_->GetQGlobal("Anguish_keldovan");
        if($checklockout) {
            if(!$PlayerLockout_Keldovan) {
                $lockout_bit = $Anguish_Lockouts{317005}->[1];
                $current_bit = ($current_bit | $lockout_bit);
                $PlayerLockout_Keldovan = 1;
            }
            $checklockout = 0;
        }
        $checklockout = $_->GetQGlobal("Anguish_jelvan");
        if($checklockout) {
            if(!$PlayerLockout_Jelvan) {
                $lockout_bit = $Anguish_Lockouts{317004}->[1];
                $current_bit = ($current_bit | $lockout_bit);
                $PlayerLockout_Jelvan = 1;
            }
            $checklockout = 0;
        }
        $checklockout = $_->GetQGlobal("Anguish_ture");
        if($checklockout) {
            if(!$PlayerLockout_Ture) {
                $lockout_bit = $Anguish_Lockouts{317003}->[1];
                $current_bit = ($current_bit | $lockout_bit);
                $PlayerLockout_Ture = 1;
            }
            $checklockout = 0;
        }
        $checklockout = $_->GetQGlobal("Anguish_hanvar");
        if($checklockout) {
            if(!$PlayerLockout_AMV) {
                $lockout_bit = $Anguish_Lockouts{317143}->[1];
                $current_bit = ($current_bit | $lockout_bit);
                $PlayerLockout_AMV = 1;
            }
            $checklockout = 0;
        }
        $checklockout = $_->GetQGlobal("Anguish_amv");
        if($checklockout) {
            if(!$PlayerLockout_OOM) {
                $lockout_bit = $Anguish_Lockouts{317001}->[1];
                $current_bit = ($current_bit | $lockout_bit);
                $PlayerLockout_OOM = 1;
            }
            $checklockout = 0;
        }
        $checklockout = $_->GetQGlobal("Anguish_omm");
        if($checklockout) {
            if(!$PlayerLockout_Keldovan) {
                $lockout_bit = $Anguish_Lockouts{317109}->[1];
                $current_bit = ($current_bit | $lockout_bit);
                $PlayerLockout_Keldovan = 1;
            }
            $checklockout = 0;
        }
        $checklockout = $_->GetQGlobal("Anguish_lower_orb");
        if($checklockout) {
            if(!$PlayerLockout_Lower_Orb) {
                $lockout_bit = $Anguish_Lockouts{1}->[1];
                $current_bit = ($current_bit | $lockout_bit);
                $PlayerLockout_Lower_Orb = 1;
            }
            $checklockout = 0;
        }
        $checklockout = $_->GetQGlobal("Anguish_upper_orb");
        if($checklockout) {
            if(!$PlayerLockout_Upper_Orb) {
                $lockout_bit = $Anguish_Lockouts{2}->[1];
                $current_bit = ($current_bit | $lockout_bit);
                $PlayerLockout_Upper_Orb = 1;
            }
            $checklockout = 0;
        }
    }
    $lockout_bit = $current_bit;
}

sub Spawn_keldovan {
    # Keldovan_the_Harrier
    quest::unique_spawn(317005, 0 , 0, -285, 700, -202, 70);
}

sub Spawn_jelvan {
    # Jelvan
    quest::unique_spawn(317004, 0, 0, -256, 2116, -123, 4);
}

sub Spawn_ture {
    # Ture
    quest::unique_spawn(317003, 0, 0, 598, 3384, -13, 134);
}

sub Spawn_hanvar {
    # Warden_Hanvar
    quest::unique_spawn(317143, 0, 0, 427, 4389, 222, 70);
}

sub PH_amv {
}

sub Spawn_omm {
    # always spawn AMV if OMM is up.  AMV only drops chest on the first kill
    #Arch_Magus_Vangl
	quest::unique_spawn(317001, 9, 0, 366, 4886, 278, 0);
    # Overlord_Mata_Muram
	quest::spawn2(317000, 0, 0, 507, 4969, 294, 128);
}

sub PH_lorb {
}

sub PH_uorb {
}

sub PH_augs {
}

sub Check_lorb {
	$spawn_orb = 0;
    $dbgTmp1 = ($current_bit & 64);
	if(($current_bit & 64) == 0) {
        $dbgTmp1 = ($current_bit & 1);
        $dbgTmp1 = ($current_bit & 2);
        if((($current_bit & 1) == 1) && (($current_bit & 2) == 2)) {
            $spawn_orb = 1;
        }
		if($spawn_orb == 1) {
			AddLockout($Anguish_Lockouts{1});
            if($_[0] eq "Anguish_keldovan") {
                # Orb_of_Discordant_Energy
                quest::spawn2(317087, 0, 0, -301 ,702, -201, 0);
            }
            elsif ($_[0] eq "Anguish_jelvan") {
                $Keepsake = $entity_list->GetMobByNpcTypeID(317111);
                if($Keepsake) {
                    # Globe_of_Discordant_Energy
                    $Keepsake->CastToNPC()->AddItem(47100, 1);
                }
            }
        }
    }
}

sub Check_uorb {
    $spawn_orb = 0;
    $dbgTmp1 = ($current_bit & 128);
	if(($current_bit & 128) == 0) {
        $dbgTmp1 = ($current_bit & 4);
        $dbgTmp1 = ($current_bit & 8);
        if((($current_bit & 4) == 4) && (($current_bit & 8) == 8)) {
            $spawn_orb = 1;
        }
        if($spawn_orb == 1) {
            AddLockout($Anguish_Lockouts{2});
            if($_[0] eq "Anguish_ture") {
                # Orb_of_Discordant_Energy
                quest::spawn2(317087, 0, 0, 610, 3381, -12, 0);
            }
			elsif($_[0] eq "Anguish_hanvar") {
                # Orb_of_Discordant_Energy
                quest::spawn2(317087, 0, 0, 488, 4382, 208, 0);
            }
        }
    }
}

sub Check_amv_chest {
    $dbgTmp1 = ($current_bit & 16);
    if(($current_bit & 16) == 0) {
        my $bitor1 = ($current_bit | 16);
        $current_bit = $bitor1;
        quest::setglobal($qblobalsetter, $bitor1, 7, "H6");
        foreach(@charid_list) {
            my $id1 = $_->CharacterID();
            quest::targlobal("Anguish_amv", "388800", "H108", 0, $id1, 0);
		}
        # Ornate_Chest
        my $chest_x = 0;
        my $chest_y = 0;
        my $chest_z = 0;
        @amv_corpse = $entity_list->GetCorpseList();
        foreach(@amv_corpse) {
            my $lastpos = rindex($_->GetName(), "#Arch", 4);
            if($lastpos != (-1)) {
                $chest_x = $_->GetX();
                $chest_y = $_->GetY();
                $chest_z = $_->GetZ();
                last;
            }
        }
        quest::unique_spawn(317112, 0, 0, $chest_x, $chest_y, $chest_z, 0);
    }
}

sub Spawn_augs {
	my $rolled_mob = 0;
	my $num_mob = 0;
	my @mob_list;
	my $num_to_spawn = 0;
	my $mob_in_list = 0;

    %list_named = (
        0 => [317094, 'Grenlok_the_Converter',   3,     1632,   -204,  130],
        1 => [317105, 'Vilria_the_Keeper',       196,   702,    -202,  196],
        2 => [317106, 'Damlin_Lingering_Charge', 354,   3815,   140,   191],
        3 => [317078, 'First_Lieutenant_Minas',  500,   4528,   210,   100],
        4 => [317077, 'Administrator_Charial',   20,    3816,   139,   66 ]
	);

    my $diceroll = (1 + int(rand(100)));
    if($diceroll > 80) {
        $num_to_spawn = 4;
    }
	elsif($diceroll > 60) {
        $num_to_spawn = 5;
    }
	elsif($diceroll > 40) {
        $num_to_spawn = 6;
    }
	else {
        $num_to_spawn = 1;
    }

    # Since $num_mob starts at 0 we get +1 for 5 Max spawns
    while($num_mob < $num_to_spawn) {
        my $randAugs = int(rand(5));
        $rolled_mob = $list_named{$randAugs}->[0];
        $mob_in_list = 0;

        foreach my $v3 (@mob_list) {
            if($v3 eq $rolled_mob) {
                $mob_in_list = 1;
            }
        }

        if($mob_in_list == 0) {
            $mob_list[$num_mob] = $rolled_mob;
            $num_mob = $num_mob + 1;
        }
    }
	
	my $grid;
    for($i=0; $i<5; $i++) {
		$mob_in_list = 0;
        foreach my $v4 (@mob_list) {
            if($v4 eq $list_named{$i}->[0]) {
                $mob_in_list = 1;
            }
        }
		
		if($i == 3) {
            $grid = 19;
        }
        else {
            $grid = 0;
        }
		
		if($mob_in_list == 1) {
            quest::spawn2($list_named{$i}->[0], $grid, 0, $list_named{$i}->[2], $list_named{$i}->[3], $list_named{$i}->[4], $list_named{$i}->[5]);
        }
        else {
            # #a_lightning_warrior_commander (317076) is placeholder
			quest::spawn2(317076, $grid, 0, $list_named{$i}->[2], $list_named{$i}->[3], $list_named{$i}->[4], $list_named{$i}->[5]);
        }
    }
}

sub AddLockout {
	my $lockout_name = $_[0][0];
	my $lockout_bit = $_[0][1];
	my $lockout_duration;
    my $lockout_end_time;
	if($lockout_name eq "Anguish_augs") {
        $lockout_duration = "H2";
        $lockout_end_time = "7200";
    }
	else {
        $lockout_duration = "H108";
        $lockout_end_time = "388800";
    }
	# you cant blanket assign a lockout to AMV
	if($lockout_name eq "Anguish_amv") {
		Check_amv_chest();
    }
	else {
        my $bitor2 = ($current_bit | $lockout_bit);
        $current_bit = $bitor2;
        quest::setglobal($qblobalsetter, $bitor2, 7, "H6");
        foreach(@charid_list) {
            my $id2 = $_->CharacterID();
            quest::targlobal($lockout_name, $lockout_end_time, $lockout_duration, 0, $id2, 0);
        }

		#--wait til after lockouts set to spawn in case of crash, etc
		if($lockout_name eq "Anguish_augs") {
			Spawn_augs();
        }
		elsif(($lockout_name eq "Anguish_keldovan") || ($lockout_name eq "Anguish_jelvan")) {
			Check_lorb($lockout_name);
        }
		elsif(($lockout_name eq "Anguish_ture") || ($lockout_name eq "Anguish_hanvar")) {
			Check_uorb($lockout_name);
        }
    }
}

sub AugsCounter {
    $AugsTotal = $AugsTotal + 1;
    if($AugsTotal == 95) {
        AddLockout($Anguish_Lockouts{3});
        quest::ze(15, "The walls of the castle tremble for a moment. Your interference has notified Mata Muram's lieutenants to your presence.");
    }
}

sub EVENT_SIGNAL {
    if($signal == 666) {
        AugsCounter();
    }
    elsif($Anguish_Lockouts{$signal}) {
        AddLockout($Anguish_Lockouts{$signal});
    }
}

