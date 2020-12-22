# tainted_seahorse (64048)

sub EVENT_DEATH {
  my $x = $npc->GetX();
  my $y = $npc->GetY();
  my $z = $npc->GetZ();
  my $h = $npc->GetHeading();
  # corrupted_seahorse (64050)
  quest::spawn2(64050,0,0,$x,$y,$z,$h);
}