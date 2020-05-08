## Ture ##

sub EVENT_COMBAT {
    if($npc->IsEngaged()) {
        quest::settimer("wanton", (30 + int(rand(31))));
        quest::settimer("breath", (10 + int(rand(21))));
        quest::settimer("aeramp_warn", (30 + int(rand(31))));
    }
    else {
        quest::stoptimer("wanton");
        quest::stoptimer("breath");
        quest::stoptimer("aeramp_warn");
    }
}

sub EVENT_TIMER {
    my $SpellTarget = 0;
	if($timer eq "wanton") {
        $SpellTarget = $npc->GetTarget();
        if($SpellTarget) {
            # -- Spell: Wanton Destruction
            $npc->SendBeginCast(1250, 0);
            quest::castspell(1250, $SpellTarget->GetID());
        }
        quest::settimer("wanton", 75); 
    }
	elsif($timer eq "breath") {
        $SpellTarget = $npc->GetTarget();
        if($SpellTarget) {
            # Spell: Thunder Breath (5807)
            # Spell: Swamp Breath (5806)
            # Spell: Stone Breath (5804)
            my $RandomSpell = quest::ChooseRandom(5804, 5806, 5807);
            $npc->SendBeginCast($RandomSpell, 0);
            quest::castspell($RandomSpell, $SpellTarget->GetID());
        }
        quest::settimer("wanton", 30); 
    }
	elsif($timer eq "aeramp_warn") {
		quest::emote(" roars with fury as it surveys its attackers.");
		quest::settimer("aeramp_warn", 60);
		quest::settimer("aeramp_on", 6);
    }
	elsif($timer eq "aeramp_on") {
		quest::stoptimer("aeramp_on");
		quest::emote("'s eyes roll into its head as it goes into a frenzy.");
		quest::modifynpcstat("special_attacks", "SERrFQMCNIDf");
		quest::settimer("aeramp_off", 10);
    }
	elsif($timer eq "aeramp_off") {
		quest::stoptimer("aeramp_off");
		quest::emote(" calms and regains its focus.");	
		quest::modifynpcstat("special_attacks", "SEQMCNIDf");
    }
}

sub EVENT_DEATH {
    quest::signalwith(317117, 317003);
}

