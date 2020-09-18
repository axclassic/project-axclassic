#######################################
## NPC: Time_Companion (223228)      ##
## Zone: Plane of Time B             ##
## Threeflies dec 2012               ##
## Revised by Caved for AXClassic    ##
##                    05-05-2014     ##
## UPDATED 6/6/16 now must pay to port##
#######################################


my $portfire = 0;
my $portwater = 0;
my $portearth = 0;
my $portair = 0;
my $portdead = 0;

sub EVENT_SAY {
    #quest::signalwith(223177,14060,0); #signals counter at 4 and will open on 5th
    #quest::signalwith(223191,14035,0); #signals inner doors.

    #Dont forget to get rid of this uppercode later
	my $fire = quest::saylink("fire", 1);
	my $water = quest::saylink("water", 1);
	my $earth = quest::saylink("earth", 1);
	my $air = quest::saylink("air", 1);
	my $undead = quest::saylink("undead", 1);

	if($text=~ /hail/i) {
		quest::say("Greetings, mortal $class. I charge 100 platinum pieces for the following destination: | $earth | $air | $fire | $water | $undead |");
    }

################FIRE#####################################
    if($text=~/fire/i) {
        $portfire = 1;
        $portwater = 0;
        $portearth = 0;
        $portair = 0;
        $portdead = 0;
        quest::say("Fire it is. It will be 100 platinum pieces.");

        # $client->Message(14,"Good luck $name.");
        # quest::movepc(223, -59.1, 587.1, 493.9, [64.6]);
    }

################WATER####################################
    if($text=~/water/i) {
        $portfire = 0;
        $portwater = 1;
        $portearth = 0;
        $portair = 0;
        $portdead = 0;
        quest::say("Water it is. It will be 100 platinum pieces.");

        # $client->Message(14,"Good luck $name."); 
        # quest::movepc(223, -58, 884.8, 493.7, [67.8]);
    }

################EARTH####################################
    if($text=~/earth/i) {
        $portfire = 0;
        $portwater = 0;
        $portearth = 1;
        $portair = 0;
        $portdead = 0;
        quest::say("Earth it is. It will be 100 platinum pieces.");

        # $client->Message(14,"Good luck $name."); 
        # quest::movepc(223, -61.9, 1638.6, 496.1, [65.5]);
    }

################AIR######################################
    if($text=~/air/i) {
        $portfire = 0;
        $portwater = 0;
        $portearth = 0;
        $portair = 1;
        $portdead = 0;
        quest::say("Air it is. It will be 100 platinum pieces.");

        # $client->Message(14,"Good luck $name."); 
        # quest::movepc(223, -59.2, 1333.4, 494.1, [56.9]);
    }

################UNDEAD###################################
    if($text=~/undead/i) {
        $portfire = 0;
        $portwater = 0;
        $portearth = 0;
        $portair = 0;
        $portdead = 1;
        quest::say("Undead it is. It will be 100 platinum pieces.");

        # $client->Message(14,"Good luck $name.");
        # quest::movepc(223, -36.5, 1092.4, 495.2, [54.6]);
    }
}#END sub EVENT_SAY

sub EVENT_ITEM {
    if($platinum >= 100 && $portfire == 1) {
        quest::say("Good luck $name.");
        quest::movepc(223, -59.1, 587.1, 493.9, [64.6]);
        $portfire == 0;
    }
    elsif($platinum >= 100 && $portwater == 1) {
        quest::say("Good luck $name.");
        quest::movepc(223, -58, 884.8, 493.7, [67.8]);
        $portwater == 0;
    }
    elsif($platinum >= 100 && $portearth == 1) {

        quest::say("Good luck $name.");
        quest::movepc(223, -61.9, 1638.6, 496.1, [65.5]);
        $portearth == 0;
    }
    elsif($platinum >= 100 && $portair == 1) {
        quest::say("Good luck $name.");
        quest::movepc(223, -59.2, 1333.4, 494.1, [56.9]);
        $portair == 0;
    }
    elsif($platinum >= 100 && $portdead == 1) {
        quest::say("Good luck $name.");
        quest::movepc(223, -36.5, 1092.4, 495.2, [54.6]);
        $portdead == 0;
    }
    elsif($platinum >= 100) {
        quest::say("Click on the destination you wish and give me 100pp.");
    }
    else {
        quest::say("Errm... Gee thanks I suppose.");
    }
}

