####Fabled Depoper###
### Romell 6-9-09
## Update 10/18/2017 patrikpatrik
# Replaced depopping script w/ timer
####################################
sub EVENT_SPAWN {
	$x = $npc->GetX();
	$y = $npc->GetY();
	quest::set_proximity($x - 50, $x + 50, $y - 50, $y + 50);
	
	$tempa = $npc->GetNPCTypeID();
	
	if ($tempa == 64099) {
		quest::settimer("fabledunder", 600); #will remain for 10 minutes
	}
}

sub EVENT_COMBAT {
	if($npc->IsEngaged()) {
		quest::stoptimer($timer);
	} else {
		quest::settimer("fabledunder", 600);
	}
}

sub EVENT_TIMER {
	if($timer eq "fabledunder") {
		quest::depop();
	}
}
#EOF Zone:Kedge Keep  NPC:64099 - #The_Fabled_Undertow