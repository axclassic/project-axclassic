# Fabled depop

sub EVENT_AGGRO {
   if($ulevel < 55) {
      quest::shout("We shall meet again $name! When you are a worthy opponent!!");
      quest::depop;
   }
}

# EOF zone: soldungb ID: 32081 NPC: #Fabled_Solusek_Kobold_King

