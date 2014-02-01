## Angelox
## Smithing Script


sub EVENT_SAY{
  if($text=~/hail/i) {
    quest::say("Hello $name, I can make Ethereal Metal Rings or Ethereal Sheet of Metal, provided you give me the proper [ring parts] or [sheet parts] for the combine and pay my [fee]");
  }
  if($text=~/fee/i) {
    quest::say("Pay me 50pp for my time, with the [ring parts] or [sheet parts] I need.");
  }
  elsif($text=~/ring/i) {
    quest::say("I need a Brick of Ethereal Energy, an Emerald Tea Leaf, and two Celestial Essences - the rest I have. Hand this to me together with my [fee]");
  }
  elsif($text=~/sheet/i) {
    quest::say("I need two Bricks of Ethereal Energy, and two Celestial Essences - the rest I have. Hand this to me together with my [fee]");
  }
}

sub EVENT_ITEM{
  if(($itemcount{16282} == 1) && ($itemcount{29790} == 1) && ($itemcount{9650} == 2) && ($platinum >= 50)){
    quest::say("Thank you! Here is your Ring.");
    quest::summonitem(16284);
  }
  elsif(($itemcount{16282} == 2) && ($itemcount{9650} == 2) && ($platinum >= 50)){
    quest::say("Thank you! Here is your Sheet.");
    quest::summonitem(16283);
  }
  else {
    quest::say("This is not what I asked for.");
    plugin::return_items(\%itemcount);
     if($platinum != 0 || $gold !=0 || $silver != 0 || $copper != 0) {
      quest::givecash($copper, $silver, $gold, $platinum);
  }
 }
}
