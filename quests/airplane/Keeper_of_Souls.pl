# Epic NPC -- Keeper_of_Souls

my $did_dt = 1;

sub EVENT_SPAWN {
   quest::settimer("summit",1800000);
}

sub EVENT_COMBAT {
   if($npc->IsEngaged()) {
      if($did_dt < 2) {
          $did_dt = $did_dt + 1;
          my $targetmob1 = $npc->GetHateTop();
          my $targetid1 = $targetmob1->GetID();
          quest::castspell(982, $targetid1);
          quest::settimer("kosdt", 45);
      }
   }
   else {
      quest::stoptimer("kosdt");
   }
}

sub EVENT_TIMER {
   if($timer eq "summit") {
      quest::stoptimer("summit");
      quest::depop();
   }
   if($timer eq "kosdt") {
      my $targetmob2 = $npc->GetHateTop();
      my $targetid2 = $targetmob2->GetID();
      quest::castspell(982, $targetid2);
   }
}

sub EVENT_DEATH {
   quest::stoptimer("kosdt");
   $x = $npc->GetX();
   $y = $npc->GetY();
   $z = $npc->GetZ();
   $did_dt = 1;
   $sirran = undef;
   quest::setglobal("sirran",4,3,"M10");
   quest::spawn(71058,0,0,$x-10,$y,$z+10);
}
#END of FILE  Quest by: Solid11  Zone:airplane  ID:71075 -- Keeper_of_Souls

