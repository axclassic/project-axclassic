## Resqu Lower Level GM event ##

sub EVENT_DEATH {
  my $a = quest::ChooseRandom(54298,54008,54200,54298,54008,54200,54298,54008,54200,54298,54008,54200,54298,54008,54200,54298,54008);
  my $b = quest::ChooseRandom(54298,54008,54200,54298,54008,54200,54298,54008,54200,54298,54008,54200,54298,54008,54200,54298,54008);
  my $x = $npc->GetX();
  my $y = $npc->GetY();
  my $z = $npc->GetZ();
  my $h = $npc->GetHeading();
  quest::spawn2($a,0,0,$x,$y,$z,$h);
  quest::spawn2($b,0,0,$x,$y,$z,$h);
}
