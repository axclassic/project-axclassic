# tainted_brownie (57096)

sub EVENT_DEATH {
  my $x = $npc->GetX();
  my $y = $npc->GetY();
  my $z = $npc->GetZ();
  my $h = $npc->GetHeading();
  # corrupted_brownie (57117)
  quest::spawn2(57117,0,0,$x,$y,$z,$h);
}