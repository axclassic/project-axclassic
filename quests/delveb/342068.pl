sub EVENT_SPAWN{
quest::setnexthpevent(50);
}
sub EVENT_HP {
  if($hpevent == 50){
  quest::spawn2(342077,0,0,-714.8,3010.8,39.1,206.6);
  quest::spawn2(342077,0,0,-708.4,2970.7,38.7,219.8);
  quest::spawn2(342077,0,0,-818,2975.2,39.5,43.6);
  quest::spawn2(342077,0,0,-813,2897.1,39.6,23.6);
  }
  }
sub EVENT_DEATH {
  my $x = $npc->GetX();
  my $y = $npc->GetY();
  my $z = $npc->GetZ();
  my $h = $npc->GetHeading();
quest::spawn2(342064,0,0,,$x,$y,$z,$h);
}