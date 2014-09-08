sub EVENT_DEATH {
  my $a = quest::ChooseRandom(339121,339121,339121,339120,339120,339120,39119,339119,339119,339118);
  my $x = $npc->GetX();
  my $y = $npc->GetY();
  my $z = $npc->GetZ();
  my $h = $npc->GetHeading();
  quest::spawn2($a,0,0,$x,$y,$z,$h);
}