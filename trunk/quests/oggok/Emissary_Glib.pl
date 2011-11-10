#########################################################################
# ZONE: Oggok (oggok)
# DATABASE:  AX-Classic 3.11c
# LAST EDIT DATE: August 14, 2009
# VERSION: 0.1 (Incomplete first draft)
# DEVELOPER: Asram
# REVISION NOTES: Initial draft; incomplete; requires spawnpath & depop at end of quest after giving info
#
# *** NPC INFORMATION ***
#
# NAME: Emissary_Glip
# ID: 49127
# RACE: 26
# CLASS: 1
# LEVEL: 20
#
# *** ITEMS GIVEN OR TAKEN ***
#
# Frog Eye Necklace ID-13369 (Received; Dropped from troll slayers in Innothule)
# Frog Eye Necklace ID-13370 (Received; Drops from slayer captain in Innothule)
#
# *** QUESTS INVOLVED IN ***
#
# 278 - The Emissary
#

sub EVENT_SAY {
 if($text=~/hail/i){
  quest::say("Gloop...Are you the one? Who sent you?");
    }
  elsif($text=~/Greenblood shaman sent me/i){
  quest::say("Gloop...Good. I am the secret emissary of the frogloks of Guk. I have come to help your community, provided, that is, that you help mine. Gloop...I want you to track down and kill the troll hunters called 'slayers.' They are capturing our foragers in the swamps. Return their slayer necklaces to me and I shall pay you, but most important, find the slayer captain. Bring me his captain's necklace and I shall give you a secret. I must leave soon. If you need me, just ask Marda where I am.");
    }   


}

sub EVENT_ITEM {
  if(plugin::check_handin(\%itemcount, 13369=> 1)) {
  quest::emote("sighs and then smiles faintly.");
  quest::say("Glug-goak, $name. Thank you for this. I do appreciate your efforts. Take this coin as a show of my appreciation.  What I really need, though, is the slayer captain's necklace to make a dent in their morale.");
  quest::faction(233,10); #Oggok Residents
  quest::givecash(0,8,0,0);
  quest::ding();
  quest::exp(5400);
  }
  elsif(plugin::check_handin(\%itemcount, 13370=> 1)) {
  quest::emote("sighs and then smiles faintly.");
  quest::say("Glug-goak, $name. This will surely destabilize their morale.  Now if only we could rescue our great conciliator.  With his capture by the trolls in Grobb, there is no longer any chance of an accord.  Please go speak with this prisoner and ensure he's alright.");
  quest::faction(233,10); #Oggok Residents
  quest::givecash(0,8,0,0);
  quest::summonitem(quest::ChooseRandom(5001,5002,5003,5004,5005,5006,5007,5008,5009,5010,5011,5012,17928,13371));
  quest::ding();
  quest::exp(5400);
  }
  else {
    quest::emote ("smiles briefly.");
    quest::say("Grigook, $name. I don't need this. Thanks anyway.");
    plugin::return_items(\%itemcount);
    }
}