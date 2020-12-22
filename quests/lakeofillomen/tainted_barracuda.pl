# tainted_barracuda (85217)

sub EVENT_DEATH {
  my $x = $npc->GetX();
  my $y = $npc->GetY();
  my $z = $npc->GetZ();
  my $h = $npc->GetHeading();
  # corrupted_barracuda (85234)
  quest::spawn2(85234,0,0,$x,$y,$z,$h);
}