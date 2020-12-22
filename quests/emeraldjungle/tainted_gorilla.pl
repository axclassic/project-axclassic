# tainted_gorilla (94123)

sub EVENT_DEATH {
  my $x = $npc->GetX();
  my $y = $npc->GetY();
  my $z = $npc->GetZ();
  my $h = $npc->GetHeading();
  #  corrupted_gorilla (94140)
  quest::spawn2(94140,0,0,$x,$y,$z,$h);
}