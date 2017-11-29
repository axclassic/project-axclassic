# Attempt to limit players level 53 and over from engaging nagafen and vox.

sub EVENT_ATTACK {
   if($ulevel >= 53) {
      quest::shout("I will not fight you, but I will banish you!");
      quest::movepc(27,1400.5,983.0,128.6, 197.3);
   }
}

# EOF zone: soldungb ID: 32040 NPC: #Lord_Nagafen

