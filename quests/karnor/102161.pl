sub EVENT_SPAWN {
  my $a = quest::ChooseRandom(102204,102176,102177,102178,102179,102204,102176,102177,102178,102179,102176,102177,102178,102179,102176,102177,102178,102179,102176,102177,102178,102179,102176,102177,102178,102179,102197);
  quest::spawn2($a,0,0,-435.5,35.4,3.7,192);
  }
  sub EVENT_SIGNAL {
  if ($signal == 112){
  quest::depop(102197);
  quest::depop(102204);
  quest::depop(102176);
  quest::depop(102177);
  quest::depop(102178);
  quest::depop(102179);
  quest::depop();
  }
  }