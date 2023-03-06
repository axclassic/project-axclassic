##########################################
# ZONE: Dawnshroud Peaks (dawnshroud)
# DATABASE: PEQ-PoP
# LAST EDIT DATE: January 22, 2012
# VERSION: 1.1
# DEVELOPER: Congdar
#
# *** NPC INFORMATION ***
#
# NAME: #An_Age_Old_Rockhopper
# ID: 174616
# TYPE: Warrior
# RACE: Rockhopper
# LEVEL: 47
#
# *** ITEMS GIVEN OR TAKEN ***
# 
# *** QUESTS INVOLVED IN ***
#
# Rockhopper/Sambata Cycle
# Cycles to the Rockhoppers when killed if #Rock_Garn_Timer is not up
#
# *** QUESTS AVAILABE TO ***
#
# Everyone
#
############################################# 

sub EVENT_DEATH {
    quest::signalwith(174240,940,0);
}

# END of FILE Zone:dawnshroud  #An_Age_Old_Rockhopper (174616)


