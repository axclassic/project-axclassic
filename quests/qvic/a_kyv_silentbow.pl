# a_kyv_silentbow

sub EVENT_SPAWN {
   quest::setnexthpevent(45);
}

sub EVENT_HP {
   if($hpevent == 45) {
      quest::settimer("castingAKS", 10);
   }
}

sub EVENT_TIMER {
   if($timer eq "castingAKS") {
      $SpellToCast = quest::chooserandom(4850, 4849, 4851);
      $SpellTarget = $npc->GetHateMost();
      if($SpellTarget) {
          $npc->SendBeginCast($SpellToCast, 0);
          quest::castspell($SpellToCast, $SpellTarget->GetID());
      }
   }
}

sub EVENT_DEATH {
   quest::stoptimer("castingAKS");
}

