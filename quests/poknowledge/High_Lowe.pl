#######################################
## NPC: High Lowe                  
## Zone: Plane of Knowledge    
## Quest: Casino Hi-Low 2 variants     
## by Patrikpatrik   
## started on Aug 20 2015
## Card type and Dice type
##
## Last updated 8/28/2015
#######################################

#symbol values
our $spades = chr(9824);
our $clubs = chr(9827);
our $hearts = chr(9829);
our $diamonds = chr(9830);

#standard 52 card single deck
our @truedeck = (
"Ace$spades",
"Ace$hearts",
"Ace$clubs",
"Ace$diamonds",
"2$spades",
"2$hearts",
"2$clubs",
"2$diamonds",
"3$spades", 
"3$hearts",
"3$clubs",
"3$diamonds",
"4$spades",
"4$hearts",
"4$clubs",
"4$diamonds",
"5$spades", 
"5$hearts",
"5$clubs",
"5$diamonds",
"6$spades",
"6$hearts",
"6$clubs",
"6$diamonds",
"7$spades",
"7$hearts",
"7$clubs",
"7$diamonds",
"8$spades",
"8$hearts",
"8$clubs",
"8$diamonds",
"9$spades", 
"9$hearts",
"9$clubs",
"9$diamonds",
"10$spades",
"10$hearts",
"10$clubs",
"10$diamonds",
"Jack$spades",
"Jack$hearts",
"Jack$clubs",
"Jack$diamonds",
"Queen$spades",
"Queen$hearts",
"Queen$clubs",
"Queen$diamonds",
"King$diamonds",
"King$clubs",
"King$hearts",
"King$spades");

#shuffling function
sub shuffle{
	my $onedeck = shift;
	my $t = @$onedeck;
	while (--$t){
		my $j = int rand($t+1);
		@$onedeck[$t,$j] = @$onedeck[$j,$t];
		}
	}

