sub EVENT_SAY {
  if($text =~ /hail/i) {
     quest::say("If you have business then out with it!! If not, then please be gone. I have little time to waste on chitchat!");
  }
}

sub EVENT_AGGRO {
  quest::say("I shall show you the pure fury of the Dead!!");
}

# EOF

