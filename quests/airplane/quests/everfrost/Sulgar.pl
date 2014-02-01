# Sulgar
# Location: everfrost - Everfrost Peaks
# npcID: 
# spawngroupID:
# Quests:
#    Tarton's Wheel quest for Spell: Ice Comet by darkonig
#    quest text was not available so made up some. The initial keyword is correct to trigger it tho.

sub EVENT_SAY {
  if($text=~/hail/i) {
   quest::say("Hail, traveler! Would you happen to [know] the location of any of the spokes of Tarton's Wheel?");
  }
  elsif($text=~/Tarton/i) {
  quest::say("Tarton's Wheel was a device that Tarton constructed to let him travel through the planes. If you are interested in helping me reassemble it, I will [reward] you well.");
  }
  elsif($text=~/reward/i) {
  quest::say("If you bring me the [Staff of the Wheel] and the Star of Eyes, I will reward you with a rune of frost and a rune of the astral - for personal use, of course...");
  }
  elsif($text=~/Staff of the Wheel/i) {
  quest::say("The Staff of the Wheel and the Star of Eyes are made by combining the ten spokes of Tarton's Wheel in a [wheel case].");
  }
  elsif($text=~/wheel case/i) {
   quest::say("I will lend you this wheel case - put the ten spokes of the wheel in it when you have collected them. I did say lend, however. I shall need the case back. Once you have constructed the Staff of the Wheel and the Star of Eyes, I will trade you them for a rune of frost and a rune of the astral.");
   quest::summonitem(17510); # a glowing chest - quest combiner
  }

  elsif($text=~/wheel/i) {
   quest::say("The wheel was broken into several pieces and scattered throughout the world. This book will give you clues as to their whereabouts. Once you gather all the pieces, they can be reassembled in a special [case]");
   quest::summonitem(18031); # Tome of the Wheel
  }

}

sub EVENT_ITEM {
  # Tarton's Wheel quest
  # items needed:
  #     14360 Staff of the Wheel
  #     14361 Star of Eyes
  # items received:
  #     11880 Rune of Frost
  #     11881 Rune of the Astral
  # plus faction received
  #     none
  # minus faction received
  #     none
  # experience received:
  #	100000

  if(plugin::check_handin(\%itemcount, 14360 => 1, 14361 => 1)) {
    quest::say("Wonderful, you have brought me the Wheel. Here is the reward I promised you.");
    quest::summonitem(11880);
    quest::summonitem(11881);
    quest::ding();
    quest::exp(100000);
  }

  else {
    quest::say("I have no interest in these items.");
    plugin::return_items(\%itemcount);
  }

}
