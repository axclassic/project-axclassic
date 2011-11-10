############################################
# ZONE: West Freeport (freportw)
# DATABASE: PEQ-Velious
# LAST EDIT DATE: April 30,2005
# VERSION: 1.0
# DEVELOPER: MWMDRAGON
#
# *** NPC INFORMATION ***
#
# NAME: Glyssa_Sonshaw
# ID: 9067
# TYPE: Enchanter Guild Master
# RACE: Erudite
# LEVEL: 61
#
# *** ITEMS GIVEN OR TAKEN ***
#
# A Note ID-18013
# Odd Cold Iron Necklace ID-14585
#
# *** QUESTS INVOLVED IN ***
#
#1 - Quellious Regent Symbol
#
# *** QUESTS AVAILABLE TO ***
#
#1 - Cleric (That Worships Quellious)
#
############################################

sub EVENT_SAY
{
if($text=~/Hail/i)
 {
 quest::say("Hail! $name, welcome to the Academy of Arcane Science.");
 }

}

sub EVENT_ITEM
{
   # A Note ID-18013 - Odd Cold Iron Necklace ID-14585
   if($itemcount{18013} == 1 && $itemcount{14585} == 1)
   {
   quest::say("You must seek out a friendly kobold in Ak'anon, Nnamed Drigaz Grumblegrowl. Give hime these and you shall be well on your way to honoring Quellious.");
   
   # Odd Cold Iron Necklace ID-14585
   quest::summonitem("14585");
   # A Note ID-18013
   quest::summonitem("18013");
   }
}

#END of FILE Zone:freportw  ID:9067 -- Glyssa_Sonshaw