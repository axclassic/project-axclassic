## NPC: Udunir_Dagorod NPCID 219065  ##
## Zone: Plane of Time A             ##
## corpse recovery dude              ##
## Created by Aardil                 ##
##                    31-05-2016     ##
## Last revised by patrikpatrik 11/20/16##
#######################################

sub EVENT_SPAWN {
	$portalab = 0; #Counter for the boss kills
}

sub EVENT_SAY {
    my $send = quest::saylink("send", 1);
	if($text=~/hail/i && $ulevel >= 64 && defined $qglobals{$name."pobcorpse"}) {
		$client->Message(14, "Hello $name, I am Udunir Dagorod. So you had a small mishap in Time B? Thats why I am 
		here. I can help you. I can $send you to the graveyard of Plane of Time B where your corpse is 
		waiting for you. There is no other way to retrieve your belongings so hurry up, cough up the mulah $class. 
		From there you can come back here to start over again.");
	}
    elsif($text=~/send/i) {
        $client->Message(14, "It will be a meager 1000 platinum pieces please.");
	}
	else {
        $client->Message(14,"I have nothing to say to you $name, now go away or I shall taunt you a second time!");
    }
}

sub EVENT_ITEM {
    if($platinum == 1000 && $ulevel >= 64 && defined $qglobals{$name."pobcorpse"}) {
        $client->Message(14,"Thank you $name , you are on the way back to your Time B, good luck!"); #Money handin for porting into time B graveyard.
		quest::setglobal($name."reco", "1", 7, "M10"); #adds check when entering zone
		quest::delglobal($name."pobcorpse"); #Deletes corpse qglobal
		quest::movepc(223, 851, -141, 395); #Moves to PotimeB graveyard
	}
	else {
		$client->Message(14,"I don't need this $name. Take it back.");
		plugin::return_items(\%itemcount);
		return 1;
	}
}

sub EVENT_SIGNAL {
    if($signal == 10505) { #This signal are from these mobs upon death!
        if((defined $qglobals{portalb}) && ($qglobals{portalab} > 4)) {
			quest::setglobal("portalab", "1", 7, "M60");
		}
		else {
            my $value = 0;
            if(!defined($qglobals{portalab})) {
                $value = 1;
            }
            else {
                $value = $qglobals{portalab} + 1;
            }
            quest::setglobal("portalab", $value, 7, "M60");	
		}
	}
}

