# Quest reward update 9/14/2016 by Patrikpatrik
# Reward is no longer 20-35k worth of platinum bags
# Reward is 1-2kpp max in coins

sub EVENT_SAY { 
if($text=~/Hail/i){
quest::say("Greetings $name. If you're looking to sell a black horse, I'll be happy to give you cash.  If you've got a different color horse you'd like to sell talk to one of my brothers."); }
}

sub EVENT_ITEM {
  if(plugin::check_handin(\%itemcount,21810=> 1)){
    #quest::summonitem(21820); #Bag of Platinum Pieces 3089pp
	quest::givecash(0, 0, 0, 1000);
}
  elsif(plugin::check_handin(\%itemcount,21811=> 1)){
    #quest::summonitem(21821); #Heavy bag of Platinum Pieces 10041pp
	quest::givecash(0, 0, 0, 1300);
}
  elsif(plugin::check_handin(\%itemcount,21812=> 1)){
    #quest::summonitem(21822); #Big Bag of Platinum Pieces 22399pp
	quest::givecash(0, 0, 0, 1600);
}
  elsif(plugin::check_handin(\%itemcount,21813=> 1)){
   #quest::summonitem(21823); #Huge bag of Platinum Pieces 35143pp
   quest::givecash(0, 0, 0, 2000);
}
  else {
    quest::say("I have no use for this, $name.");
    plugin::return_items(\%itemcount);
  }
}
#END of FILE Zone:bazaar  ID:151006 -- Wendal_Amondson 

