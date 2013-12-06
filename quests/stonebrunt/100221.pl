  sub EVENT_SAY {
  if($text=~/hail/i) {
      quest::emote("The task that you complete this day may mock you in the days to come if you do not heed its lesson. Take care, my friend.");
      quest::depop()
  }
  }
