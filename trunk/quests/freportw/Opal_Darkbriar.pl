############################################
# ZONE: West Freeport (freportw)
# DATABASE: PEQ-Velious
# LAST EDIT DATE: April 24,2005
# VERSION: 1.0
# BASE QUEST BY: PEQ Quest Team
# DEVELOPER: MWMDRAGON
#
# *** NPC INFORMATION ***
#
# NAME: Opal_Darkbriar
# ID: 9073
# TYPE: Guild Master Wizard
# RACE: High Elf
# LEVEL: 61
#
# *** ITEMS GIVEN OR TAKEN ***
#
# A tattered note ID-18739
# Patched Violet Robe ID-13558
# Testament of Vanear ID-13991
# Marnek's Wand ID- MISSING
# Sapphire of Souls ID- MISSING
# Wand of the Burning Dead ID- MISSING
#
# *** QUESTS INVOLVED IN ***
#
#1 Wizard Newbie Note
#2 Wand of Burning Dead (BROKEN - Items Needed)
#
# *** QUESTS AVAILABLE TO ***
#
#1 Wizard
#2 Necromancer , Wizard
#
############################################


sub EVENT_SAY
{ 
  if ($text=~/Hail/i)
  {
  quest::say("Hello.");
  }

}


sub EVENT_ITEM
{ 
  # A tattered note ID-18739
  if ($item1=="18739")
  {
  quest::say("Welcome young wizard to the order of the Arcane Scientists. Here is your guild robe, wear it proudly. Study hard and one day you will be a powerful wizard!");
  # Patched Violet Robe ID-13558
  quest::summonitem("13558");
  quest::ding();
quest::faction(11, 10);
quest::faction(184, 10);
quest::faction(105, -30);
quest::faction(235, -30);
quest::exp(1000);
quest::rebind(9,-710,138,17.7);
  }
    else {
   quest::say("I have no use for this.");
   plugin::return_items(\%itemcount);
   }
}
#END of FILE Zone:freportw  ID:9073 -- Opal_Darkbriar