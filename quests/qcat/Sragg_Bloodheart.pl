sub EVENT_SAY {
  if($text=~/hail/i) {
    quest::say("Do you have a death wish!? If you have something for me I suggest you give it to me before your head is no longer attached!.") ;
  }
}

sub EVENT_ITEM {
if (plugin::check_handin(\%itemcount, 18706 => 1)) { #Bloodsabers Shadowknight Summons
  quest::say("Ah! Another victim, er new recruit.") ;
  quest::say("Take this tunic of the Bloodsabers, I hope it serves you well, at least better than its former owner.") ;
  quest::say("Trust no one and always have your guard up, return to me if you are in need of training $name.")  ;
  quest::summonitem(119849);
  quest::exp(1000);
  quest::ding();
  quest::faction(21,10);
  quest::faction(135,-10);
  quest::faction(235,-10);
  quest::faction(257,-10);
  quest::faction(53,10);
  quest::rebind(45,-314,414,-38);
   }
       else {
   quest::say("I have no use for this.");
   plugin::return_items(\%itemcount);
   }
}
