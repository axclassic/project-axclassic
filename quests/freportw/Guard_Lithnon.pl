############################################
#ZONE: West Freeport (freportw)
#DATABASE: PEQ-Velious
#LAST EDIT DATE: April 5,2005
#VERSION: 2.0
#DEVELOPER: Congdar
#
#*** NPC INFORMATION ***
#
#NAME: Guard_Lithnon
#ID: 9106
#TYPE: Warrior
#RACE: Freeport guard
#LEVEL: 30
#
#*** QUESTS INVOLVED IN ***
#
#1 - Zimel's Blades (Quest for Soulfire)
#
############################################

sub EVENT_SIGNAL {
    if ($signal == 3) {
        quest::attacknpctype(9135);
    }
}
#END of FILE Zone:freportw  ID:9135 -- Guard_Alayle

