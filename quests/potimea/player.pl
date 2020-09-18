#####################################
##Logic for opening sundial portals
##into Plane of Time B
##zone: Plane of Time A
##alternate method for entry by patrikpatrik
## 3rd revision 11/19/2016
## Files associated 5#The_*_Construct.pl Udunir_Dagorod
#####################################

sub EVENT_ENTERZONE {
	quest::delglobal("portalab");
	#no warnings 'all' ;
	#$event1 = 0;
	#$event2 = 0;
	#$event3 = 0;
	#$event4 = 0;
	#$event5 = 0;
	$client->Message(15, "Welcome $name! If you're here to access Plane of Time B, the portals 
					 are locked until you kill all 5 bosses guarding the sundial portals. You have 60 minutes 
					 to kill all 5 and timer starts after the 1st one killed. You must kill each one to gain portal
					 access and you'll know when all 5 are dead.");
}

sub EVENT_ZONE {
    quest::delglobal("portalab");
}

sub EVENT_CLICKDOOR {
    #quest::ze(15, "portal says bosscounter is $bosscounter.");
    if(((defined $qglobals{portalab}) && ($qglobals{portalab} == 5)) && (!defined $qglobals{blockout})) {
        if($doorid == 8) {
            quest::setglobal("blockout", "1", 7, "H2");
            quest::setglobal("blockout2", "1", 7, "H2");
            $client->Message(14, "The portal, dim at first, begins to glow brighter.");
            $client->Message(14, "The portal flashes briefly, then glows steadily.");
            #Once zone in, counter is reset
            quest::delglobal("portalab");
            quest::movepc(223, -36, 1352, 496);
        }
        elsif($doorid == 9) {
            quest::setglobal("blockout", "1", 7, "H2");
            quest::setglobal("blockout2", "1", 7, "H2");
            $client->Message(14, "The portal, dim at first, begins to glow brighter.");
            $client->Message(14, "The portal flashes briefly, then glows steadily.");
            #Once zone in, counter is reset
            quest::delglobal("portalab");
            quest::movepc(223, -51, 857, 496);
        }
        elsif($doorid == 10) {
            quest::setglobal("blockout", "1", 7, "H2");
            quest::setglobal("blockout2", "1", 7, "H2");
            $client->Message(14, "The portal, dim at first, begins to glow brighter.");
            $client->Message(14, "The portal flashes briefly, then glows steadily.");
            #Once zone in, counter is reset
            quest::delglobal("portalab");
            quest::movepc(223, -35, 1636, 496);
        }
        elsif($doorid == 11) {
            quest::setglobal("blockout", "1", 7, "H2");
            quest::setglobal("blockout2", "1", 7, "H2");
            $client->Message(14, "The portal, dim at first, begins to glow brighter.");
            $client->Message(14, "The portal flashes briefly, then glows steadily.");
            #Once zone in, counter is reset
            quest::delglobal("portalab");
            quest::movepc(223, -55, 569, 496);
        }
        elsif($doorid == 12) {
            quest::setglobal("blockout", "1", 7, "H2");
            quest::setglobal("blockout2", "1", 7, "H2");
            $client->Message(14, "The portal, dim at first, begins to glow brighter.");
            $client->Message(14, "The portal flashes briefly, then glows steadily.");
            #Once zone in, counter is reset
            quest::delglobal("portalab");
            quest::movepc(223, -27, 1103, 496);
        }
    } #Lockout initializes
    elsif(((defined $qglobals{portalab}) && ($qglobals{portalab} == 5)) && (defined $qglobals{blockout})) {
        $client->Message(15, "You are flagged for access but there is someone already in Plane of Time B. Wait until he/she leaves and try again later.");
    }
    else {
        $client->Message(14, "Portal is locked.");
    }
}#END sub EVENT_CLICKDOOR

