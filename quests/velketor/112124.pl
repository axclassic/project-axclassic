sub EVENT_SPAWN {
  my $a = quest::ChooseRandom(112134,112140,112146,112152,112158,112164,112170,112176,112182,112188,112134,112140,112146,112152,112158,112164,112170,112176,112182,112188,112129);
  quest::spawn2($a,0,0,52,310,-68.4,221.5);
  }
  sub EVENT_SIGNAL {
  if ($signal == 207){
  quest::depop(112129);
  quest::depop(112134);
  quest::depop(112140);
  quest::depop(112146);
  quest::depop(112152);
  quest::depop(112158);
  quest::depop(112164);
  quest::depop(112170);
  quest::depop(112176);
  quest::depop(112182);
  quest::depop(112188);
  quest::depop();
  }
  }