# Attempt to limit players level 53 and over from engaging nagafen and vox.
# On live servers a player is banished to lavastorm but with the revamped
# zone problem players will be temporarily sent to soldunga safe point until
# lavastorm is a useable zone.

sub EVENT_ATTACK {
   if($ulevel >= 53) {
      quest::shout("I will not fight you, but I will banish you!");
      quest::movepc(31,-485.77,-476.04,73.72);
   }
}
# EOF zone: soldungb ID: 32040 NPC: Lord_Nagafen

