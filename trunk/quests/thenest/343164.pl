##incorporeal_shadow NPC ID 343164##
sub EVENT_DEATH {
my $x = $npc->GetX();
  my $y = $npc->GetY();
  my $z = $npc->GetZ();
  my $h = $npc->GetHeading();
  quest::signalwith(343257,622,0);
  quest::spawn2(343161,0,0,$x,$y,$z,$h);
  
}
sub EVENT_SIGNAL {
if ($signal == 400) {
quest::depop();
}
}