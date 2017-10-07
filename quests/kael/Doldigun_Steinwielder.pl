sub EVENT_AGGRO {
  quest::emote("calls for help and scurries off.");
  quest::unique_spawn(113443,28,0,1130.3,-933.2,-125.6,126.6);
  quest::unique_spawn(113548,29,0,1130.3,-749.6,-125.6,126.6);
  quest::depop();
}
