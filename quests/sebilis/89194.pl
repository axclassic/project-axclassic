# A_Sebilite_ Guardian (89194)
sub EVENT_SIGNAL {
    if($signal == 901) {
        quest::modifynpcstat("special_attacks", "SMCNIDABfWO");
        quest::settimer("cast_spells1", 3);
    }
    if($signal == 902) {
        quest::modifynpcstat("special_attacks", "SMCNID");
    }
}

sub EVENT_TIMER {
    if($timer eq "heal_protector") {
        my $spellTarget2 = $entity_list->GetMobByNpcTypeID(89196);
        if($spellTarget2) {
            # -- Spell: Complete Heal Protector
            $npc->SendBeginCast(13, 0);
            quest::castspell(13, $spellTarget1->GetID());
        }
    }
    if($timer eq "cast_spells1") {
        quest::stoptimer("cast_spells1");
        $spellTarget1 = $npc->GetHateRandom();
        if($spellTarget1) {
            # -- Spell: Blurring Focus
            $npc->SendBeginCast(4123, 0);
            quest::castspell(4123, $spellTarget1->GetID());
        }
        $spellTarget1 = $npc->GetHateRandom();
        if($spellTarget1) {
            # -- Spell: Curse of the Protector
            $npc->SendBeginCast(6100, 0);
            quest::castspell(6100, $spellTarget1->GetID());
        }
        quest::settimer("cast_spells2", 45);
        quest::settimer("cast_spells3", 48);
        quest::settimer("heal_protector", 11);
    }
    if($timer eq "cast_spells2") {
        $spellTarget1 = $npc->GetHateRandom();
        if($spellTarget1) {
            # -- Spell: Curse of the Protector
            $npc->SendBeginCast(6100, 0);
            quest::castspell(6100, $spellTarget1->GetID());
        }
    }
    if($timer eq "cast_spells3") {
        $spellTarget1 = $npc->GetHateRandom();
        if($spellTarget1) {
            # -- Spell: Blurring Focus
            $npc->SendBeginCast(4123, 0);
            quest::castspell(4123, $spellTarget1->GetID());
        }
    }
}

sub EVENT_DEATH {
    quest::stoptimer("cast_spells1");
    quest::stoptimer("cast_spells2");
    quest::stoptimer("cast_spells3");
    quest::stoptimer("heal_protector");
    # Signal Ancient_Sebilite_Trigger (89197)
    quest::signalwith(89197,892,0);
}