#Values function
sub value1{
		if($firstcard eq "2$spades" || $firstcard eq "2$hearts" || $firstcard eq "2$clubs" || $firstcard eq "2$diamonds") {
			$first = 2;
			}
		elsif($firstcard eq "3$spades" || $firstcard eq "3$hearts" || $firstcard eq "3$clubs" || $firstcard eq "3$diamonds") {
			$first = 3;
			}
		elsif($firstcard eq "4$spades" || $firstcard eq "4$hearts" || $firstcard eq "4$clubs" || $firstcard eq "4$diamonds") {
			$first = 4;
			}
		elsif($firstcard eq "5$spades" || $firstcard eq "5$hearts" || $firstcard eq "5$clubs" || $firstcard eq "5$diamonds") {
			$first = 5;
			}
		elsif($firstcard eq "6$spades" || $firstcard eq "6$hearts" || $firstcard eq "6$clubs" || $firstcard eq "6$diamonds") {
			$first = 6;
			}
		elsif($firstcard eq "7$spades" || $firstcard eq "7$hearts" || $firstcard eq "7$clubs" || $firstcard eq "7$diamonds") {
			$first = 7;
			}
		elsif($firstcard eq "8$spades" || $firstcard eq "8$hearts" || $firstcard eq "8$clubs" || $firstcard eq "8$diamonds") {
			$first = 8;
			}
		elsif($firstcard eq "9$spades" || $firstcard eq "9$hearts" || $firstcard eq "9$clubs" || $firstcard eq "9$diamonds") {
			$first = 9;
			}
		elsif($firstcard eq "10$spades" || $firstcard eq "10$hearts" || $firstcard eq "10$clubs" || $firstcard eq "10$diamonds") {
			$first = 10;
			}
		elsif($firstcard eq "Jack$spades" || $firstcard eq "Jack$hearts" || $firstcard eq "Jack$clubs" || $firstcard eq "Jack$diamonds") {
			$first = 11;
			}
		elsif($firstcard eq "Queen$spades" || $firstcard eq "Queen$hearts" || $firstcard eq "Queen$clubs" || $firstcard eq "Queen$diamonds") {
			$first = 12;
			}
		elsif($firstcard eq "King$spades" || $firstcard eq "King$hearts" || $firstcard eq "King$clubs" || $firstcard eq "King$diamonds") {
			$first = 13;
			}
		elsif($firstcard eq "Ace$spades" || $firstcard eq "Ace$hearts" || $firstcard eq "Ace$clubs" || $firstcard eq "Ace$diamonds") {
			$first = 14;
			}
}
sub value2{
		if($secondcard eq "2$spades" || $secondcard eq "2$hearts" || $secondcard eq "2$clubs" || $secondcard eq "2$diamonds") {
			$second = 2;
			}
		elsif($secondcard eq "3$spades" || $secondcard eq "3$hearts" || $secondcard eq "3$clubs" || $secondcard eq "3$diamonds") {
			$second = 3;
			}
		elsif($secondcard eq "4$spades" || $secondcard eq "4$hearts" || $secondcard eq "4$clubs" || $secondcard eq "4$diamonds") {
			$second = 4;
			}
		elsif($secondcard eq "5$spades" || $secondcard eq "5$hearts" || $secondcard eq "5$clubs" || $secondcard eq "5$diamonds") {
			$second = 5;
			}
		elsif($secondcard eq "6$spades" || $secondcard eq "6$hearts" || $secondcard eq "6$clubs" || $secondcard eq "6$diamonds") {
			$second = 6;
			}
		elsif($secondcard eq "7$spades" || $secondcard eq "7$hearts" || $secondcard eq "7$clubs" || $secondcard eq "7$diamonds") {
			$second = 7;
			}
		elsif($secondcard eq "8$spades" || $secondcard eq "8$hearts" || $secondcard eq "8$clubs" || $secondcard eq "8$diamonds") {
			$second = 8;
			}
		elsif($secondcard eq "9$spades" || $secondcard eq "9$hearts" || $secondcard eq "9$clubs" || $secondcard eq "9$diamonds") {
			$second = 9;
			}
		elsif($secondcard eq "10$spades" || $secondcard eq "10$hearts" || $secondcard eq "10$clubs" || $secondcard eq "10$diamonds") {
			$second = 10;
			}
		elsif($secondcard eq "Jack$spades" || $secondcard eq "Jack$hearts" || $secondcard eq "Jack$clubs" || $secondcard eq "Jack$diamonds") {
			$second = 11;
			}
		elsif($secondcard eq "Queen$spades" || $secondcard eq "Queen$hearts" || $secondcard eq "Queen$clubs" || $secondcard eq "Queen$diamonds") {
			$second = 12;
			}
		elsif($secondcard eq "King$spades" || $secondcard eq "King$hearts" || $secondcard eq "King$clubs" || $secondcard eq "King$diamonds") {
			$second = 13;
			}
		elsif($secondcard eq "Ace$spades" || $secondcard eq "Ace$hearts" || $secondcard eq "Ace$clubs" || $secondcard eq "Ace$diamonds") {
			$second = 14;
			}
}
sub value3{
		if($thirdcard eq "Ace$spades" || $thirdcard eq "Ace$hearts" || $thirdcard eq "Ace$clubs" || $thirdcard eq "Ace$diamonds") {
			$third = 1;
			}
		elsif($thirdcard eq "2$spades" || $thirdcard eq "2$hearts" || $thirdcard eq "2$clubs" || $thirdcard eq "2$diamonds") {
			$third = 2;
			}
		elsif($thirdcard eq "3$spades" || $thirdcard eq "3$hearts" || $thirdcard eq "3$clubs" || $thirdcard eq "3$diamonds") {
			$third = 3;
			}
		elsif($thirdcard eq "4$spades" || $thirdcard eq "4$hearts" || $thirdcard eq "4$clubs" || $thirdcard eq "4$diamonds") {
			$third = 4;
			}
		elsif($thirdcard eq "5$spades" || $thirdcard eq "5$hearts" || $thirdcard eq "5$clubs" || $thirdcard eq "5$diamonds") {
			$third = 5;
			}
		elsif($thirdcard eq "6$spades" || $thirdcard eq "6$hearts" || $thirdcard eq "6$clubs" || $thirdcard eq "6$diamonds") {
			$third = 6;
			}
		elsif($thirdcard eq "7$spades" || $thirdcard eq "7$hearts" || $thirdcard eq "7$clubs" || $thirdcard eq "7$diamonds") {
			$third = 7;
			}
		elsif($thirdcard eq "8$spades" || $thirdcard eq "8$hearts" || $thirdcard eq "8$clubs" || $thirdcard eq "8$diamonds") {
			$third = 8;
			}
		elsif($thirdcard eq "9$spades" || $thirdcard eq "9$hearts" || $thirdcard eq "9$clubs" || $thirdcard eq "9$diamonds") {
			$third = 9;
			}
		elsif($thirdcard eq "10$spades" || $thirdcard eq "10$hearts" || $thirdcard eq "10$clubs" || $thirdcard eq "10$diamonds" || 
			$thirdcard eq "Jack$spades" || $thirdcard eq "Jack$hearts" || $thirdcard eq "Jack$clubs" || $thirdcard eq "Jack$diamonds" ||
			$thirdcard eq "Queen$spades" || $thirdcard eq "Queen$hearts" || $thirdcard eq "Queen$clubs" || $thirdcard eq "Queen$diamonds" ||
			$thirdcard eq "King$spades" || $thirdcard eq "King$hearts" || $thirdcard eq "King$clubs" || $thirdcard eq "King$diamonds") {
			$third = 10;
			}	
}
sub value4{
		if($fourthcard eq "Ace$spades" || $fourthcard eq "Ace$hearts" || $fourthcard eq "Ace$clubs" || $fourthcard eq "Ace$diamonds") {
			$fourth = 1;
			}
		elsif($fourthcard eq "2$spades" || $fourthcard eq "2$hearts" || $fourthcard eq "2$clubs" || $fourthcard eq "2$diamonds") {
			$fourth = 2;
			}
		elsif($fourthcard eq "3$spades" || $fourthcard eq "3$hearts" || $fourthcard eq "3$clubs" || $fourthcard eq "3$diamonds") {
			$fourth = 3;
			}
		elsif($fourthcard eq "4$spades" || $fourthcard eq "4$hearts" || $fourthcard eq "4$clubs" || $fourthcard eq "4$diamonds") {
			$fourth = 4;
			}
		elsif($fourthcard eq "5$spades" || $fourthcard eq "5$hearts" || $fourthcard eq "5$clubs" || $fourthcard eq "5$diamonds") {
			$fourth = 5;
			}
		elsif($fourthcard eq "6$spades" || $fourthcard eq "6$hearts" || $fourthcard eq "6$clubs" || $fourthcard eq "6$diamonds") {
			$fourth = 6;
			}
		elsif($fourthcard eq "7$spades" || $fourthcard eq "7$hearts" || $fourthcard eq "7$clubs" || $fourthcard eq "7$diamonds") {
			$fourth = 7;
			}
		elsif($fourthcard eq "8$spades" || $fourthcard eq "8$hearts" || $fourthcard eq "8$clubs" || $fourthcard eq "8$diamonds") {
			$fourth = 8;
			}
		elsif($fourthcard eq "9$spades" || $fourthcard eq "9$hearts" || $fourthcard eq "9$clubs" || $fourthcard eq "9$diamonds") {
			$fourth = 9;
			}
		elsif($fourthcard eq "10$spades" || $fourthcard eq "10$hearts" || $fourthcard eq "10$clubs" || $fourthcard eq "10$diamonds" || 
			$fourthcard eq "Jack$spades" || $fourthcard eq "Jack$hearts" || $fourthcard eq "Jack$clubs" || $fourthcard eq "Jack$diamonds" ||
			$fourthcard eq "Queen$spades" || $fourthcard eq "Queen$hearts" || $fourthcard eq "Queen$clubs" || $fourthcard eq "Queen$diamonds" ||
			$fourthcard eq "King$spades" || $fourthcard eq "King$hearts" || $fourthcard eq "King$clubs" || $fourthcard eq "King$diamonds") {
			$fourth = 10;
			}	
}	
#Function wins/losses
sub playerwin{
	$client->Message(15, "$name WINS!");
	#quest::ding();
	$client->DoAnim(13, 27);
	quest::setglobal("cards", 0, 5, "F");
	quest::setglobal("paid", 0, 5, "F");
	quest::setglobal("dices", 0, 5, "F");
	# $alt = "";
	# $alt2 = "";
	# $mytotals = "";
	# $dealertotals = "";
	# $i = 0; #This resets the counter once game is over
	# $myace = 0; #This resets the ace value so it doesnt repeat on $play
	# $dealerace = 0; #This resets the ace value so it doesnt repeat on $play
	# quest::setglobal("cheat", 0, 5, "F");
	# quest::setglobal("hithit", 1, 5, "F");
	# quest::setglobal("standstand", 1, 5, "F");
	# quest::givecash(0, 0, 0, ($platinum*2));
}

