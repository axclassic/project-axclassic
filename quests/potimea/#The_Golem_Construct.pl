#####################################
##The_Golem_Construct 2 of 5 bosses.
##accessing plane of time B
##associated with doorid 10
##preliminary testing by patrikpatrik
## 1st revision 5/31/2016
## Files associated player.pl
#####################################

sub EVENT_SAY {
 #$client->Message(15, "The HELL u want?");
}#END sub EVENT_SAY

sub EVENT_DEATH {
#Upon Death the qglobal is triggered.
	if (!defined $qglobals{$name."boss2"}){
		quest::setglobal($name."boss2", 1, 7, "M60");
		#$client->Message(15, "boss2 not defined, so you get a point!");	
	} else {
		#$client->Message(15, "boss2 qglobal already up and running.");
	}
	if ((!defined $qglobals{$name."boss1"}) || (!defined $qglobals{$name."boss3"}) || 
		(!defined $qglobals{$name."boss4"}) || (!defined $qglobals{$name."boss5"})) {
		$client->Message(15, "You have more to dispatch to appease the gods...");
	}
	else {
		$client->Message(14, "Congratulations, $name. You feel an overwhelming urge to pass 
		through the portals. Make haste before it's too late...");
	}
}#END sub EVENT_DEATH