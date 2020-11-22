# An_Ancient_Sebilite_Protector (89196)
my $spellTarget1 = 0;

sub EVENT_SPAWN {
    quest::setnexthpevent(75);
}

sub EVENT_HP {
    if($hpevent == 75) {
        quest::signalwith(89194,901,0);
        quest::signalwith(89195,901,0);
        quest::settimer("casting", 36);
        $spellTarget1 = $npc->GetTarget();
        if($spellTarget1) {
            # -- Spell: Death Shackles
            $npc->SendBeginCast(2047, 0);
            quest::castspell(2047, $spellTarget1->GetID());
        }
    }
}

sub EVENT_TIMER {
	if($timer eq "casting") {
        $spellTarget1 = $npc->GetTarget();
        if($spellTarget1) {
            # -- Spell: Death Shackles
            $npc->SendBeginCast(2047, 0);
            quest::castspell(2047, $spellTarget1->GetID());
        }
    }
}

sub EVENT_DEATH {
    quest::stoptimer("casting");
    quest::signalwith(89198,900,0);
}