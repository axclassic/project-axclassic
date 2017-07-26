#####################################
## Server-wide messages upon rare loots
## Karnor's Castle
## Revision 3 by patrikpatrik 7/26/2017
#####################################

sub EVENT_LOOT {
	my @item_list = (82731, 82734, 6639);
	# 82731 Fabled_Jade_mace
	# 82734 Fabled_Tranquil staff
	# 6639 Tranquil staff

	if(grep(/^$looted_id$/, @item_list)) {
		my $item = quest::varlink($looted_id);
		quest::we(14, "The Rathe server congratulates $name, the uber $class for looting an extremely rare -$item-!");
	}
}