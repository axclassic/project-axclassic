## Jelvan ##

my $hear = quest::saylink("hear", 1);
my $help = quest::saylink("help", 1);
my $event_started = 0;
my $tanthi_aggro = 0;
my $tantho_aggro = 0;
my $tanthu_aggro = 0;
my $depopping = 0;

sub EVENT_SPAWN {
    $event_started = 0;
}

sub EVENT_SAY {
    if($text=~/Hail/i) {
        quest::emote(" grabs his head in pain. 'The voices. Make them stop. My thoughts are my own! You will not break me! Shhh. Can you [ $hear ] them?");
    }
    elsif($text=~/hear/i) {
		quest::say("The tormentors. They are trying to break me. They want me to be one of them. They want my power. You must [ $help ] me. You must destroy them.");
    }
    elsif($text=~/help/i) {
		quest::say("They must be killed! They... Can you here them? They are coming close. I will help you while I can, but I can already feel their taint seeping into my bones");
		$event_started = 1;
		$depopping = 1;
		$tanthi_aggro = 0;
		$tantho_aggro = 0;
		$tanthu_aggro = 0;
        # -- NPC: Tanthi_the_Tormentor
		quest::unique_spawn(317099,0,0, -174, 2152, -149, 334);
        # -- NPC: Tantho_the_Tormentor
		quest::unique_spawn(317100,0,0, -341, 2152, -149, 154);
        # -- NPC: Tanthu_the_Tormentor
		quest::unique_spawn(317101,0,0, -252, 2008, -149, 0);
		quest::settimer("check_event", 1);
		quest::settimer("balance", 60);
		quest::settimer("depop_event", 15);
    }
}

