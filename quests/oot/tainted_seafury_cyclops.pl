# tainted_seafury_cyclops (69096)

sub EVENT_DEATH {
  my $x = $npc->GetX();
  my $y = $npc->GetY();
  my $z = $npc->GetZ();
  my $h = $npc->GetHeading();
  # corrupted_seafury_cyclops (69142)
  quest::spawn2(69142,0,0,$x,$y,$z,$h);
}