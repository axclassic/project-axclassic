sub EVENT_SAY { 
    if($text=~/Hail/i){
     quest::say("Hail $name. did you need something from me or are you looking to do me a favor?");
     }
}
sub EVENT_ITEM {
    if(plugin::check_handin(\%itemcount,3670 =>1 )){
     quest::say("Ah, another up and coming recruit are you? I am happy to see you rising through the ranks.");
     quest::say("I have a small job for you, take this map and give it to Kery Miann. Good luck Recruit $name.");
     quest::summonitem(5571);
     }
    else {
     plugin::return_items(\%itemcount);
  }
}
#END of FILE Zone:sharvahl  ID:155062 -- Animist_Mahron_Sood 

