# Attempt to limit players level 53 and over from engaging nagafen and vox.
# Player will be banished to just outside the permafrost zone in everfrost.

sub EVENT_ATTACK {
   if($ulevel >= 53) {
      quest::shout("I will not fight you, but I will banish you!");
      quest::movepc(30,-7021.9,2020.1,-59.8,190.1);
   }
}

# EOF zone: permafrost ID: 73057 NPC: Lady_Vox

