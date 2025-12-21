# Uqua, The Ocean God Chantry (uqua) >> #Guardian_of_Destruction (292067)

sub EVENT_SPAWN {
    $npc->SetAppearance(3);
    quest::setnexthpevent(70);
}

sub EVENT_AGGRO {
    quest::settimer("destruct", 180);
    quest::ze(15, "strides forward to deal with its enemies.");
}

sub EVENT_HP {
    if($hpevent == 70) {
        quest::spawn2(292069, 0, 0, -869, -16, 65, 125);
        quest::depop(292068);
    }
}

sub EVENT_TIMER {
    if ($timer eq "destruct") {
        quest::spawn2(292070, 0, 0, $x,$y,$z,$h);
        quest::depop();
    }
}