sub dealerwin{
	$client->Message(15, "Dealer WINS!");
	$npc->DoAnim(8, 27);
	quest::setglobal("cards", 0, 5, "F");
	quest::setglobal("paid", 0, 5, "F");
	quest::setglobal("dices", 0, 5, "F");
	# $alt = "";
	# $alt2 = "";
	# $mytotals = "";
	# $dealertotals = "";
	# $i = 0; #This resets the counter once game is over
	# $myace = 0; #This resets the ace value so it doesnt repeat on $play
	# $dealerace = 0; #This resets the ace value so it doesnt repeat on $play
	# quest::setglobal("cheat", 0, 5, "F");
	# quest::setglobal("hithit", 1, 5, "F");
	# quest::setglobal("standstand", 1, 5, "F");
}	

sub EVENT_SPAWN {
	$x = $npc->GetX();
	$y = $npc->GetY();
	quest::set_proximity($x - 20, $x + 20, $y - 20, $y + 20);
}
sub EVENT_ENTER {
	$npc->SetAppearance(1);
}
sub EVENT_EXIT {
	#$npc->SetAppearance(0);
}
#10037 diamond 90 plat 207 plat
#10035 ruby 56 plat 129 plat
#10051 ruby crown 90 plat 207 plat
#10048 star ruby earring 56 plat 129 plat
#10045 emerald ring 30 plat 67 plat
#10050 sapphire necklace 80 plat 181 plat
#10033 fire emerald 39 plat 88 plat
#10032 star ruby 29 plat 67 plat
#10034 sapphire 45 plat 103 plat
#10036 black sapphire 80 plat 181 plat


