#####################################
# ZONE: Lavastorm Mountains (lavastorm)
# DATABASE: PEQ
# Developer: ATTEMPT37
#
# **NPC INFORMATION**
#
# NAME: Eejag
# 
#
# **ITEMS GIVEN OR TAKEN**
#
#
# **QUESTS INVOLVED**
#
# Celestial Fists (Monk epic 1.0)
#
#
#####################################

sub EVENT_SPAWN {
   quest::settimer("eejag1", 5);
   quest::shout("What imbecile dares challenge a Celestial Fist?! Do you even know who you are challenging? HA! You are nothing but an insect! I will enjoy crushing you, I have not charred the flesh of an idiot in decades! If you truly wish to fight me, the battle shall be held in my own element. Come, challenger, come down to the pits of flowing fire.");
}

sub EVENT_TIMER {
   if($timer eq "eejag1") {
      if($x > 382 || $x < 182 || $y > 1171 || $y < 971 || $z > -19 || $z < -270) {
         $npc->GMMove(282.2, 1071.3, -230.2, 251.9);
         $npc->WipeHateList();
      }
   }
}


# End of File
