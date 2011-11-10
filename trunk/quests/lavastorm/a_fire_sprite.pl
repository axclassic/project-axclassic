#########################################
# ZONE: Lavastorm Mountains (lavastorm)
# DATABASE: PEQ
# DEVELOPER: ATTEMPT37
#
# **NPC INFORMATION**
#
# NAME: a_Fire_Sprite
# ID: none
# Body type: Fire Imp
#
# **QUEST INFORMATION**
#
# Celestial Fists (Monk Epic 1.0)
#
#
#
#
#########################################

sub EVENT_SAY {
   if($text=~/i challenge eejag/i) {
      # Monk Epic 1.0
      quest::spawn(27034, 0, 0, 282.2, 1071.3, -230.2);
      quest::depop();
   }
}

# END OF FILE

