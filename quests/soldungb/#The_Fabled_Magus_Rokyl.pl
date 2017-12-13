# Fabled depop

sub EVENT_AGGRO {
   if($ulevel < 55) {
      quest::shout("We shall meet again $name! When you are a worthy opponent!!");
      quest::depop;
   }
}

# EOF zone: soldungb ID: 32080 NPC: #The_Fabled_Magus_Rokyl