sub EVENT_TIMER {
	if($timer eq "check_event") {
        my $torment_alive = 0;
        if($entity_list->GetMobByNpcTypeID(317099)) {
            $torment_alive = $torment_alive + 1;
        }
		else {
            $tanthi_aggro = 0;
        }
        if($entity_list->GetMobByNpcTypeID(317100)) {
            $torment_alive = $torment_alive + 1;
        }
		else {
            $tantho_aggro = 0;
        }
        if($entity_list->GetMobByNpcTypeID(317101)) {
            $torment_alive = $torment_alive + 1;
        }
        else {
            $tanthu_aggro = 0;
        }
        if($torment_alive == 0) {
            # --Jelvan`s_Keepsake (317111)
			quest::unique_spawn(317111, 0, 0, $x, $y, $z, 0);
			quest::ze(15, "You hear Jelvan's shouts of gratitude as he runs into the shadows.");
            #--set player lockout
            #--chance to spawn 2.0 orb, if so set zone lockout for "bottom orb"
            quest::signalwith(317117 , 317004);
            $event_started = 0;
            quest::depop();
        }
        elsif($torment_alive == 1) {
            quest::stoptimer("balance");
        }
        elsif(($tanthi_aggro == 0) && ($tantho_aggro == 0) && ($tanthu_aggro == 0) && ($depopping == 0)) {
            quest::starttimer("depop_event", 15);
            $depopping = 1;
        }
        elsif(($tanthi_aggro == 1) || ($tantho_aggro == 1) || ($tanthu_aggro == 1)) {
            quest::stoptimer("depop_event");
            $depopping = 0;
        }
    }
	elsif($timer eq "depop_event") {
        if(($tanthi_aggro == 0) && ($tantho_aggro == 0) && ($tanthu_aggro == 0) && ($depopping == 1)) {
            quest::stoptimer("depop_event");
			quest::stoptimer("check_event");
			quest::stoptimer("balance");
			quest::depopall(317099);
			quest::depopall(317100);
			quest::depopall(317101);
			$event_started = 0;
        }
    }
	elsif(($timer eq "balance") && (($tanthi_aggro == 1) || ($tantho_aggro == 1) || ($tanthu_aggro == 1))) {
        my $tanthi_hp = 100;
		my $tantho_hp = 100;
		my $tanthu_hp = 100;
		my $tanth_io = 1;
		my $tanth_iu = 1;
		my $tanth_ou = 1;
		my $tanthi_alive = 0;
		my $tantho_alive = 0;
		my $tanthu_alive = 0;
		my $lowest_hp = 100;
		my $lowest_npc = 0;
		#--if alive get hp and see who is lowest
        my $tanthiSpawned = $entity_list->GetMobByNpcTypeID(317099);
		if($tanthiSpawned) {
			$tanthi_alive = 1;
			$tanthi_hp = $tanthiSpawned->GetHPRatio();
			$lowest_hp = $tanthi_hp;
			$lowest_npc = 317099;
        }
        my $tanthoSpawned = $entity_list->GetMobByNpcTypeID(317100);
		if($tanthoSpawned) {
            $tantho_alive = 1;
            $tantho_hp = $tanthoSpawned->GetHPRatio();
            if($tantho_hp < $lowest_hp) {
                $lowest_hp = $tantho_hp;
                $lowest_npc = 317100;
            }
        }
        my $tanthuSpawned = $entity_list->GetMobByNpcTypeID(317101);
        if($tanthuSpawned) {
            $tanthu_alive = 1;
            $tanthu_hp = $tanthuSpawned->GetHPRatio();
            if($tanthu_hp < $lowest_hp) {
                $lowest_hp = $tanthu_hp;
                $lowest_npc = 317101;
            }
        }
        #--check alive mobs to see if any are out of balance
        if(($tanthi_alive == 1) && ($tantho_alive == 1)) {
            if(abs($tanthi_hp - $tantho_hp) > 5.0) {
                $tanth_io = 0;
            }
        }
		if(($tanthi_alive == 1) && ($tanthu_alive == 1)) {
            if(abs($tanthi_hp - $tanthu_hp) > 5.0) {
                $tanth_iu = 0;
            }
        }
        if(($tantho_alive == 1) && ($tanthu_alive == 1)) {
            if(abs($tantho_hp - $tanthu_hp) > 5.0) {
                $tanth_ou = 0;
            }
        }
        #--if out of balance send lowest_npc signal to call for helps
        if(($tanth_io == 0) || ($tanth_iu == 0) || ($tanth_ou == 0)) {
            my $local_npc = $entity_list->GetMobByNpcTypeID($lowest_npc);
            if($local_npc) {
                $local_npc->Emote(" calls for Jelvan's assistance as the balance tips.");
                if($lowest_npc == 317099) {
                    quest::signalwith(317099, 3170991);
                }
                elsif($lowest_npc == 317100) {
                    quest::signalwith(317100, 3171001);
                }
                elsif($lowest_npc == 317101) {
                    quest::signalwith(317101, 3171011);
                }
            }
            quest::shout("My power is theirs...I'm sorry, I cannot... fight... them...");
        }
        #--in balance
		else {
            quest::shout("Here you go! This should help!");
            quest::signalwith(317099, 3170990);
            quest::signalwith(317100, 3171000);
            quest::signalwith(317101, 3171010);
            my $spellCaster = $entity_list->GetMobByNpcTypeID(317099);
            my $spellTarget = 0;
            if($spellCaster) {
                $spellTarget = $spellCaster->GetTarget();
                if($spellTarget) {
                    $dbgTargetName = $spellTarget->GetCleanName();
                }
            }
            if($spellTarget) {
                # -- Spell: Blessing of Jelvan
                $npc->SendBeginCast(5674, 0);
                quest::castspell(5674, $spellTarget->GetID());
            }

            $spellCaster = $entity_list->GetMobByNpcTypeID(317100);
            $spellTarget = 0;
            $dbgTargetName = 0;
            if($spellCaster) {
                $spellTarget = $spellCaster->GetTarget();
                if($spellTarget) {
                    $dbgTargetName = $spellTarget->GetCleanName();
                }
            }
            if($spellTarget) {
                # -- Spell: Blessing of Jelvan
                $npc->SendBeginCast(5674, 0);
                quest::castspell(5674, $spellTarget->GetID());
            }

            $spellCaster = $entity_list->GetMobByNpcTypeID(317101);
            $spellTarget = 0;
            if($spellCaster) {
                $spellTarget = $spellCaster->GetTarget();
                if($spellTarget) {
                    $dbgTargetName = $spellTarget->GetCleanName();
                }
            }
            if($spellTarget) {
                # -- Spell: Blessing of Jelvan
                $npc->SendBeginCast(5674, 0);
                quest::castspell(5674, $spellTarget->GetID());
            }
		}
	}
}

sub EVENT_SIGNAL {
    if($signal == 3170990) {
        $tanthi_aggro = 0;
    }
    if($signal == 3170991) {
        $tanthi_aggro = 1;
    }
    if($signal == 3171000) {
        $tantho_aggro = 0;
    }
    if($signal == 3171001) {
        $tantho_aggro = 1;
    }
    if($signal == 3171010) {
        $tanthu_aggro = 0;
    }
    if($signal == 3171011) {
        $tanthu_aggro = 1;
    }
}

