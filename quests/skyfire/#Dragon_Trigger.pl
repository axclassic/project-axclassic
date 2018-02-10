sub EVENT_SPAWN {
   quest::settimer("drtr",3);
}

sub EVENT_TIMER {
   if($timer eq "drtr") {
      quest::stoptimer("drtr");
      if(defined $qglobals{door_one} && defined $qglobals{door_two} && defined $qglobals{door_three} && defined $qglobals{door_four} && !defined $qglobals{dragon_not_ready}) {
         quest::spawn2(91097,0,0,-8.5,861.0,-168.3,223.6);
         quest::depop();
      }
      else {
         quest::settimer("drtr",3);
      }
   }
}
# #Dragon_Trigger

