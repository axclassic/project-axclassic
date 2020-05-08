## an_elite_guard ##

sub EVENT_COMBAT {
  if($npc->IsEngaged()) {
      quest::settimer("depop_warn", (5 + int(rand(81))));
  }
  else {
      quest::stoptimer("depop_warn");
  }
}

sub EVENT_TIMER {
	if($timer eq "depop_warn") {
        quest::settimer("depop", int(rand(15)));
        quest::stoptimer("depop_warn");
        quest::emote(" prepares to sacrifice its life to Hanvar.");
    }
    elsif($timer eq "depop") {
        quest::emote(" sacrifices himself to the warden in an explosive blast of energy.");
        $SpellTarget = $npc->GetTarget();
        if($SpellTarget) {
            # --Feedback Dispersion
            $npc->SendBeginCast(5681, 0);
            quest::castspell(5681, $SpellTarget->GetID());
            quest::depop();
        }
    }
}

sub EVENT_SIGNAL {
    if($signal == 1) {
        my $Hanvar = $entity_list->GetMobByNpcTypeID(317143);
        if($Hanvar) {
            my $HateTarget = $Hanvar->GetHateRandom();
            if($HateTarget) {
                $npc->AddToHateList($HateTarget, 500);
            }
        }
    }
}

