sub EVENT_SAY {
  if($text=~/hail/i) {
    if(quest::istaskactivityactive(14,1)) {
      quest::say("Thanks for contacting me, $name. Your information on this matter has been most useful.");
      quest::updatetaskactivity(14,1);
    }
    else {
      quest::say("I'm sorry, I have neither the time nor the patience to chat right now.");
    }
  }
  }