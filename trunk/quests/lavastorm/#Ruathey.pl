#############
#NPC: #Ruathey ID:27020
#Quest Name: Sword of Nobility (Ghoulbane)
#Quest by:
#Revised: mystic414, Olhadon
#NPCs Involved: Llara
#Items Involved: Note to Ruathey ID:2417, Nobleman's Bag ID: 17878, Ghoul's Heart ID:2410, Amstaf's Scroll ID:2411, Blade of Nobility ID:2412, Hilt of the Nobleman ID:2413
#zone: lavastorm

sub EVENT_SAY {
  if($text=~/Hail/i) {
      quest::say("Hello, $name.");
  }
  elsif (!defined($qglobals{"note"})){
	  quest::setglobal("note", 0, 0, "M5");
  }
  # Only responds with text if hand-in was completed or if $client already has quest item.
  elsif($qglobals{"note"} == 1 || plugin::check_hasitem($client, 17878)) {
    if($text=~/what sword/i) {
      quest::say("I've heard stories about a holy sword. There are many rumored to be hidden all throughout the world, yet only a few have actually been found. Amstaf had one of these swords. It is known for its ability to dismiss the undead. Perhaps by having this sword it'll bring you closer to finding your friend. Gather a ghoul's heart, Amstaf's Scroll, the Blade of Nobility, and a noblemans hilt and place them in this [bag].");
    }
    elsif($text=~/what bag/i) {
      quest::say("Take this bag and gather the items I've mentioned. I've been told that the Ghoul's Heart can be found in the estate of the undead, while the scroll can be found in the Keep not far from the Karanas. One of the others are rumored to be found near the dwarven city among the goblins. While the last should be found in the caverns of Najena.");
      #Nobleman's Bag ID: 17878
      if (!plugin::check_hasitem($client, 17878)) {
        quest::summonitem(17878);
        quest::delglobal("note");
      }
    }
  }
}

sub EVENT_ITEM {
  #Note to Ruathey ID:2417
  if($itemcount{2417} == 1) {
    quest::say("I see that you've spoken to Llara. She too came to me looking for Amstaf. Though she wasn't able to find her friend, she was able to recover his [sword].");
    quest::setglobal("note", 1, 0,"D2");
  }
  else {
    quest::emote("I have no need for this $name, you can have it back.");
    plugin::return_items(\%itemcount);
  }
}

#END of FILE Zone:lavastorm ID:27020 -- #Ruathey

