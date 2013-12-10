# Test of Phanatsm - enchanter epic - start of quest
# 

sub EVENT_SAY {
my $serpent = quest::saylink("serpent", 1);
my $ghost = quest::saylink("ghost", 1);
my $vampire = quest::saylink("vampire", 1);
my $sands = quest::saylink("sands", 1);
  if ($text=~/hail/i) {
    quest::say("Yes, young one?");
  }
  if ($text=~/ready/i) {
    quest::say("It will be simple. Go collect these items and return them to me: head of a $serpent, essence of a $ghost, essence of a $vampire, and $sands of the mystics. Do so and you will receive the last of the pieces. Be sure to combine them in the sack I provided.");
  }
  if ($text=~/serpent/i) {
    quest::say("Serpent is probably not an accurate term for what you must return to me. It is actaully the reminants of a spirit. The spirit is one which was eradicated long, long ago by the Iksar. I believe they were called the Shissar. You may need to travel to the Iksar city to learn more about these creatures.");
  }
  if ($text=~/ghost/i) {
    quest::say("You don't have to look far to find roaming spirits. One in particular though has more meaning then the other sorry souls trapped here. You see, Kindle was a dear friend of mine. I came in search of him when he stopped writing. Well...look at me now. I fear that I have succumbed to the same fate as poor Kindle.");
  }
  if ($text=~/vampire/i) {
    quest::say("The essence of a vampire is just that. Only the most powerful of these creatures will possess what you need.");
  }
  if ($text=~/sands/i) {
    quest::say("They are sands that were imbued with the magical might of the mystics. Mystics use a ritual involving their own blood to create a powerful bond with the sand. One will need to search the shores.");
  }
}

sub EVENT_ITEM {
my $ready = quest::saylink("ready", 1);
  if (plugin::check_handin(\%itemcount, 10604 => 1)) {# Jeb's Seal
    quest::say("Jeb has spoken with you already, excellent. Tell me are you $ready for the test of the phantasm?");
    quest::summonitem(10604);#Jeb's Seal Returned
    quest::summonitem(17861);#Enchanters Sack
  }
  if (plugin::check_handin(\%itemcount, 10638 => 1)) {# Sack for Polzin
    quest::say("You have done well, take this last piece and return them to Jeb. He will be able to complete the final crafting.");
    quest::faction(342,30);
     quest::ding();
	 quest::exp(2304535);
    quest::summonitem(10613); #4th Piece of Staff for Enchanter Epic 1.0
  }
  else {
    plugin::return_items(\%itemcount);
  }
}

# EOF Zone: hole ID: 39063 NPC: Polzin_Mrid