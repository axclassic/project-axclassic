############################################
# ZONE: West Freeport (freportw)
# DATABASE: PEQ-Velios
# LAST EDIT DATE: April 5,2005
# VERSION: 2.0
# DEVELOPER: MWMDRAGON
#
# *** NPC INFORMATION ***
#
# NAME: Pandos_Flintside
# ID: 9057
# TYPE: Warrior
# RACE: Dwarf
# LEVEL: 28
#
# *** ITEMS GIVEN OR TAKEN ***
#
# Muffin ID-13014
#
# *** QUESTS INVOLVED IN ***
#
#1 - Muffin Man
#
# *** QUESTS AVAILABLE TO ***
#
#1 - All
#
############################################

sub EVENT_SAY
{ 

  if($text=~/Hail/i)
  {
  quest::say("Greetings! Please move along. I am not paid to converse with strangers... unless of course you have a muffin or two..?");
  }

  if($text=~/brownloe bakery/i)
  {
  quest::say("Oh, yes! That is close by. I am sure Lady Shae will be fine for just a minute. I will just run there and run back. Thanks, friend!");
  }

}

sub EVENT_ITEM
{ 
  # Muffin ID-13014
  if($itemcount{13014} >= 1)
  {
  quest::say("Mmmm. This smells delicious. Oh great!! No milk!! Don't you have any sense?! Just tell me the name of the bakery and I will run and get it myself. I am sure Lady Shae will be safe.");
  
   quest::ding(); quest::exp(10);
  # Clerics of Tunare Faction
  quest::faction("43","1");
  # Faydark's Champions Faction
  quest::faction("99","1");
  # King Tearis Thex Faction
  quest::faction("178","1");
  # Soldiers of Tunare Faction
  quest::faction("304","1");
  # Crushbone Orcs Faction
  quest::faction("63","-1");
  }

}
#END of FILE Zone:freportw  ID:9057 -- Pandos_Flintside

