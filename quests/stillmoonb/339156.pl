sub EVENT_DEATH {
my $a = quest::ChooseRandom(339154,339156,339159,339160,339161,339162,339163,339164,339165,339166,339167);
  my $x = $npc->GetX();
  my $y = $npc->GetY();
  my $z = $npc->GetZ();
  my $h = $npc->GetHeading();
  quest::spawn2($a,0,0,$x,$y,$z,$h);
  }