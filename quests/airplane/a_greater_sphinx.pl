sub EVENT_COMBAT {
   if($npc->IsEngaged()) {
      quest::settimer("agsdt", 45);
      my $targetmob1 = $npc->GetHateTop();
      my $targetid1 = $targetmob1->GetID();
      quest::castspell(982, $targetid1);
   }
   else {
      quest::stoptimer("agsdt");
   }
}

sub EVENT_TIMER {
   if($timer eq "agsdt") {
      my $targetmob2 = $npc->GetHateTop();
      my $targetid2 = $targetmob2->GetID();
      quest::castspell(982, $targetid2);
   }
}
# a_greater_sphinx NPCID: 71001

