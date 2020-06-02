## Arch_Magus_Vangl (317001) ##

sub EVENT_COMBAT {
    if($npc->IsEngaged()) {
		quest::settimer("adds", (30 + int(rand(41))));
		quest::settimer("touch", (10 + int(rand(26))));
		quest::settimer("gaze", (35 + int(rand(41))));
		quest::settimer("mark", (55 + int(rand(26))));
		quest::settimer("focus30", (15 + int(rand(16))));
		quest::stoptimer("reset");
	}
    else {
		quest::settimer("reset", 60);
		quest::stoptimer("adds");
		quest::stoptimer("touch");
		quest::stoptimer("gaze");
		quest::stoptimer("mark");
		quest::stoptimer("focus40");
		quest::stoptimer("focus30");
	}
}

sub EVENT_TIMER {
    my $spellTarget1 = $npc->GetTarget();
    my @now_raid = $npc->GetHateList();
	if($timer eq "touch") {
        if($spellTarget1) {
            # -- Spell: Touch of Anguish
            $npc->SendBeginCast(5679, 0);
            quest::castspell(5679, $spellTarget1->GetID());
        }
		quest::settimer("touch", 70);
    }
    elsif($timer eq "gaze") {
        if($spellTarget1) {
            # -- Spell: Gaze of Anguish
            $npc->SendBeginCast(5680, 0);
            quest::castspell(5680, $spellTarget1->GetID());
        }
        quest::settimer("gaze", 70);
    }
    elsif($timer eq "mark") {
        foreach(@now_raid) {
            # Spell: Mark of Death
            #$npc->SendBeginCast(5684, 0);
            quest::castspell(5684, $_->GetEnt()->GetID());
            if($_->GetEnt()->IsClient()) {
                $_->GetEnt()->Message(15, "You feel the cold grip of death looming over you.");
            }
        }
        #  --amv mark of death triggers after 30s
		quest::settimer("check_mark", 30);
        # -- 45 seconds after we check the mark we will re-mark
		my $mark_seconds = 45;
        if($npc->GetHPRatio() < 75) {
            # -- unless our HP is less than 75%, then it's in 30 seconds
            $mark_seconds = 30;
        }
        quest::settimer("mark", $mark_seconds);
    }
    elsif($timer eq "check_mark") {
        foreach(@now_raid) {
            if($_->GetEnt()->FindBuff(5684)) {
                # Spell: Cazic Touch
                $npc->SendBeginCast(982, 0);
                quest::castspell(982, $_->GetEnt()->GetID());
            }
        }
		quest::stoptimer("check_mark");
    }
    elsif($timer eq "adds") {
        if((1 + (int(rand(100)))) > 50) {
            quest::spawn2(317110, 0, 0, 331, 4961, 278, 128);
        }
		else {
            quest::spawn2(317110, 0, 0, 505, 4792, 278, 384);
        }
        quest::signalwith(317110, 1);
    }
    elsif($timer eq "focus30") {
        quest::stoptimer("focus30");
		quest::settimer("focus40", 40);
        quest::modifynpcstat("hp_regen", "5000");
		quest::ze(15, "The power of the focus energizes the Arch Magus.");
    }
    elsif($timer eq "focus40") {
        quest::stoptimer("focus40");
		quest::settimer("focus30", 30);
        quest::modifynpcstat("hp_regen", "1000");
		quest::ze(15, "The power of the focus falters.");
    }
    elsif($timer eq "reset") {
        quest::stoptimer("reset");
		quest::setnexthpevent(75);
		quest::depopall(317110);
		$npc->SetHP($npc->GetMaxHP());
        # Spell: Ocean's Cleansing
        quest::castspell(3791, $npc->GetID());
        $npc->WipeHateList();
        $npc->GMMove(366, 4886, 278, 0);
    }
    elsif($timer eq "close_doors") {
        quest::stoptimer("close_doors");
        my $close_door = $entity_list->FindDoor(57);
        $close_door->SetOpenType(58);
        $close_door->ForceClose($npc);
        $close_door = $entity_list->FindDoor(58);
        $close_door->SetOpenType(58);
        $close_door->ForceClose($npc);
        $close_door = $entity_list->FindDoor(59);
        $close_door->SetOpenType(58);
        $close_door->ForceClose($npc);
        $close_door = $entity_list->FindDoor(60);
        $close_door->SetOpenType(58);
        $close_door->ForceClose($npc);
    }
}

sub EVENT_DEATH {
	quest::ze(13, "As the Arch Magus' corpse falls to the ground, you feel the magical aura filling the room collapse, and hear a deep gutteral laugh growing louder.");
    $npc->CameraEffect(15000, 5);
	quest::depopall(317108);
	quest::signalwith(317117, 317001);
    my $open_door = $entity_list->FindDoor(57);
    $open_door->SetOpenType(59);
    $open_door->ForceOpen($npc);
    $open_door = $entity_list->FindDoor(58);
    $open_door->SetOpenType(59);
    $open_door->ForceOpen($npc);
    $open_door = $entity_list->FindDoor(59);
    $open_door->SetOpenType(59);
    $open_door->ForceOpen($npc);
    $open_door = $entity_list->FindDoor(60);
    $open_door->SetOpenType(59);
    $open_door->ForceOpen($npc);
}

sub EVENT_HP {
    if($hpevent == 75) {
        quest::ze(13, "A voice echoes from behind the shield, 'Vangl, you are my mightiest guardian, yet you allow these insects to remain in my presence? Destroy them now or I will rend the flesh from your worthless frame!'");
        quest::setnexthpevent(50);
		$npc->CameraEffect(2000, 5);
    }
    elsif($hpevent == 50) {
        quest::ze(13, "The deafening voice shakes the room again, 'You expect to defeat me? I have lived longer than you can begin to comprehend. I walked the realms before your pitiful gods were spawned. I flew the skies in a time before your world's creation and I shall enslave new worlds long after you and your gods are forgotten. You fight only to die.  I   AM   ETERNAL!'");
        quest::setnexthpevent(10);
        $npc->CameraEffect(2000, 5);
    }
    elsif($hpevent == 10) {
        quest::ze(13, "The voice echoes from behind the shield, 'Vangl, do not think that you can escape me in death. After I destroy the infiltrators I will find where you are to spend eternity. Death does not end your obligation to me, wretched thrall!'");
        my $spellTarget = $npc->GetTarget();
        if($spellTarget) {
            #  --feedback dispersion
            $npc->SendBeginCast(5681, 0);
            quest::castspell(5681, $spellTarget->GetID());
            $npc->CameraEffect(2000, 5);
        }
	}		
}

sub EVENT_SPAWN {
    # --Vangl`s_Focus (317108)
	quest::unique_spawn(317108, 0, 0, 475, 5139, 279, 123);
	quest::setnexthpevent(75);
    quest::settimer("close_doors", 10);
}

