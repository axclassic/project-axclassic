#############
#NPC: #Llara ID:70043
#Quest Name: Sword of Nobility (Ghoulbane)
#Quest by:
#Revised: mystic414, Olhadon
#NPCs Involved: Kanthuk_Ogrebane, Ruathey
#Items Involved: Pendant (Trunolis Family) ID: 2414, Note to Ruathey ID:2417
#zone: cauldron

sub EVENT_SAY {
  if($text=~/hail/i) {
    quest::say("Hail, $name.");
  }
  elsif (!defined($qglobals{"pendant"})){
	  quest::setglobal("pendant", 0, 0, "M5");
  }
  # Only responds with text if hand-in was completed or if $client already has quest item.
  elsif($qglobals{"pendant"} == 1 || plugin::check_hasitem($client, 2417)) {
    if($text=~/Kanthuk.*?me/i) {
      quest::say("I take it you're here to find out more about [Amstaf].");
    }
    elsif($text=~/who.*?Amstaf/i) {
      quest::say("I've known Amstaf since he was a child. We grew up in the same city together. Ever since I've known him there's always been something [unusual] about him.");
    }
    elsif($text=~/what.*?unusual/i) {
      quest::say("When we were growing up we used to venture outside the city gates. Sometimes we would encounter a wandering ghoul or an undead spirit of some sort. He was always able to quickly dismiss the undead being with very little effort. I [learned] many things growing up with Amstaf.");
    }
    elsif($text=~/what.*?learn/i) {
      quest::say("Amstaf told me many things when we were younger. Once Amstaf told me that life isn't about how you get there, it's about where you end up. I miss my dear friend. Its been a long time since I've seen him. The night of the snowstorm I dreamt about him. I remember seeing Amstaf's face. I saw something I've never [seen] before.");
    }
    elsif($text=~/what.*?see/i) {
      quest::say("I saw desperation. I spoke to many people who knew Amstaf trying to find out if anyone heard anything about that night. No one knew anything about it. When I had reached the dwarven hunting grounds I ran into a woman named Walnan. She kept rambling on and on about the power of the Orb and something about Magi`kot. I didn't understand what she was saying. She didn't know anything about my situation either, but she did tell me that there were others that may be able to help me. She told me that I should find [Ruathey].");
    }
    elsif($text=~/who.*?Ruathey/i) {
      quest::say("Ruathey is known for her ability to look into people's souls and find truth. Though I wasn't able to find Amstaf, I was able to recover his sword. I believe that by having his sword I am closer to finding him. Take this note to Ruathey and tell her that I sent you.");
      #Note to Ruathey ID:2417
      if (!plugin::check_hasitem($client, 2417)) {
        quest::summonitem(2417);
        quest::delglobal("pendant");
      }
    }
  }
}

sub EVENT_ITEM {
  #Pendant (Trunolis Family) ID: 2414
  if($itemcount{2414} == 1) {
    quest::say("Oh my, this belongs to Amstaf! Where did you get it?");
    quest::setglobal("pendant", 1, 0,"D2");
  }
  else {
    quest::emote("I have no need for this $name, you can have it back.");
    plugin::return_items(\%itemcount);
  }
}

#END of FILE Zone:butcher ID:70043 -- #Llara

