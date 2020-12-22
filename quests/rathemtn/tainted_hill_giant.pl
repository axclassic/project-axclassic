# tainted_hill_giant (50123)

sub EVENT_DEATH {
  my $x = $npc->GetX();
  my $y = $npc->GetY();
  my $z = $npc->GetZ();
  my $h = $npc->GetHeading();
  # corrupted_hill_giant (50126)
  quest::spawn2(50126,0,0,$x,$y,$z,$h);
}