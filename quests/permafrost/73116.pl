  sub EVENT_SAY {
  if($text=~/hail/i) {
      quest::emote("form begins to lose shape, as its fur turns to snow and begins to blow away.");
      quest::depop()
  }
  }