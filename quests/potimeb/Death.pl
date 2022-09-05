# Death.pl npcid - 223251

sub EVENT_WAYPOINT {
    if($wp == 2) {
        my $rolls = int(rand(200));
        if($rolls <= 2) {
            quest::emote(" pats his pockets and says, 'Hmm, now where did I put my keys?'");
		}
	}

    if($wp == 4) {
        my $rolls = int(rand(200));
		if($rolls <= 2) {
            quest::emote(" pats his pockets and says, 'Hmm, now where did I put my keys?'");
		}
	} 

    if($wp == 6) {
        my $rolls = int(rand(200));
		if($rolls <= 2) {
            quest::emote(" pats his pockets and says, 'Hmm, now where did I put my keys?'");
		}
	}

    if($wp == 8) {
        my $rolls = int(rand(200));
		if($rolls <= 2) {
            quest::emote(" pats his pockets and says, 'Hmm, now where did I put my keys?'");
		}
	}

    if($wp == 10) {
        my $rolls = int(rand(200));
		if($rolls <= 2) {
            quest::emote(" pats his pockets and says, 'Hmm, now where did I put my keys?'");
		}
	}

    if($wp == 12) {
        my $rolls = int(rand(200));
		if($rolls <= 2) {
            quest::emote(" pats his pockets and says, 'Hmm, now where did I put my keys?'");
		}
	}
}
#END sub EVENT_WAYPOINT

