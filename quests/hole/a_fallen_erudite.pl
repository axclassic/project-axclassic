sub EVENT_SPAWN {
  quest::settimer("appearance", 3);
}

sub EVENT_TIMER {
  quest::stoptimer("appearance");
  $npc->SetAppearance(3);
}