sub EVENT_SAY {
my $rules = quest::saylink("rules", 1);

my $play = quest::saylink("play", 1);
my $higher = quest::saylink("higher", 1);
my $lower = quest::saylink("lower", 1);
my $continue = quest::saylink("continue", 1);
my $cash = quest::saylink("cash", 1);
my $high = quest::saylink("high", 1);
my $low = quest::saylink("low", 1);
my $seven = quest::saylink("seven", 1);
	
	if($text=~/Hail/i) {
		quest::say("Welcome to Hi-Low, $name. Would you like to know the $rules? You can choose to $play the card variant or the dice version.");
	}
	elsif($text=~/rules/i) {
		$client->Message(10, "High Lowe says,");
		$client->Message(12, "For the card version, the object of the game is to correctly guess if the 
			following card will be higher or lower in value: [2] being the LOWEST and [Ace] being the HIGHEST. 
			After the 1st win, the player may continue to play to increase the payout for up to 9 consecutive times, 
			while an incorrect guess or a tie will result in a loss. Lastly, the player may cash out at any time to 
			start afresh.");
		$client->Message(263, "For the dice version, the player guesses from 3 choices: HIGH, LOW, or a 7. The dealer then 
			rolls two 6-sided dice. If the sum is 2, 3, 4, 5, or 6 it's Low. If the sum is 8, 9, 10, 11, or 12 it's High. 
			If the bet is a 7 and the dealer rolls a 7, the player will get a payout of 4:1. Otherwise dice wins are 1:1.
			Ready to $play?");
	}
	elsif($text=~/play/i) {
		quest::say("I accept certain gems in particular as payment. Currently, I require: diamond, ruby, ruby crown, 
		star ruby earring, emerald ring, sapphire necklace, fire emerald, star ruby, sapphire, or black sapphire. 
		Your winnings will be paid out in cash as the highest buyback value for these items.");
	}
	elsif(($text=~/card/i) && $cards == 1 || $paid != 1) {
		quest::say("I'm sorry, not right now.");
	}
	elsif(($text=~/dice/i) && $dices == 1 || $paid != 1) {
		quest::say("I'm sorry, not right now.");
	}
	elsif(($text=~/card/i) && $cards == 2){
		quest::say("We're already playing, let us continue.");
	}
	elsif(($text=~/dice/i) && $dices == 2){
		quest::say("We're already playing, let us continue.");
	}
	elsif($text=~/card/i) {
		$i++;
		quest::say("Let's play, your first card is..");
		shuffle ( \@truedeck ); #shuffles
		@onedeck = @truedeck;
		$firstcard = splice(@onedeck, int(rand(52)), 1); #int(rand(52)) and lessen down
		value1;
		quest::setglobal("highers", 2, 5, "F"); #sets it so the previous higher or lower wont work?
		$client->Message(14, "Dealer reveals [$firstcard]. Is the next card $higher or $lower?");
		quest::setglobal("dices", 1, 5, "F"); #locks out dice when card is playing
		quest::setglobal("cards", 2, 5, "F"); #locks out card so loops wont initialize
		
	}
	elsif(($text=~/higher/i) && $highers == 1) {
		quest::say("Not right now.");
	}
	elsif(($text=~/higher/i) && $highers == 2) {
		if($i == 1) {
			$client->Message(15, "You picked HIGHER!");
			#make sure setglobal here to prevent repeats
			#quest::say("Your next card is..");
			$secondcard = splice(@onedeck, int(rand(51)), 1);
			value2;
			$client->Message(14, "Dealer reveals [$secondcard].");
			if($first < $second) {
				playerwin;
				#set globals for continue and cash to move on properly
				quest::setglobal("nocash", 0, 5, "F");
				quest::setglobal("highers", 1, 5, "F"); #sets it so the previous higher or lower wont work?
				quest::say("Congratulations $name. Would you like to $continue playing or $cash out? If you cash out now your payout is 0.6:1, otherwise the
				next win will be 1.2x the gem's buyback value!");
				quest::setglobal("paid", 1, 5, "F");
			}
			elsif($first == $second) {
				quest::say("I'm sorry but tie goes to the dealer!");
				dealerwin;
				$i = 0;
			}
			else{
				quest::say("You lose, try your luck next time!");
				dealerwin;
				$i = 0; #resets counter
			}
		}
		elsif($i == 2) {
			$client->Message(15, "You picked HIGHER!");
			#make sure setglobal here to prevent repeats
			#quest::say("Your next card is..");
			$firstcard = splice(@onedeck, int(rand(50)), 1);
			value1;
			$client->Message(14, "Dealer reveals [$firstcard].");
			if($first > $second) {
				playerwin;
				#set globals for continue and cash to move on properly
				quest::setglobal("nocash", 0, 5, "F");
				quest::setglobal("highers", 1, 5, "F"); #sets it so the previous higher or lower wont work?
				quest::say("Two in a row $name! Would you like to $continue playing or $cash out? If you cash out now your payout is 1.2:1, otherwise the
				next win will be 1.8x the gem's buyback value!");
				quest::setglobal("paid", 1, 5, "F");
			}
			elsif($first == $second) {
				quest::say("I'm sorry but tie goes to the dealer!");
				dealerwin;
				$i = 0;
			}
			else{
				quest::say("You lose, try your luck next time!");
				dealerwin;
				$i = 0; #resets counter
			}
		}
		elsif($i == 3) {
			$client->Message(15, "You picked HIGHER!");
			#make sure setglobal here to prevent repeats
			#quest::say("Your next card is..");
			$secondcard = splice(@onedeck, int(rand(49)), 1);
			value2;
			$client->Message(14, "Dealer reveals [$secondcard].");
			if($first < $second) {
				playerwin;
				#set globals for continue and cash to move on properly
				quest::setglobal("nocash", 0, 5, "F");
				quest::setglobal("highers", 1, 5, "F"); #sets it so the previous higher or lower wont work?
				quest::say("Three in a row $name! Would you like to $continue playing or $cash out? If you cash out now your payout is 1.8:1, otherwise the
				next win will be 2.4x the gem's buyback value!");
				quest::setglobal("paid", 1, 5, "F");
			}
			elsif($first == $second) {
				quest::say("I'm sorry but tie goes to the dealer!");
				dealerwin;
				$i = 0;
			}
			else{
				quest::say("You lose, try your luck next time!");
				dealerwin;
				$i = 0; #resets counter
			}
		}
		elsif($i == 4) {
			$client->Message(15, "You picked HIGHER!");
			#make sure setglobal here to prevent repeats
			#quest::say("Your next card is..");
			$firstcard = splice(@onedeck, int(rand(48)), 1);
			value1;
			$client->Message(14, "Dealer reveals [$firstcard].");
			if($first > $second) {
				playerwin;
				#set globals for continue and cash to move on properly
				quest::setglobal("nocash", 0, 5, "F");
				quest::setglobal("highers", 1, 5, "F"); #sets it so the previous higher or lower wont work?
				quest::say("Four in a row $name! Would you like to $continue playing or $cash out? If you cash out now your payout is 2.4:1, otherwise the
				next win will be 3x the gem's buyback value!");
				quest::setglobal("paid", 1, 5, "F");
			}
			elsif($first == $second) {
				quest::say("I'm sorry but tie goes to the dealer!");
				dealerwin;
				$i = 0;
			}
			else{
				quest::say("You lose, try your luck next time!");
				dealerwin;
				$i = 0; #resets counter
			}
		}
		elsif($i == 5) {
			$client->Message(15, "You picked HIGHER!");
			#make sure setglobal here to prevent repeats
			#quest::say("Your next card is..");
			$secondcard = splice(@onedeck, int(rand(47)), 1);
			value2;
			$client->Message(14, "Dealer reveals [$secondcard].");
			if($first < $second) {
				playerwin;
				#set globals for continue and cash to move on properly
				quest::setglobal("nocash", 0, 5, "F");
				quest::setglobal("highers", 1, 5, "F"); #sets it so the previous higher or lower wont work?
				quest::say("Five in a row $name! Would you like to $continue playing or $cash out? If you cash out now your payout is 3:1, otherwise the
				next win will be 3.6x the gem's buyback value!");
				quest::setglobal("paid", 1, 5, "F");
			}
			elsif($first == $second) {
				quest::say("I'm sorry but tie goes to the dealer!");
				dealerwin;
				$i = 0;
			}
			else{
				quest::say("You lose, try your luck next time!");
				dealerwin;
				$i = 0; #resets counter
			}
		}
		elsif($i == 6) {
			$client->Message(15, "You picked HIGHER!");
			#make sure setglobal here to prevent repeats
			#quest::say("Your next card is..");
			$firstcard = splice(@onedeck, int(rand(46)), 1);
			value1;
			$client->Message(14, "Dealer reveals [$firstcard].");
			if($first > $second) {
				playerwin;
				#set globals for continue and cash to move on properly
				quest::setglobal("nocash", 0, 5, "F");
				quest::setglobal("highers", 1, 5, "F"); #sets it so the previous higher or lower wont work?
				quest::say("Six in a row $name, it's getting very serious! Would you like to $continue playing or $cash out? If you cash out now your payout is 3.6:1, otherwise the
				next win will be 4.2x the gem's buyback value!");
				quest::setglobal("paid", 1, 5, "F");
			}
			elsif($first == $second) {
				quest::say("I'm sorry but tie goes to the dealer!");
				dealerwin;
				$i = 0;
			}
			else{
				quest::say("You lose, try your luck next time!");
				dealerwin;
				$i = 0; #resets counter
			}
		}
		elsif($i == 7) {
			$client->Message(15, "You picked HIGHER!");
			#make sure setglobal here to prevent repeats
			#quest::say("Your next card is..");
			$secondcard = splice(@onedeck, int(rand(45)), 1);
			value2;
			$client->Message(14, "Dealer reveals [$secondcard].");
			if($first < $second) {
				playerwin;
				#set globals for continue and cash to move on properly
				quest::setglobal("nocash", 0, 5, "F");
				quest::setglobal("highers", 1, 5, "F"); #sets it so the previous higher or lower wont work?
				quest::say("Seven in a row $name, it's getting very serious! Would you like to $continue playing or $cash out? If you cash out now your payout is 4.2:1, otherwise the
				next win will be 4.8x the gem's buyback value!");
				quest::setglobal("paid", 1, 5, "F");
			}
			elsif($first == $second) {
				quest::say("I'm sorry but tie goes to the dealer!");
				dealerwin;
				$i = 0;
			}
			else{
				quest::say("You lose, try your luck next time!");
				dealerwin;
				$i = 0; #resets counter
			}
		}
		elsif($i == 8) {
			$client->Message(15, "You picked HIGHER!");
			#make sure setglobal here to prevent repeats
			#quest::say("Your next card is..");
			$firstcard = splice(@onedeck, int(rand(44)), 1);
			value1;
			$client->Message(14, "Dealer reveals [$firstcard].");
			if($first > $second) {
				playerwin;
				#set globals for continue and cash to move on properly
				quest::setglobal("nocash", 0, 5, "F");
				quest::setglobal("highers", 1, 5, "F"); #sets it so the previous higher or lower wont work?
				quest::say("Eight in a row $name, it's getting very serious! Would you like to $continue playing or $cash out? If you cash out now your payout is 4.8:1, otherwise the
				next win is final at 5.4x the gem's buyback value PLUS a Haversack Leatherfoot backpack!");
				quest::setglobal("paid", 1, 5, "F");
			}
			elsif($first == $second) {
				quest::say("I'm sorry but tie goes to the dealer!");
				dealerwin;
				$i = 0;
			}
			else{
				quest::say("You lose, try your luck next time!");
				dealerwin;
				$i = 0; #resets counter
			}
		}
		elsif($i == 9) {
			$client->Message(15, "You picked HIGHER!");
			#make sure setglobal here to prevent repeats
			#quest::say("Your next card is..");
			$secondcard = splice(@onedeck, int(rand(43)), 1);
			value2;
			$client->Message(14, "Dealer reveals [$secondcard].");
			if($first < $second) {
				#set globals for continue and cash to move on properly
				quest::say("Congratulations $name, you've managed to win 9 in a row! Enjoy your payout and backpack!");
				quest::setglobal("highers", 1, 5, "F"); #sets it so the previous higher or lower wont work?
				quest::ding();
				playerwin;
				quest::givecash(0, 0, 0, 5.4*$plat);
				quest::summonitem(17145);
				$i = 0;
			}
			elsif($first == $second) {
				quest::say("I'm sorry but tie goes to the dealer!");
				dealerwin;
				$i = 0;
			}
			else{
				quest::say("You lose, try your luck next time!");
				dealerwin;
				$i = 0; #resets counter
			}
		}
	}#END higher
	elsif(($text=~/lower/i) && $highers == 1) {
		quest::say("Not right now.");
	}
	elsif(($text=~/lower/i) && $highers == 2) {
		if($i == 1) {
			$client->Message(15, "You picked LOWER!");
			#make sure setglobal here to prevent repeats
			#quest::say("Your next card is..");
			$secondcard = splice(@onedeck, int(rand(51)), 1);
			value2;
			$client->Message(14, "Dealer reveals [$secondcard].");
			if($first > $second) {
			playerwin;
				#set globals for continue and cash to move on properly
				quest::setglobal("nocash", 0, 5, "F");
				quest::setglobal("highers", 1, 5, "F"); #sets it so the previous higher or lower wont work?
				quest::say("Congratulations $name. Would you like to $continue playing or $cash out? If you cash out now your payout is 0.6:1, otherwise the
				next win will be 1.2x the gem's buyback value!");
				quest::setglobal("paid", 1, 5, "F");
			}
			elsif($first == $second) {
				quest::say("I'm sorry but tie goes to the dealer!");
				dealerwin;
				$i = 0;
			}
			else{
				quest::say("You lose, try your luck next time!");
				dealerwin;
				$i = 0; #resets counter
			}
		}
		elsif($i == 2) {
			$client->Message(15, "You picked LOWER!");
			#make sure setglobal here to prevent repeats
			#quest::say("Your next card is..");
			$firstcard = splice(@onedeck, int(rand(50)), 1);
			value1;
			$client->Message(14, "Dealer reveals [$firstcard].");
			if($first < $second) {
				playerwin;
				#set globals for continue and cash to move on properly
				quest::setglobal("nocash", 0, 5, "F");
				quest::setglobal("highers", 1, 5, "F"); #sets it so the previous higher or lower wont work?
				quest::say("Two in a row $name! Would you like to $continue playing or $cash out? If you cash out now your payout is 1.2:1, otherwise the
				next win will be 1.8x the gem's buyback value!");
				quest::setglobal("paid", 1, 5, "F");
			}
			elsif($first == $second) {
				quest::say("I'm sorry but tie goes to the dealer!");
				dealerwin;
				$i = 0;
			}
			else{
				quest::say("You lose, try your luck next time!");
				dealerwin;
				$i = 0; #resets counter
			}
		}
		elsif($i == 3) {
			$client->Message(15, "You picked LOWER!");
			#make sure setglobal here to prevent repeats
			#quest::say("Your next card is..");
			$secondcard = splice(@onedeck, int(rand(49)), 1);
			value2;
			$client->Message(14, "Dealer reveals [$secondcard].");
			if($first > $second) {
				playerwin;
				#set globals for continue and cash to move on properly
				quest::setglobal("nocash", 0, 5, "F");
				quest::setglobal("highers", 1, 5, "F"); #sets it so the previous higher or lower wont work?
				quest::say("Three in a row $name! Would you like to $continue playing or $cash out? If you cash out now your payout is 1.8:1, otherwise the
				next win will be 2.4x the gem's buyback value!");
				quest::setglobal("paid", 1, 5, "F");
			}
			elsif($first == $second) {
				quest::say("I'm sorry but tie goes to the dealer!");
				dealerwin;
				$i = 0;
			}
			else{
				quest::say("You lose, try your luck next time!");
				dealerwin;
				$i = 0; #resets counter
			}
		}
		elsif($i == 4) {
			$client->Message(15, "You picked LOWER!");
			#make sure setglobal here to prevent repeats
			#quest::say("Your next card is..");
			$firstcard = splice(@onedeck, int(rand(48)), 1);
			value1;
			$client->Message(14, "Dealer reveals [$firstcard].");
			if($first < $second) {
				playerwin;
				#set globals for continue and cash to move on properly
				quest::setglobal("nocash", 0, 5, "F");
				quest::setglobal("highers", 1, 5, "F"); #sets it so the previous higher or lower wont work?
				quest::say("Four in a row $name! Would you like to $continue playing or $cash out? If you cash out now your payout is 2.4:1, otherwise the
				next win will be 3x the gem's buyback value!");
				quest::setglobal("paid", 1, 5, "F");
			}
			elsif($first == $second) {
				quest::say("I'm sorry but tie goes to the dealer!");
				dealerwin;
				$i = 0;
			}
			else{
				quest::say("You lose, try your luck next time!");
				dealerwin;
				$i = 0; #resets counter
			}
		}
		elsif($i == 5) {
			$client->Message(15, "You picked LOWER!");
			#make sure setglobal here to prevent repeats
			#quest::say("Your next card is..");
			$secondcard = splice(@onedeck, int(rand(47)), 1);
			value2;
			$client->Message(14, "Dealer reveals [$secondcard].");
			if($first > $second) {
				playerwin;
				#set globals for continue and cash to move on properly
				quest::setglobal("nocash", 0, 5, "F");
				quest::setglobal("highers", 1, 5, "F"); #sets it so the previous higher or lower wont work?
				quest::say("Five in a row $name! Would you like to $continue playing or $cash out? If you cash out now your payout is 3:1, otherwise the
				next win will be 3.6x the gem's buyback value!");
				quest::setglobal("paid", 1, 5, "F");
			}
			elsif($first == $second) {
				quest::say("I'm sorry but tie goes to the dealer!");
				dealerwin;
				$i = 0;
			}
			else{
				quest::say("You lose, try your luck next time!");
				dealerwin;
				$i = 0; #resets counter
			}
		}
		elsif($i == 6) {
			$client->Message(15, "You picked LOWER!");
			#make sure setglobal here to prevent repeats
			#quest::say("Your next card is..");
			$firstcard = splice(@onedeck, int(rand(46)), 1);
			value1;
			$client->Message(14, "Dealer reveals [$firstcard].");
			if($first < $second) {
				playerwin;
				#set globals for continue and cash to move on properly
				quest::setglobal("nocash", 0, 5, "F");
				quest::setglobal("highers", 1, 5, "F"); #sets it so the previous higher or lower wont work?
				quest::say("Six in a row $name, it's getting very serious! Would you like to $continue playing or $cash out? If you cash out now your payout is 3.6:1, otherwise the
				next win will be 4.2x the gem's buyback value!");
				quest::setglobal("paid", 1, 5, "F");
			}
			elsif($first == $second) {
				quest::say("I'm sorry but tie goes to the dealer!");
				dealerwin;
				$i = 0;
			}
			else{
				quest::say("You lose, try your luck next time!");
				dealerwin;
				$i = 0; #resets counter
			}
		}
		elsif($i == 7) {
			$client->Message(15, "You picked LOWER!");
			#make sure setglobal here to prevent repeats
			#quest::say("Your next card is..");
			$secondcard = splice(@onedeck, int(rand(45)), 1);
			value2;
			$client->Message(14, "Dealer reveals [$secondcard].");
			if($first > $second) {
				playerwin;
				#set globals for continue and cash to move on properly
				quest::setglobal("nocash", 0, 5, "F");
				quest::setglobal("highers", 1, 5, "F"); #sets it so the previous higher or lower wont work?
				quest::say("Seven in a row $name, it's getting very serious! Would you like to $continue playing or $cash out? If you cash out now your payout is 4.2:1, otherwise the
				next win will be 4.8x the gem's buyback value!");
				quest::setglobal("paid", 1, 5, "F");
			}
			elsif($first == $second) {
				quest::say("I'm sorry but tie goes to the dealer!");
				dealerwin;
				$i = 0;
			}
			else{
				quest::say("You lose, try your luck next time!");
				dealerwin;
				$i = 0; #resets counter
			}
		}
		elsif($i == 8) {
			$client->Message(15, "You picked LOWER!");
			#make sure setglobal here to prevent repeats
			#quest::say("Your next card is..");
			$firstcard = splice(@onedeck, int(rand(44)), 1);
			value1;
			$client->Message(14, "Dealer reveals [$firstcard].");
			if($first < $second) {
				playerwin;
				#set globals for continue and cash to move on properly
				quest::setglobal("nocash", 0, 5, "F");
				quest::setglobal("highers", 1, 5, "F"); #sets it so the previous higher or lower wont work?
				quest::say("Eight in a row $name, it's getting very serious! Would you like to $continue playing or $cash out? If you cash out now your payout is 4.8:1, otherwise the
				next win is final at 5.4x the gem's buyback value PLUS a Leatherfoot Haversack backpack!");
				quest::setglobal("paid", 1, 5, "F");
			}
			elsif($first == $second) {
				quest::say("I'm sorry but tie goes to the dealer!");
				dealerwin;
				$i = 0;
			}
			else{
				quest::say("You lose, try your luck next time!");
				dealerwin;
				$i = 0; #resets counter
			}
		}
		elsif($i == 9) {
			$client->Message(15, "You picked LOWER!");
			#make sure setglobal here to prevent repeats
			#quest::say("Your next card is..");
			$secondcard = splice(@onedeck, int(rand(43)), 1);
			value2;
			$client->Message(14, "Dealer reveals [$secondcard].");
			if($first > $second) {
				#set globals for continue and cash to move on properly
				quest::say("Congratulations $name, you've managed to win 9 in a row! Enjoy your payout and backpack!");
				quest::ding();
				playerwin;
				quest::setglobal("highers", 1, 5, "F"); #sets it so the previous higher or lower wont work?
				quest::givecash(0, 0, 0, 5.4*$plat);
				quest::summonitem(17145);
				$i = 0;
			}
			elsif($first == $second) {
				quest::say("I'm sorry but tie goes to the dealer!");
				dealerwin;
				$i = 0;
			}
			else{
				quest::say("You lose, try your luck next time!");
				dealerwin;
				$i = 0; #resets counter
			}
		}
	}#END lower
	elsif($text=~/continue/i) {
		if($i == 1){
			$i++;
			quest::setglobal("highers", 2, 5, "F");
			$client->Message(14, "Let's continue, is your next card $higher or $lower?");
			quest::setglobal("paid", 1, 5, "F");
			quest::setglobal("cards", 1, 5, "F");
			quest::setglobal("nocash", 1, 5, "F");
		}
		elsif($i == 2) {
			$i++;
			quest::setglobal("highers", 2, 5, "F");
			$client->Message(14, "Let's continue, is your next card $higher or $lower?");
			quest::setglobal("paid", 1, 5, "F");
			quest::setglobal("nocash", 1, 5, "F");
		}
		elsif($i == 3) {
			$i++;
			quest::setglobal("highers", 2, 5, "F");
			$client->Message(14, "Let's continue, is your next card $higher or $lower?");
			quest::setglobal("paid", 1, 5, "F");
			quest::setglobal("nocash", 1, 5, "F");
		}
		elsif($i == 4) {
			$i++;
			quest::setglobal("highers", 2, 5, "F");
			$client->Message(14, "Let's continue, is your next card $higher or $lower?");
			quest::setglobal("paid", 1, 5, "F");
			quest::setglobal("nocash", 1, 5, "F");
		}
		elsif($i == 5) {
			$i++;
			quest::setglobal("highers", 2, 5, "F");
			$client->Message(14, "Let's continue, is your next card $higher or $lower?");
			quest::setglobal("paid", 1, 5, "F");
			quest::setglobal("nocash", 1, 5, "F");
		}
		elsif($i == 6) {
			$i++;
			quest::setglobal("highers", 2, 5, "F");
			$client->Message(14, "Let's continue, is your next card $higher or $lower?");
			quest::setglobal("paid", 1, 5, "F");
			quest::setglobal("nocash", 1, 5, "F");
		}
		elsif($i == 7) {
			$i++;
			quest::setglobal("highers", 2, 5, "F");
			$client->Message(14, "Let's continue, is your next card $higher or $lower?");
			quest::setglobal("paid", 1, 5, "F");
			quest::setglobal("nocash", 1, 5, "F");
		}
		elsif($i == 8) {
			$i++;
			quest::setglobal("highers", 2, 5, "F");
			$client->Message(14, "Let's continue, is your next card $higher or $lower?");
			quest::setglobal("paid", 1, 5, "F");
			quest::setglobal("nocash", 1, 5, "F");
		}
	}
	elsif(($text=~/cash/i) && $nocash == 1) {
			quest::say("I'm sorry, not right now!");
	}
	elsif($text=~/cash/i) {
		if($i == 1){
			quest::say("Congratulations $name. Your payout is 0.6:1.");
			quest::givecash(0, 0, 0, 0.6*$plat);
			$i = 0;
			$plat = 0;
			playerwin;
			quest::ding();
		}
		elsif($i == 2){
			quest::say("Congratulations $name. Your payout is 1.2:1.");
			quest::givecash(0, 0, 0, 1.2*$plat);
			$i = 0;
			$plat = 0;
			playerwin;
			quest::ding();
		}
		elsif($i == 3){
			quest::say("Congratulations $name. Your payout is 1.8:1.");
			quest::givecash(0, 0, 0, 1.8*$plat);
			$i = 0;
			$plat = 0;
			playerwin;
			quest::ding();
		}
		elsif($i == 4){
			quest::say("Congratulations $name. Your payout is 2.4:1.");
			quest::givecash(0, 0, 0, 2.4*$plat);
			$i = 0;
			$plat = 0;
			playerwin;
			quest::ding();
		}
		elsif($i == 5){
			quest::say("Congratulations $name. Your payout is 3:1.");
			quest::givecash(0, 0, 0, 3*$plat);
			$i = 0;
			$plat = 0;
			playerwin;
			quest::ding();
		}
		elsif($i == 6){
			quest::say("Congratulations $name. Your payout is 3.6:1.");
			quest::givecash(0, 0, 0, 3.6*$plat);
			$i = 0;
			$plat = 0;
			playerwin;
			quest::ding();
		}
		elsif($i == 7){
			quest::say("Congratulations $name. Your payout is 4.2:1.");
			quest::givecash(0, 0, 0, 4.2*$plat);
			$i = 0;
			$plat = 0;
			playerwin;
			quest::ding();
		}
		elsif($i == 8){
			quest::say("Congratulations $name. Your payout is 4.8:1.");
			quest::givecash(0, 0, 0, 4.8*$plat);
			$i = 0;
			$plat = 0;
			playerwin;
			quest::ding();
		}
	}
	elsif(($text=~/dice/i) && $paid == 1) {
		#$p++;
		quest::setglobal("cards", 1, 5, "F"); #locks out cards when dice is playing
		quest::setglobal("dices", 2, 5, "F"); #locks out dices so loops wont initialize
		quest::say("Let's play, will the roll be $high, $low, or a $seven?");
	}
	elsif($text=~/high/i) {
		$client->Message(15, "You picked HIGH!");
		$firstroll = 1 + int(rand(6));
		$secondroll = 1 + int(rand(6));
		$totalroll = $firstroll + $secondroll;
		$client->Message(14, "Dealer rolls a [$firstroll] and [$secondroll] for a total of $totalroll.");
		if(($firstroll + $secondroll) > 7) {
			quest::say("Congratulations $name, you guessed right!");
			playerwin;
			quest::ding();
			quest::givecash(0, 0, 0, $plat);
			$plat = 0;
		}
		else {
			quest::say("I'm sorry try again!");
			dealerwin;
		}
	}
	elsif($text=~/low/i) {
		$client->Message(15, "You picked LOW!");
		$firstroll = 1 + int(rand(6));
		$secondroll = 1 + int(rand(6));
		$totalroll = $firstroll + $secondroll;
		$client->Message(14, "Dealer rolls a [$firstroll] and [$secondroll] for a total of $totalroll.");
		if(($firstroll + $secondroll) < 7) {
			quest::say("Congratulations $name, you guessed right!");
			playerwin;
			quest::ding();
			quest::givecash(0, 0, 0, $plat);
			$plat = 0;
		}
		else {
			quest::say("I'm sorry try again!");
			dealerwin;
		}
	}
	elsif($text=~/seven/i) {
		$client->Message(15, "You picked lucky Seven!");
		$firstroll = 1 + int(rand(6));
		$secondroll = 1 + int(rand(6)); 
		$totalroll = $firstroll + $secondroll;
		$client->Message(14, "Dealer rolls a [$firstroll] and [$secondroll] for a total of $totalroll.");
		if(($firstroll + $secondroll) == 7) {
			quest::say("Congratulations $name, you guessed right!");
			playerwin;
			quest::ding();
			quest::givecash(0, 0, 0, 4*$plat);
			$plat = 0;
		}
		else {
			quest::say("I'm sorry try again!");
			dealerwin;
		}
	}
}#END EVENT SAY
sub EVENT_ITEM {
my $card = quest::saylink("card", 1);
my $dice = quest::saylink("dice", 1);
	if(plugin::check_handin(\%itemcount, 10037 => 1)) {
		quest::setglobal("paid", 1, 5, "F"); #makes it so you've paid and can now play
		$plat = 205; #10037 diamond 90 plat 207 plat
		quest::say("Would you like to play the $card variant or $dice of Hi-low?");
	}
	elsif(plugin::check_handin(\%itemcount, 10035 => 1)) {
		quest::setglobal("paid", 1, 5, "F");
		$plat = 127; #10035 ruby 56 plat 129 plat
		quest::say("Would you like to play the $card variant or $dice of Hi-low?");
	}
	elsif(plugin::check_handin(\%itemcount, 10051 => 1)) {
		quest::setglobal("paid", 1, 5, "F");
		$plat = 205; #10051 ruby crown 90 plat 207 plat
		quest::say("Would you like to play the $card variant or $dice of Hi-low?");
	}
	elsif(plugin::check_handin(\%itemcount, 10048 => 1)) {
		quest::setglobal("paid", 1, 5, "F");
		$plat = 127; #10048 star ruby earring 56 plat 129 plat
		quest::say("Would you like to play the $card variant or $dice of Hi-low?");
	}
	elsif(plugin::check_handin(\%itemcount, 10045 => 1)) {
		quest::setglobal("paid", 1, 5, "F");
		$plat = 65; #10045 emerald ring 30 plat 67 plat
		quest::say("Would you like to play the $card variant or $dice of Hi-low?");
	}
	elsif(plugin::check_handin(\%itemcount, 10050 => 1)) {
		quest::setglobal("paid", 1, 5, "F");
		$plat = 179; #10050 sapphire necklace 80 plat 181 plat
		quest::say("Would you like to play the $card variant or $dice of Hi-low?");
	}
	elsif(plugin::check_handin(\%itemcount, 10033 => 1)) {
		quest::setglobal("paid", 1, 5, "F");
		$plat = 86; #10033 fire emerald 39 plat 88 plat
		quest::say("Would you like to play the $card variant or $dice of Hi-low?");
	}
	elsif(plugin::check_handin(\%itemcount, 10032 => 1)) {
		quest::setglobal("paid", 1, 5, "F");
		$plat = 65; #10032 star ruby 29 plat 67 plat
		quest::say("Would you like to play the $card variant or $dice of Hi-low?");
	}
	elsif(plugin::check_handin(\%itemcount, 10034 => 1)) {
		quest::setglobal("paid", 1, 5, "F");
		$plat = 101; #10034 sapphire 45 plat 103 plat
		quest::say("Would you like to play the $card variant or $dice of Hi-low?");
	}
	elsif(plugin::check_handin(\%itemcount, 10036 => 1)) {
		quest::setglobal("paid", 1, 5, "F");
		$plat = 179; #10036 black sapphire 80 plat 181 plat
		quest::say("Would you like to play the $card variant or $dice of Hi-low?");
	}
	else {
		quest::say("I have no use for this.");
		plugin::return_items(\%itemcount);
		if($platinum != 0 || $gold != 0 || $silver != 0 || $copper != 0) {
		quest::givecash($copper, $silver, $gold, $platinum);
		}
	}
}
#END of FILE Zone:Plane of Knowledge ID:202395 -- High_Lowe.pl