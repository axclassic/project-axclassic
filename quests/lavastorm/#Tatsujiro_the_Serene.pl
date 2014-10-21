#Tatsujiro the Serene  NPC ID 27122#
sub EVENT_SAY {
  if($text=~/Hail/i){
  quest::say("Hail traveler, have a look at my wares, surely there is something that peaks your interest.");
  }
}
sub EVENT_ITEM {
  if ($ulevel <= 50 && $ulevel >= 41 && plugin::check_handin(\%itemcount, 81909 => 1)) {
  quest::say("How horrible! You mean that there aren't any living eggs in that nest at all! Oh, my. That certainly doesn't ease my feelings of guilt any, but you tried your best. We'll probably keep looking anyway, just in case. Thank you for your help.");
  quest::ding();
  quest::exp(4500000);
  quest::givecash(0,0,0,50); 
  }
          else {
    plugin::return_items(\%itemcount);
    quest::say("I have no use for this.");
   }
}  