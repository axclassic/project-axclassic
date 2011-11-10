#############
#Quest Name:The Bind
#Author:Shaznito
#NPCs Involved:Xanuusus, Ilscent Tagglefoot
#Items Involved:
#################

# earthcaller - ranger epic

sub EVENT_SAY {

 if ($text=~/hail/i) {
 quest::say("Greetings, small one! I am Xanuusus of the Stormreapers. You are welcome to rest beneath my mighty branches.");
 
 }
}



sub EVENT_ITEM {

  if (plugin::check_handin(\%itemcount, 20483 => 1, 20484 => 1)) {
  quest::emote("waves his hands over the gem of corruption and a wave of warm energy passes through the area. With care for such a huge creature, he melds the gem into the sword and seems to glow all over as he channels energy into the weapon. 'Thus is the link of hate broken between Innoruuk and the spirit of earth. Through your will has balance returned. Your deeds, your work for the good of all, will be remembered by anyone who walks beneath the canopy of a forest or roams the plains. Continue your vigil over nature's balance.");

  quest::summonitem(20488);
   quest::ding(); quest::exp(2500000);
}

 elsif (plugin::check_handin(\%itemcount, 20699 => 1, 20697 => 1, 20698 => 1)) {

  quest::summonitem(20490);
   quest::ding(); quest::exp(2500000);
}
 # Hand in for Case of JumJum juice
 elsif (plugin::check_handin(\%itemcount, 13411 => 1)){
  quest::say("Heh heh! Excellent, small one!  My roots have been longing for some fresh jumjum juice!  Thank you!  Take this for your trouble.  Be sure to thank the Tagglefoots for me.");
 
 
 } else {
  plugin::return_items(\%itemcount);
  quest::say("I have no need for this $name, you can have it back.");
 }
}
# EOF zone: northkarana ID: 13061 NPC: Xanuusus