# Warder control for 2nd raid target(s) on 1st floor of vexthal

sub EVENT_SPAWN {
   quest::spawn2(158088,0,0,1874.4,2.1,3.1,192);
   quest::spawn2(158088,0,0,1767.3,2.3,67.1,64);
   quest::spawn2(158088,0,0,1837.0,1.9,63.1,64);
   quest::spawn2(158088,0,0,1736.6,-64.3,63.1,45.4);
   quest::spawn2(158088,0,0,1736.6,64.3,63.1,79);
   quest::spawn2(158088,0,0,1314.8,-85.0,233.1,192);
}

sub EVENT_DEATH {
    quest::depopall(158088);
}

#End of File, Zone:vexthal  NPC:158015 -- #Diabo_Xi_Xin
