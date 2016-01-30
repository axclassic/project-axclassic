sub EVENT_SPAWN {
   $npc->SetAppearance(3);#sleeping
}
sub EVENT_SIGNAL{
   if($signal == 1501){
   quest::emote(" tosses and turns violently on the floor, then is still.");
  }
 } 

