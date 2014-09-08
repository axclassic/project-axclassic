sub EVENT_DEATH {
  my $a = quest::ChooseRandom(337257,337257,337257,337258,337258,337258,337259,337259,337259,,337260);
  my $x = $npc->GetX();
  my $y = $npc->GetY();
  my $z = $npc->GetZ();
  my $h = $npc->GetHeading();
  quest::spawn2($a,0,0,$x,$y,$z,$h);
}