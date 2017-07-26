#####################################
## Server-wide messages upon rare loots
## Karnor's Castle
## Revision 2.0 by patrikpatrik 7/25/2017
#####################################

sub EVENT_LOOT{
	$tempa = $looted_id;
	#$statement2 = quest::ze(15, "looted_id is $tempa.");
	if($tempa == 82731) { #Fabled_Jade_mace
		$item = quest::varlink(82731);
		quest::we(14, "The Rathe server congratulates $name, the uber $class for looting an extremely rare -$item-!");
	} elsif ($tempa == 82734) { #Fabled_Tranquil staff
		$item = quest::varlink(82734);
		quest::we(14, "The Rathe server congratulates $name, the uber $class for looting an extremely rare -$item-!");
	} elsif ($tempa == 6639) { # Tranquil staff
		$item = quest::varlink(6639);
		quest::we(14, "The Rathe server congratulates $name, the uber $class for looting an extremely rare -$item-!");
	} else {
		# Do nothing!
	}
}
