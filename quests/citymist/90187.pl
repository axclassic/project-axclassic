# Part of SK Epic 1.0
# This quest needs to be named by NPCID rather than the mob's name

sub EVENT_SPAWN {
  quest::say("Young one, you cannot fathom how long it has been since I breathed air and felt flesh on my bones. I told you I would show you a weapon that would make you the most powerful of your kind. I said nothing of giving it to you. Feast your eyes on Innoruuk's Curse, mortal! Thank you for your service.");
  quest::attack($name);
}

sub EVENT_DEATH {
  quest::spawn2(74191, 0, 0, 25, 25, 7.1, 178);
}

# Quest by mystic414

