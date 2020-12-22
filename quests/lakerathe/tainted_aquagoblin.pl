# tainted_aquagoblin (51137)

sub EVENT_DEATH {
  my $x = $npc->GetX();
  my $y = $npc->GetY();
  my $z = $npc->GetZ();
  my $h = $npc->GetHeading();
  # corrupted_shaman (51141)
  quest::spawn2(51141,0,0,$x,$y,$z,$h);
}