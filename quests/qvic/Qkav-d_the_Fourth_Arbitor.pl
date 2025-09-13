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
   if($timer eq "CastSpells4A") {
       quest::stoptimer("CastSpells4A");
       CastSpells();
       quest::settimer("CastSpells4A", 35);
   }
}

sub EVENT_SIGNAL {
   if($signal == 1) {
      quest::settimer("CastSpells4A", 1);
   }
   else {
      $Cynosure = $entity_list->GetMobByNpcTypeID(295146);
      if($Cynosure) {
         quest::emote(" locks minds with Cynosure Kvanjji, as it mimics the Cynosure's spell.");
         $SpellTarget = $Cynosure->GetHateRandom();
         $npc->SendBeginCast($signal, 0);
         quest::castspell($signal, $SpellTarget->GetID());
      }
   }
}

sub EVENT_DEATH {
   quest::stoptimer("CastSpells4A");
   $check_cyno = $entity_list->GetMobByNpcTypeID(295146);
   if($check_cyno) {
      quest::signalwith(295146, 4, 20000);
   }
}

# NPC Qkav`d_the_Fourth_Arbitor (295154) - Non-Healer

