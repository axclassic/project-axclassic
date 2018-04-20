# Warder control for first raid target on 1st floor of vexthal

sub EVENT_SPAWN {
    quest::spawn2(158087,0,0,626.0,256.0,6.25,172);
    quest::spawn2(158087,0,0,626.0,-256.0,6.25,209);
    quest::spawn2(158087,0,0,1314.8,85.0,233.1,192);
}

sub EVENT_DEATH {
    quest::depopall(158087);
}

#End of File, Zone:vexthal  NPC:158013 -- #Kaas_Thox_Xi_Ans_Dyek
