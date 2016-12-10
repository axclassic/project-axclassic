#####################################
## Server-wide messages upon rare loots
## Sebilis
#####################################

sub EVENT_LOOT{
	$templ = $looted_id;
	if($templ == 2735) { #Fungus covered scale tunic
		$item = quest::varlink(2735);
	} elsif ($templ == 1619) { #siblisian berserker cloak
		$item = quest::varlink(1619);
	} elsif ($templ == 1620) { # Runebranded girdle
		$item = quest::varlink(1620);
	}
		quest::we(14, "The Rathe server congratulates $name, the uber $class for looting an extremely rare -$item-!");
}
