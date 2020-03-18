# Qvic Raid Event: Cynosure Kvanjji

sub EVENT_AGGRO {
   quest::settimer("Third", 20);
}
  
sub EVENT_TIMER {
   if($timer eq "Third") {
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
   $npc->CastSpell($SpellToCast, $SpellTarget->GetID());
}

sub EVENT_SIGNAL {
   if($signal == 0) {
      quest::emote("heals Cynosure Kvanjji's wounds.");
   }
   elsif($signal == 1) {
      quest::stoptimer("Third");
      quest::settimer("CastSpells", 35);
      CastSpells();
   }
   else {
      $Cynosure = $entity_list->GetMobByNpcTypeID(295146);
      if($Cynosure) {
         quest::emote("locks minds with Cynosure Kvanjji, as it mimics the Cynosure's spell.");
         $SpellTarget = $Cynosure->GetHateRandom();
         $npc->CastSpell($signal, $SpellTarget->GetID());
      }
   }
}

sub EVENT_DEATH {
   quest::stoptimer("CastSpells");
   quest::stoptimer("Third");
   $check_cyno = $entity_list->GetMobByNpcTypeID(295146);
   if($check_cyno) {
      quest::signalwith(295146, 3, 20000);
   }
}

# NPC #Ytvagi_the_Third_Arbitor (295149)

