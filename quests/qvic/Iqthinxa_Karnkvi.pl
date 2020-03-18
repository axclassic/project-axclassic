# Qvic Raid Event: Iqthinxa Karnkvi

sub EVENT_SPAWN {
   quest::setnexthpevent(75);
}

sub EVENT_DEATH {
   quest::ze(10, "You hear howls of victory from the distance, as packs of beasts are released from Iqthinxa Karnkvi's magic.");
}

sub SpawnIqthinxaPets {
   quest::stoptimer("IqthinxaPets");
   quest::spawn2(295131,0,0,84,423,-410,84);
   quest::spawn2(295132,0,0,126,310,-422,232);
   quest::spawn2(295133,0,0,267,283,-410,124);
   $rav1 = $entity_list->GetMobByNpcTypeID(295131);
   $rav2 = $entity_list->GetMobByNpcTypeID(295132);
   $rav3 = $entity_list->GetMobByNpcTypeID(295133);
   $rav1->AddToHateList($TopHate->CastToMob(), 100000);
   $rav2->AddToHateList($TopHate->CastToMob(), 100000);
   $rav3->AddToHateList($TopHate->CastToMob(), 100000);

   #safety check for lost/missed signal from ravs.
   quest::settimer("Iqthinxa", 10);
}

sub EVENT_HP {
   if($hpevent == 75) {
      $TopHate = $npc->GetHateTop();
      quest::modifynpcstat("special_attacks", "ABH");
      $npc->WipeHateList();
      quest::say("You fight well. We shall see how you handle my new pets in battle.");
      quest::settimer("IqthinxaPets", 20);
   }
}

