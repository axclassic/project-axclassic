######################################
## NPC: All Soulbinders             ##
## Zone: All starting zones         ##
##  Bind soul & port to start city  ##
##                                  ##
## Revised by caved for AXClassic   ##
## EQWorld Server     04-01-2013    ##
######################################


sub soulbinder_say {

	my $text = shift;
	my $bind = quest::saylink("bind", 1);
if($text=~/hail/i){
		quest::say("Greetings $name . When a hero of our world is slain their soul returns to the place it was last bound and the body is reincarnated. As a member of the Order of Eternity  it is my duty to $bind to this location if that is your wish.");
	} 
elsif($text=~/bind/i) {
	    quest::say("Binding your soul. You will return here when you die.");
	    quest::selfcast(2049);
	}
}  
