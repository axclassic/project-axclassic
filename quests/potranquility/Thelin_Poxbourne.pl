sub EVENT_SPAWN {
   $npc->SetAppearance(3);#sleeping
   quest::set_proximity($x - 5, $x + 5, $y - 5, $y + 5);
}
sub EVENT_ENTER{
      quest::emote(" tosses and turns violently on the floor, then is still.");
  }


