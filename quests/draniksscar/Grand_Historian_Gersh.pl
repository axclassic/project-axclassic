# Zone: draniksscar
# AngeloX

sub EVENT_SAY { 
if($text=~/Hail/i){
quest::say("Greetings, traveler. I am Grand Historian Gersh and I can open your mind to the history of our people if you wish. I can show you the remnants of our [caves] where we hid from the raiding Muramite Army.");
 }
}

sub EVENT_ITEM {
    quest::say("I can't use this.");
    plugin::return_items(\%itemcount);
     if($platinum != 0 || $gold !=0 || $silver != 0 || $copper != 0) {
      quest::givecash($copper, $silver, $gold, $platinum);
     }
   }
