#########################################################################
# ZONE: Paineel (paineel)
# DATABASE:  AX-Classic 3.11b
# LAST EDIT DATE: August 10, 2009
# VERSION: 1.0
# DEVELOPER: Asram
# REVISION NOTES: Initial Quest
#
# *** NPC INFORMATION ***
#
# NAME: Pungla
# ID: 40051
# RACE: 10
# CLASS: 1
# LEVEL: 14
#
# *** ITEMS GIVEN OR TAKEN ***
#
# Flaming Pungla ID-13382
#
# *** QUESTS INVOLVED IN ***
#
# Clurg's Revenge
#

sub EVENT_SAY { 
if ($text=~/Hail/i){
  quest::say("What you want? I'm busy here."); 
    }
if ($text=~/Flaming Pungla/i) {
  quest::emote("starts to shake and cough anxiously.");
  quest::say("Who sent you? I don't wanna talk about it. If you want Flaming Pungla, you give Pungla 3 gold shiny coins. Exact change only!");
   }
}

sub EVENT_ITEM {
  if ($gold==3) {
  quest::emote("looks nervously over her shoulder.");
  quest::say("Here, drink this quick and be on your way.");
  quest::summonitem(13382);
   }
 }
#END of FILE Zone:qeynos  ID:40051 -- Pungla 

