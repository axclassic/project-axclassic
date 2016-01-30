sub EVENT_SPAWN {
   $npc->SetAppearance(3);#sleeping
   quest::set_proximity($x - 15, $x + 15, $y - 15, $y + 15);
}
sub EVENT_ENTER{
      quest::emote(" tosses and turns violently on the floor, then is still.");
  }


