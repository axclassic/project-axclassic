
sub EVENT_DEATH {
  my $x = $npc->GetX();
  my $y = $npc->GetY();
  my $z = $npc->GetZ();
  my $h = $npc->GetHeading();
  quest::spawn2(340137,0,0,$x,$y,$z,$h);
  quest::spawn2(340137,0,0,$x,$y,$z,$h);
}


