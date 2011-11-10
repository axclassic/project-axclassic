sub EVENT_SAY {
 if($text=~/hail/i){
  quest::say("There is little time for talk. There are plenty of [tiny invaders]. Do your part and exterminate as many as you can. All of Cabilis shall look favorably upon you in the long run.");
 }
 elsif($text=~/tiny invaders/i){
  quest::say("The small scorpions have been turning up everywhere!! One can hardly sleep when thinking of the little monsters. Please crush as many as you can for the greater good. I will even pay a bounty for every four Scorpion Pincers you return.");
 }
}

sub EVENT_ITEM {
 #Handin: 4x Scorpion Pincers (12650)
 if(plugin::check_handin(\%itemcount, 12650 => 4)){
  quest::say("Magnificent!! The more pincers I get the lesser scorpions there are. Here. Take the bounty.");
  quest::faction(193,5); # +Legion of Cabilis
  quest::faction(30,5); # +Cabilis Residents
  quest::faction(282,5); # +Scaled Mystics
  quest::faction(62,5); # +Crusaders of Greenmist
  quest::faction(317,5); # +Swifttails
  quest::givecash(4,2,0,0);
   quest::ding(); quest::exp(10);  
 }
 else {
  quest::say("I have no need for this item $name, you can have it back.");
  plugin::return_items(\%itemcount);
 }
}


#Scripted By: Fatty Beerbelly
