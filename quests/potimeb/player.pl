##Plane of Time B player.pl

# sub EVENT_DEATH{
	# quest::ze(15, "Oh dear im dead!");
	# quest::say("im dead!");
# }


sub EVENT_ZONE{
	if($status >= 50){
		quest::ze(15, "a GM has left the zone.");
		#quest::delglobal("blockout");
		#quest::delglobal("blockout2");
		#quest::delglobal("portal3");
		#quest::delglobal("portal4");
		#quest::delglobal("portal5");
		
		#quest::delglobal("recovery");
		#quest::delglobal("recovery2");
		#quest::stoptimer($timer);
		#quest::delglobal("checkb");
	}
	elsif((defined $qglobals{$name."reco"}) || (defined $qglobals{$name."reco2"})){
		#leave zone and dont disrupt players script if in zone
		quest::delglobal($name."reco2");
		quest::delglobal($name."reco");
	 # Don't have a corpse? most likely died or zoned out
	}
	elsif((defined $qglobals{"blockout"}) && (!defined $qglobals{"outout"})) { #if you dont have a corpse and die! the getout is a check for when someone logs in from logging out earlier.
			quest::delglobal("bdoors"); #Deletes qglobal doors so everyhting is locked agian!
			quest::delglobal("portal3"); #remember to put this in so it deletes upon dying, zoning etc
			quest::delglobal("portal4");
			quest::delglobal("portal5");
			quest::repopzone(); #reseting zone on each logout.
			quest::delglobal("blockout");
			quest::delglobal($name."reco");
			#quest::stoptimer($timer);
			#fetch corpse
			@corpse = $entity_list->GetCorpseList();
				if(@corpse){
					quest::setglobal($name."pobcorpse", 1, 7, "D7");
					foreach $ent (@corpse) {
						$corpseName = $ent->GetOwnerName();
							if($corpseName eq $name) {
								my $ex = int(rand(140) -70); #randomize corpse loc in graveyard area
								my $yy = int(rand(50) -25);
								$ent->GMMove(850+$ex, -140+$yy, 400);
							}
					}
				}
			
	}else{
	  #This happens when a player doesnt retrive his corpse and dies again so no corpse is moved and nothing is deleted, could be buggy!
	  #updated to move to here when you zone in and someone is still here. you need to go.
	  #quest::ze(15, "You left but you had a reco which means you quit while in corpse recovery.");
	  #quest::ze(15, "You left because either you logged in this zone and someone was here or tried to leave and come back later to continue, thats a no no.");
	  #quest::delglobal($name."pobcorpse");
	  quest::delglobal("outout");
	}

}#END sub EVENT_ZONE

sub EVENT_ENTERZONE { #Upon entering zone through portals it will spawn mobs in all 5 locations
	#quest::delglobal("blockout");
	if($status >= 50) {
		quest::ze(15, "a GM has entered the zone.");
		#quest::delglobal("blockout");
	} elsif ((defined $qglobals{"blockout"}) && (defined $qglobals{$name."reco"})) {
		#quest::ze(15, "Was sent by Udunir, retrieving corpse."); #corpse run so bypass qglobals and youll be in graveyard
		quest::setglobal($name."reco2", 1, 7, "H20"); #20 hours
	} elsif ((defined $qglobals{"blockout"}) && (defined $globals{$name."reco2"}) || (defined $globals{$name."reco"})) {
		#quest::ze(15, "you must have logged out from a corpse run so bypass qglobals and no depop!");
	
		#quest::ze(15, "successful entering zone. blockout qglobal DISABLED!");
	} elsif((defined $qglobals{"blockout"}) && (defined $qglobals{"blockout2"})) { #The blockout2 is an extra check involved for when someone disconnects in the zone.
			quest::repopzone(); #reseting just in case.
			#$client->Message(15, "blockout is here so spawns should pop.");
			quest::delglobal("blockout2");
		#first message
			quest::signalwith(223111, 1000, 1);
		#Earth
			quest::spawn2(223186,0,0,-129.6,1720,547,0); #spawn earth_event
		#Air
			quest::spawn2(223187,0,0,-129.6,1720,547,0); #spawn air_event
		#Water
			quest::spawn2(223189,0,0,-129.6,1720,547,0); #spawn water_event
		#Fire
			quest::spawn2(223190,0,0,-129.6,1720,547,0); #spawn fire_event
		#Undead
			quest::spawn2(223188,0,0,-129.6,1720,547,0); #spawn undead_event
		#Trigger signal timer
			#quest::signalwith(223211,23,0); #send signal to main trigger to start hour time limit
	} elsif ((defined $qglobals{"blockout"}) && (!defined $qglobals{"blockout2"}) && (!defined $qglobals{$name."reco"}) && (!defined $qglobals{$name."reco2"})) {
		quest::setglobal("outout", 1, 7, "F"); #triggers outout
		#quest::ze(15, "This means you came here when someone else is here so you must be zoned out asap OR you logged out in this zone and must be zoned out.");
		
		quest::ze(13, "An unknown voice shouts, 'You do not belong here, begone!'");
		quest::movepc(9, 335, 181, -25); #WC default 
	} else {
			#quest::ze(15, "You entered and came across the else function. You must have quit and come back when no ones here.");
			quest::repopzone(); #no ones in here? just reset anyway
			#$client->Message(15, "corpse fetching and or gm spectating my status is $status.");
		#When qglobals blockout is not defined nothing happens i.e corpse fetching in graveyard or gm intervention.
		}
}#END sub_EVENT_ENTERZONE

# sub EVENT_TIMER {

# }

sub EVENT_CLICKDOOR {
	my $d_id = ($doorid % 256);
	
	if($status >= 50) { #Check for gms
	#quest::ze(15, "GM's are not allowed.");
	}
	else {
		#$client->Message(15, "doorid is $doorid and d_id is $d_id.");
		
		if(($d_id == 62) && (defined $qglobals{"portal3"})) {
		quest::movepc(223, -401, 0, 347); #moves to portal 4 spot upon phase 3 completion
		quest::spawn2(223157,0,0,-410,-69,348,0); #spawn phase4_trigger.pl
		}
		if(($d_id == 24) && (defined $qglobals{"portal4"})) {
		quest::movepc(223, -419, 0, 4); #semi last phase
		quest::spawn2(223158,0,0,-415.5,-68.8,3.3,0); # phase5_trigger.pl
		}
		if(($d_id == 51) && (defined $qglobals{"portal5"})) {
		#quest::movepc(223, -620, -1125, -2); #To Quarm the end behind
		
		quest::movepc(223, 268, -1121, -2); #To Quarm the end in front!
		quest::spawn2(223159,0,0,166,-938,9.7,0); #spawn quarm_trigger
		}
	}
}#END sub_EVENT_CLICKDOOR

# sub EVENT_CONNECT { #I dont think these are supported for axclassic but worth a try
	# quest::repopzone();
	# #quest::depop();
# }

# sub EVENT_DISCONNECT {
	# quest::repopzone();
	# #quest::depop();
	# quest::ze(15, "testing testing uh oh.");
# }