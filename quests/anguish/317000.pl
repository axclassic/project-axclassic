## This is the final encounter in the Asylum of Anguish raid expedition.  #Overlord_Mata_Muram (317000) becomes active once Arch Magus Vangl is dead. ##

my $banished_raid = 0;
my $banished_hp = 30;
my $reenable_summon = 0;
my $reset_countdown = 0;
my $GazeTarget = 0;
my $GazeTargetID = 0;
my $BuzzTarget = 0;
my $event_started = 0;
my $worlds = quest::saylink("worlds", 1);

sub EVENT_SPAWN {
    if($banished_raid) {
        quest::settimer("reset", 3600);
        quest::settimer("banish_phase2", 5);
        # --sitting
        $npc->SetAppearance(1);
        quest::modifynpcstat("hp_regen", "0");
        $npc->SetHP($banished_hp);
        $reenable_summon = 1;
        quest::modifynpcstat("special_attacks", "ERQMCNIDf");
    }
	else {
        $npc->SetHP($npc->GetMaxHP());
        $banished_raid = 0;
        $reenable_summon = 0;
        $GazeTarget = 0;
        $GazeTargetID = 0;
        $BuzzTarget = 0;
        $event_started = 0;
        $reset_countdown = 0;
        $banished_hp = 30;
        # --sitting
        $npc->SetAppearance(1);
        quest::modifynpcstat("special_attacks", "SERQMCNIDABfWOH");
	}
}

sub EVENT_SAY {
    if($event_started == 0) {
        if($text=~/Hail/i) {
            quest::say("So. You are the mighty god killers. I am not surprised you managed to make it this far. I did expect there to be more of you, do you really think so little of me? I have destroyed [ $worlds ] where animals roam with power that would cause your gods to tremble.");
        }
        if($text=~/worlds/i) {
            my $amv_up = $entity_list->GetMobByNpcTypeID(317001);
            if(!$amv_up) {
                # -- if amv is up, ignore hails
                quest::say("You would have made fine additions to my army, were you not so willful. Prepare yourself for power beyond your greatest nightmares.");
                $event_started = 1;
                $reset_countdown = 0;
                $banished_raid = 0;
                $banished_hp = 30;
                quest::setnexthpevent(80);
                quest::modifynpcstat("special_attacks", "SERQMCNIDf");
                my $random_raid_member = $client->GetRandomBotRaidMember();
                if($random_raid_member) {
                    $npc->AddToHateList($random_raid_member, 100);
                }
            }
        }
    }
}

sub EVENT_HP {
	if($hpevent == 80) {
        quest::ze(13, "Roaring laughter fills the room, 'Is this what you've come here to show me? You hope to defeat an ancient warrior with this miserable display of force?'");
        quest::setnexthpevent(70);
        $npc->CameraEffect(1000, 4);
    }
	elsif($hpevent == 70) {
        my @now_raid = $npc->GetHateList();
        quest::shout("I can taste your fear. You know the hand of death approaches.");
        quest::setnexthpevent(50);
        $npc->CameraEffect(1000, 4);
        my $picks_left = 10;
        my $num_left = @now_raid;
        my @result;
        my $idx = 0;
        while($picks_left > 0) {
            my $rand = int(rand($num_left));
            if($rand < $picks_left) {
                push(@result, $now_raid->[$idx]);
                $picks_left--;
            }
            $num_left--;
            $idx++;
        }
        foreach(@result) {
            if($_) {
                my $SpellTarget = $_->GetEnt();
                if($SpellTarget) {
                    # Spell: Mark of Death
                    $npc->SendBeginCast(5684, 0);
                    quest::castspell(5684, $SpellTarget->GetID());
                    if($SpellTarget->IsClient()) {
                        $SpellTarget->Message(15, "You feel the cold grip of death looming over you.");
                    }
                }
            }
        }
        quest::settimer("check_mark", 15);
    }
	elsif($hpevent == 50) {
        quest::shout("I will adorn the Gates of Anguish with the corpses of your dead.");
        quest::setnexthpevent(30);
        # a_languished_convert (317110)
        quest::spawn2(317110, 0, 0, 331, 4961, 278, 128);
        quest::spawn2(317110, 0, 0, 505, 4792, 278, 384);
        quest::signal(317110, 2);
    }
    elsif($hpevent == 30) {
        $npc->CameraEffect(2000, 3);
        quest::modifynpcstat("special_attacks", "MCIDH");
        #$npc->GMMove(507, 4969, 294, 128);
        $npc->WipeHateList();
		$npc->SetAppearance(1);
        # --#Vyishe (317134)
        quest::spawn2(317134, 0, 0, 504, 4923, 292, 0);
        # --#Anishy (317136)
		quest::spawn2(317136, 0, 0, 504, 5013, 292, 128);
        # --#Piraand (317002)
		quest::spawn2(317002, 0, 0, 461, 4965, 292, 64);
        # --#Garishi (317103)
		quest::spawn2(317103, 0, 0, 546, 4970, 292, 192);
        # -- NPC: #Vyishe
		quest::signal(317134);
        # -- NPC: #Anishy
		quest::signal(317136);
        # --Coerced_Lieutenant
        quest::depopall(317114);
        # --Frenzied_Lasher
        quest::depopall(317133);
		quest::stoptimer("torment");
		quest::stoptimer("pick6");
		quest::stoptimer("buzz");
		quest::stoptimer("buzz_spawn");
		quest::stoptimer("mmgaze");
		quest::settimer("banish", 60);
		quest::settimer("banish_hp_watch", 1);
	}		
}

