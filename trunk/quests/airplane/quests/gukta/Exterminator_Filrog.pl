sub EVENT_SAY {
  if($text=~/Hail/i){ #Start of Exterminate the Vermin Quest (Based on a Script By: Fatty Beerbelly)
    quest::say("Hey you dere! Look at all these spiders! Dey called me to come kill em, but there is too many!!! If you bring me four eyes from da little spiders, I reward you!");
  }
}

sub EVENT_ITEM {
  #Handin: 4x Spiderling Eye
  if(plugin::check_handin(\%itemcount, 13253 => 4)){ #End of Exterminate the Vermin (Scripted By: Fatty Beerbelly)
    quest::say("You good at killing spiders. Mebbe me should find anuder job. Here take da coins.");
    quest::faction(131,10); # +Grobb Merchants
     quest::ding(); quest::exp(5);
    quest::givecash(1,1,1,0);
  }
}
