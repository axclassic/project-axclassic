# Shaman Epic 1.0
# Fright
# Plane of Fear
# Aramid September 2006

 my $x;
 my $y;
 my $z;

sub EVENT_DEATH {
   $x = $npc->GetX();
   $y = $npc->GetY();
   $z = $npc->GetZ();
   quest::unique_spawn(72105,0,0,$x,$y,$z);
 }


# End of File - NPCID 72004 - Fright
