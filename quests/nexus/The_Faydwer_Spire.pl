sub EVENT_SPAWN {
   $x1 = $npc->GetX();
   $y1 = $npc->GetY();
   quest::set_proximity($x1 - 20, $x1 + 20, $y1 - 20, $y1 + 20);
}

sub EVENT_ENTER {
   quest::setglobal("nexus_fay",1,1,"M10"); #when we enter the spires, set global true.
   $nexus_fay = undef;
}

sub EVENT_EXIT {
   quest::delglobal("nexus_fay"); #when we leave spires, set global false.
   $nexus_fay = undef;
}
# AX_Classic Nexus Spire NPC: 152023

