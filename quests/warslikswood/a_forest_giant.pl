 sub EVENT_SAY {
  $x = $npc->GetX();
 $y = $npc->GetY();
 quest::set_proximity($x - 20, $x + 20, $y - 20, $y + 20);
 quest::emote('a forest giant covers a pouch as to something keep from jumping out.');
 quest::shout("You not get lizard!! You be squashed!!");
 }
sub EVENT_DEATH {
  my $x = $npc->GetX();
  my $y = $npc->GetY();
  my $z = $npc->GetZ();
  my $h = $npc->GetHeading();
  quest::spawn2(79112,83,0,$x,$y,$z,$h);
  quest::depop;
 }