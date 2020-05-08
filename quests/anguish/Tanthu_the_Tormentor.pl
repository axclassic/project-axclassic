## Tanthu_the_Tormentor ##

my $tanthu_ae = 0;

sub EVENT_COMBAT {
    if($npc->IsEngaged()) {
        quest::settimer("cast", (10 + int(rand(36))));
        quest::settimer("void", (1 + int(rand(20))));
        quest::settimer("relinq", (20 + int(rand(20))));
        quest::settimer("torment", (40 + int(rand(21))));
        quest::signalwith(317004, 3171011);
	}
    else {
        quest::signalwith(317004, 3171010);
        quest::stoptimer("cast");
        quest::stoptimer("void");
        quest::stoptimer("relinq");
        quest::stoptimer("torment");
	}
}

sub EVENT_TIMER {
    my $spellTarget = $npc->GetTarget();
    if($spellTarget) {
        if($timer eq "cast") {
            # -- Spell: Gaze of Anguish
            $npc->SendBeginCast(5680, 0);
            quest::castspell(5680, $spellTarget->GetID());
            quest::settimer("cast", 45);
        }
        if($tanthu_ae == 1) {
            if($timer eq "void") {
                # -- Spell: Void of Suppression
                $npc->SendBeginCast(5677, 0);
                quest::castspell(5677, $spellTarget->GetID());
                quest::settimer("void", 60);
            }
            elsif($timer eq "relinq") {
                # -- Spell: Relinquish Spirit
                $npc->SendBeginCast(5675, 0);
                quest::castspell(5675, $spellTarget->GetID());
                quest::settimer("relinq", 30);
            }
            elsif($timer eq "torment") {
                # -- Spell: Torment of Body
                $npc->SendBeginCast(5676, 0);
                quest::castspell(5676, $spellTarget->GetID());
                quest::settimer("torment", 60);
            }
        }
    }
}

sub EVENT_SIGNAL {
    if($signal == 3171010) {
        $tanthu_ae = 0;
    }
    if($signal == 3171011) {
        $tanthu_ae = 1;
    }
}

