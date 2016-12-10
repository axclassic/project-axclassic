#####################################
## Server-wide messages upon rare loots
## Karnor's Castle
#####################################

sub EVENT_LOOT{
	$templ = $looted_id;
	if($templ == 82731) { #Fabled_Jade_mace
		$item = quest::varlink(82731);
	} elsif ($templ == 82734) { #Fabled_Tranquil staff
		$item = quest::varlink(82734);
	} elsif ($templ == 6639) { # Tranquil staff
		$item = quest::varlink(6639);
	}
		quest::we(14, "The Rathe server congratulates $name, the uber $class for looting an extremely rare -$item-!");
}
