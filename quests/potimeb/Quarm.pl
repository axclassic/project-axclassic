my $headCount = 4;
my $nukeDelay = 35;

sub EVENT_SPAWN {
    $headCount = 4;
    $nukeDelay = 35;
	quest::setnexthpevent(76);
}

sub EVENT_COMBAT {
	if($combat_state == 1) {
		quest::settimer("add_timer", 30);
		quest::stoptimer("reset_mob");
		quest::settimer("inf_flm", $nukeDelay);
	}
    elsif($combat_state == 0) {
		quest::stoptimer("add_timer");
		quest::settimer("reset_mob", 60);
	}
}

sub EVENT_TIMER {
	if($timer eq "add_timer") {
		$chance = int(rand(100));
		if($chance < 76) {
			quest::spawn2(223112,0,0,$x + 10,$y,$z,$h);
		}

		if($chance < 46) {
			quest::spawn2(223112,0,0,$x - 10,$y,$z,$h);
		}

		if($chance < 26) {
			quest::spawn2(223112,0,0,$x,$y + 10,$z,$h);
		}

		if($chance < 8) {
			quest::spawn2(223112,0,0,$x,$y - 10,$z,$h);
		}
	}
    elsif($timer eq "reset_mob") {
		quest::stoptimer("reset_mob");
		if($headCount == 4) {
			quest::stoptimer("inf_flm");
		}
        elsif($headCount == 3) {
			quest::stoptimer("glc_bth");
			quest::stoptimer("glc_bst");
		}
        elsif($headCount == 2) {
			quest::stoptimer("vnm_mst");
			quest::stoptimer("vnm_bst");        
		}
        elsif($headCount == 1) {
			quest::stoptimer("plg_eth");
			quest::stoptimer("plg_ssm");        
		}

		if($headCount < 4) {
			$npc->SendIllusion(304,2,0,0,0,1,1,0,1,0,0,0,70); 
			quest::setnexthpevent(76);
			$npc->SetHP(2000000);
			$headCount = 4;
		}
	}
    elsif($timer eq "inf_flm") {
		$target = $npc->GetHateTop();   
		$npc->CastSpell(3768, $target->GetID());
	}
    elsif($timer eq "glc_bth") {
		$target = $npc->GetHateTop();       
		$npc->CastSpell(3769, $target->GetID());    
	}
    elsif($timer eq "glc_bst") {
		$target = $npc->GetHateTop();       
		$npc->CastSpell(3773, $target->GetID());    
	}
    elsif($timer eq "vnm_mst") {
		$target = $npc->GetHateTop();       
		$npc->CastSpell(3770, $target->GetID());    
	}
    elsif($timer eq "vnm_bst") {
		$target = $npc->GetHateTop();       
		$npc->CastSpell(3777, $target->GetID());    
	}
    elsif($timer eq "plg_eth") {
		$target = $npc->GetHateTop();       
		$npc->CastSpell(3771, $target->GetID());    
	}
    elsif($timer eq "plg_ssm") {
		$target = $npc->GetHateTop();       
		$npc->CastSpell(3780, $target->GetID());    
	}       
}

sub EVENT_HP {
	if($hpevent == 76) {
		quest::emote(" roars in pain as his red head explodes in a shower of flaming ethereal energy!");
		$npc->SendIllusion(304,2,1,1,0,1,1,0,1,0,0,0,70);
		quest::stoptimer("inf_flm");
		quest::settimer("glc_bth", $nukeDelay - int(rand(10)));
		quest::settimer("glc_bst", $nukeDelay + int(rand(10)));
		$headCount = 3;
		quest::setnexthpevent(51);
	}
    elsif($hpevent == 51) {
		quest::emote(" roars in pain as his blue head explodes into pure ethereal energy!");
		$npc->SendIllusion(304,2,2,2,0,1,1,0,1,0,0,0,70); 
		quest::stoptimer("glc_bth");
		quest::stoptimer("glc_bst");
		quest::settimer("vnm_mst", $nukeDelay - int(rand(10)));
		quest::settimer("vnm_bst", $nukeDelay + int(rand(10)));
		$headCount = 2;
		quest::setnexthpevent(26);
	}
    elsif($hpevent == 26) {
		quest::emote(" shakes the cavern with a bellow of pain as the white head explodes into a swirling vortex of ethereal energy!");
		$npc->SendIllusion(304,2,3,3,0,1,1,0,1,0,0,0,70); 
		quest::stoptimer("vnm_mst");
		quest::stoptimer("vnm_bst");
		quest::settimer("plg_eth", $nukeDelay - int(rand(10)));
		quest::settimer("plg_ssm", $nukeDelay + int(rand(10)));
		$headCount = 1;
	} 
}

sub EVENT_DEATH {
    #spawns new beehive
	quest::spawn2(223250,0,0,-656.2,-1096.5,-2.7,60);
    #Worlwide camera shake
    $npc->CameraEffect(3000, 9, 0, 1);
}

