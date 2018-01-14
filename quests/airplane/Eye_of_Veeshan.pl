sub EVENT_COMBAT {
   if($npc->IsEngaged()) {
      quest::settimer("eovdt", 45);
      my $targetmob1 = $npc->GetHateTop();
      my $targetid1 = $targetmob1->GetID();
      quest::castspell(982, $targetid1);
   }
   else {
      quest::stoptimer("eovdt");
   }
}

sub EVENT_TIMER {
   if($timer eq "eovdt") {
      my $targetmob2 = $npc->GetHateTop();
      my $targetid2 = $targetmob2->GetID();
      quest::castspell(982, $targetid2);
   }
}
# Eye_of_Veeshan NPCID: 71065

