sub EVENT_SPAWN {
  my $ready = quest::saylink("ready", 1);
       quest::say("Tell me when you are $ready to travel.");
       }
sub EVENT_ENTER {
       my $ready = quest::saylink("ready", 1);
       quest::say("Tell me when you are $ready to travel.");
       }
       sub EVENT_SAY {
       if ($text=~/ready/i) {
     quest::say("We must sneak up on the encampment, rushing in this time would surely mean death for both us..");
     quest::spawn2(167989,0,0,531.4,-831.4,13.8,15.5);
     quest::spawn2(167990,0,0,531.4,-831.4,13.8,15.5);
     quest::signalwith(167960,7222,0);
     quest::signalwith(167989,7223,10);
     quest::start(501018);
     }
}
sub EVENT_WAYPOINT {
    if ($wp == 5) {
     quest::spawn2(167992,0,0,641.8,-899.9,-9,237.2);
     quest::depop();
     }
}
