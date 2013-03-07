# Threeflies
# Ax_Classic March 2013
# Zone: North Felwithe
# Short name: felwithea
# NPC Name: guard_settine
# NPC ID: (61004,61086)
# Quest: Taskmaster Earring

sub EVENT_SAY {
  if ($text=~/Hail/i) {
    quest::say("Welcome to Felwithe.");
  }
}

sub EVENT_ITEM {

# Hand in Ragged Cloth Note 
  if (plugin::check_handin(\%itemcount, 18901 => 1)) {
    quest::say("I.. but.. she.. You can take this. I guess I don't need it any more."); 
    quest::summonitem(14640); # Silver Amber Ring 
    quest::depop();
  }
  plugin::return_items(\%itemcount);
}