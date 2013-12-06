  sub EVENT_SAY {
  if($text=~/hail/i) {
      quest::emote("Its form turns to water and slowly begins to melt away.");
      quest::depop()
  }
  }
