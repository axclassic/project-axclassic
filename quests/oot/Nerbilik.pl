sub EVENT_SAY {
  if ($text=~/hail/i) {
    quest::say("Leave me alone.");
    quest::emote("glowers at you dubiously.");
    }
  if ($text=~/recipe/i) {
      quest::say("Don't you have something for me first?");
}

sub EVENT_ITEM {
if (plugin::check_handin(\%itemcount, 12203 => 1)) {
  quest::ding();
  quest::exp(50000);
  quest::faction(66,10);
  quest::faction(22,-30);
  quest::say("Thanks, lackey. Now go back to Neriak because I'm not going to give you the recipe. It's worth too much to me here in my pocket. If you want it, you're going to have come take it."); 
  quest::emote("glares at you menacingly."); 
  }
}
}
sub EVENT_DEATH {
  quest::faction(66,-100);
  quest::faction(22,10);
 }
