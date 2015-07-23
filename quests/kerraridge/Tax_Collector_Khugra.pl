sub EVENT_SAY { 
    if($text=~/Hail/i){
     quest::say("Well met. friend.  May I be of assistance?");
     }
}
sub EVENT_ITEM { 
     if(plugin::check_handin(\%itemcount, 2874 => 1)) {
      quest::say("There you go $name, Take this back to Registrar Bindarah.");
      quest::summonitem(2875);
      quest::ding();
      quest::exp(50);
      }
}
#END of FILE Zone:sharvahl  ID:155084 -- Tax_Collector_Khugra 

