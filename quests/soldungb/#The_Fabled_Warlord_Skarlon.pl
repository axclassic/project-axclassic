# Fabled depop

sub EVENT_AGGRO {
   if($ulevel < 65) {
      quest::shout("We shall meet again $name! When you are a worthy opponent!!");
      quest::depop();
   }
}

# EOF zone: soldungb ID: 32082 NPC: #The_Fabled_Warlord_Skarlon

