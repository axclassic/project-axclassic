##a_flaming_mephit 210548##
sub EVENT_DEATH {
  my $x = $npc->GetX();
  my $y = $npc->GetY();
  my $z = $npc->GetZ();
  my $h = $npc->GetHeading();
  quest::spawn2(210549,0,0,$x,$y,$z,$h);
  quest::spawn2(210549,0,0,$x,$y,$z,$h);
  quest::spawn2(210549,0,0,$x,$y,$z,$h);
  }