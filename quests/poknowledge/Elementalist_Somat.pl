#Elementalist Somat.pl
#Magician PoP Spells/Songs


sub EVENT_SAY {
  if($text=~/Hail/i) {
    quest::say("Hello traveler."); #Text made up.
  }
 }
 
  sub EVENT_ITEM {
  if (plugin::check_handin(\%itemcount, 29112 => 1)) {#Ethereal Parchment
    quest::emote("examines the parchment and mumbles something."); #Emote made up
    quest::say("Thank you very much, this will help our research. Take this as a reward."); #Text made up
    quest::summonitem(quest::ChooseRandom(21641, 21642, 32411, 29357, 29358, 29359, 29360, 29361, 28413, 28428, 28429, 28440, 21637, 21643, 21646, 21669, 28430, 28431)); #Level 61 or 62 Magician spell, PoP (Belt of Magi'Kot, Blade of Walnan, Flameshield of Ro, Summon Platinum Choker, Summon Runed Mantle, Summon Sapphire Bracelet, Summon Spiked Ring, Summon Glowing Bauble, Shield of the Arcane, Ward of Xegony, Firebolt of Tallon, Elemental Barrier, Xegony's Phantasmal Guard, Fist of Ixiblat, Talisman of Return, Burnout V, Sun Storm, Servant of Marr)
  }
 
    elsif (plugin::check_handin(\%itemcount, 29131 => 1)) {#Spectral Parchment
    quest::emote("examines the parchment and mumbles something."); #Emote made up
    quest::say("Thank you very much, this will help our research. Take this as a reward."); #Text made up
    quest::summonitem(quest::ChooseRandom(21644, 29362, 28432, 28433, 28497, 16341, 29363, 21645, 21659, 21668, 28415, 28434)); #Level 63 or 64 Magician spell, PoP (Blade of The Kedge, Summon Jewelry Bag, Black Steel, Child of Ro, Malosinia, Elemental Silence, Maelstrom of Ro, Girdle of Magi'Kot, Destroy Summoned, Planar Renewal, Shield of Maelin, Maelstrom of Thunder)
  }
 
    elsif (plugin::check_handin(\%itemcount, 29132 => 1)) {#Glyphed Rune Word
    quest::emote("examines the rune and mumbles something."); #Emote made up
    quest::say("Thank you very much, this will help our research. Take this as a reward."); #Text made up
    quest::summonitem(quest::ChooseRandom(28435, 28436, 16342)); #Level 65 Magician spell, PoP (Rathe's Son, Sun Vortex, Call of the Arch Mage)
  }
    else {
        my $stuff = (\%itemcount);
        my $yes = 2;
        foreach my $k (keys(%{$stuff})) {
            next if($k == 0);
            $yes = 1;
        }
        if($yes == 1) {
            quest::say("I don't need this $name. Take it back.");
            plugin::return_items(\%itemcount);
        }
        if($platinum != 0 || $gold !=0 || $silver != 0 || $copper != 0) {
            quest::say("Thanks for the coin!");
        }
    }
}   
#Done, quest by Kilelen
