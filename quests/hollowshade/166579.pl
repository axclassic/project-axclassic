my %DeathText = (
  1 => "collapses, its fur matted with blood.",
  2 => "defiantly tries to make one final swipe with its claws.",
  3 => "whines pitifully as the attack cuts his life short."
);

sub EVENT_WAYPOINT {
    if ($wp == 4) {
quest::signalwith(166405,602,0);
}
}
sub EVENT_DEATH{
my $RandomNumber = int(rand(3)) + 1;
  quest::emote("$DeathText{$RandomNumber}");
   quest::signalwith(166579,6121,0);
 }

