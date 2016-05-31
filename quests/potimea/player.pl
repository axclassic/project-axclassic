#####################################
##Logic for opening sundial portals
##into Plane of Time B
##zone: Plane of Time A
##preliminary testing by patrikpatrik
## 1st revision 5/31/2016
## Files associated 5#The_*_Construct.pl
#####################################
sub EVENT_CLICKDOOR {
	#my $d_id = ($doorid % 256);
	#$client->Message(15, "doorid is $doorid.");
	#If all 5 are down port to potimeB
	if ((defined $qglobals{$name."boss1"}) && (defined $qglobals{$name."boss2"}) && (defined $qglobals{$name."boss3"}) &&
		(defined $qglobals{$name."boss4"}) && (defined $qglobals{$name."boss5"})) {
		if($doorid == 8){
			$client->Message(14, "The portal, dim at first, begins to glow brighter.");
			$client->Message(14, "The portal flashes briefly, then glows steadily.");
			quest::movepc(223, -36, 1352, 496);
			#Deleting triggers as a 1 time zone in
			quest::delglobal($name."boss1");
			quest::delglobal($name."boss2");
			quest::delglobal($name."boss3");
			quest::delglobal($name."boss4");
			quest::delglobal($name."boss5");
		}
		elsif($doorid == 9){
			$client->Message(14, "The portal, dim at first, begins to glow brighter.");
			$client->Message(14, "The portal flashes briefly, then glows steadily.");
			quest::movepc(223, -51, 857, 496);
			#Deleting triggers as a 1 time zone in
			quest::delglobal($name."boss1");
			quest::delglobal($name."boss2");
			quest::delglobal($name."boss3");
			quest::delglobal($name."boss4");
			quest::delglobal($name."boss5");
		}
		elsif($doorid == 10){
			$client->Message(14, "The portal, dim at first, begins to glow brighter.");
			$client->Message(14, "The portal flashes briefly, then glows steadily.");
			quest::movepc(223, -35, 1636, 496);
			#Deleting triggers as a 1 time zone in
			quest::delglobal($name."boss1");
			quest::delglobal($name."boss2");
			quest::delglobal($name."boss3");
			quest::delglobal($name."boss4");
			quest::delglobal($name."boss5");
		}
		elsif($doorid == 11){
			$client->Message(14, "The portal, dim at first, begins to glow brighter.");
			$client->Message(14, "The portal flashes briefly, then glows steadily.");
			quest::movepc(223, -55, 569, 496);
			#Deleting triggers as a 1 time zone in
			quest::delglobal($name."boss1");
			quest::delglobal($name."boss2");
			quest::delglobal($name."boss3");
			quest::delglobal($name."boss4");
			quest::delglobal($name."boss5");
		}
		elsif($doorid == 12){
			$client->Message(14, "The portal, dim at first, begins to glow brighter.");
			$client->Message(14, "The portal flashes briefly, then glows steadily.");
			quest::movepc(223, -27, 1103, 496);
			#Deleting triggers as a 1 time zone in
			quest::delglobal($name."boss1");
			quest::delglobal($name."boss2");
			quest::delglobal($name."boss3");
			quest::delglobal($name."boss4");
			quest::delglobal($name."boss5");
		}
		else {
		#DO nothing for now
		}
		
		
	} else {
	$client->Message(14, "Portal is locked.");
	}
	
	
	
	
}#END sub EVENT_CLICKDOOR

sub EVENT_ENTERZONE {
	$client->Message(15, "Welcome $name! If you're here to access Plane of Time B, the portals 
	are locked until you kill all 5 bosses guarding the sundial portals. You have 45 minutes 
	to kill all 5 and timer starts after the 1st one killed. You must kill each one to gain portal
	access and you'll know when all 5 are dead.");


}

sub EVENT_TIMER {

}