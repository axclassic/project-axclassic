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
   my $spawnchance = int(rand(100));
   if($spawnchance > 90) {
      quest::spawn2(72108, 0, 0, $x, $y, $z, $h);
   }
}
