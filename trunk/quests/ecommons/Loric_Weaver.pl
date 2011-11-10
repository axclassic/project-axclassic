
sub EVENT_SAY {

  if($text=~/hail/i){
	quest::say("Hello, $name. [Enemies] are always watching us, aren't they?");
  }

  if($text=~/enemies/i){
    if(($ulevel > 34) && ($ulevel < 57)) { # Required because otherwise the quest won't proc and users won't know why they didn't get it.
      if (quest::istaskactive(14)) {
        quest::say("The task, Clearing The Mines, is already active.");
      }
    else {
      quest::taskselector(14);
      }
    }
    else {
      quest::say("Yes, good luck with yours then, and I'll keep an eye on mine. Good day!");
    }
  }
}

sub EVENT_ITEM {
  quest::say("I have no use for this, $name.");
  plugin::return_items(\%itemcount);
}