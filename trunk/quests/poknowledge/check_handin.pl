#!/usr/bin/perl

# plugin::check_handin($item1 => #required_amount,...);
# autoreturns extra unused items on success
sub check_handin {
    my $hashref = shift;
    my %itemcount = %$hashref;
    my %required = @_;
    my %extraitems;
    my $failed = 0;
    my %dupitemcount = %itemcount;
    foreach my $req (keys %required) {
	if ((!defined $itemcount{$req}) || ($itemcount{$req} < $required{$req})) {
	    # missing item(s) or not enough of them
	    $failed = 1;
	} elsif ($itemcount{$req} > $required{$req}) {
	    # check to see if they gave too many
	    if (($itemcount{$req} - $required{$req}) > 0) {
		$extraitems{$req} = $itemcount{$req} - $required{$req};
	    }
	} else {
	    delete $dupitemcount{$req};
	}
    }
    if ($failed == 1) {
	return_items();
	return 0;
    }
    foreach my $extra (keys %extraitems) {
	# return extra items
	quest::say("You gave me extra, here, take it back");
	quest::summonitem($extra, $extraitems{"$extra"});
	delete $dupitemcount{"$extra"};
    }
    # return unused items
    plugin::return_items(\%dupitemcount);
    return 1;
}

sub return_items {    
    my $hashref = shift;
    my %items = %$hashref;
    foreach my $k (keys(%items)) {
	quest::summonitem($k, $items{$k}) unless $k == 0;
    }
}

