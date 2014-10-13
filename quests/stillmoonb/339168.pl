sub EVENT_DEATH {
my $a = quest::ChooseRandom(339164,339168,339164,339168,339167);
  my $x = $npc->GetX();
  my $y = $npc->GetY();
  my $z = $npc->GetZ();
  my $h = $npc->GetHeading();
  quest::spawn2($a,0,0,$x,$y,$z,$h);
  }