# Shaman Epic 1.0
# Dread
# Plane of Fear
# Aramid September 2006
sub EVENT_SIGNAL {
   if($signal == 1) {
      quest::say("Such is the will of Cazic-Thule!");
   }
   if($signal == 2) {
      quest::follow(72003);
   }
   if($signal == 3) {
      quest::sfollow();
   }
}

sub EVENT_DEATH {
   quest::unique_spawn(72105,0,0,$x,$y,$z,$h);
}
# End of File - NPCID 72000 - Dread

