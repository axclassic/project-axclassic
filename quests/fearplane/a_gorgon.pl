sub EVENT_SIGNAL {
   if($signal == 1) {
      quest::say("Such is the will of Cazic-Thule!");
   }
   if($signal == 2) {
      quest::follow(72003);
   }
   if($signal == 3) {
      quest::sfollow();
   }
}


