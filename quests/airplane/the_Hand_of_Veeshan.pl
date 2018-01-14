sub EVENT_COMBAT {
   if($npc->IsEngaged()) {
      quest::settimer("thovdt", 45);
      my $targetmob1 = $npc->GetHateTop();
      my $targetid1 = $targetmob1->GetID();
      quest::castspell(982, $targetid1);
   }
   else {
      quest::stoptimer("thovdt");
   }
}

sub EVENT_TIMER {
   if($timer eq "thovdt") {
      my $targetmob2 = $npc->GetHateTop();
      my $targetid2 = $targetmob2->GetID();
      quest::castspell(982, $targetid2);
   }
}
# the_Hand_of_Veeshan NPCID: 71060

