#######################################
## NPC: a_slot_machine
## Zone: Plane of Knowledge
## classic slots (4 symbols, 4 reels)        
## by Patrikpatrik
## Aug 3rd 2015
#######################################

#4 suit symbols in ascii
	$spades = chr(9824);
	$clubs = chr(9827);
	$hearts = chr(9829);
	$diamonds = chr(9830);
#Types of reels
	@spades4 = ($spades, $spades, $spades, $spades);
	@spades3 = ($spades, $spades, $spades);
	@hearts4 = ($hearts, $hearts, $hearts, $hearts);
	@hearts3 = ($hearts, $hearts, $hearts);
	@clubs4 = ($clubs, $clubs, $clubs, $clubs);
	@clubs3 = ($clubs, $clubs, $clubs);
	@diamonds4 = ($diamonds, $diamonds, $diamonds, $diamonds);
	@diamonds3 = ($diamonds, $diamonds, $diamonds);
	
sub EVENT_SPAWN {
	$x = $npc->GetX();
	$y = $npc->GetY();
	quest::set_proximity($x - 35, $x + 35, $y - 35, $y + 35);
	}
	
sub EVENT_ENTER {
	$npc->SetAppearance(0);
	my $randomrollsay = int(rand(100));
	if ($randomrollsay <= 40) {
		$client->Message(263, "You hear the sounds and jingles of a slot machine nearby.");
		}
	}
	
sub EVENT_EXIT {
	$npc->SetAppearance(0);
	}
	
sub EVENT_SAY {
	if($text=~/Hail/i) {
		my $payout = quest::saylink("payout", 1);
		my $token = quest::saylink("token", 1);
		$client->Message(14, "A slot machine is oddly placed with a $payout description and a $token slot.");
		}
	elsif($text=~/token/i) {
		$client->Message(15, "The token slot is too small for coins.");
		}
	elsif($text=~/payout/i) {
		$client->Message(12, "-" x 57);
		$client->Message(12, "| Winning Combinations | Payout | 1 Token |");
		$client->Message(12, "-" x 57);
		$client->Message(12, "| $spades $spades $spades $spades -------------------- |---10x--- | -1050pp-|");
		$client->Message(12, "| $hearts $hearts $hearts $hearts ------------------- |----9x---- | -945pp-- |");
		#$client->Message(15, "| One of each suit --------| -315pp- |");
		$client->Message(12, "| Any 3 suits in a row--- |----2x---- | -210pp-- |");
		$client->Message(12, "| Pairs of $clubs or $diamonds only --- |----1x---- | -105pp-- |");
		$client->Message(12, "-" x 57);
		}
	}

sub EVENT_ITEM {
	if(plugin::check_handin(\%itemcount, 59970 => 1)) {
		#1st reel
		my @miniarray1 = ($spades, $hearts, $clubs, $diamonds);
		my $reel1 = splice(@miniarray1, int(rand(4)), 1);
		#2nd reel
		my @miniarray2 = ($spades, $hearts, $clubs, $diamonds);
		my $reel2 = splice(@miniarray2, int(rand(4)), 1);
		#3rd reel
		my @miniarray3 = ($spades, $hearts, $clubs, $diamonds);
		my $reel3 = splice(@miniarray3, int(rand(4)), 1);
		#4th reel
		my@miniarray4 = ($spades, $hearts, $clubs, $diamonds);
		my $reel4 = splice(@miniarray4, int(rand(4)), 1);
		@total = ($reel1, $reel2, $reel3, $reel4);
		$client->Message(14, "The slot machine spins briefly then stops at $reel1, $reel2, $reel3, $reel4");
#These check jackpot sequence
	if ("@spades4" eq "@total")  {
		$client->Message(15, "You HIT $spades $spades $spades $spades jackpot! You win 1050 Platinum Pieces.");
		quest::ding();
		$client->DoAnim(13, 27);
		quest::givecash(0, 0, 0, 1050);
		}
	elsif("@hearts4" eq "@total") {
		$client->Message(15, "You HIT $hearts $hearts $hearts $hearts jackpot! You win 945 Platinum Pieces.");
		quest::ding();
		$client->DoAnim(13, 27);
		quest::givecash(0, 0, 0, 945);
		}
	elsif("@clubs4" eq "@total") {
		$client->Message(14, "So close! Unfortunately, 4 of a kind $clubs win nothing.");
		$client->DoAnim(13, 28);
		}
	elsif("@diamonds4" eq "@total") {
		$client->Message(14, "So close! Unfortunately, 4 of a kind $diamonds win nothing.");
		$client->DoAnim(13, 28);
		}
#End jackpot sequence
	#This checks one of each suit
	#elsif((@total[0] ne @total[1]) && (@total[1] ne @total[2]) && (@total[2] ne @total[3]) && (@total[0] ne @total[2]) && (@total[1] ne @total[3]) && (@total[0] ne @total[3])) {
	#	$client->Message(15, "You got one of each suit! You win 315 Platinum Pieces.");
	#	quest::ding();
#This checks any 3 of a kind.
	elsif(((@total[0] eq @total[1]) && (@total[1] eq @total[2]) || (@total[1] eq @total[2]) && (@total[2] eq @total[3]))) {
		$client->Message(15, "You HIT 3 of a kind! You win 210 Platinum Pieces.");
		quest::ding();
		$client->DoAnim(13, 27);
		quest::givecash(0, 0, 0, 210);
		}
		#This checks 2 running pairs of clubs
	elsif(((@total[0] eq "$clubs") && (@total[1] eq "$clubs")) || ((@total[1] eq "$clubs") && (@total[2] eq "$clubs")) || ((@total[2] eq "$clubs") && (@total[3] eq "$clubs"))) {
		$client->Message(15, "You got running $clubs pair! You win 105 Platinum Pieces.");
		quest::ding();
		$client->DoAnim(13, 27);
		quest::givecash(0, 0, 0, 105);
		}
		#This checks 2 running pairs of diamonds
	elsif(((@total[0] eq "$diamonds") && (@total[1] eq "$diamonds")) || ((@total[1] eq "$diamonds") && (@total[2] eq "$diamonds")) || ((@total[2] eq "$diamonds") && (@total[3] eq "$diamonds"))) {
		$client->Message(15, "You got running $diamonds pair! You win 105 Platinum Pieces.");
		quest::ding();
		$client->DoAnim(13, 27);
		quest::givecash(0, 0, 0, 105);
		}
	else{
		$client->Message(15, "You get nothing.");
		}
		#$client->Message(14, "Debugging, the Total array is @total.");
		#$client->Message(14, "peeking at @total[0] and @total[1] as well as @total[1] and @total[2].");	
}
else {
		$client->Message(14,"It doesn't seem to fit. Try a 'small gold token'.");
		plugin::return_items(\%itemcount);
		if($platinum != 0 || $gold != 0 || $silver != 0 || $copper != 0) {
			quest::givecash($copper, $silver, $gold, $platinum);
		}
	}
}
#END OF FILE Zone:Plane of Knowledge ID:202392 -- a_slot_machine.pl