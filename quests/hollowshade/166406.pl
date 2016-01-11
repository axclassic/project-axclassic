my %DeathText = (
  1 => "collapses, its fur matted with blood.",
  2 => "defiantly tries to make one final swipe with its claws.",
  3 => "whines pitifully as the attack cuts his life short."
);

sub EVENT_WAYPOINT {
    if ($wp == 13) {
quest::signalwith(166405,200,0);
}
    elsif ($wp == 30) {
quest::signalwith(166405,209,0);
quest::depop();
}
}
sub EVENT_DEATH{
my $RandomNumber = int(rand(3)) + 1;
  quest::emote("$DeathText{$RandomNumber}");
   quest::signalwith(166407,2121,0);
 }

