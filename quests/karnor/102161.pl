sub EVENT_SPAWN {
  my $a = quest::ChooseRandom(102204,102176,102177,102178,102179,102204,102176,102177,102178,102179,102176,102177,102178,102179,102176,102177,102178,102179,102176,102177,102178,102179,102176,102177,102178,102179,102197);
  quest::spawn2($a,0,0,-435.5,35.4,3.7,192);
  }
  sub EVENT_SIGNAL {
  if ($signal == 112){
  quest::depopall(102197);
  quest::depopall(102204);
  quest::depopall(102176);
  quest::depopall(102177);
  quest::depopall(102178);
  quest::depopall(102179);
  quest::depop();
  }
  }