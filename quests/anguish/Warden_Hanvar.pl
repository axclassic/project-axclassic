## Warden_Hanvar ##

my $min_hp = 100.0;
my $guard_spawn1 = 0;
my $guard_spawn2 = 0;
my $guard_spawn3 = 0;
my $guard_spawn4 = 0;
my $max_hp = 0;

sub EVENT_SPAWN {
    $min_hp = 100.0;
    $max_hp = $npc->GetMaxHP();
    Spawn_Guards();
}

sub EVENT_COMBAT {
    if($npc->IsEngaged()) {
        Aggro_Guards();
        quest::settimer("adds", 5);	
        quest::settimer("chains", (10 + int(rand(36))));
        quest::settimer("feedback", (10 + int(rand(31))));
        quest::settimer("wail", (15 + int(rand(76))));
        quest::settimer("check_hp", 1);
        quest::settimer("leash", 3);
    }
    else {
        quest::settimer("reset", 60);
        quest::stoptimer("adds");
        quest::stoptimer("chains");
        quest::stoptimer("feedback");
        quest::stoptimer("wail");
        quest::stoptimer("check_hp");
    }
}

sub Spawn_Guards {
    quest::spawn2(317015, 0, 0, 307, 4348, 210, 70);
    quest::spawn2(317016, 0, 0, 307, 4430, 210, 70);
    quest::spawn2(317017, 0, 0, 314, 4389, 210, 70);
    quest::spawn2(317018, 0, 0, 375, 4347, 210, 70);
    quest::spawn2(317102, 0, 0, 375, 4430, 210, 70);
}

sub Aggro_Guards {
    quest::signalwith(317015, 1);
    quest::signalwith(317016, 1);
    quest::signalwith(317017, 1);
    quest::signalwith(317018, 1);
    quest::signalwith(317102, 1);
}

sub Hanvar_HP {
    my $hp_ratio = $npc->GetHPRatio();
    my $new_hp = 0;
    if($hp_ratio < $min_hp) {
        $new_hp = ($max_hp * ($min_hp/100.0));
        $npc->SetHP($new_hp);
    }
}

sub EVENT_TIMER {
    my $SpellTarget = 0;
	if($timer eq "check_hp") {
        Hanvar_HP();
    }
	elsif($timer eq "chains") {
        $SpellTarget = $npc->GetTarget();
        if($SpellTarget) {
            # -- Spell: Chains of Anguish
            $npc->SendBeginCast(5682, 0);
            quest::castspell(5682, $SpellTarget->GetID());
            quest::settimer("chains", 45);
        }
    }
    elsif($timer eq "feedback") {
        $SpellTarget = $npc->GetTarget();
        if($SpellTarget) {
            # -- Spell: Feedback Dispersion
            $npc->SendBeginCast(5681, 0);
            quest::castspell(5681, $SpellTarget->GetID());
            quest::settimer("feedback", 30);
        }
    }
    elsif($timer eq "wail") {
        $SpellTarget = $npc->GetTarget();
        if($SpellTarget) {
            # -- Spell: Wail of Anguish
            $npc->SendBeginCast(5678, 0);
            quest::castspell(5678, $SpellTarget->GetID());
            quest::settimer("wail", 90);
        }
    }
    elsif($timer eq "adds") {
        my $guard1 = $entity_list->GetMobByNpcTypeID(317015);
        my $guard2 = $entity_list->GetMobByNpcTypeID(317016);
        my $guard3 = $entity_list->GetMobByNpcTypeID(317017);
        my $guard4 = $entity_list->GetMobByNpcTypeID(317018);
        my $guard5 = $entity_list->GetMobByNpcTypeID(317102);
        if(!$guard1 && !$guard2 && !$guard3 && !$guard4 && !$guard5 && (!$guard_spawn1 || !$guard_spawn2 || !$guard_spawn3 || !$guard_spawn4)) {
            if(!$guard_spawn1) {
                $guard_spawn1 = 1;
            }
            elsif(!$guard_spawn2) {
                $guard_spawn2 = 1;
            }
            elsif(!$guard_spawn3) {
                $guard_spawn3 = 1;
            }
            elsif(!$guard_spawn4) {
                $guard_spawn4 = 1;
            }
            if($min_hp >= 25) {
                $min_hp = $min_hp - 25;
                if($min_hp > 0) {
                    Spawn_Guards();
                    Aggro_Guards();
                }
            }
        }
    }
    elsif($timer eq "leash") {
        my $leashDistance = $npc->CalculateDistance(427, 4389, 222);
        if($leashDistance > 280) {
			Reset_Hanvar();			
        }
    }
	elsif($timer eq "reset") {
		Reset_Hanvar();
        quest::stoptimer("reset");
    }
}

sub Reset_Hanvar {
    quest::depopall(317015);
    quest::depopall(317016);
    quest::depopall(317017);
    quest::depopall(317018);
    quest::depopall(317102);
    $npc->GMMove(427, 4389, 222, 70);
    # Spell: Ocean's Cleansing
    $npc->CastSpell(3791, $npc->GetID());
    $npc->WipeHateList();
    my $reset_max_hp = $npc->GetMaxHP();
    $npc->SetHP($reset_max_hp);
    $min_hp = 100;
    $dead_guards = 0;
    Spawn_Guards();
}

sub EVENT_DEATH {
    quest::signalwith(317117, 317143);
}

