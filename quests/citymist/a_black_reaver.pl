# Different Quests - Shaman - Mage
# respawn random mob on a black reaver death - list favors another reaver respawn
# 75% of the time

sub EVENT_DEATH {
  my $a = quest::ChooseRandom(90192,90192,90192,90193,90193,90193,90194,90194,90194,90174,90180,90184,90188,90188,90189,90189,90190);
  my $x = $npc->GetX();
  my $y = $npc->GetY();
  my $z = $npc->GetZ();
  my $h = $npc->GetHeading();
  quest::spawn2($a,0,0,$x,$y,$z,$h);
}


