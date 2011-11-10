# special gemstone for paladin quest spell divine might
#

sub EVENT_ITEM {
  if (plugin::check_handin(\%itemcount, 10033 => 1)) { #fire emerald
    quest::emote("examines the fire emerald, reaches into his pouch and hands you another. 'There you go, it doesn't look special but it is. If you don't believe me I'll take another look at it. Just remember this special fire emerald only has one purpose!'");
    quest::summonitem(10013);
  }
  elsif (plugin::check_handin(\%itemcount, 10013 => 1)) { #special fire emerald
    quest::say("There you go, it doesn't look special, but it is.");
    quest::summonitem(10013);
  }
}

# EOF zone: firiona ID: 84301 NPC: Drake_Mountainstorm


