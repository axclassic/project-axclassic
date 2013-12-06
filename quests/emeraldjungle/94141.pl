  sub EVENT_SAY {
  if($text=~/hail/i) {
      quest::emote("Perhaps it senses that you have more adventure ahead of you. Its form begins to loosen, as if it were a mirage produced by the jungle heat.");
      quest::depop()
  }
  }
