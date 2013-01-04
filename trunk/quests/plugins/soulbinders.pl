######################################
## NPC: All Soulbinders             ##
## Zone: All starting zones         ##
##  Bind soul & port to start city  ##
##                                  ##
## Revised by caved for AXClassic   ##
## EQWorld Server     04-01-2013    ##
######################################


sub soulbinder_say {

	
	my $bind = quest::saylink("bind", 1); 
      my $sense = quest::saylink("sense", 1); 
      my $return = quest::saylink("return", 1);
      my $text = shift;
if($text=~/hail/i){
		quest::say("Greetings $name . When a hero of our world is slain their soul returns to the place it was last bound and the body is reincarnated. As a member of the Order of Eternity it is my duty to $bind your soul to this location, or $sense the ties to your soul, thus sending you back to the city you once started in, if that is your wish.");
	} 
elsif($text=~/bind/i) {
	quest::say("Binding your soul. You will return here when you die.");
	quest::selfcast(2049);
	}
elsif($text=~/sense/i) {
      quest::say("Not only can I bind your soul, but I can $return you to your bind of origin .");
      }
elsif($text=~/return/i) {
      quest::say("Returning you to your home!");
      quest::selfcast(5824);

}
}