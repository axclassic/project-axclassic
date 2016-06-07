#####################################
##Logic for opening sundial portals
##into Plane of Time B
##zone: Plane of Time A
##preliminary testing by patrikpatrik
## 2nd revision 6/01/2016
## Files associated 5#The_*_Construct.pl
#####################################

sub EVENT_CLICKDOOR {
	#my $d_id = ($doorid % 256);
	#$client->Message(15, "doorid is $doorid.");
	#Checks if access and no one in Plane of Time B
	if ((defined $qglobals{$name."boss1"}) && (defined $qglobals{$name."boss2"}) && (defined $qglobals{$name."boss3"}) &&
		(defined $qglobals{$name."boss4"}) && (defined $qglobals{$name."boss5"}) && (!defined $qglobals{"blockout"})) {
		if($doorid == 8){
			quest::setglobal("blockout", 1, 7, "H24"); #This sets lockout If people complain they cant get it, Dont be flagedd with a GM account! because if you zone out in potimeb with status greater than 50, no qglobals are deleted!
			quest::setglobal("blockout2", 1, 7, "H5");
			$client->Message(14, "The portal, dim at first, begins to glow brighter.");
			$client->Message(14, "The portal flashes briefly, then glows steadily.");
			#Once zone in, all clients' boss triggers are wiped
			my @questarray = $entity_list->GetClientList();
			foreach $ent(@questarray){
				my $members = $ent->GetName();
				quest::delglobal($members."boss1");
				quest::delglobal($members."boss2");
				quest::delglobal($members."boss3");
				quest::delglobal($members."boss4");
				quest::delglobal($members."boss5");
				}
			quest::movepc(223, -36, 1352, 496);
		}
		elsif($doorid == 9){
			quest::setglobal("blockout", 1, 7, "H5");
			quest::setglobal("blockout2", 1, 7, "H5");
			$client->Message(14, "The portal, dim at first, begins to glow brighter.");
			$client->Message(14, "The portal flashes briefly, then glows steadily.");
			#Once zone in, all clients' boss triggers are wiped
			my @questarray = $entity_list->GetClientList();
			foreach $ent(@questarray){
				my $members = $ent->GetName();
				quest::delglobal($members."boss1");
				quest::delglobal($members."boss2");
				quest::delglobal($members."boss3");
				quest::delglobal($members."boss4");
				quest::delglobal($members."boss5");
				}
			quest::movepc(223, -51, 857, 496);
		}
		elsif($doorid == 10){
			quest::setglobal("blockout", 1, 7, "H5");
			quest::setglobal("blockout2", 1, 7, "H5");
			$client->Message(14, "The portal, dim at first, begins to glow brighter.");
			$client->Message(14, "The portal flashes briefly, then glows steadily.");
			#Once zone in, all clients' boss triggers are wiped
			my @questarray = $entity_list->GetClientList();
			foreach $ent(@questarray){
				my $members = $ent->GetName();
				quest::delglobal($members."boss1");
				quest::delglobal($members."boss2");
				quest::delglobal($members."boss3");
				quest::delglobal($members."boss4");
				quest::delglobal($members."boss5");
				}
			quest::movepc(223, -35, 1636, 496);
		}
		elsif($doorid == 11){
			quest::setglobal("blockout", 1, 7, "H5");
			quest::setglobal("blockout2", 1, 7, "H5");
			$client->Message(14, "The portal, dim at first, begins to glow brighter.");
			$client->Message(14, "The portal flashes briefly, then glows steadily.");
			#Once zone in, all clients' boss triggers are wiped
			my @questarray = $entity_list->GetClientList();
			foreach $ent(@questarray){
				my $members = $ent->GetName();
				quest::delglobal($members."boss1");
				quest::delglobal($members."boss2");
				quest::delglobal($members."boss3");
				quest::delglobal($members."boss4");
				quest::delglobal($members."boss5");
				}
			quest::movepc(223, -55, 569, 496);
		}
		elsif($doorid == 12){
			quest::setglobal("blockout", 1, 7, "H5");
			quest::setglobal("blockout2", 1, 7, "H5");
			$client->Message(14, "The portal, dim at first, begins to glow brighter.");
			$client->Message(14, "The portal flashes briefly, then glows steadily.");
			#Once zone in, all clients' boss triggers are wiped
			my @questarray = $entity_list->GetClientList();
			foreach $ent(@questarray){
				my $members = $ent->GetName();
				quest::delglobal($members."boss1");
				quest::delglobal($members."boss2");
				quest::delglobal($members."boss3");
				quest::delglobal($members."boss4");
				quest::delglobal($members."boss5");
				}
			quest::movepc(223, -27, 1103, 496);
		}
		else {
		#DO nothing for now
		}
	#Lockout initializes
	} elsif ((defined $qglobals{$name."boss1"}) && (defined $qglobals{$name."boss2"}) && (defined $qglobals{$name."boss3"}) &&
			 (defined $qglobals{$name."boss4"}) && (defined $qglobals{$name."boss5"}) && (defined $qglobals{"blockout"})) {
				$client->Message(15, "You are flagged for access but there is someone already in Plane of Time B. 
				Wait until he/she leaves or try again later.");
	} else {
		$client->Message(14, "Portal is locked.");
	}
	
	
	
}#END sub EVENT_CLICKDOOR

sub EVENT_ENTERZONE {
	$client->Message(15, "Welcome $name! If you're here to access Plane of Time B, the portals 
	are locked until you kill all 5 bosses guarding the sundial portals. You have 60 minutes 
	to kill all 5 and timer starts after the 1st one killed. You must kill each one to gain portal
	access and you'll know when all 5 are dead.");


}
sub EVENT_GROUP_CHANGE {
}

sub EVENT_TIMER {

}