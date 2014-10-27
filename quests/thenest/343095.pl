##corrupted_drake NPC ID 343093##
sub EVENT_DEATH {
  my $x = $npc->GetX();
  my $y = $npc->GetY();
  my $z = $npc->GetZ();
  my $h = $npc->GetHeading();
  quest::spawn2(343093,0,0,$x,$y,$z,$h);
}
sub EVENT_SIGNAL {
if ($signal == 400) {
    quest::depop();
	}
	}