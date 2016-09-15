# Quest reward update 9/14/2016 by Patrikpatrik
# Reward is no longer 20-35k worth of platinum bags
# Reward is 1-2kpp max in coins

sub EVENT_SAY { 
if($text=~/Hail/i){
quest::say("Greetings $name. If you're looking to sell a white horse, I'll be happy to give you cash.  If you've got a different color horse you'd like to sell talk to one of my brothers."); }
}

sub EVENT_ITEM {
  if(plugin::check_handin(\%itemcount,21805=> 1)){
    quest::givecash(0, 0, 0, 1000);
}
  elsif(plugin::check_handin(\%itemcount,21806=> 1)){
    quest::givecash(0, 0, 0, 1300);
}
  elsif(plugin::check_handin(\%itemcount,21807=> 1)){
    quest::givecash(0, 0, 0, 1600);
}
  elsif(plugin::check_handin(\%itemcount,21808=> 1)){
    quest::givecash(0, 0, 0, 2000);
}
  else {
    quest::say("I have no use for this, $name.");
    plugin::return_items(\%itemcount);
  }
}
#END of FILE Zone:bazaar  ID:151007 -- Galic_Amondson 