sub EVENT_SAY {
   if($text=~/Hail/i) {
      quest::say("Oh my word!! A rescuer!! Hurry! Get me out of these chains!! Go find the orc who has the keys!");
   }
}

sub EVENT_ITEM {
   if($copper >= 1 || $item1 != 20015) {
      quest::say("No, no!! I do not need this!! Get me key number 15!!");
   }

   if($item1 == 20015) {
      quest::say("Good work!! I shall be on my way. Farewell my friend!!");
      quest::givecash(0,3,2,0);
      quest::ding();
      quest::exp(10000);
      quest::faction(91,2);   # Eldrich Collective
      quest::faction(71,-1);  # Dark Reflection
      quest::faction(322,-1); # The Dead
      quest::faction(115,1);  # Gem Choppers
      quest::faction(176,1);  # King AkAnon
      quest::depop();
   }
}
# Retlon_Brenclog