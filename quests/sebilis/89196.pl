# An_Ancient_Sebilite_Protector (89196)
my $spellTarget1 = 0;

sub EVENT_SPAWN {
    quest::setnexthpevent(75);
}

sub EVENT_HP {
    if($hpevent == 75) {
        quest::signalwith(89194,901,10);
        quest::signalwith(89195,901,10);
        quest::settimer("casting", 26);
        $spellTarget1 = $npc->GetHateRandom();
        if($spellTarget1) {
            # -- Spell: Death Shackles
            $npc->SendBeginCast(2047, 1);
            quest::castspell(2047, $spellTarget1->GetID());
        }
    }
}

sub EVENT_TIMER {
	if($timer eq "casting") {
        $spellTarget1 = $npc->GetHateRandom();
        if($spellTarget1) {
            # -- Spell: Death Shackles
            $npc->SendBeginCast(2047, 1);
            quest::castspell(2047, $spellTarget1->GetID());
        }
    }
}

sub EVENT_DEATH {
    quest::stoptimer("casting");
    quest::signalwith(89194,902,10);
    quest::signalwith(89195,902,10);
}