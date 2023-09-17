sub EVENT_SPAWN {
   quest::settimer("selfdepop",3400);
   quest::settimer("keeperpop",2100);
}

sub EVENT_TIMER {
   if($timer eq "selfdepop") {
      quest::stoptimer("selfdepop");
      quest::depop();
   }
   if($timer eq "keeperpop") {
      quest::stoptimer("keeperpop");
      quest::unique_spawn(71075,0,0,-1007.0,694.0,165.4,56.3);
   }
}
# EOF zone: airplane ID: 71106 NPC: Nottap_Ekim

