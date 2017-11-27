sub EVENT_DEATH {
   quest::shout("EVENT_DEATH...");
   if($userid >= 1) {
      quest::shout("$userid");
   }
   if($ulevel >= 1) {
      quest::shout("$ulevel");
   }
}

