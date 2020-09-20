# keycheck (162569)

sub EVENT_SPAWN {
	quest::set_proximity($x - 135, $x + 135, $y - 135, $y + 135, $z - 5, $z + 400);
}

sub EVENT_ENTER {
	if($status < 80) {
		if(!plugin::check_hasitem($client, 19719) && !$client->KeyRingCheck(19719)) {
			quest::movepc(162,0,0,2.2,65); # Zone: ssratemple
            $client->Message(14, "You must have a Ring of the Shissar to enter this chamber.");
		}
	}
}

