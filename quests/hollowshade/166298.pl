my %AggroText = (
  1 => "assails you with a deafening shriek!",
  2 => "emits a loud screech, vibrating the ground at your feet.",
  3 => "snaps its powerful beak."
);

my %DeathText = (
  1 => "collapses, its fur matted with blood.",
  2 => "defiantly tries to make one final swipe with its claws.",
  3 => "whines pitifully as the attack cuts his life short."
);

sub EVENT_WAYPOINT {
    if ($wp == 13) {
quest::signalwith(166821,501,0);
}
    elsif ($wp == 21) {
quest::signalwith(166821,509,0);
quest::depop();
}
}
sub EVENT_DEATH{
my $RandomNumber = int(rand(3)) + 1;
  quest::emote("$DeathText{$RandomNumber}");
   quest::signalwith(166825,7121,0);
 }

