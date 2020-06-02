# Qvic Raid Event: Cynosure Kvanjji

sub CastSpells {
   $SpellToCast = quest::ChooseRandom(4567, 4723, 4749, 4748, 4734, 4121, 4722);
   $SpellTarget = $npc->GetHateMost();
   if($SpellTarget) {
       $npc->SendBeginCast($SpellToCast, 0);
       quest::castspell($SpellToCast, $SpellTarget->GetID());
   }
}

sub EVENT_TIMER {
   if($timer eq "CastSpells") {
      CastSpells();
   }
}

sub EVENT_SIGNAL {
   if($signal == 1) {
      quest::settimer("CastSpells", 35);
      CastSpells();
   }
   else {
      $Cynosure = $entity_list->GetMobByNpcTypeID(295146);
      if($Cynosure) {
         quest::emote("locks minds with Cynosure Kvanjji, as it mimics the Cynosure's spell.");
         $SpellTarget = $Cynosure->GetHateRandom();
         $npc->SendBeginCast($signal, 0);
         quest::castspell($signal, $SpellTarget->GetID());
      }
   }
}

sub EVENT_DEATH {
   quest::stoptimer("CastSpells");
   $check_cyno = $entity_list->GetMobByNpcTypeID(295146);
   if($check_cyno) {
      quest::signalwith(295146, 2, 20000);
   }
}

# NPC Svi`pral_the_Second_Arbitor (295152) - Non-Healer
