#############
#NPC: Ryshon_Hunsti ID:12081
#Quest Name: Sword of Nobility (Ghoulbane)
#Quest by:
#Revised: mystic414, Olhadon
#NPCs Involved: Kanthuk_Ogrebane
#Items Involved: Note to Kanthuk ID:2416
#zone: qey2hh1

sub EVENT_SAY {
  if($text=~/hail/i) {
    quest::say("Hello, $name. What brings you to the Karanas? Do you seek [enlightenment]?");
  }
  if($text=~/I seek enlightenment/i) {
    quest::say("Ahh, i could see by the look in your eyes that you are looking for something more than just enlightenment. Perhaps you are looking for a [sword] crafted by a noble man.");
  }
  if($text=~/what sword/i) {
    quest::say("It is not just a sword friend. It is much more than that. This sword carries with it special [power], something unlike anything else within this realm.");
  }
  if($text=~/what power/i) {
    quest::say("It is an instrument fashioned together by a noble man. It is said to be blessed by the gods themselves. Only a man who comes from nobility may wield it. Do you seek the [sword of nobility]?");
  }
  if($text=~/I seek.*?sword of nobility/i) {
    quest::say("I see.  Then take this note to Kanthuk Ogrebane. I've been told he can be found fishing not far from the dwarven city.");
    #Note to Kanthuk ID:2416
    quest::summonitem(2416);
  }
}

sub EVENT_ITEM {
  quest::emote("I have no need for this $name, you can have it back.");
  plugin::return_items(\%itemcount);
}

#END of FILE Zone:qey2hh1 ID:12081 -- Ryshon_Hunsti

