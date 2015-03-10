sub EVENT_SPAWN {
  $x = $npc->GetX();
  $y = $npc->GetY();
  $z = $npc->GetZ();
  quest::set_proximity($x - 50, $x + 50, $y - 50, $y + 50);
}
sub EVENT_ENTER {
my $a = quest::ChooseRandom(171063,171064,171377);
my $x = $npc->GetX();
  my $y = $npc->GetY();
  my $z = $npc->GetZ();
  my $h = $npc->GetHeading();
  quest::emote(' the sand at your feet explodes into violent motion!');
  quest::spawn2($a,0,0,$x,$y,$z,$h);
  quest::depop();
}