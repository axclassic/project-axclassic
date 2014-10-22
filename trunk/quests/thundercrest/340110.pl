## a_defunct_sentry trigger mob##
sub EVENT_DEATH {
  my $x = $npc->GetX();
  my $y = $npc->GetY();
  my $z = $npc->GetZ();
  my $h = $npc->GetHeading();
  quest::spawn2(340108,0,0,$x,$y,$z,$h);
quest::signalwith(340108,910,0);
}