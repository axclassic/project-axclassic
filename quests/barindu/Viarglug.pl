##Viarglug Normal spawn ID 283158 for player necromancer epic 1.5 to avoid conflict with bot necromancer epic 1.5

my $isNecro = 2;

sub EVENT_SAY {
    if($class eq "Necromancer") {
        if(($text=~/hail/i) && (defined($qglobals{Soulwhisper}) && ($qglobals{Soulwhisper} == 2))) {
            quest::say("I wonder how much I could get for the tongue of a blithering fool..leave before I decide to find out for myself.");
            $isNecro = 1;
            quest::modifynpcstat("special_attacks", SEMCNIDf);
            quest::attack($name);
        }
    }
}

sub EVENT_SPAWN {
    quest::shout("Fresh Meat!");
    $isNecro = 2;
}

sub EVENT_AGGRO {
  quest::emote("runs for battle in an uncontrollable rage.");
}

sub EVENT_DEATH {
    quest::emote("'s eyes glisten as it loses itself in the pleasure of pain and death.");
    if($isNecro == 1) {
        quest::spawn2(283157,0,0,$x,$y,$z,0); ##a_chest (283157)##
    }
}

