# NPC: Terren Starwatcher (ID:61017)
#
# Quests:
#   Sylvan Initiate Armor
#   Sylvan Initiate Further Guidance

sub EVENT_SAY {
    if ($text=~/Hail/i) {
        quest::say("Welcome friend! Have you come to the Temple of Tunare to give praise or are you a young Cleric [seeking guidance] from your elders?");
    }

    if ($text=~/seeking guidance/i) {
        quest::say("Tunare shall be pleased to have a new disciple amongst her Koada`Dal children. We Clerics of Tunare offer spiritual guidance to the citizens of Felwithe and when needed aid the Paladins of Tunare and the Keepers of the Art in the defense of our people and forest from those [creatures] that seek to cause us harm. Every young cleric should pursue acquiring a [suit of armor] to protect themselves when aiding those in need outside of the safety of Felwithes walls.");
    }

    if ($text=~/creatures/i) {
        quest::say("There are many evil creatures in Norrath. Some are evil by nature, others have chosen evil by their devotion to evil deities. Even the Faydarks are not safe for young Koada`Dal. The orcs of Clan Crushbone seek to expand their territory from their citadel to the north. The brownies viciously guard their hidden communities, pixies play mischievous and sometimes deadly pranks on travelers, and the arboreans have returned to the Faydarks after centuries of slumber.");
    }

    if ($text=~/suit of armor/i) {
        quest::say("You will need this Mail Assembly Kit to craft your Sylvan Initiate Armor. The materials required for the armor vary according to which piece you desire to craft. Once you have been suitably outfitted return to me and I will offer [further guidance]. Do you desire to craft Sylvan Initiate [Gauntlets], [Boots], [Bracer], [Helm], [Greaves], [Vambraces], or [Breastplate]?");
        quest::summonitem("17124"); # Mail Assembly Kit
    }

    if ($text=~/gauntlets/i) {
        quest::say("To assemble sylvan initiate gauntlets you will need to obtain two bricks of crude bronze and smelt them in a forge with a Water Flask and this Crude Gauntlet Mold. Once that is done combine the Crude Bronze Gauntlets with a Large Sylvan Bat Fur and two Arborean Sprout Twigs in the Mail Assembly Kit.");
        quest::summonitem("19633"); # Crude Gauntlets Mold
    }

    if ($text=~/boots/i) {
        quest::say("To assemble sylvan initiate boots you will need to obtain two bricks of crude bronze and smelt them in a forge with a Water Flask and this Crude Boot Mold. Once that is done combine the Crude Bronze Boots with two Large Sylvan Bat Fur and two Arborean Sprout Roots in the Mail Assembly Kit.");
        quest::summonitem("19634"); # Crude Boot Mold
    }

    if ($text=~/bracer/i) {
        quest::say("To assemble a sylvan initiate bracer you will need to obtain a brick of crude bronze and smelt it in a forge with a Water Flask and this Crude Bracer Mold. Once that is done, combine the Crude Bronze Bracer with a Large Sylvan Bat Fur and an Arborean Sprout Bark in the Mail Assembly Kit.");
        quest::summonitem("19632"); # Crude Bracer Mold
    }

    if ($text=~/helm/i) {
        quest::say("To assemble a sylvan initiate helm you will need to obtain two bricks of crude bronze and smelt them in a forge with a Water Flask and this Crude Helm Mold. Once that is done combine the Crude Bronze Helm with a Large Sylvan Bat Fur and an Arborean Sapling Bark in the Mail Assembly Kit.");
        quest::summonitem("19631"); # Crude Helm Mold
    }

    if ($text=~/greaves/i) {
        quest::say("To assemble sylvan initiate greaves you will need to obtain two bricks of crude bronze and smelt them in a forge with a Water Flask and this Crude Greaves Mold. Once that is done combine the Crude Bronze Greaves with two Giant Sylvan Bat Furs and two Arborean Sapling Barks in the Mail Assembly Kit.");
        quest::summonitem("19636"); # Crude Greaves Mold
    }

    if ($text=~/vambraces/i) {
        quest::say("To assemble sylvan initiate vambraces you will need to obtain two bricks of crude bronze and smelt them in a forge with a Water Flask and this Crude Vambrace Mold. Once that is done combine the Crude Bronze Vambraces with a Giant Sylvan Bat Fur and two Arborean Sapling Barks in the Mail Assembly Kit.");
        quest::summonitem("19635"); # Crude Vambrace Mold
    }

    if ($text=~/breastplate/i) {
        quest::say("To assemble a sylvan initiate breastplate you will need to obtain four bricks of crude bronze and smelt them in a forge with a Water Flask and this Crude Breastplate Mold. Once that is done combine the Crude Bronze Breastplate with a Giant Sylvan Bat Fur and two Mature Arborean Barks in the Mail Assembly Kit.");
        quest::summonitem("19637"); # Crude Breastplate Mold
    }

    if ($text=~/further guidance/i) {
        quest::say("If you are ready to put your life on the line for the citizens of our homeland than hear my words. The Crushbone Clan of Orcs are evil and strong adversaries of we Koada`Dal. Recently an orc scout assaulted a merchant from our city carrying a valuable amulet from the Fier`Dal city of Kelethin. Our seers have divined the name of the orc that is in possession of the amulet, Gurleg Bribgok. Find this despicable creature and return the amulet to me so that I may return it to its proper owner.");
    }
}

sub EVENT_ITEM {
    # Sylvan Initiate Further Guidance
    if (plugin::check_handin(\%itemcount, 20280 => 1)) { # Silver Leafed Emerald Amulet
        quest::say("You have done well young $name. If you continue to show such devotion to your people and your faith then perhaps one day you will serve in the chambers of King Tearis Thex himself. Take this Rusty Sylvan Morning Star and scrape the rust from it in a forge with a sharpening stone. It may take several attempts if you are unfamiliar with the process. Once that is done bring me the Refined Sylvan Morning Star, a Pristine Drakeling Scales, and an Arborean Amber.");
        quest::summonitem(20297); # Rusty Sylvan Morning Star
        quest::faction(43, 10);  # +Clerics of Tunare
        quest::faction(178, 10); # +King Tearis Thex
        quest::faction(8, 10);   # +Anti-Mage
        quest::ding();
        quest::exp(3500);
    }
    # Sylvan Initiate Further Guidance
    #   Refined Sylvan Morning Star (ID:20300)
    #   Pristine Forest Drakeling Scales (ID:20271)
    #   Arborean Amber (ID:20274)
    elsif (plugin::check_handin(\%itemcount, 20300 => 1, 20271 => 1, 20274 => 1)) {
        quest::emote("fashions a grip out of the pristine forest drakeling scales, fastens the arborean amber to the pommel, and polishes the head of the morning star with a luminescent substance.");
        quest::say("I grant you a Sylvan Initiate Morning Star. May it serve you well in your service to The All Mother.");
        quest::summonitem(20330); # Sylvan Initiate Morningstar
        quest::faction(43, 10);  # +Clerics of Tunare
        quest::faction(178, 10); # +King Tearis Thex
        quest::faction(8, 10);   # +Anti-Mage
        quest::exp(3500);
        quest::ding();
    } else {
        # Do all other handins first with plugin, then let it do disciplines
        plugin::try_tome_handins(\%itemcount, $class, 'Cleric');
        plugin::return_items(\%itemcount);
    }
}
#END of FILE Zone:felwithea  ID:61017 -- Terren_Starwatcher
