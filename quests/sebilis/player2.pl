#####################################
## Server-wide messages upon rare loots
## Sebilis
## Revision 2.0 by patrikpatrik 7/25/2017
#####################################

sub EVENT_LOOT{
	$tempa = $looted_id;
	#$statement2 = quest::ze(15, "looted_id is $tempa.");
	if($tempa == 2735) { #Fungus covered scale tunic
		$item = quest::varlink(2735);
		quest::we(14, "The Rathe server congratulates $name, the uber $class for looting an extremely rare -$item-!");
	} elsif ($tempa == 1619) { #siblisian berserker cloak
		$item = quest::varlink(1619);
		quest::we(14, "The Rathe server congratulates $name, the uber $class for looting an extremely rare -$item-!");
	} elsif ($tempa == 1620) { # Runebranded girdle
		$item = quest::varlink(1620);
		quest::we(14, "The Rathe server congratulates $name, the uber $class for looting an extremely rare -$item-!");
	} else {
		# Do nothing
	}
}
