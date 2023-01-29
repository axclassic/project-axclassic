# respawn acid mass on death

sub EVENT_DEATH {
  my $x1 = $npc->GetX();
  my $y1 = $npc->GetY();
  my $z1 = $npc->GetZ();
  my $h1 = $npc->GetHeading();
  quest::spawn2(48422,0,0,$x1,$y1,$z1,$h1);
}
# EOF zone: Cazicthule ID: NPC: #a_boiling_ooze