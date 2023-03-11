###################################################################
#
# Dawnshroud Peaks Rockhopper/Sambata Spawn Settings
#
# The zone spawn conditions are:
#    Sambata are spawned:
#        Condition ID 1 has a value 1
#        Condition ID 2 has a value 0
#        Condition ID 3 has a value 0
#
#    Rockhoppers are spawned:
#        Condition ID 1 has a value 0
#        Condition ID 2 has a value 1
#        Condition ID 3 has a value 0
#
#    Delay period with no spawns:
#        Condition ID 1 has a value 0
#        Condition ID 2 has a value 0
#        Condition ID 3 has a value 1
#
#####################################################################

sub EVENT_SIGNAL {
    if($signal == 530) {
        # Signal from #Sambata_Tribal_Leader_Garn (174577)
        quest::spawn_condition($zonesn, 1, 0);
        quest::spawn_condition($zonesn, 2, 0);
        quest::spawn_condition($zonesn, 3, 1);
        quest::settimer("ChangeToRockhoppers", 300)
    }
    if($signal == 940) {
        # Signal from #An_Age_Old_Rockhopper (174616)
        quest::spawn_condition($zonesn, 1, 0);
        quest::spawn_condition($zonesn, 2, 0);
        quest::spawn_condition($zonesn, 3, 1);
        quest::settimer("ChangeToSambata", 300)
    }
}

sub EVENT_TIMER {
    if($timer eq "ChangeToSambata") {
        quest::stoptimer("ChangeToSambata");
        if(!defined $qglobals{"Rockhopper_Sambata"}) {
            quest::spawn_condition($zonesn, 1, 1);
            quest::spawn_condition($zonesn, 2, 0);
            quest::spawn_condition($zonesn, 3, 0);
        }
    }
    if($timer eq "ChangeToRockhoppers") {
        quest::stoptimer("ChangeToRockhoppers");
        if(!defined $qglobals{"Rockhopper_Sambata"}) {
            quest::spawn_condition($zonesn, 1, 0);
            quest::spawn_condition($zonesn, 2, 1);
            quest::spawn_condition($zonesn, 3, 0);
        }
    }
}

# END of FILE Zone:dawnshroud  #Rock_Garn_Condition_Setter (174240)