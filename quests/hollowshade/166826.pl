my %DeathText = (
  1 => "coughs up a bit of blood. 'You'll never escape us. . .'",
  2 => "screams as it collapses, 'Brothers and sisters, show no mercy to this outlander.'",
  3 => "staggers for a moment and then collapses."
 );

sub EVENT_DEATH{
my $RandomNumber = int(rand(3)) + 1;
  quest::emote("$DeathText{$RandomNumber}");
   quest::signalwith(166822,550,0);
 }

