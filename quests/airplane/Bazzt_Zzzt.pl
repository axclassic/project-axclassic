# Bazzt_Zzzt NPCID 71072
# spawns Sirran on Death

my $did_dt = 1;

sub EVENT_DEATH {
   quest::stoptimer("bzdt");
   $did_dt = undef;
   my $x = $npc->GetX();
   my $y = $npc->GetY();
   my $z = $npc->GetZ();
   $sirran= undef;
   quest::setglobal("sirran",6,3,"M10");
   quest::spawn(71058,0,0,$x-10,$y,$z+10);
}

sub EVENT_COMBAT {
   if($npc->IsEngaged()) {
       if($did_dt < 2) {
           $did_dt = $did_dt + 1;
           my $targetmob1 = $npc->GetHateTop();
           my $targetid1 = $targetmob1->GetID();
           quest::castspell(982, $targetid1);
           quest::settimer("bzdt", 45);
       }
   }
   else {
      quest::stoptimer("bzdt");
   }
}

sub EVENT_TIMER {
   if($timer eq "bzdt") {
      my $targetmob2 = $npc->GetHateTop();
      my $targetid2 = $targetmob2->GetID();
      quest::castspell(982, $targetid2);
   }
}

