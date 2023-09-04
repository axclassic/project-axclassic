my $did_dt = 1;

sub EVENT_DEATH {
   quest::stoptimer("sotsdt");
   $x = $npc->GetX();
   $y = $npc->GetY();
   $z = $npc->GetZ();
   $sirran = undef;
   $did_dt = undef;
   quest::setglobal("sirran",7,3,"M10");
   quest::spawn(71058,0,0,$x-10,$y,$z+10);
}

sub EVENT_COMBAT {
   if($npc->IsEngaged()) {
       if($did_dt < 2) {
           $did_dt = $did_dt + 1;
           my $targetmob1 = $npc->GetHateTop();
           my $targetid1 = $targetmob1->GetID();
           quest::castspell(982, $targetid1);
           quest::settimer("sotsdt", 45);
       }
   }
   else {
      quest::stoptimer("sotsdt");
   }
}

sub EVENT_TIMER {
   if($timer eq "sotsdt") {
      my $targetmob2 = $npc->GetHateTop();
      my $targetid2 = $targetmob2->GetID();
      quest::castspell(982, $targetid2);
   }
}
# Sister_of_the_Spire NPCID: 71076

