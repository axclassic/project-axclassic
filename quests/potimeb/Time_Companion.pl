#########################################
## NPC: Time_Companion (223228)        ##
## Zone: Plane of Time B               ##
## Threeflies dec 2012                 ##
## Revised by Caved for 05-05-2014     ##
## UPDATED 6/6/16 now must pay to port ##
## UPDATED 08/28/22 by Congdar         ##
#########################################


my $portfire = 0;
my $portwater = 0;
my $portearth = 0;
my $portair = 0;
my $portdead = 0;

sub EVENT_SAY {
	my $fire = quest::saylink("Fire", 1);
	my $water = quest::saylink("Water", 1);
	my $earth = quest::saylink("Earth", 1);
	my $air = quest::saylink("Air", 1);
	my $undead = quest::saylink("Undead", 1);
	if($text=~/hail/i) {
		quest::say("Greetings, mortal $class. I charge 100 platinum pieces for the following destination: $earth | $air | $fire | $water | $undead");
    }

################FIRE#####################################
    if($text=~/fire/i) {
        $portfire = 1;
        $portwater = 0;
        $portearth = 0;
        $portair = 0;
        $portdead = 0;
        quest::say("Fire it is. It will be 100 platinum pieces.");
    }

################WATER####################################
    if($text=~/water/i) {
        $portfire = 0;
        $portwater = 1;
        $portearth = 0;
        $portair = 0;
        $portdead = 0;
        quest::say("Water it is. It will be 100 platinum pieces.");
    }

################EARTH####################################
    if($text=~/earth/i) {
        $portfire = 0;
        $portwater = 0;
        $portearth = 1;
        $portair = 0;
        $portdead = 0;
        quest::say("Earth it is. It will be 100 platinum pieces.");
    }

################AIR######################################
    if($text=~/air/i) {
        $portfire = 0;
        $portwater = 0;
        $portearth = 0;
        $portair = 1;
        $portdead = 0;
        quest::say("Air it is. It will be 100 platinum pieces.");
    }

################UNDEAD###################################
    if($text=~/undead/i) {
        $portfire = 0;
        $portwater = 0;
        $portearth = 0;
        $portair = 0;
        $portdead = 1;
        quest::say("Undead it is. It will be 100 platinum pieces.");
    }
}
#END sub EVENT_SAY

sub EVENT_ITEM {
    if($platinum >= 100 && $portfire == 1) {
        quest::say("Good luck $name.");
        my $QGlobalValue2 = $client->GetQGlobal($name.".potimeB");
        quest::ze(15, "QGlobalValue2 = $QGlobalValue2");
        if($QGlobalValue2) {
            if($client->GetGroup()) {
                quest::AssignGroupToInstance($QGlobalValue2);
                quest::MoveGroupInstance(223, $QGlobalValue2, -59.1, 587.1, 493.9, 64.6);
            }
            else {
                quest::AssignToInstance($QGlobalValue2);
                quest::MovePCInstance(223, $QGlobalValue2, -59.1, 587.1, 493.9, 64.6);
            }
            return;
        }
        $portfire == 0;
    }
    elsif($platinum >= 100 && $portwater == 1) {
        quest::say("Good luck $name.");
        my $QGlobalValue2 = $client->GetQGlobal($name.".potimeB");
        quest::ze(15, "QGlobalValue2 = $QGlobalValue2");
        if($QGlobalValue2) {
            if($client->GetGroup()) {
                quest::AssignGroupToInstance($QGlobalValue2);
                quest::MoveGroupInstance(223, $QGlobalValue2, -58, 884.8, 493.7, 67.8);
            }
            else {
                quest::AssignToInstance($QGlobalValue2);
                quest::MovePCInstance(223, $QGlobalValue2, -58, 884.8, 493.7, 67.8);
            }
            return;
        }
        $portwater == 0;
    }
    elsif($platinum >= 100 && $portearth == 1) {
        quest::say("Good luck $name.");
        my $QGlobalValue2 = $client->GetQGlobal($name.".potimeB");
        quest::ze(15, "QGlobalValue2 = $QGlobalValue2");
        if($QGlobalValue2) {
            if($client->GetGroup()) {
                quest::AssignGroupToInstance($QGlobalValue2);
                quest::MoveGroupInstance(223, $QGlobalValue2, -61.9, 1638.6, 496.1, 65.5);
            }
            else {
                quest::AssignToInstance($QGlobalValue2);
                quest::MovePCInstance(223, $QGlobalValue2, -61.9, 1638.6, 496.1, 65.5);
            }
            return;
        }
        $portearth == 0;
    }
    elsif($platinum >= 100 && $portair == 1) {
        quest::say("Good luck $name.");
        my $QGlobalValue2 = $client->GetQGlobal($name.".potimeB");
        quest::ze(15, "QGlobalValue2 = $QGlobalValue2");
        if($QGlobalValue2) {
            if($client->GetGroup()) {
                quest::AssignGroupToInstance($QGlobalValue2);
                quest::MoveGroupInstance(223, $QGlobalValue2, -59.2, 1333.4, 494.1, 56.9);
            }
            else {
                quest::AssignToInstance($QGlobalValue2);
                quest::MovePCInstance(223, $QGlobalValue2, -59.2, 1333.4, 494.1, 56.9);
            }
            return;
        }
        $portair == 0;
    }
    elsif($platinum >= 100 && $portdead == 1) {
        quest::say("Good luck $name.");
        my $QGlobalValue2 = $client->GetQGlobal($name.".potimeB");
        quest::ze(15, "QGlobalValue2 = $QGlobalValue2");
        if($QGlobalValue2) {
            if($client->GetGroup()) {
                quest::AssignGroupToInstance($QGlobalValue2);
                quest::MoveGroupInstance(223, $QGlobalValue2, -36.5, 1092.4, 495.2, 54.6);
            }
            else {
                quest::AssignToInstance($QGlobalValue2);
                quest::MovePCInstance(223, $QGlobalValue2, -36.5, 1092.4, 495.2, 54.6);
            }
            return;
        }
        $portdead == 0;
    }
    elsif($platinum >= 100) {
        quest::say("Errm... Gee thanks I suppose.");
    }
}

