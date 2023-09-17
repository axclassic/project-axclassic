my $did_dt = 1;

sub EVENT_COMBAT {
   if($npc->IsEngaged()) {
       if($did_dt < 2) {
           $did_dt = $did_dt + 1;
           my $targetmob1 = $npc->GetHateTop();
           my $targetid1 = $targetmob1->GetID();
           quest::castspell(982, $targetid1);
           quest::settimer("eovdt", 45);
       }
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

sub EVENT_DEATH {
   $did_dt = 1;
   quest::stoptimer("eovdt");
}
# Eye_of_Veeshan NPCID: 71065

