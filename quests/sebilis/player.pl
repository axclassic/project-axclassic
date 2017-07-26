#####################################
## Server-wide messages upon rare loots
## Sebilis
## Revision 3 by patrikpatrik 7/26/2017
#####################################

sub EVENT_LOOT {
	my @item_list = (2735, 1619, 1620);
	# 2735 Fungus covered scale tunic
	# 1619 siblisian berserker cloak
	# 1620 Runebranded girdle

	if(grep(/^$looted_id$/, @item_list)) {
		my $item = quest::varlink($looted_id);
		quest::we(14, "The Rathe server congratulates $name, the uber $class for looting an extremely rare -$item-!");
	}
}