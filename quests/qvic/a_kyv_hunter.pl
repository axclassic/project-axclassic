# a_kyv_hunter

sub EVENT_SPAWN {
   quest::setnexthpevent(45);
}

sub EVENT_HP {
   if($hpevent == 45) {
      quest::settimer("castingAKH", 10);
   }
}

sub EVENT_TIMER {
   if($timer eq "castingAKH") {
      $SpellToCast = quest::chooserandom(4850, 4849, 4851);
      $SpellTarget = $npc->GetHateMost();
      if($SpellTarget) {
          $npc->SendBeginCast($SpellToCast, 0);
          quest::castspell($SpellToCast, $SpellTarget->GetID());
      }
   }
}

sub EVENT_DEATH {
   quest::stoptimer("castingAKH");
}

