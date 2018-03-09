##New Easter Event the signals tell the controller for Westkarana qey2hh1 zone what level NPC to spawn
sub EVENT_ENTERZONE {
    if((defined $event8) && ($event8 == 1)) {
        if(defined($qglobals{'EasterInProgress'})) {
            $client->Message(14, "Another Norrathian is working on the Easter Event in this zone, come back a little later.");
        }
     else {
        quest::signalwith(12215, $ulevel);
			} #end else
	} # Easter Event End
        } # EVENT_ENTERZONE End
	