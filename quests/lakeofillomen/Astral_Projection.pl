# Astral_Projection (85153)

sub EVENT_SAY {
    if($text=~/hail/i) {
        quest::emote("ignores you.");
    }
}

sub EVENT_ITEM {
    if((plugin::check_handin(\%itemcount, 1687 => 1)) && ($ulevel>=46)) {
        my $x = $npc->GetX();
        my $y = $npc->GetY();
        my $z = $npc->GetZ();
        my $h = $npc->GetHeading();
        # Monk Epic 1.0
        quest::depop();
        # Spawn: Vorash
        quest::spawn2(85211,0,0,$x,$y,$z,$h);
        # Spawn: Deep
        quest::spawn2(85223,0,0,$x,$y,$z,$h);  
    }
    else {
        quest::say("I have no use for this, $name.");
        plugin::return_items(\%itemcount);
    }
}
# End of File