sub EVENT_COMBAT {
    if($npc->IsEngaged()) {
        quest::stoptimer("reset");
        # --standing
		$npc->SetAppearance(0);
        quest::modifynpcstat("hp_regen", "10000");
        quest::modifynpcstat("special_attacks", "SERQMCNIDf");
		quest::settimer("buzz", (25 + int(rand(31))));
		quest::settimer("mmgaze", (45 + int(rand(31))));
		quest::settimer("torment", (10 + int(rand(11))));
		quest::settimer("pick6", 50);
        # -- Coerced_Lieutenant
		quest::spawn2(317114, 0, 0, 378, 4969, 279, 128);
		quest::spawn2(317114, 0, 0, 618, 4969, 279, 384);
        quest::settimer("coerced", 10);
		if($reenable_summon) {
            quest::settimer("enable_summon", 10);
		}
    }
    else {
		quest::settimer("reset", 30);
		quest::stoptimer("buzz");
		quest::stoptimer("torment");
		quest::stoptimer("pick6");
		quest::stoptimer("mmgaze");
    }
}

sub EVENT_TIMER {
    my $SpellTarget = 0;
    my @now_raid = $npc->GetHateList();
    my @clickup_clients = $entity_list->GetClientList();
	if($timer eq "torment") {
        $npc->SendBeginCast(5682, 0);
        $SpellTarget = $npc->GetHateRandom();
        if($SpellTarget) {
            # --Torment of Body
            $npc->SendBeginCast(5676, 0);
            quest::castspell(5676, $SpellTarget->GetID());
        }
		quest::settimer("torment", (60 + int(rand(7))));
    }
    elsif($timer eq "coerced") {
        quest::stoptimer("coerced");
        quest::signal(317114);
    }
	elsif($timer eq "pick6") {
        $SpellTarget = $npc->GetTarget();
        if($SpellTarget) {
            # Spell: Gaze of Anguish (5680)
            # Spell: Touch of Anguish (5679)
            # Spell: Wail of Anguish (5678)
            # Spell: Void of Suppression (5677)
            # Spell: Torment of Body (5676)
            # Spell: Relinquish Spirit (5675)
            my $RandomSpell = quest::ChooseRandom(5675, 5676, 5677, 5678, 5679, 5680);
            $npc->SendBeginCast($RandomSpell, 0);
            quest::castspell($RandomSpell, $SpellTarget->GetID());
        }
    }
	elsif($timer eq "check_mark") {
        foreach(@now_raid) {
            if($_) {
                if($_->GetEnt()->FindBuff(5684)) {
                    # Spell: Cazic Touch
                    $npc->SendBeginCast(982, 0);
                    quest::castspell(982, $_->GetEnt()->GetID());
                }
            }
        }
		quest::stoptimer("check_mark");
    }
	elsif($timer eq "mmgaze") {
		quest::settimer("mmgaze", 70);
        foreach(@now_raid) {
            if($_) {
                $GazeTarget = $_->GetEnt();
                if($GazeTarget) {
                    quest::ze(15, "Mata Muram fixes his gaze on one of your companions.");
                    if($GazeTarget->IsClient()) {
                        $GazeTarget->Message(6, "You feel a gaze of deadly power focusing on you.");
                        $GazeTargetID = 0;
                    }
                    else {
                        $GazeTargetID = $GazeTarget->GetNPCTypeID();
                    }
                    quest::settimer("mmgaze_cast", 10);
                    quest::settimer("mmgaze_reflect", 5);
                    last;
                }
            }
        }
    }
    elsif($timer eq "mmgaze_reflect") {
        if($npc->FindBuff(5685)) {
            quest::stoptimer("mmgaze_reflect");
            quest::ze(15, "Mata Muram grows weak as he is afflicted with his own magic.");
            quest::settimer("mmgaze_reflect2", 2);
        }
    }
    elsif($timer eq "mmgaze_reflect2") {
        quest::stoptimer("mmgaze_reflect2");
        quest::ze(15, "Mata Muram roars in anger, 'You dare use my own magic against me?!'");
        quest::settimer("mmgaze_reflect3", 15);
    }
    elsif($timer eq "mmgaze_reflect3") {
        quest::stoptimer("mmgaze_reflect3");
        quest::ze(15, "Mata Muram shakes off the effects of his affliction.");
    }
    elsif($timer eq "mmgaze_cast") {
        if($GazeTargetID != 0) {
            $GazeTarget = $entity_list->GetMobByNpcTypeID($GazeTargetID);
        }
        if($GazeTarget) {
            $targetName = $GazeTarget->GetCleanName();
            if($targetName) {
                quest::emote(" fixes his gaze on $targetName");
                # Spell: Mata Muram's Gaze
                $npc->SendBeginCast(5685, 0);
                quest::castspell(5685, $GazeTarget->GetID());
                $GazeTarget = 0;
                $targetName = 0;
            }
        }
    }
	elsif($timer eq "buzz") {
        quest::settimer("buzz", 55);
        foreach(@now_raid) {
            if($_) {
                $BuzzTarget = $_->GetEnt();
                if($BuzzTarget) {
                    quest::ze(15, "You hear a buzzing in the distance.");
                    if($BuzzTarget->IsClient()) {
                        $BuzzTarget->Message(6, "You hear a strange buzzing around your head, and feel as though something is creeping toward you.");
                    }
                    quest::settimer("buzz_spawn", 6);
                    last;
                }
            }
        }
    }
	elsif($timer eq "buzz_spawn") {
		quest::stoptimer("buzz_spawn");
        if($BuzzTarget) {
            $BuzzTarget_x = $BuzzTarget->GetX();
            $BuzzTarget_y = $BuzzTarget->GetY();
            $BuzzTarget_z = $BuzzTarget->GetZ();
            $BuzzTarget_h = $BuzzTarget->GetHeading();
            # Frenzied_Lasher (317133)
			quest::spawn2(317133, 0, 0, $BuzzTarget_x, $BuzzTarget_y, $BuzzTarget_z+10, $BuzzTarget_h);
			quest::spawn2(317133, 0, 0, $BuzzTarget_x, $BuzzTarget_y, $BuzzTarget_z+10, $BuzzTarget_h);
			quest::spawn2(317133, 0, 0, $BuzzTarget_x, $BuzzTarget_y, $BuzzTarget_z+10, $BuzzTarget_h);
			quest::spawn2(317133, 0, 0, $BuzzTarget_x, $BuzzTarget_y, $BuzzTarget_z+10, $BuzzTarget_h);
			quest::spawn2(317133, 0, 0, $BuzzTarget_x, $BuzzTarget_y, $BuzzTarget_z+10, $BuzzTarget_h);
        }
    }
	elsif($timer eq "banish") {
		quest::stoptimer("banish");
        quest::modifynpcstat("special_attacks", "SERQMCNIDABfWOH");
        # #Vyishe (317134)
		quest::depopall(317134);
        #Anishy (317136)
		quest::depopall(317136);
        # #Piraand (317002)
		quest::depopall(317002);
        # #Garishi (317103)
		quest::depopall(317103);
        # a_languished_convert (317110)
		quest::depopall(317110);
		quest::ze(13, "Mata Muram breaks free of his bonds, killing the Riftseekers with the magic. 'You dare betray me! When I am done with them I shall see that all of your kind meet the same fate.");
		quest::ze(13, "The world shifts around you as the riftseeker's are consumed by their magic.");
        foreach(@clickup_clients) {
            if($_) {
                if($_->GetEntityVariable(1) eq "clicked_up") {
                    $_->WipeHateList();
                    $_->MovePCInstance(317, $instanceid, 641, 3285, -10, 0);
                    $_->SetEntityVariable(1, "clicked_down");
                }
            }
        }
        $banished_raid = 1;
        my $maxHP = $npc->GetMaxHP();
        my $hpRatio = $npc->GetHPRatio();
        $banished_hp = ($maxHP * ($hpRatio/100));
        $npc->WipeHateList();
        # #Overlord_Mata_Muram (317000)
        quest::spawn2(317000, 0, 0, 507, 4969, 294, 128);
        quest::depop();
    }
	elsif($timer eq "banish_hp_watch") {
		if($npc->GetHPRatio() < 20) {
            quest::stoptimer("banish_hp_watch");
			quest::settimer("banish", 3);
		}
    }
	elsif($timer eq "reset") {
        $reenable_summon = 0;
        quest::stoptimer("banish_phase2");
        quest::stoptimer("enable_summon");
        #  a_languished_convert (317110)
        quest::depopall(317110);
        # Coerced_Lieutenant (317114)
		quest::depopall(317114);
        # Frenzied_Lasher (317133)
		quest::depopall(317133);
        $npc->WipeHateList();
        $npc->SetAppearance(1);
        # #Overlord_Mata_Muram (317000)
        #quest::spawn2(317000, 0, 0, 507, 4969, 294, 128);
        #quest::depop();
    }
    elsif($timer eq "enable_summon") {
        quest::modifynpcstat("special_attacks", "SERQMCNIDf");
        $reenable_summon = 0;
		quest::stoptimer("enable_summon");
    }
	elsif($timer eq "banish_phase2") {
		#-- so we need to banish people who are up here incorrectly (warp, logged and relogged, etc)
		#-- we set the entity variable when PCs click up which we check here to
		#-- prevent any sort of race condition with the signal
        foreach(@clickup_clients) {
            if($_) {
                if($_->GetEntityVariable(1) ne "clicked_up") {
                    $_->MovePCInstance(317, $instanceid, 641, 3285, -10, 0);
                }
            }
		}
        quest::stoptimer("banish_phase2");
	}
    elsif($timer eq "respawn") {
        quest::stoptimer("respawn");
        quest::spawn2(317114, 0, 0, 378, 4969, 279, 128);
        quest::settimer("coerced", 10);
    }
}

sub EVENT_DEATH {
	quest::ze(13, "The walls of Anguish tremble, you can feel the world shaking your bones. For a brief moment you think you see a smile flash across Mata Muram's face, and as the last breath escapes his lungs you hear a faint voice, 'There are worlds other than these...'");
	$npc->CameraEffect(1000, 8);
	quest::signalwith(317117 , 317000);
    # a_languished_convert (317110)
	quest::depopall(317110);
    # Coerced_Lieutenant (317114)
	quest::depopall(317114);
    # Frenzied_Lasher (317133)
	quest::depopall(317133);
}

sub EVENT_SIGNAL {
    # --30 sec reset timer on first click up after raid is banished 
	if($signal == 1) {
        if(($reset_countdown == 0) && ($banished_raid == 1)) {
            quest::settimer("reset", 30);
            quest::stoptimer("banish_phase2");
            quest::modifynpcstat("hp_regen", "10000");
			$reset_countdown = 1;
			# --someone clicked up after banish, starting reset countdown: 30s
			#-- we turned these on for phase 2 to prevent him magically aggroing for some reason
            quest::modifynpcstat("special_attacks", "SERQMCNIDf");
        }
    }
    elsif($signal == 317114) {
        quest::settimer("respawn", 4);
    }
}

