#########################################################################
# ZONE: Oggok (oggok)
# DATABASE:  AX-Classic 3.11b
# LAST EDIT DATE: August 10, 2009
# VERSION: 1.1
# DEVELOPER: Asram (Original Source Unknown but Not Me)
# REVISION NOTES: Added Clurg's Revenge
#
# *** NPC INFORMATION ***
#
# NAME: Clurg
# ID: 49049 
# RACE: 10  
# CLASS: 41
# LEVEL: 51
#
# *** ITEMS GIVEN OR TAKEN ***
#
# Ogre Head ID-13740
# Bunch of Ringmail (Large and Human-sized)
# Ogre War Maul ID-6302
# Barkeep Compendium ID-13379
# Stein of Moggok ID-13380
#
# *** QUESTS INVOLVED IN ***
#
# Clurg's Revenge
# Exotic Drinks
#

sub EVENT_SAY { 
if($text=~/Hail/i){
quest::say("Hello, friend. Have a drink. I have some [unique drinks]. Try one, and remember: You get rowdy...the [Bouncers] crush you.");
  }
if($text=~/bouncers/i){
quest::say("The Bouncers were organized by me. As I traveled to many of the world's taverns, I encountered great enforcers called bouncers. It was their duty to keep things under control. When I returned and rose to greatness after the creation of the [Flaming Clurg], I organized the Oggok Bouncers to keep the [rival guilds] under control.");
  }
if($text=~/flaming clurg/i){
quest::say("The Flaming Clurg was my greatest creation. It brought me great respect in Oggok. Unfortunately, I have heard tales of an [imposter drink] streaming down the alleys of Neriak.");
  }
if($text=~/imposter drink/i){
  quest::say("Bah! That damned Pungla! She imitates the Flaming Clurg with her own swill, and I can't have that.");
  if ($faction < 5) {
	quest::say("If someone returned to me with her head, I would reward them for their good tidings.");
	}
	else {quest::say("Find ways to help all in Oggok. Then we will have conversation.");
    }
  }
if($text=~/what rival guilds/i){
quest::say("Oggok has been the battleground for the feud between the Greenblood knights and shamans and the Craknek warriors. It is fueled by the superior intellect of the Greenbloods. Few remember that I. Clurg. was once dim. but now I speak with great words.");
  }
}


sub EVENT_ITEM
{
 if(plugin::check_handin(\%itemcount, 13740 => 1)) # Ogre Head (From Pungla in neriaka)
  {
   quest::say("Ahahaha! Dat witch sur did get wat was commin ta her!");
   quest::givecash(0,0,0,5);
   quest::summonitem(quest::ChooseRandom(3125,3127,3128,3129,3130,3131,3132,3133,3134,3135,3136,3101,3103,3104,3105,3106,3107,3108,3109,3110,3111,3112,6302)); #Random selection of large ringmail, ringmail, or ogre war maul
   quest::exp(12500);
   quest::ding();
   quest::faction(69, -71); #Dark Bargainers
   quest::faction(46, 10);  #Clurg
  }
if(plugin::check_handin(\%itemcount, 13379 => 1) && ($faction <5)){ #Barkeep Compendium and Amiable or Better Faction
   quest::summonitem(13380); #Stein of Moggok
   quest::exp(12500);
   quest::ding();
   quest::faction(46, 10); #Clurg
   quest::faction(39, -30); 
   quest::faction(169, -30);
 }
plugin::return_items(\%itemcount);
}

#END of FILE Zone:oggok  ID:49049 -- Clurg 