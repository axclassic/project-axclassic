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
     quest::say("Be carefull as we travel there are many creatures that dont like us around here.");
     quest::spawn2(167982,0,0,-982.5,919.2,34.7,243);
     quest::spawn2(167981,0,0,-982.5,919.2,34.7,243);
     quest::signalwith(167981,7212,0);
     quest::signalwith(167982,7213,10);
     quest::start(501017);
     }
}
sub EVENT_WAYPOINT {
    if ($wp == 10) {
     quest::spawn2(167980,0,0,-758.9,873.3,-0.4,211.5);
     quest::depop();
     }
}
