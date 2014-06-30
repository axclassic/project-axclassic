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
# NAME: Heneva_Jexsped
# ID: 10121
# TYPE: Magician Guild Master
# RACE: Human
# LEVEL: 61
#
# *** ITEMS GIVEN OR TAKEN ***
#
# A tattered note ID-18855
# Dirty Torn Robe ID-13564
#
# *** QUESTS INVOLVED IN ***
#
#1 - Newbie Note
#
# *** QUESTS AVAILABLE TO ***
#
#1 - Magician
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
quest::say("Yes. yes. yes.  Hail to you. too. $name .  Now. quit bugging me!"); }

}

sub EVENT_ITEM
{ 
# A tattered note ID-18855
if($itemcount{18855} == 1)
{

quest::say("Take this to help you on your journeys.");
# Dirty Torn Robe ID-13564
quest::summonitem("13564");
quest::ding();
quest::faction(86, 10);
quest::faction(235, 10);
quest::faction(184, -30);
quest::exp("1000");
}

}

#END of FILE Zone:freporte  ID:10121 -- Heneva_Jexsped


