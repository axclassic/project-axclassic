sub EVENT_SPAWN {
   quest::shout("You have awakened something which you should not have, fool!");
   quest::settimer("sds",3600);
}

sub EVENT_DEATH {
   quest::setglobal(dragon_not_ready,1,3,"H72");
   quest::spawn2(91099,0,0,-8.5,861.0,-168.3,223.6);
   quest::spawn2(91099,0,0,-18.5,861.0,-168.3,223.6);
   quest::spawn2(91099,0,0,-28.5,861.0,-168.3,223.6);
   quest::spawn2(91099,0,0,-38.5,861.0,-168.3,223.6);
   quest::spawn2(91099,0,0,-48.5,861.0,-168.3,223.6);
   quest::spawn2(91099,0,0,-58.5,861.0,-168.3,223.6);
   quest::spawn2(91099,0,0,-68.5,861.0,-168.3,223.6);
   quest::spawn2(91099,0,0,-78.5,861.0,-168.3,223.6);
}

sub EVENT_TIMER {
   if($timer eq "sds") {
      quest::stoptimer("sds");
      quest::setglobal(dragon_not_ready,1,3,"H1");
      quest::depop();
   }
}
# #Suled_Dar`s_Shade

