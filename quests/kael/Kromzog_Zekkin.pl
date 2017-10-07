sub EVENT_AGGRO {
  quest::say("Your bones will be crushed by the Kromrif of Kael Drakkel!");
}

sub EVENT_DEATH {
  quest::unique_spawn(113471,29,0,1130.3,-749.6,-125.6,126.6);
}
