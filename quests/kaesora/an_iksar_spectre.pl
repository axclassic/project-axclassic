##an_iksar_spectre ID 88071##
##part of the iksar bracer quest kill iksar spectre until a_tome_keeper spawns##
sub EVENT_DEATH {
  my $a = quest::ChooseRandom(88071,88071,88071,88071,88047);
  my $x = $npc->GetX();
  my $y = $npc->GetY();
  my $z = $npc->GetZ();
  my $h = $npc->GetHeading();
  quest::spawn2($a,0,0,$x,$y,$z,$h);
}