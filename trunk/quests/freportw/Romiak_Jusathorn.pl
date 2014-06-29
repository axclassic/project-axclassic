############################################
# ZONE: West Freeport (freportw)
# DATABASE: PEQ-Velios
# LAST EDIT DATE: April 29,2005
# VERSION: 1.0
# DEVELOPER: MWMDRAGON
#
# *** NPC INFORMATION ***
#
# NAME: Romiak_Justhorn
# ID: 9069
# TYPE: Enchanter Guild Master
# RACE: Aviak
# LEVEL: 61
#
# *** ITEMS GIVEN OR TAKEN ***
#
# A tattered note ID-18741
# Old Violet Robe ID-13560
#
# *** QUESTS INVOLVED IN ***
#
#1 - Newbie Note
#
# *** QUESTS AVAILABLE TO ***
#
#1 - Enchanter
#
############################################


sub EVENT_SAY
{ 

if ($text=~/Hail/i)
{
quest::say("Squawk! Er.. I mean - Hello!");
}

}

sub EVENT_ITEM
{ 
# A tattered note ID-18741
 if ($itemcount{18741} == 1)
{

quest::say("So you wish to join the Arcane Scientits? You have much to learn my young friend and I will be happy to tutor you along the way. Here is your guild robe, wear it proudly and return to me if you are in need of further training.");
# Old Violet Robe ID-13560
quest::summonitem("13560");
quest::ding();
quest::faction(11, 10);  #Arcane Scientists
quest::faction(184, 10);  #Knights of Truth
quest::faction(105, -30);  #Freeport Militia
quest::faction(235, -30);  #Opal Dark Briar
 quest::exp("1000");
}

}
#END of FILE Zone:freportw  ID:9069 -- Romiak_Jusathorn