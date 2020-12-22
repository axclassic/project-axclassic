# tainted_wooly_mammoth (30007)

sub EVENT_DEATH {
  my $x = $npc->GetX();
  my $y = $npc->GetY();
  my $z = $npc->GetZ();
  my $h = $npc->GetHeading();
  # corrupted_wooly_mammoth (30100)
  quest::spawn2(30100,0,0,$x,$y,$z,$h);
}
