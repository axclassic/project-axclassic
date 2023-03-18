##########################################
# ZONE: Dawnshroud Peaks (dawnshroud)
# DATABASE: PEQ-PoP
# LAST EDIT DATE: January 22, 2012
# VERSION: 1.1
# DEVELOPER: Congdar
#
# *** NPC INFORMATION ***
#
# NAME: #Rock_Garn_Timer
# ID: 174540
# TYPE: Warrior
# RACE: Teleport Man
# LEVEL: 50
#
# *** ITEMS GIVEN OR TAKEN ***
# 
# *** QUESTS INVOLVED IN ***
#
# Rockhopper/Sambata Cycle
# Simulate chance that the cycle doesn't change
# even if Garn or Age Old is killed.
#
# *** QUESTS AVAILABE TO ***
#
# Everyone
#
############################################# 

sub EVENT_SPAWN {
    quest::delglobal("Rockhopper_Sambata_Delay");
    quest::settimer("Chance", 3600);
}

sub EVENT_TIMER {
    if($timer eq "Chance") {
        quest::setglobal("Rockhopper_Sambata_Delay", 1, 3, "M20");
    }
}

# END of FILE Zone:dawnshroud  ID:174540 -- #Rock_Garn_Timer (174540)