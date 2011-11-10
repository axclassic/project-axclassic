############################################
# ZONE: East Freeport (freporte)
# DATABASE: PEQ-Velious
# LAST EDIT DATE: May 1,2005
# VERSION: 1.0
# BASE QUEST BY: PEQ Team
# DEVELOPER: MWMDRAGON
#
# *** NPC INFORMATION ***
#
# NAME: Xelha_Nevagon
# ID: 10093
# TYPE: Necromancer Guild Master
# RACE: Human
# LEVEL: 61
#
# *** ITEMS GIVEN OR TAKEN ***
#
# Spiderling Silk ID-13099
# Fire Beetle Eye ID-10307
# Bone Chips ID-13073
# Cyclops Eye ID-13927
#
# -= Random Spell Reward =-
#
# Spell: Beguile Undead ID-15197
# Spell: Call of Bones ID-15643
# Spell: Greater Shielding ID-15066
# Spell: Invoke Shadow ID-16434
# Spell: Resist Disease ID-15063
# Spell: Venom of the Snake ID-15435
#
# *** QUESTS INVOLVED IN ***
#
#1 - Xelha's Spiderling Silk
#2 - Xelha's Fire Beetle Eye
#3 - Xelha's Bone Chips
#4 - Xelha's Cyclops Eye
#
# *** QUESTS AVAILABLE TO ***
#
#1 - All (Evil)
#2 - All (Evil)
#3 - All (Evil)
#4 - All (Evil)
#
# *** NPC NOTES ***
#
#
#
############################################


sub EVENT_SAY
{ 

if($text=~/Hail/i)
{
quest::say("A new recruit to our cause.  Just what I have been waiting for!  How would you like to serve the great Xelha Nevagon?  I need an apprentice necromancer to [assist the great Xelha].");
}

if($text=~/assist the great xelha/i)
{
quest::say("Fantastic.  Stick with me and you shall ascend in our ranks quickly.  I am in need of some components for new spells.  Will you collect them for me?  I shall need four each of the following - fire beetle eyes. bone chips and spiderling silk.  Fetch these items for me at once. Well..? Did not you hear the great Xelha? Begone!");
}

}

sub EVENT_ITEM
{
   # Spiderling Silk ID-13099
   if($itemcount{13099} == 4)
   {
   quest::say("Let's see here. One.. two.. three.. and.. four. Great!! Just enough for my needs. You are serving Xelha well. I give you Xelha's Sparkler. It is not much, but neither are you. You know what I really need is a cyclops eye. That would be worthy of a great reward.");
   
   quest::ding(); quest::exp("60");
   quest::givecash("0","4","0","0");

   # Dismal Rage Faction
   quest::faction("86","1");
   # Opal Dark Briar Faction
   quest::faction("235","1");
   # Knights of Truth
   quest::faction("184","-1");
   }

   # Cyclops Eye ID-13927
   if($itemcount{13927} == 1)
   {
   quest::say("A cyclops eye!! You are stronger than I believed. You will rise in the ranks of the Dismal Rage quickly with acts such as this!! I am most appreciative! Here, take this. It was lying around my shelves, just gettingg all dusty. I hope you can use it. And watch yourself in your journeys, the aura of your faith in Innoruuk surrounds you like a shroud. Our enemies will surely see you for what you are.");

   
   quest::ding(); quest::exp("1000");
   # Spell: Beguile Undead ID-15197 - Spell: Call of Bones ID-15643 - Spell: Greater Shielding ID-15066
   # Spell: Invoke Shadow ID-16434 - Spell: Resist Disease ID-15063 - Spell: Venom of the Snake ID-15435
   $random=int(rand 15197+15643+15066+16434+15063+15435);
   # Spell: Invoke Shadow ID-16434 - Spell: Resist Disease ID-15063 - Spell: Venom of the Snake ID-15435
   # Spell: Beguile Undead ID-15197 - Spell: Call of Bones ID-15643 - Spell: Greater Shielding ID-15066
   quest::summonitem($random);

   # Dismal Rage Faction
   quest::faction("86","1");
   # Opal Dark Briar Faction
   quest::faction("235","1");
   # Knights of Truth
   quest::faction("184","-1");

   }

   # Fire Beetle Eye ID-10307
   if($itemcount{10307} == 4)
   {
   quest::say("Let's see here. One.. two.. three.. and.. four. Great!! Just enough for my needs. You are serving Xelha well. I give you Xelha's Sparkler. It is not much, but neither are you. You know what I really need is a cyclops eye. That would be worthy of a great reward.");
   
   quest::ding(); quest::exp("40");
   quest::givecash("8","1","0","0");

   # Dismal Rage Faction
   quest::faction("86","1");
   # Opal Dark Briar Faction
   quest::faction("235","1");
   # Knights of Truth
   quest::faction("184","-1");
   }

   # Bone Chips ID-13073
   if($itemcount{13073} == 4)
   {
   quest::say("Let's see here. One.. two.. three.. and.. four. Great!! Just enough for my needs. You are serving Xelha well. I give you Xelha's Sparkler. It is not much, but neither are you. You know what I really need is a cyclops eye. That would be worthy of a great reward.");
   
   quest::ding(); quest::exp("25");
   quest::givecash("4","0","0","0");

   # Dismal Rage Faction
   quest::faction("86","1");
   # Opal Dark Briar Faction
   quest::faction("235","1");
   # Knights of Truth
   quest::faction("184","-1");
   }

}


#END of FILE Zone:freporte  ID:10093 -- Xelha_Nevagon 


