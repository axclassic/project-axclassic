sub EVENT_CLICKDOOR {
	#my $d_id = ($doorid % 256);
	$client->Message(14, "Portal is locked.");
	
}

sub EVENT_ENTERZONE {
	$client->Message(15, "Welcome $name!");


}