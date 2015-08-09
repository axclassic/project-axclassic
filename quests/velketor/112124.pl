sub EVENT_SPAWN {
  my $a = quest::ChooseRandom(112134,112140,112146,1122152,112158,112164,112170,112176,112182,112188,112134,112140,112146,1122152,112158,112164,112170,112176,112182,112188,112129);
  quest::spawn2($a,0,0,52,310,-68.4,221.5);
  }
  sub EVENT_SIGNAL {
  if ($signal == 207){
  quest::depopall(112129);
  quest::depopall(112134);
  quest::depopall(112140);
  quest::depopall(112146);
  quest::depopall(112152);
  quest::depopall(112158);
  quest::depopall(112164);
  quest::depopall(112170);
  quest::depopall(112176);
  quest::depopall(112182);
  quest::depopall(112188);
  quest::depop();
  }
  }