## Angelox
## Leather Tailoring Script


sub EVENT_SAY{
  if($text=~/hail/i) {
    quest::say("Hello $name, I can make Cured Ethereal Energy, provided you give me the proper [parts] for the combine and pay my [fee]");
  }
  if($text=~/fee/i) {
    quest::say("Pay me 50pp for my time, with the [parts] I need.");
  }
  elsif($text=~/parts/i) {
    quest::say("I need two Celestial Essences and two Strands of Ether - the rest I have. Hand this to me together with my [fee]");
  }
}

sub EVENT_ITEM{
  if(($itemcount{9650} == 2) && ($itemcount{16285} == 2) && ($platinum >= 50)){
    quest::say("Thank you! Here is your Cured Ethereal Energy.");
    quest::summonitem(16287);
  }
  else {
    quest::say("This is not what I asked for.");
    plugin::return_items(\%itemcount);
     if($platinum != 0 || $gold !=0 || $silver != 0 || $copper != 0) {
      quest::givecash($copper, $silver, $gold, $platinum);
  }
 }
}
