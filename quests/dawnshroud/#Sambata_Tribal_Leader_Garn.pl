##########################################
# ZONE: Dawnshroud Peaks (dawnshroud)
# DATABASE: PEQ-PoP
# LAST EDIT DATE: January 22, 2012
# VERSION: 1.1
# DEVELOPER: Congdar
#
# *** NPC INFORMATION ***
#
# NAME: #Sambata_Tribal_Leader_Garn
# ID: 174577
# TYPE: Warrior
# RACE: Galorian
# LEVEL: 47
#
# *** ITEMS GIVEN OR TAKEN ***
# 
# *** QUESTS INVOLVED IN ***
#
# Rockhopper/Sambata Cycle
# Cycles to the Sambata when killed if #Rock_Garn_Timer is not up
#
# *** QUESTS AVAILABE TO ***
#
# Everyone
#
############################################# 

sub EVENT_DEATH {
    quest::signalwith(174240,530,0);
}

# END of FILE Zone:dawnshroud  #Sambata_Tribal_Leader_Garn (174577)


