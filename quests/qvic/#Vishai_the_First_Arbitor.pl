# Qvic Raid Event: Cynosure Kvanjji

sub EVENT_AGGRO {
   quest::settimer("First", 20);
}
  
sub EVENT_TIMER {
   if($timer eq "First") {
      quest::emote("channels its energy and begins to heal Cynosure Kvanjji.");
      quest::signalwith(295146, 0);
   }
   if($timer eq "CastSpells") {
      CastSpells();
   }
}

sub CastSpells {
   $SpellToCast = quest::ChooseRandom(4567, 4723, 4749, 4748, 4734, 4121, 4722);
   $SpellTarget = $npc->GetHateMost();
   $npc->SendBeginCast($SpellToCast, 0);
   quest::castspell($SpellToCast, $SpellTarget->GetID());
}

sub EVENT_SIGNAL {
   if($signal == 0) {
      quest::emote("heals Cynosure Kvanjji's wounds.");
   }
   elsif($signal == 1) {
      quest::stoptimer("First");
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
   quest::stoptimer("First");
   $check_cyno = $entity_list->GetMobByNpcTypeID(295146);
   if($check_cyno) {
      quest::signalwith(295146, 1, 20000);
   }
}

# NPC #Vishai_the_First_Arbitor (295147)
