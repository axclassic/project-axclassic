############################################
# ZONE: West Freeport (freportw)
# DATABASE: PEQ-Velios
# LAST EDIT DATE: April 27,2005
# VERSION: 1.0
# DEVELOPER: MWMDRAGON
#
# *** NPC INFORMATION ***
#
# NAME: Lady_Shae
# ID: 9058
# TYPE: Warrior
# RACE: High Elf
# LEVEL: 12
#
# *** ITEMS GIVEN OR TAKEN ***
#
# White Wine ID-13031
#
# *** QUESTS INVOLVED IN ***
#
#1 - Hog Caller Inn Mail
#
# *** QUESTS AVAILABLE TO ***
#
#1 - Warrior
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
quest::say("Hello. It is always good to meet someone new. I am Lady Shae of the House of Dumas. And what [house] are you from?");
}

if($text=~/house/i)
{
quest::say("Good. I care not to hang around any snobs this evening. Would you be so kind as to buy me some wine?");
}

if($text=~/steel warriors sent me/i)
{
quest::say("Thank you for checking into this matter. I told the Militia, but they just ignored me. It appears the darkelves keep coming in leaving mail for [ Shintl ] Lowbrew. Before I tell you more could you please buy me A white wine please. ");
}

if($text=~/shintl/i)
{
quest::say("Dyllin was the name of A Qeynos guard who was sent to pick up the list I was holding for dear sweet Antonius. He left just yesterday. If you wish to meet up with him, I heard him say he was going to stop at Highpass Hold. ");
}

}

sub EVENT_ITEM
{ 

# White Wine ID-13031
if($itemcount{13031} == 1)
{
quest::say("Thank you. Pandos has been telling me to try white wine forever. I mostly only drink red wine. Pardon me for getting off track. Anyway, it is a good thing you showed up. The lady in room 2 has been receiving mail from a Dark Elf. You [need the mail for room two]. The Innkeeper usually holds it for the guests.");


quest::ding(); quest::exp("25");
# Faction Faydark's Champions ID-99
quest::faction("99","1");
# Faction King Tearis Thex ID-178
quest::faction("178","1");
# Faction Clerics of Tunare ID-34
quest::faction("34","1");
# Faction Soldiers of Tunare ID-304
quest::faction("304","1");
# Faction Crushbone Orcs ID-63
quest::faction("63","-1");
}

}
#END of FILE Zone:freportw  ID:9058 -- Lady_Shae