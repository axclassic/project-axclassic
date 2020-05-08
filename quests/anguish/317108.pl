## Vangl`s_Focus (317108) ##

my $cazic_cooldown;

sub EVENT_SPAWN {
    quest::set_proximity($x - 75, $x + 750, $y - 75, $y + 75);
	quest::settimer("crushing", 15);
	$cazic_cooldown = 0;
}

sub EVENT_ENTER {
    quest::emote(" trembles with energy as any living creature approaches it.");
}

sub EVENT_COMBAT {
  if($npc->IsEngaged()) {
      quest::settimer("dt", 1);
  }
  else {
      quest::stoptimer("dt");
      $cazic_cooldown = 0;
  }
}

sub EVENT_TIMER {
    my $spellTarget = $npc->GetTarget();
    if(($timer eq "dt") && ($cazic_cooldown == 0)) {
        if($spellTarget) {
            # --Cazic Touch
            $npc->SendBeginCast(982, 0);
            quest::castspell(982, $spellTarget->GetID());
        }
		$cazic_cooldown = 1;
		quest::settimer("reset_cd", 15);
    }
    elsif($timer eq "crushing") {
        if($spellTarget) {
            # --Crushing Presence
            $npc->SendBeginCast(5683, 0);
            quest::castspell(5683, $spellTarget->GetID());
        }
    }
}

