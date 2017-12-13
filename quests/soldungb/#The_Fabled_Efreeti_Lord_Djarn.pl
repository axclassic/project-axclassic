# Fabled depop

sub EVENT_AGGRO {
   if($ulevel < 65) {
      quest::shout("We shall meet again $name! When you are a worthy opponent!!");
      quest::depop;
   }
}

# EOF zone: soldungb ID: 32076 NPC: #The_Fabled_Efreeti_Lord_Djarn

