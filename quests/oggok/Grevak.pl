############################################
# ZONE: Oggok (oggok)
# Database: AXClassic 3.11b
# LAST EDIT DATE: August 13, 2009
# Version 1.2
# Developer: Asram
#
# *** NPC INFORMATION ***
#
# NAME: Grevak
# ID: 49037
# Type: Shadowknight Guild Master
# Race: Ogre
# Level: 61
#
# *** ITEMS GIVEN OR TAKEN ***
#
# Lizard Tail ID - 13354
# Pickled Lizard ID - 13453
# Mystic Doll ID - 13367
#
# *** QUESTS INVOLVED IN ***
#
# Lizard Tails #2
# Lizardman Mystic Shaman Dolls
#
# *** QUESTS AVAILABLE TO ***
#
# Must be Indifferent or better
#
###########################################


sub EVENT_SAY {
  if(($text=~/Hail/i) && ($faction <=5)) {
    quest::say("Need new members we do not. Powerful enough are we with Grevak. Still. peons needed. Are you a [new peon] or are you an [outsider]? Speak up!! Fool!! No time Grevak has!!");
      }
  elsif(($text=~/i am a new peon/i) && ($faction <=5)){
    quest::say("So you think you can be greater than Grevak!! Touch you not and still I can smash you. I am a Greenblood shadowknight!! Peon are you. Peons go to swamps and slay lizardmen. You return with four lizardmen tails and a reward is yours. You return with two lizardman shaman dolls and a great reward is yours.");
      }
  elsif($text=~/i am an outsider/i){
    quest::say("Go away or soon your pain will find you.");
    quest::emote("glowers at you menacingly as his already-limited patience approaches an end.");
            }
   else {
   quest::say("Grevak mighty and you, $race, are not.  Go away until you more like Grevak.");
   quest::emote("stomps his foot.");
   }
      
}

sub EVENT_ITEM {
  if  (plugin::check_handin(\%itemcount, 13354 => 4)) {
   # Text created by Asram since nothing found on Allakhazam
   quest::say("Grevak rewards peon with reward instead of smashing you.  Bring me more, peon!");
   #Summon Pickled Lizard
   quest::summonitem(13453);
   quest::ding();
   quest::exp(500);
   
   quest::faction(46,30);     # Increase faction -- Clurg
   quest::faction(128,30);    # Increase faction -- Greenblood Knights
   quest::faction(292,-30);   # Decrease faction -- Shadowknights of Night Keep
   quest::faction(314,-10);   # Decrease faction -- Storm Guard
    }
elsif(plugin::check_handin(\%itemcount, 13367 => 2))
   {
   quest::say("Grevak rewards you. Grevak now afraid of nothing! Ha ha! Mighty mighty!");    # Text created by Asram since nothing found on Allakhazam
   quest::summonitem(quest::ChooseRandom(13453,5013,5014,5016,5019,5020,5023,5025)); #Summon Random Rusty Shadowknight-Friendly weapon
   quest::exp(500);
    quest::ding();
   quest::faction(128,30);    # Increase faction -- Greenblood Knights
   quest::faction(292,-30);    # Decrease faction -- Shadowknights of Night Keep
    }

  #do all other handins first with plugin, then let it do disciplines
  plugin::try_tome_handins(\%itemcount, $class, 'Shadowknight');
  plugin::return_items(\%itemcount);

}
#END of FILE Zone:oggok  ID:49037 -- Grevak 
