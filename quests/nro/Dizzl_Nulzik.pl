sub EVENT_SAY {
   if($text=~/hail/i) {
      quest::say("Please Inspect me for Raid Adventures.");
   }
}