sub CheckForRavs {
   $rav1 = $entity_list->GetMobByNpcTypeID(295131);
   $rav2 = $entity_list->GetMobByNpcTypeID(295132);
   $rav3 = $entity_list->GetMobByNpcTypeID(295133);
   if((!$rav1) && (!$rav2) && (!$rav3)) {
      quest::stoptimer("Iqthinxa");
      quest::modifynpcstat("special_attacks", "SRTQMCNIDf");
      quest::modifynpcstat("aggro", "200.0");
   }
   else {
      $RavCount = 0;
      if($rav1) {
         $RavCount++;
         if($rav1->CalculateDistance(171, 342, -418) >= 250) {
            $rav1->GMMove(171, 342, -418, 336);
         }
      }
      if($rav2) {
         $RavCount++;
         if($rav2->CalculateDistance(171, 342, -418) >= 250) {
            $rav2->GMMove(171, 342, -418, 336);
         }
      }
      if($rav3) {
         $RavCount++;
         if($rav3->CalculateDistance(171, 342, -418) >= 250) {
            $rav3->GMMove(171, 342, -418, 336);
         }
      }
      $WhichRav = 0;
      if($RavCount > 1) {
         if($RavCount == 2) {
            if($rav1) {
               if($rav2) {
                  $rav1HPR = $rav1->GetHPRatio();
                  $rav2HPR = $rav2->GetHPRatio();
                  if(abs($rav1HPR - $rav2HPR) >= 10.0) {
                     if($rav1HPR < $rav2HPR) {
                        $WhichRav = 1;
                        quest::signalwith(295131, 2, 0);
                        quest::signalwith(295132, 3, 0);
                        $TopHate = $rav1->GetHateTop();
                        $rav2->WipeHateList();
                        $rav2->AddToHateList($TopHate->CastToMob(), 100000);
                     }
                     else {
                        $WhichRav = 2;
                        quest::signalwith(295131, 3, 0);
                        quest::signalwith(295132, 2, 0);
                        $TopHate = $rav2->GetHateTop();
                        $rav1->WipeHateList();
                        $rav1->AddToHateList($TopHate->CastToMob(), 100000);
                     }
                  }
               }
               else {
                  $rav1HPR = $rav1->GetHPRatio();
                  $rav3HPR = $rav3->GetHPRatio();
                  if(abs($rav1HPR - $rav3HPR) >= 10.0) {
                     if($rav1HPR < $rav3HPR) {
                        $WhichRav = 1;
                        quest::signalwith(295131, 2, 0);
                        quest::signalwith(295133, 3, 0);
                        $TopHate = $rav1->GetHateTop();
                        $rav3->WipeHateList();
                        $rav3->AddToHateList($TopHate->CastToMob(), 100000);
                     }
                     else {
                        $WhichRav = 3;
                        quest::signalwith(295131, 3, 0);
                        quest::signalwith(295133, 2, 0);
                        $TopHate = $rav3->GetHateTop();
                        $rav1->WipeHateList();
                        $rav1->AddToHateList($TopHate->CastToMob(), 100000);
                     }
                  }
               }
            }
            else {
               $rav2HPR = $rav2->GetHPRatio();
               $rav3HPR = $rav3->GetHPRatio();
               if(abs($rav2HPR - $rav3HPR) >= 10.0) {
                  if($rav2HPR < $rav3HPR) {
                     $WhichRav = 2;
                     quest::signalwith(295132, 2, 0);
                     quest::signalwith(295133, 3, 0);
                     $TopHate = $rav2->GetHateTop();
                     $rav3->WipeHateList();
                     $rav3->AddToHateList($TopHate->CastToMob(), 100000);
                  }
                  else {
                     $WhichRav = 3;
                     quest::signalwith(295132, 3, 0);
                     quest::signalwith(295133, 2, 0);
                     $TopHate = $rav3->GetHateTop();
                     $rav2->WipeHateList();
                     $rav2->AddToHateList($TopHate->CastToMob(), 100000);
                  }
               }
            }
         }
         elsif($RavCount == 3) {
            $rav1HPR = $rav1->GetHPRatio();
            $rav2HPR = $rav2->GetHPRatio();
            $rav3HPR = $rav3->GetHPRatio();
            if((abs($rav1HPR - $rav2HPR) >= 10.0) || (abs($rav2HPR - $rav3HPR) >= 10.0) || (abs($rav1HPR - $rav3HPR) >= 10.0)) {
               if($rav1HPR < $rav2HPR) {
                  if($rav1HPR < $rav3HPR) {
                     $WhichRav = 1;
                     quest::signalwith(295131, 2, 0);
                     quest::signalwith(295132, 3, 0);
                     quest::signalwith(295133, 3, 0);
                     $TopHate = $rav1->GetHateTop();
                     $rav2->WipeHateList();
                     $rav3->WipeHateList();
                     $rav2->AddToHateList($TopHate->CastToMob(), 100000);
                     $rav3->AddToHateList($TopHate->CastToMob(), 100000);
                  }
                  else {
                     $WhichRav = 3;
                     quest::signalwith(295131, 3, 0);
                     quest::signalwith(295132, 3, 0);
                     quest::signalwith(295133, 2, 0);
                     $TopHate = $rav3->GetHateTop();
                     $rav1->WipeHateList();
                     $rav2->WipeHateList();
                     $rav1->AddToHateList($TopHate->CastToMob(), 100000);
                     $rav2->AddToHateList($TopHate->CastToMob(), 100000);
                  }
               }
               elsif($rav2HPR < $rav3HPR) {
                  $WhichRav = 2;
                  quest::signalwith(295131, 3, 0);
                  quest::signalwith(295132, 2, 0);
                  quest::signalwith(295133, 3, 0);
                  $TopHate = $rav2->GetHateTop();
                  $rav1->WipeHateList();
                  $rav3->WipeHateList();
                  $rav1->AddToHateList($TopHate->CastToMob(), 100000);
                  $rav3->AddToHateList($TopHate->CastToMob(), 100000);
               }
               else {
                  $WhichRav = 3;
                  quest::signalwith(295131, 3, 0);
                  quest::signalwith(295132, 3, 0);
                  quest::signalwith(295133, 2, 0);
                  $TopHate = $rav3->GetHateTop();
                  $rav1->WipeHateList();
                  $rav2->WipeHateList();
                  $rav1->AddToHateList($TopHate->CastToMob(), 100000);
                  $rav2->AddToHateList($TopHate->CastToMob(), 100000);
               }
            }
         }
      }
      if($WhichRav == 0) {
         quest::signalwith(295131, 1, 0);
         quest::signalwith(295132, 1, 0);
         quest::signalwith(295133, 1, 0);
      }
   }
}

sub EVENT_SIGNAL {
   if($signal == 1) {
      CheckForRavs();
   }  
} 

sub EVENT_TIMER {
   if($timer eq "IqthinxaPets") {
      SpawnIqthinxaPets();
   }
   if($timer eq "Iqthinxa") {
      CheckForRavs();
   }
}

# Iqthinxa_Karnkvi NPC ID: 295130
