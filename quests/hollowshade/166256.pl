my %DeathText = (
  1 => "coughs up a bit of blood. 'You'll never escape us. . .'",
  2 => "screams as it collapses, 'Brothers and sisters, show no mercy to this outlander.'",
  3 => "staggers for a moment and then collapses."
 );

sub EVENT_WAYPOINT {
    if ($wp == 4) {
quest::signalwith(166663,701,0);
}
    elsif ($wp == 23) {
quest::signalwith(166663,709,0);
quest::depop();
}
}
sub EVENT_DEATH{
my $RandomNumber = int(rand(3)) + 1;
  quest::emote("$DeathText{$RandomNumber}");
   quest::signalwith(166722,5121,0);
 }

