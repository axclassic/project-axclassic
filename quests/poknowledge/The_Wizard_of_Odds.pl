#######################################
## NPC: The Wizard of Odds                   
## Zone: Plane of Knowledge    
## Quest: Blackjack Dealer                
## by Patrikpatrik   
## Aug 1st 2015
##This is 14th revision 
##all sequences fitted in 
##all values correctly assigned
##Last updated 8/14/2015
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
	#Firstcard goes to player
	if($firstcard eq "Ace$spades" || $firstcard eq "Ace$hearts" || $firstcard eq "Ace$clubs" || $firstcard eq "Ace$diamonds") {
			$first = 1;
			$myace = 10; #This is to value Aces as 11
			}
		elsif($firstcard eq "2$spades" || $firstcard eq "2$hearts" || $firstcard eq "2$clubs" || $firstcard eq "2$diamonds") {
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
		elsif($firstcard eq "10$spades" || $firstcard eq "10$hearts" || $firstcard eq "10$clubs" || $firstcard eq "10$diamonds" || 
			$firstcard eq "Jack$spades" || $firstcard eq "Jack$hearts" || $firstcard eq "Jack$clubs" || $firstcard eq "Jack$diamonds" ||
			$firstcard eq "Queen$spades" || $firstcard eq "Queen$hearts" || $firstcard eq "Queen$clubs" || $firstcard eq "Queen$diamonds" ||
			$firstcard eq "King$spades" || $firstcard eq "King$hearts" || $firstcard eq "King$clubs" || $firstcard eq "King$diamonds") {
			$first = 10;
			}
}
sub value2{
	#Thirdcard goes to player
		if($thirdcard eq "Ace$spades" || $thirdcard eq "Ace$hearts" || $thirdcard eq "Ace$clubs" || $thirdcard eq "Ace$diamonds") {
			$third = 1;
			$myace = 10; #This is to value Aces as 11
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
sub value3{
	#Secondcard goes to Dealer
		if($secondcard eq "Ace$spades" || $secondcard eq "Ace$hearts" || $secondcard eq "Ace$clubs" || $secondcard eq "Ace$diamonds") {
			$second = 1;
			$dealerace = 10; #This is to value Aces as 11
			}
		elsif($secondcard eq "2$spades" || $secondcard eq "2$hearts" || $secondcard eq "2$clubs" || $secondcard eq "2$diamonds") {
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
		elsif($secondcard eq "10$spades" || $secondcard eq "10$hearts" || $secondcard eq "10$clubs" || $secondcard eq "10$diamonds" || 
			$secondcard eq "Jack$spades" || $secondcard eq "Jack$hearts" || $secondcard eq "Jack$clubs" || $secondcard eq "Jack$diamonds" ||
			$secondcard eq "Queen$spades" || $secondcard eq "Queen$hearts" || $secondcard eq "Queen$clubs" || $secondcard eq "Queen$diamonds" ||
			$secondcard eq "King$spades" || $secondcard eq "King$hearts" || $secondcard eq "King$clubs" || $secondcard eq "King$diamonds") {
			$second = 10;
			}
}
sub value4{
	#Fourthcard goes to Dealer
		if($fourthcard eq "Ace$spades" || $fourthcard eq "Ace$hearts" || $fourthcard eq "Ace$clubs" || $fourthcard eq "Ace$diamonds") {
			$fourth = 1;
			$dealerace = 10; #This is to value Aces as 11
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
#nextcards value 5 to 9
sub value5{
		#Nextcard on players HIT
		if($nextcard eq "Ace$spades" || $nextcard eq "Ace$hearts" || $nextcard eq "Ace$clubs" || $nextcard eq "Ace$diamonds") {
			$next = 1;
			$myace = 10; #This is to value Aces as 11
			}
		elsif($nextcard eq "2$spades" || $nextcard eq "2$hearts" || $nextcard eq "2$clubs" || $nextcard eq "2$diamonds") {
			$next = 2;
			}
		elsif($nextcard eq "3$spades" || $nextcard eq "3$hearts" || $nextcard eq "3$clubs" || $nextcard eq "3$diamonds") {
			$next = 3;
			}
		elsif($nextcard eq "4$spades" || $nextcard eq "4$hearts" || $nextcard eq "4$clubs" || $nextcard eq "4$diamonds") {
			$next = 4;
			}
		elsif($nextcard eq "5$spades" || $nextcard eq "5$hearts" || $nextcard eq "5$clubs" || $nextcard eq "5$diamonds") {
			$next = 5;
			}
		elsif($nextcard eq "6$spades" || $nextcard eq "6$hearts" || $nextcard eq "6$clubs" || $nextcard eq "6$diamonds") {
			$next = 6;
			}
		elsif($nextcard eq "7$spades" || $nextcard eq "7$hearts" || $nextcard eq "7$clubs" || $nextcard eq "7$diamonds") {
			$next = 7;
			}
		elsif($nextcard eq "8$spades" || $nextcard eq "8$hearts" || $nextcard eq "8$clubs" || $nextcard eq "8$diamonds") {
			$next = 8;
			}
		elsif($nextcard eq "9$spades" || $nextcard eq "9$hearts" || $nextcard eq "9$clubs" || $nextcard eq "9$diamonds") {
			$next = 9;
			}
		elsif($nextcard eq "10$spades" || $nextcard eq "10$hearts" || $nextcard eq "10$clubs" || $nextcard eq "10$diamonds" || 
			$nextcard eq "Jack$spades" || $nextcard eq "Jack$hearts" || $nextcard eq "Jack$clubs" || $nextcard eq "Jack$diamonds" ||
			$nextcard eq "Queen$spades" || $nextcard eq "Queen$hearts" || $nextcard eq "Queen$clubs" || $nextcard eq "Queen$diamonds" ||
			$nextcard eq "King$spades" || $nextcard eq "King$hearts" || $nextcard eq "King$clubs" || $nextcard eq "King$diamonds") {
			$next = 10;
			}
}
sub value6{
		if($nextcard2 eq "Ace$spades" || $nextcard2 eq "Ace$hearts" || $nextcard2 eq "Ace$clubs" || $nextcard2 eq "Ace$diamonds") {
			$next2 = 1;
			$myace = 10; #This is to value Aces as 11
			}
		elsif($nextcard2 eq "2$spades" || $nextcard2 eq "2$hearts" || $nextcard2 eq "2$clubs" || $nextcard2 eq "2$diamonds") {
			$next2 = 2;
			}
		elsif($nextcard2 eq "3$spades" || $nextcard2 eq "3$hearts" || $nextcard2 eq "3$clubs" || $nextcard2 eq "3$diamonds") {
			$next2 = 3;
			}
		elsif($nextcard2 eq "4$spades" || $nextcard2 eq "4$hearts" || $nextcard2 eq "4$clubs" || $nextcard2 eq "4$diamonds") {
			$next2 = 4;
			}
		elsif($nextcard2 eq "5$spades" || $nextcard2 eq "5$hearts" || $nextcard2 eq "5$clubs" || $nextcard2 eq "5$diamonds") {
			$next2 = 5;
			}
		elsif($nextcard2 eq "6$spades" || $nextcard2 eq "6$hearts" || $nextcard2 eq "6$clubs" || $nextcard2 eq "6$diamonds") {
			$next2 = 6;
			}
		elsif($nextcard2 eq "7$spades" || $nextcard2 eq "7$hearts" || $nextcard2 eq "7$clubs" || $nextcard2 eq "7$diamonds") {
			$next2 = 7;
			}
		elsif($nextcard2 eq "8$spades" || $nextcard2 eq "8$hearts" || $nextcard2 eq "8$clubs" || $nextcard2 eq "8$diamonds") {
			$next2 = 8;
			}
		elsif($nextcard2 eq "9$spades" || $nextcard2 eq "9$hearts" || $nextcard2 eq "9$clubs" || $nextcard2 eq "9$diamonds") {
			$next2 = 9;
			}
		elsif($nextcard2 eq "10$spades" || $nextcard2 eq "10$hearts" || $nextcard2 eq "10$clubs" || $nextcard2 eq "10$diamonds" || 
			$nextcard2 eq "Jack$spades" || $nextcard2 eq "Jack$hearts" || $nextcard2 eq "Jack$clubs" || $nextcard2 eq "Jack$diamonds" ||
			$nextcard2 eq "Queen$spades" || $nextcard2 eq "Queen$hearts" || $nextcard2 eq "Queen$clubs" || $nextcard2 eq "Queen$diamonds" ||
			$nextcard2 eq "King$spades" || $nextcard2 eq "King$hearts" || $nextcard2 eq "King$clubs" || $nextcard2 eq "King$diamonds") {
			$next2 = 10;
			}
}
sub value7{
		if($nextcard3 eq "Ace$spades" || $nextcard3 eq "Ace$hearts" || $nextcard3 eq "Ace$clubs" || $nextcard3 eq "Ace$diamonds") {
		$next3 = 1;
		$myace = 10; #This is to value Aces as 11
			}
		elsif($nextcard3 eq "2$spades" || $nextcard3 eq "2$hearts" || $nextcard3 eq "2$clubs" || $nextcard3 eq "2$diamonds") {
			$next3 = 2;
			}
		elsif($nextcard3 eq "3$spades" || $nextcard3 eq "3$hearts" || $nextcard3 eq "3$clubs" || $nextcard3 eq "3$diamonds") {
			$next3 = 3;
			}
		elsif($nextcard3 eq "4$spades" || $nextcard3 eq "4$hearts" || $nextcard3 eq "4$clubs" || $nextcard3 eq "4$diamonds") {
			$next3 = 4;
			}
		elsif($nextcard3 eq "5$spades" || $nextcard3 eq "5$hearts" || $nextcard3 eq "5$clubs" || $nextcard3 eq "5$diamonds") {
			$next3 = 5;
			}
		elsif($nextcard3 eq "6$spades" || $nextcard3 eq "6$hearts" || $nextcard3 eq "6$clubs" || $nextcard3 eq "6$diamonds") {
			$next3 = 6;
			}
		elsif($nextcard3 eq "7$spades" || $nextcard3 eq "7$hearts" || $nextcard3 eq "7$clubs" || $nextcard3 eq "7$diamonds") {
			$next3 = 7;
			}
		elsif($nextcard3 eq "8$spades" || $nextcard3 eq "8$hearts" || $nextcard3 eq "8$clubs" || $nextcard3 eq "8$diamonds") {
			$next3 = 8;
			}
		elsif($nextcard3 eq "9$spades" || $nextcard3 eq "9$hearts" || $nextcard3 eq "9$clubs" || $nextcard3 eq "9$diamonds") {
			$next3 = 9;
			}
		elsif($nextcard3 eq "10$spades" || $nextcard3 eq "10$hearts" || $nextcard3 eq "10$clubs" || $nextcard3 eq "10$diamonds" || 
			$nextcard3 eq "Jack$spades" || $nextcard3 eq "Jack$hearts" || $nextcard3 eq "Jack$clubs" || $nextcard3 eq "Jack$diamonds" ||
			$nextcard3 eq "Queen$spades" || $nextcard3 eq "Queen$hearts" || $nextcard3 eq "Queen$clubs" || $nextcard3 eq "Queen$diamonds" ||
			$nextcard3 eq "King$spades" || $nextcard3 eq "King$hearts" || $nextcard3 eq "King$clubs" || $nextcard3 eq "King$diamonds") {
			$next3 = 10;
			}
}
sub value8 {
		if($nextcard4 eq "Ace$spades" || $nextcard4 eq "Ace$hearts" || $nextcard4 eq "Ace$clubs" || $nextcard4 eq "Ace$diamonds") {
		$next4 = 1;
		$myace = 10; #This is to value Aces as 11
			}
		elsif($nextcard4 eq "2$spades" || $nextcard4 eq "2$hearts" || $nextcard4 eq "2$clubs" || $nextcard4 eq "2$diamonds") {
			$next4 = 2;
			}
		elsif($nextcard4 eq "3$spades" || $nextcard4 eq "3$hearts" || $nextcard4 eq "3$clubs" || $nextcard4 eq "3$diamonds") {
			$next4 = 3;
			}
		elsif($nextcard4 eq "4$spades" || $nextcard4 eq "4$hearts" || $nextcard4 eq "4$clubs" || $nextcard4 eq "4$diamonds") {
			$next4 = 4;
			}
		elsif($nextcard4 eq "5$spades" || $nextcard4 eq "5$hearts" || $nextcard4 eq "5$clubs" || $nextcard4 eq "5$diamonds") {
			$next4 = 5;
			}
		elsif($nextcard4 eq "6$spades" || $nextcard4 eq "6$hearts" || $nextcard4 eq "6$clubs" || $nextcard4 eq "6$diamonds") {
			$next4 = 6;
			}
		elsif($nextcard4 eq "7$spades" || $nextcard4 eq "7$hearts" || $nextcard4 eq "7$clubs" || $nextcard4 eq "7$diamonds") {
			$next4 = 7;
			}
		elsif($nextcard4 eq "8$spades" || $nextcard4 eq "8$hearts" || $nextcard4 eq "8$clubs" || $nextcard4 eq "8$diamonds") {
			$next4 = 8;
			}
		elsif($nextcard4 eq "9$spades" || $nextcard4 eq "9$hearts" || $nextcard4 eq "9$clubs" || $nextcard4 eq "9$diamonds") {
			$next4 = 9;
			}
		elsif($nextcard4 eq "10$spades" || $nextcard4 eq "10$hearts" || $nextcard4 eq "10$clubs" || $nextcard4 eq "10$diamonds" || 
			$nextcard4 eq "Jack$spades" || $nextcard4 eq "Jack$hearts" || $nextcard4 eq "Jack$clubs" || $nextcard4 eq "Jack$diamonds" ||
			$nextcard4 eq "Queen$spades" || $nextcard4 eq "Queen$hearts" || $nextcard4 eq "Queen$clubs" || $nextcard4 eq "Queen$diamonds" ||
			$nextcard4 eq "King$spades" || $nextcard4 eq "King$hearts" || $nextcard4 eq "King$clubs" || $nextcard4 eq "King$diamonds") {
			$next4 = 10;
			}
}
sub value9 {
		if($nextcard5 eq "Ace$spades" || $nextcard5 eq "Ace$hearts" || $nextcard5 eq "Ace$clubs" || $nextcard5 eq "Ace$diamonds") {
			$next5 = 1;
			$myace = 10; #This is to value Aces as 11
			}
		elsif($nextcard5 eq "2$spades" || $nextcard5 eq "2$hearts" || $nextcard5 eq "2$clubs" || $nextcard5 eq "2$diamonds") {
			$next5 = 2;
			}
		elsif($nextcard5 eq "3$spades" || $nextcard5 eq "3$hearts" || $nextcard5 eq "3$clubs" || $nextcard5 eq "3$diamonds") {
			$next5 = 3;
			}
		elsif($nextcard5 eq "4$spades" || $nextcard5 eq "4$hearts" || $nextcard5 eq "4$clubs" || $nextcard5 eq "4$diamonds") {
			$next5 = 4;
			}
		elsif($nextcard5 eq "5$spades" || $nextcard5 eq "5$hearts" || $nextcard5 eq "5$clubs" || $nextcard5 eq "5$diamonds") {
			$next5 = 5;
			}
		elsif($nextcard5 eq "6$spades" || $nextcard5 eq "6$hearts" || $nextcard5 eq "6$clubs" || $nextcard5 eq "6$diamonds") {
			$next5 = 6;
			}
		elsif($nextcard5 eq "7$spades" || $nextcard5 eq "7$hearts" || $nextcard5 eq "7$clubs" || $nextcard5 eq "7$diamonds") {
			$next5 = 7;
			}
		elsif($nextcard5 eq "8$spades" || $nextcard5 eq "8$hearts" || $nextcard5 eq "8$clubs" || $nextcard5 eq "8$diamonds") {
			$next5 = 8;
			}
		elsif($nextcard5 eq "9$spades" || $nextcard5 eq "9$hearts" || $nextcard5 eq "9$clubs" || $nextcard5 eq "9$diamonds") {
			$next5 = 9;
			}
		elsif($nextcard5 eq "10$spades" || $nextcard5 eq "10$hearts" || $nextcard5 eq "10$clubs" || $nextcard5 eq "10$diamonds" || 
			$nextcard5 eq "Jack$spades" || $nextcard5 eq "Jack$hearts" || $nextcard5 eq "Jack$clubs" || $nextcard5 eq "Jack$diamonds" ||
			$nextcard5 eq "Queen$spades" || $nextcard5 eq "Queen$hearts" || $nextcard5 eq "Queen$clubs" || $nextcard5 eq "Queen$diamonds" ||
			$nextcard5 eq "King$spades" || $nextcard5 eq "King$hearts" || $nextcard5 eq "King$clubs" || $nextcard5 eq "King$diamonds") {
			$next5 = 10;
			}
}
#Function wins/losses
sub playerwin{
	$client->Message(15, "$name WINS!");
	quest::ding();
	$client->DoAnim(13, 27);
	$alt = "";
	$alt2 = "";
	$mytotals = "";
	$dealertotals = "";
	$i = 0; #This resets the counter once game is over
	$myace = 0; #This resets the ace value so it doesnt repeat on $play
	$dealerace = 0; #This resets the ace value so it doesnt repeat on $play
	quest::givecash(0,0,0, ($platinum*2));
	quest::setglobal("cheat", 0, 5, "F");
	quest::setglobal("hithit", 1, 5, "F");
	quest::setglobal("standstand", 1, 5, "F");
}

sub dealerwin{
	$client->Message(15, "Dealer WINS!");
	$npc->DoAnim(8, 27);
	$alt = "";
	$alt2 = "";
	$mytotals = "";
	$dealertotals = "";
	$i = 0; #This resets the counter once game is over
	$myace = 0; #This resets the ace value so it doesnt repeat on $play
	$dealerace = 0; #This resets the ace value so it doesnt repeat on $play
	quest::setglobal("cheat", 0, 5, "F");
	quest::setglobal("hithit", 1, 5, "F");
	quest::setglobal("standstand", 1, 5, "F");
}
sub pushtie{
	$client->Message(15, "It's a PUSH, or a tie! You get your money back.");
	quest::ding();
	$npc->DoAnim(8, 27);
	$client->DoAnim(13, 27);
	$alt = "";
	$alt2 = "";
	$mytotals = "";
	$dealertotals = "";
	$i = 0; #This resets the counter once game is over
	$myace = 0; #This resets the ace value so it doesnt repeat on $play
	$dealerace = 0; #This resets the ace value so it doesnt repeat on $play
	quest::givecash(0,0,0, $platinum);
	quest::setglobal("cheat", 0, 5, "F");
	quest::setglobal("hithit", 1, 5, "F");
	quest::setglobal("standstand", 1, 5, "F");
}
#dealercards 10 to 17
sub value10 {
		if($dealercard eq "Ace$spades" || $dealercard eq "Ace$hearts" || $dealercard eq "Ace$clubs" || $dealercard eq "Ace$diamonds") {
			$dealer = 1;
			$dealerace = 10; #This is to value Aces as 11
			}
		elsif($dealercard eq "2$spades" || $dealercard eq "2$hearts" || $dealercard eq "2$clubs" || $dealercard eq "2$diamonds") {
			$dealer = 2;
			}
		elsif($dealercard eq "3$spades" || $dealercard eq "3$hearts" || $dealercard eq "3$clubs" || $dealercard eq "3$diamonds") {
			$dealer = 3;
			}
		elsif($dealercard eq "4$spades" || $dealercard eq "4$hearts" || $dealercard eq "4$clubs" || $dealercard eq "4$diamonds") {
			$dealer = 4;
			}
		elsif($dealercard eq "5$spades" || $dealercard eq "5$hearts" || $dealercard eq "5$clubs" || $dealercard eq "5$diamonds") {
			$dealer = 5;
			}
		elsif($dealercard eq "6$spades" || $dealercard eq "6$hearts" || $dealercard eq "6$clubs" || $dealercard eq "6$diamonds") {
			$dealer = 6;
			}
		elsif($dealercard eq "7$spades" || $dealercard eq "7$hearts" || $dealercard eq "7$clubs" || $dealercard eq "7$diamonds") {
			$dealer = 7;
			}
		elsif($dealercard eq "8$spades" || $dealercard eq "8$hearts" || $dealercard eq "8$clubs" || $dealercard eq "8$diamonds") {
			$dealer = 8;
			}
		elsif($dealercard eq "9$spades" || $dealercard eq "9$hearts" || $dealercard eq "9$clubs" || $dealercard eq "9$diamonds") {
			$dealer = 9;
			}
		elsif($dealercard eq "10$spades" || $dealercard eq "10$hearts" || $dealercard eq "10$clubs" || $dealercard eq "10$diamonds" || 
			$dealercard eq "Jack$spades" || $dealercard eq "Jack$hearts" || $dealercard eq "Jack$clubs" || $dealercard eq "Jack$diamonds" ||
			$dealercard eq "Queen$spades" || $dealercard eq "Queen$hearts" || $dealercard eq "Queen$clubs" || $dealercard eq "Queen$diamonds" ||
			$dealercard eq "King$spades" || $dealercard eq "King$hearts" || $dealercard eq "King$clubs" || $dealercard eq "King$diamonds") {
			$dealer = 10;
			}
}
sub value11 {
		if($dealercard2 eq "Ace$spades" || $dealercard2 eq "Ace$hearts" || $dealercard2 eq "Ace$clubs" || $dealercard2 eq "Ace$diamonds") {
			$dealer2 = 1;
			$dealerace = 10; #This is to value Aces as 11
			}
		elsif($dealercard2 eq "2$spades" || $dealercard2 eq "2$hearts" || $dealercard2 eq "2$clubs" || $dealercard2 eq "2$diamonds") {
			$dealer2 = 2;
			}
		elsif($dealercard2 eq "3$spades" || $dealercard2 eq "3$hearts" || $dealercard2 eq "3$clubs" || $dealercard2 eq "3$diamonds") {
			$dealer2 = 3;
			}
		elsif($dealercard2 eq "4$spades" || $dealercard2 eq "4$hearts" || $dealercard2 eq "4$clubs" || $dealercard2 eq "4$diamonds") {
			$dealer2 = 4;
			}
		elsif($dealercard2 eq "5$spades" || $dealercard2 eq "5$hearts" || $dealercard2 eq "5$clubs" || $dealercard2 eq "5$diamonds") {
			$dealer2 = 5;
			}
		elsif($dealercard2 eq "6$spades" || $dealercard2 eq "6$hearts" || $dealercard2 eq "6$clubs" || $dealercard2 eq "6$diamonds") {
			$dealer2 = 6;
			}
		elsif($dealercard2 eq "7$spades" || $dealercard2 eq "7$hearts" || $dealercard2 eq "7$clubs" || $dealercard2 eq "7$diamonds") {
			$dealer2 = 7;
			}
		elsif($dealercard2 eq "8$spades" || $dealercard2 eq "8$hearts" || $dealercard2 eq "8$clubs" || $dealercard2 eq "8$diamonds") {
			$dealer2 = 8;
			}
		elsif($dealercard2 eq "9$spades" || $dealercard2 eq "9$hearts" || $dealercard2 eq "9$clubs" || $dealercard2 eq "9$diamonds") {
			$dealer2 = 9;
			}
		elsif($dealercard2 eq "10$spades" || $dealercard2 eq "10$hearts" || $dealercard2 eq "10$clubs" || $dealercard2 eq "10$diamonds" || 
			$dealercard2 eq "Jack$spades" || $dealercard2 eq "Jack$hearts" || $dealercard2 eq "Jack$clubs" || $dealercard2 eq "Jack$diamonds" ||
			$dealercard2 eq "Queen$spades" || $dealercard2 eq "Queen$hearts" || $dealercard2 eq "Queen$clubs" || $dealercard2 eq "Queen$diamonds" ||
			$dealercard2 eq "King$spades" || $dealercard2 eq "King$hearts" || $dealercard2 eq "King$clubs" || $dealercard2 eq "King$diamonds") {
			$dealer2 = 10;
			}
}
sub value12 {
		if($dealercard3 eq "Ace$spades" || $dealercard3 eq "Ace$hearts" || $dealercard3 eq "Ace$clubs" || $dealercard3 eq "Ace$diamonds") {
			$dealer3 = 1;
			$dealerace = 10; #This is to value Aces as 11
			}
		elsif($dealercard3 eq "2$spades" || $dealercard3 eq "2$hearts" || $dealercard3 eq "2$clubs" || $dealercard3 eq "2$diamonds") {
			$dealer3 = 2;
			}
		elsif($dealercard3 eq "3$spades" || $dealercard3 eq "3$hearts" || $dealercard3 eq "3$clubs" || $dealercard3 eq "3$diamonds") {
			$dealer3 = 3;
			}
		elsif($dealercard3 eq "4$spades" || $dealercard3 eq "4$hearts" || $dealercard3 eq "4$clubs" || $dealercard3 eq "4$diamonds") {
			$dealer3 = 4;
			}
		elsif($dealercard3 eq "5$spades" || $dealercard3 eq "5$hearts" || $dealercard3 eq "5$clubs" || $dealercard3 eq "5$diamonds") {
			$dealer3 = 5;
			}
		elsif($dealercard3 eq "6$spades" || $dealercard3 eq "6$hearts" || $dealercard3 eq "6$clubs" || $dealercard3 eq "6$diamonds") {
			$dealer3 = 6;
			}
		elsif($dealercard3 eq "7$spades" || $dealercard3 eq "7$hearts" || $dealercard3 eq "7$clubs" || $dealercard3 eq "7$diamonds") {
			$dealer3 = 7;
			}
		elsif($dealercard3 eq "8$spades" || $dealercard3 eq "8$hearts" || $dealercard3 eq "8$clubs" || $dealercard3 eq "8$diamonds") {
			$dealer3 = 8;
			}
		elsif($dealercard3 eq "9$spades" || $dealercard3 eq "9$hearts" || $dealercard3 eq "9$clubs" || $dealercard3 eq "9$diamonds") {
			$dealer3 = 9;
			}
		elsif($dealercard3 eq "10$spades" || $dealercard3 eq "10$hearts" || $dealercard3 eq "10$clubs" || $dealercard3 eq "10$diamonds" || 
			$dealercard3 eq "Jack$spades" || $dealercard3 eq "Jack$hearts" || $dealercard3 eq "Jack$clubs" || $dealercard3 eq "Jack$diamonds" ||
			$dealercard3 eq "Queen$spades" || $dealercard3 eq "Queen$hearts" || $dealercard3 eq "Queen$clubs" || $dealercard3 eq "Queen$diamonds" ||
			$dealercard3 eq "King$spades" || $dealercard3 eq "King$hearts" || $dealercard3 eq "King$clubs" || $dealercard3 eq "King$diamonds") {
			$dealer3 = 10;
			}
}
sub value13 {
		if($dealercard4 eq "Ace$spades" || $dealercard4 eq "Ace$hearts" || $dealercard4 eq "Ace$clubs" || $dealercard4 eq "Ace$diamonds") {
			$dealer4 = 1;
			$dealerace = 10; #This is to value Aces as 11
			}
		elsif($dealercard4 eq "2$spades" || $dealercard4 eq "2$hearts" || $dealercard4 eq "2$clubs" || $dealercard4 eq "2$diamonds") {
			$dealer4 = 2;
			}
		elsif($dealercard4 eq "3$spades" || $dealercard4 eq "3$hearts" || $dealercard4 eq "3$clubs" || $dealercard4 eq "3$diamonds") {
			$dealer4 = 3;
			}
		elsif($dealercard4 eq "4$spades" || $dealercard4 eq "4$hearts" || $dealercard4 eq "4$clubs" || $dealercard4 eq "4$diamonds") {
			$dealer4 = 4;
			}
		elsif($dealercard4 eq "5$spades" || $dealercard4 eq "5$hearts" || $dealercard4 eq "5$clubs" || $dealercard4 eq "5$diamonds") {
			$dealer4 = 5;
			}
		elsif($dealercard4 eq "6$spades" || $dealercard4 eq "6$hearts" || $dealercard4 eq "6$clubs" || $dealercard4 eq "6$diamonds") {
			$dealer4 = 6;
			}
		elsif($dealercard4 eq "7$spades" || $dealercard4 eq "7$hearts" || $dealercard4 eq "7$clubs" || $dealercard4 eq "7$diamonds") {
			$dealer4 = 7;
			}
		elsif($dealercard4 eq "8$spades" || $dealercard4 eq "8$hearts" || $dealercard4 eq "8$clubs" || $dealercard4 eq "8$diamonds") {
			$dealer4 = 8;
			}
		elsif($dealercard4 eq "9$spades" || $dealercard4 eq "9$hearts" || $dealercard4 eq "9$clubs" || $dealercard4 eq "9$diamonds") {
			$dealer4 = 9;
			}
		elsif($dealercard4 eq "10$spades" || $dealercard4 eq "10$hearts" || $dealercard4 eq "10$clubs" || $dealercard4 eq "10$diamonds" || 
			$dealercard4 eq "Jack$spades" || $dealercard4 eq "Jack$hearts" || $dealercard4 eq "Jack$clubs" || $dealercard4 eq "Jack$diamonds" ||
			$dealercard4 eq "Queen$spades" || $dealercard4 eq "Queen$hearts" || $dealercard4 eq "Queen$clubs" || $dealercard4 eq "Queen$diamonds" ||
			$dealercard4 eq "King$spades" || $dealercard4 eq "King$hearts" || $dealercard4 eq "King$clubs" || $dealercard4 eq "King$diamonds") {
			$dealer4 = 10;
			}
}
sub value14 {
		if($dealercard5 eq "Ace$spades" || $dealercard5 eq "Ace$hearts" || $dealercard5 eq "Ace$clubs" || $dealercard5 eq "Ace$diamonds") {
			$dealer5 = 1;
			$dealerace = 10; #This is to value Aces as 11
			}
		elsif($dealercard5 eq "2$spades" || $dealercard5 eq "2$hearts" || $dealercard5 eq "2$clubs" || $dealercard5 eq "2$diamonds") {
			$dealer5 = 2;
			}
		elsif($dealercard5 eq "3$spades" || $dealercard5 eq "3$hearts" || $dealercard5 eq "3$clubs" || $dealercard5 eq "3$diamonds") {
			$dealer5 = 3;
			}
		elsif($dealercard5 eq "4$spades" || $dealercard5 eq "4$hearts" || $dealercard5 eq "4$clubs" || $dealercard5 eq "4$diamonds") {
			$dealer5 = 4;
			}
		elsif($dealercard5 eq "5$spades" || $dealercard5 eq "5$hearts" || $dealercard5 eq "5$clubs" || $dealercard5 eq "5$diamonds") {
			$dealer5 = 5;
			}
		elsif($dealercard5 eq "6$spades" || $dealercard5 eq "6$hearts" || $dealercard5 eq "6$clubs" || $dealercard5 eq "6$diamonds") {
			$dealer5 = 6;
			}
		elsif($dealercard5 eq "7$spades" || $dealercard5 eq "7$hearts" || $dealercard5 eq "7$clubs" || $dealercard5 eq "7$diamonds") {
			$dealer5 = 7;
			}
		elsif($dealercard5 eq "8$spades" || $dealercard5 eq "8$hearts" || $dealercard5 eq "8$clubs" || $dealercard5 eq "8$diamonds") {
			$dealer5 = 8;
			}
		elsif($dealercard5 eq "9$spades" || $dealercard5 eq "9$hearts" || $dealercard5 eq "9$clubs" || $dealercard5 eq "9$diamonds") {
			$dealer5 = 9;
			}
		elsif($dealercard5 eq "10$spades" || $dealercard5 eq "10$hearts" || $dealercard5 eq "10$clubs" || $dealercard5 eq "10$diamonds" || 
			$dealercard5 eq "Jack$spades" || $dealercard5 eq "Jack$hearts" || $dealercard5 eq "Jack$clubs" || $dealercard5 eq "Jack$diamonds" ||
			$dealercard5 eq "Queen$spades" || $dealercard5 eq "Queen$hearts" || $dealercard5 eq "Queen$clubs" || $dealercard5 eq "Queen$diamonds" ||
			$dealercard5 eq "King$spades" || $dealercard5 eq "King$hearts" || $dealercard5 eq "King$clubs" || $dealercard5 eq "King$diamonds") {
			$dealer5 = 10;
			}
}
sub value15 {
		if($dealercard6 eq "Ace$spades" || $dealercard6 eq "Ace$hearts" || $dealercard6 eq "Ace$clubs" || $dealercard6 eq "Ace$diamonds") {
			$dealer6 = 1;
			$dealerace = 10; #This is to value Aces as 11
			}
		elsif($dealercard6 eq "2$spades" || $dealercard6 eq "2$hearts" || $dealercard6 eq "2$clubs" || $dealercard6 eq "2$diamonds") {
			$dealer6 = 2;
			}
		elsif($dealercard6 eq "3$spades" || $dealercard6 eq "3$hearts" || $dealercard6 eq "3$clubs" || $dealercard6 eq "3$diamonds") {
			$dealer6 = 3;
			}
		elsif($dealercard6 eq "4$spades" || $dealercard6 eq "4$hearts" || $dealercard6 eq "4$clubs" || $dealercard6 eq "4$diamonds") {
			$dealer6 = 4;
			}
		elsif($dealercard6 eq "5$spades" || $dealercard6 eq "5$hearts" || $dealercard6 eq "5$clubs" || $dealercard6 eq "5$diamonds") {
			$dealer6 = 5;
			}
		elsif($dealercard6 eq "6$spades" || $dealercard6 eq "6$hearts" || $dealercard6 eq "6$clubs" || $dealercard6 eq "6$diamonds") {
			$dealer6 = 6;
			}
		elsif($dealercard6 eq "7$spades" || $dealercard6 eq "7$hearts" || $dealercard6 eq "7$clubs" || $dealercard6 eq "7$diamonds") {
			$dealer6 = 7;
			}
		elsif($dealercard6 eq "8$spades" || $dealercard6 eq "8$hearts" || $dealercard6 eq "8$clubs" || $dealercard6 eq "8$diamonds") {
			$dealer6 = 8;
			}
		elsif($dealercard6 eq "9$spades" || $dealercard6 eq "9$hearts" || $dealercard6 eq "9$clubs" || $dealercard6 eq "9$diamonds") {
			$dealer6 = 9;
			}
		elsif($dealercard6 eq "10$spades" || $dealercard6 eq "10$hearts" || $dealercard6 eq "10$clubs" || $dealercard6 eq "10$diamonds" || 
			$dealercard6 eq "Jack$spades" || $dealercard6 eq "Jack$hearts" || $dealercard6 eq "Jack$clubs" || $dealercard6 eq "Jack$diamonds" ||
			$dealercard6 eq "Queen$spades" || $dealercard6 eq "Queen$hearts" || $dealercard6 eq "Queen$clubs" || $dealercard6 eq "Queen$diamonds" ||
			$dealercard6 eq "King$spades" || $dealercard6 eq "King$hearts" || $dealercard6 eq "King$clubs" || $dealercard6 eq "King$diamonds") {
			$dealer6 = 10;
			}
}	
sub value16{
		if($dealercard7 eq "Ace$spades" || $dealercard7 eq "Ace$hearts" || $dealercard7 eq "Ace$clubs" || $dealercard7 eq "Ace$diamonds") {
			$dealer7 = 1;
			$dealerace = 10; #This is to value Aces as 11
			}
		elsif($dealercard7 eq "2$spades" || $dealercard7 eq "2$hearts" || $dealercard7 eq "2$clubs" || $dealercard7 eq "2$diamonds") {
			$dealer7 = 2;
			}
		elsif($dealercard7 eq "3$spades" || $dealercard7 eq "3$hearts" || $dealercard7 eq "3$clubs" || $dealercard7 eq "3$diamonds") {
			$dealer7 = 3;
			}
		elsif($dealercard7 eq "4$spades" || $dealercard7 eq "4$hearts" || $dealercard7 eq "4$clubs" || $dealercard7 eq "4$diamonds") {
			$dealer7 = 4;
			}
		elsif($dealercard7 eq "5$spades" || $dealercard7 eq "5$hearts" || $dealercard7 eq "5$clubs" || $dealercard7 eq "5$diamonds") {
			$dealer7 = 5;
			}
		elsif($dealercard7 eq "6$spades" || $dealercard7 eq "6$hearts" || $dealercard7 eq "6$clubs" || $dealercard7 eq "6$diamonds") {
			$dealer7 = 6;
			}
		elsif($dealercard7 eq "7$spades" || $dealercard7 eq "7$hearts" || $dealercard7 eq "7$clubs" || $dealercard7 eq "7$diamonds") {
			$dealer7 = 7;
			}
		elsif($dealercard7 eq "8$spades" || $dealercard7 eq "8$hearts" || $dealercard7 eq "8$clubs" || $dealercard7 eq "8$diamonds") {
			$dealer7 = 8;
			}
		elsif($dealercard7 eq "9$spades" || $dealercard7 eq "9$hearts" || $dealercard7 eq "9$clubs" || $dealercard7 eq "9$diamonds") {
			$dealer7 = 9;
			}
		elsif($dealercard7 eq "10$spades" || $dealercard7 eq "10$hearts" || $dealercard7 eq "10$clubs" || $dealercard7 eq "10$diamonds" || 
			$dealercard7 eq "Jack$spades" || $dealercard7 eq "Jack$hearts" || $dealercard7 eq "Jack$clubs" || $dealercard7 eq "Jack$diamonds" ||
			$dealercard7 eq "Queen$spades" || $dealercard7 eq "Queen$hearts" || $dealercard7 eq "Queen$clubs" || $dealercard7 eq "Queen$diamonds" ||
			$dealercard7 eq "King$spades" || $dealercard7 eq "King$hearts" || $dealercard7 eq "King$clubs" || $dealercard7 eq "King$diamonds") {
			$dealer7 = 10;
			}
}
sub value17{
		if($dealercard8 eq "Ace$spades" || $dealercard8 eq "Ace$hearts" || $dealercard8 eq "Ace$clubs" || $dealercard8 eq "Ace$diamonds") {
			$dealer8 = 1;
			$dealerace = 10; #This is to value Aces as 11
			}
		elsif($dealercard8 eq "2$spades" || $dealercard8 eq "2$hearts" || $dealercard8 eq "2$clubs" || $dealercard8 eq "2$diamonds") {
			$dealer8 = 2;
			}
		elsif($dealercard8 eq "3$spades" || $dealercard8 eq "3$hearts" || $dealercard8 eq "3$clubs" || $dealercard8 eq "3$diamonds") {
			$dealer8 = 3;
			}
		elsif($dealercard8 eq "4$spades" || $dealercard8 eq "4$hearts" || $dealercard8 eq "4$clubs" || $dealercard8 eq "4$diamonds") {
			$dealer8 = 4;
			}
		elsif($dealercard8 eq "5$spades" || $dealercard8 eq "5$hearts" || $dealercard8 eq "5$clubs" || $dealercard8 eq "5$diamonds") {
			$dealer8 = 5;
			}
		elsif($dealercard8 eq "6$spades" || $dealercard8 eq "6$hearts" || $dealercard8 eq "6$clubs" || $dealercard8 eq "6$diamonds") {
			$dealer8 = 6;
			}
		elsif($dealercard8 eq "7$spades" || $dealercard8 eq "7$hearts" || $dealercard8 eq "7$clubs" || $dealercard8 eq "7$diamonds") {
			$dealer8 = 7;
			}
		elsif($dealercard8 eq "8$spades" || $dealercard8 eq "8$hearts" || $dealercard8 eq "8$clubs" || $dealercard8 eq "8$diamonds") {
			$dealer8 = 8;
			}
		elsif($dealercard8 eq "9$spades" || $dealercard8 eq "9$hearts" || $dealercard8 eq "9$clubs" || $dealercard8 eq "9$diamonds") {
			$dealer8 = 9;
			}
		elsif($dealercard8 eq "10$spades" || $dealercard8 eq "10$hearts" || $dealercard8 eq "10$clubs" || $dealercard8 eq "10$diamonds" || 
			$dealercard8 eq "Jack$spades" || $dealercard8 eq "Jack$hearts" || $dealercard8 eq "Jack$clubs" || $dealercard8 eq "Jack$diamonds" ||
			$dealercard8 eq "Queen$spades" || $dealercard8 eq "Queen$hearts" || $dealercard8 eq "Queen$clubs" || $dealercard8 eq "Queen$diamonds" ||
			$dealercard8 eq "King$spades" || $dealercard8 eq "King$hearts" || $dealercard8 eq "King$clubs" || $dealercard8 eq "King$diamonds") {
			$dealer8 = 10;
			}
}
	
sub EVENT_SPAWN {
	$x = $npc->GetX();
	$y = $npc->GetY();
	quest::set_proximity($x - 20, $x + 20, $y - 20, $y + 20);
	}
sub EVENT_ENTER {
	$npc->SetAppearance(1);
	quest::say("I am the Wizard of Odds!");
	}
sub EVENT_EXIT {
	$npc->SetAppearance(0);
	quest::say("Come back again!");
	}

sub EVENT_SAY {

my $hit = quest::saylink("hit", 1);
my $stand = quest::saylink("stand", 1);
my $rules = quest::saylink("rules", 1);
my $play = quest::saylink("play", 1);
my $shuffle = quest::saylink("shuffle", 1);


	if($text=~/Hail/i) {
		quest::say("Hail $name. Welcome to Blackjack. Do you want to $play? Or would you like the $rules?");
	}
	elsif($text=~/rules/i) {
		quest::say("The object of the game is to achieve a hand whose total points nearest to 21 than that of the dealer wins. If you go over 21, it is called
		a bust and the dealer wins. Points are scored from 2 to 9 respectively with 10 and face cards worth 10 points and Ace being worth 1 or 11 points. If you have a 10 point card with
		an Ace in your starting hand, it is called a natural 21 or 'Blackjack' and it pays 3 to 2. Lastly, dealers must draw to 17. Ready to $play?");
	}
	elsif(($text=~/play/i) && ($cheat == 0)) {
		quest::say("The minimum bet to play is 50 platinum pieces or a maximum bet of 1000 platinum pieces.");
	}
	elsif(($text=~/play/i) && ($cheat == 2)) {
		quest::say("We're already playing, let us continue.");
	}
	elsif(($text=~/hit/i) && ($hithit == 1)) {
		quest::say("You cannot hit at this point.");
	}
	elsif(($text=~/stand/i) && ($standstand == 1)){
		quest::say("I'm sorry but you cannot stand right now.");
	}
	elsif(($text=~/play/i) && ($cheat == 1)) {
		quest::setglobal("cheat", 2, 5, "F"); #if player decides to $play at any time, loops wont initialize
		shuffle ( \@truedeck ); #shuffles
		@onedeck = @truedeck;
		$firstcard = splice(@onedeck, int(rand(52)), 1); #int(rand(52)) and decrease increments as you go down
		$secondcard = splice(@onedeck, int(rand(51)), 1); #int(rand(51)) etc
		$thirdcard = splice(@onedeck, int(rand(50)), 1);
		$fourthcard = splice(@onedeck, int(rand(49)), 1);
		
		#Assigns values here
		value1;
		value2;
		value3;
		value4;
		#Aces function
		if($myace == '10' && $dealerace == '10') {
		$alt = " or ";
		$alt2 = " or ";
		$mytotals = $first + $third + 10;
		$dealertotals = $second + $fourth + 10;
		}
		elsif($myace == '10') {
		$alt = " or ";
		$mytotals = $first + $third + 10;
		}
		elsif($dealerace == '10') {
		$alt2 = " or ";
		$dealertotals = $second + $fourth + 10;
		}
		else{
		$alt = "";
		$alt2 = "";
		$mytotals = "";
		$dealertotals = "";
		}
	
		$mytotal = $first + $third;
		$dealertotal = $second + $fourth;
		
		#If both gets blackjack
		if($dealertotals == '21' && $mytotals == '21'){
			$client->Message(14, "Your hand is [$firstcard][$thirdcard] for a total of $mytotals.");
			$client->Message(14, "Dealer reveals [$secondcard][$fourthcard] for a total of $dealertotals.");
			pushtie;
			}
		#This interprets blackjack for dealer 1st
		elsif($dealertotals == '21') {
			$client->Message(14, "Your hand is [$firstcard][$thirdcard] for a total of $mytotal$alt$mytotals.");
			$client->Message(14, "Dealer reveals [$secondcard][$fourthcard] and HITS Blackjack!");
			dealerwin;
			}
		#Then player
		elsif($mytotals == '21') {
			$client->Message(14, "Your hand is [$firstcard][$thirdcard] for a total of $mytotals and HIT Blackjack!");
			$client->Message(15, "Dealer reveals [$secondcard][$fourthcard].");
			$client->Message(15, "$name WINS!");
			quest::ding();
			$client->DoAnim(13, 27);
			$alt = "";
			$alt2 = "";
			$mytotals = "";
			$dealertotals = "";
			$i = 0; #This resets the counter once game is over
			$myace = 0; #This resets the ace value so it doesnt repeat on $play
			$dealerace = 0; #This resets the ace value so it doesnt repeat on $play
			quest::givecash(0,0,0, (($platinum/2)*3));
			quest::setglobal("cheat", 0, 5, "F");
			quest::setglobal("hithit", 1, 5, "F");
			quest::setglobal("standstand", 1, 5, "F");
			}
		else{
		#If none of those 21 or pushes are met, game continues as normal
		$client->Message(14, "Your hand is [$firstcard][$thirdcard] for a total of $mytotal$alt$mytotals.");
		$client->Message(14, "Dealer reveals the top card as [$fourthcard]. Would you like to $hit or $stand?");
			}
	} #END play
	elsif($text=~/hit/i) {
		$i++;
		#Assigning values for players next card
		if($i == 1) {
			$nextcard = splice(@onedeck, 4, 1);
			value5;
			#Aces function
			if($myace == '10') {
			$alt = " or ";
			$mytotals = $first + $third + $next + 10;
			}
			else{
			$alt = "";
			$mytotals = "";
			}
			$mytotal = $first + $third + $next; #players total ONLY
		
			#Starts checking process for bust or continue sequence
			if($mytotals > 21 && $mytotal < 22) { #Use lower value if higher value is greater than 21
				$client->Message(15, "You HIT!");
				$client->Message(14, "Your next card is [$nextcard] for a total of $mytotal. Would you like to $hit or $stand?");
			}
			elsif($mytotal > 21) {
				$alt = "";
				$mytotals = "";
				$client->Message(15, "You HIT!");
				$client->Message(14, "Your next card is [$nextcard] for a total of $mytotal$alt$mytotals and BUST!");
				dealerwin;
			}
			else{
			$client->Message(15, "You HIT!");
			$client->Message(14, "Your next card is [$nextcard] for a total of $mytotal$alt$mytotals. Would you like to $hit or $stand?");
			}
		}
		elsif($i == 2) {
			$nextcard2 = splice(@onedeck, 0, 1);
			value6;
			#Aces function
			if($myace == '10') {
			$alt = " or ";
			$mytotals = $first + $third + $next + $next2 + 10;
			}
			else{
			$alt = "";
			$mytotals = "";
			}
			$mytotal = $first + $third + $next + $next2;
			
			#Starts checking process for bust or continue sequence
			if($mytotals > 21 && $mytotal < 22) { #Use lower value if higher value is greater than 21
				$client->Message(15, "You HIT!");
				$client->Message(14, "Your next card is [$nextcard2] for a total of $mytotal. Would you like to $hit or $stand?");
			}
			elsif($mytotal > 21) {
				$alt = "";
				$mytotals = "";
				$client->Message(15, "You HIT!");
				$client->Message(14, "Your next card is [$nextcard2] for a total of $mytotal$alt$mytotals and BUST!");
				dealerwin;
			}
			else{
			$client->Message(15, "You HIT!");
			$client->Message(14, "Your next card is [$nextcard2] for a total of $mytotal$alt$mytotals. Would you like to $hit or $stand?");
			}
		}
		elsif($i == 3) {
			$nextcard3 = splice(@onedeck, 3, 1);
			value7;
			#Aces function
			if($myace == '10') {
			$alt = " or ";
			$mytotals = $first + $third + $next + $next2 + $next3 + 10;
			}
			else{
			$alt = "";
			$mytotals = "";
			}
			$mytotal = $first + $third + $next + $next2 + $next3;
		
			#Starts checking process for bust or continue sequence
			if($mytotals > 21 && $mytotal < 22) { #Use lower value if higher value is greater than 21
				$client->Message(15, "You HIT!");
				$client->Message(14, "Your next card is [$nextcard3] for a total of $mytotal. Would you like to $hit or $stand?");
			}
			elsif($mytotal > 21) {
				$alt = "";
				$mytotals = "";
				$client->Message(15, "You HIT!");
				$client->Message(14, "Your next card is [$nextcard3] for a total of $mytotal$alt$mytotals and BUST!");
				dealerwin;
			}
			else{
			$client->Message(15, "You HIT!");
			$client->Message(14, "Your next card is [$nextcard3] for a total of $mytotal$alt$mytotals. Would you like to $hit or $stand?");
			}
		}
		elsif($i == 4) {
			$nextcard4 = splice(@onedeck, 38, 1);
			value8;
			#Aces function
			if($myace == '10') {
			$alt = " or ";
			$mytotals = $first + $third + $next + $next2 + $next3 + $next4 + 10;
			}
			else{
			$alt = "";
			$mytotals = "";
			}
			$mytotal = $first + $third + $next + $next2 + $next3 + $next4;
			
			#Starts checking process for bust or continue sequence
			if($mytotals > 21 && $mytotal < 22) { #Use lower value if higher value is greater than 21
				$client->Message(15, "You HIT!");
				$client->Message(14, "Your next card is [$nextcard4] for a total of $mytotal. Would you like to $hit or $stand?");
			}
			elsif($mytotal > 21) {
				$alt = "";
				$mytotals = "";
				$client->Message(15, "You HIT!");
				$client->Message(14, "Your next card is [$nextcard4] for a total of $mytotal$alt$mytotals and BUST!");
				dealerwin;
			}
			else{
				$client->Message(15, "You HIT!");
				$client->Message(14, "Your next card is [$nextcard4] for a total of $mytotal$alt$mytotals. Would you like to $hit or $stand?");
			}
		}
		elsif($i == 5) {
			$nextcard5 = splice(@onedeck, 5, 1); #int(rand(49-$i))
			value9;
			#Aces function
			if($myace == '10') {
			$alt = " or ";
			$mytotals = $first + $third + $next + $next2 + $next3 + $next4 + $next5 + 10;
			}
			else{
			$alt = "";
			$mytotals = "";
			}
			$mytotal = $first + $third + $next + $next2 + $next3 + $next4 + $next5;
			
			#Starts checking process for bust or continue sequence
			if($mytotal > 21) {
				$alt = "";
				$mytotals = "";
				$client->Message(15, "You HIT!");
				$client->Message(14, "Your next card is [$nextcard5] for a total of $mytotal$alt$mytotals and BUST!");
				$client->Message(15, "Dealer reveals [$secondcard][$fourthcard]. Dealer WINS!");
				dealerwin;
			}
			else{
				$client->Message(15, "You HIT!");
				$client->Message(14, "You've managed to hit 5 times without busting and is called a 'Five-card Charlie' rule. You automatically WIN!");
				$client->Message(15, "Dealer reveals [$secondcard][$fourthcard].");
				playerwin;
			}
		}
	} #END hit	
	elsif($text=~/stand/i) { #once stand, you cannot hit again remember to prevent this
		$client->Message(15, "You STAND!");
		#Dealer's totals and ace checking in hands have already been declared in hit section
		if($dealertotals > 16){ #Dealer must stand and compare when ace in hand, higher value
			$client->Message(14, "Dealer reveals [$secondcard][$fourthcard] for a total of $dealertotals and must STAND.");
			if($mytotals != '0') { #This means if its not zero then player must have an ace.
				if($dealertotals > $mytotals) {
					dealerwin;
				}
				elsif($dealertotals < $mytotals ) {
					playerwin;
				}
				else {
					pushtie;
				}
			}
			elsif($dealertotals > $mytotal) { #Otherwise if player has no ace in hand
				dealerwin;
				}
			elsif($dealertotals < $mytotal) { #problem here is that if tied it goes here
				playerwin;
				}
			else {
				pushtie;
				}
		}
		elsif($dealertotal > 16) {
			$client->Message(14, "Dealer reveals [$secondcard][$fourthcard] for a total of $dealertotal and must STAND.");
			if($mytotals != '0') {
				if($dealertotal > $mytotals) {
					dealerwin;
				}
				elsif($dealertotal < $mytotals ) {
					playerwin;
				}
				else {
					pushtie;
				}
			}
			elsif($dealertotal > $mytotal) {
				dealerwin;
			}
			elsif($dealertotal < $mytotal) {
				playerwin;
			}
			else {
				pushtie;
				}
		}
		else{
			$client->Message(14, "Dealer reveals [$secondcard][$fourthcard] for a total of $dealertotal$alt2$dealertotals and must HIT!");
			#dealercard 1st sequence goes here!
			$i++;
			$dealercard = splice(@onedeck, int(rand(49-$i)), 1);
			value10;
			$dealertotal = $second + $fourth + $dealer;
			$dealertotals = $second + $fourth + $dealer + 10;
			
			if($dealerace == '10' && $dealertotals < 22) {
				$alt2 = " or ";
				$dealertotals = $second + $fourth + $dealer + 10;
			}
			elsif($dealerace == '10') { 
				$alt2 = "";
				$dealertotals = "";
			}
			else{ 
				$alt2 = "";
				$dealertotals = "";
			}
			
			if($dealertotal > 21) {
				$client->Message(14, "Dealer reveals his next card [$dealercard] for a total of $dealertotal and BUSTS!");
				playerwin;
			}
			elsif($dealertotals > 16){
				$client->Message(14, "Dealer reveals his next card [$dealercard] for a total of $dealertotals and must STAND.");
				if($mytotals != '0') {
					if($dealertotals > $mytotals) {
						dealerwin;
					}
					elsif($dealertotals < $mytotals ) {
						playerwin;
					}
					else {
						pushtie;
					}
				}
				elsif($dealertotals > $mytotal) {
					dealerwin;
				}
				elsif($dealertotals < $mytotal) {
					playerwin;
				}
				else {
					pushtie;
				}
			}
			elsif($dealertotal > 16) {
				$client->Message(14, "Dealer reveals his next card [$dealercard] for a total of $dealertotal and must STAND.");
				if($mytotals != '0') {
					if($dealertotal > $mytotals) {
						dealerwin;
					}
					elsif($dealertotal < $mytotals ) {
						playerwin;
					}
					else {
						pushtie;
					}
				}
				elsif($dealertotal > $mytotal) {
					dealerwin;
				}
				elsif($dealertotal < $mytotal) {
					playerwin;
				}
				else {
					pushtie;
					}
			}#END NO ACES IN HAND SECTION
			else{
				$client->Message(14, "Dealer reveals his next hand [$dealercard] for a total of $dealertotal$alt2$dealertotals and must HIT!");
				$i++;
				$dealercard2 = splice(@onedeck, int(rand(49-$i)), 1);
				value11;
				$dealertotal = $second + $fourth + $dealer + $dealer2;
				$dealertotals = $second + $fourth + $dealer + $dealer2 + 10;
				
				if($dealerace == '10' && $dealertotals < 22) {
					$alt2 = " or ";
					$dealertotals = $second + $fourth + $dealer + $dealer2 + 10;
				}
				elsif($dealerace == '10') { 
					$alt2 = "";
					$dealertotals = "";
				}
				else{ 
					$alt2 = "";
					$dealertotals = "";
				}
				
				if($dealertotal > 21) {
					$client->Message(14, "Dealer reveals his next card [$dealercard2] for a total of $dealertotal and BUSTS!");
					playerwin;
				}
				elsif($dealertotals > 16){
					$client->Message(14, "Dealer reveals his next card [$dealercard2] for a total of $dealertotals and must STAND.");
					if($mytotals != '0') {
						if($dealertotals > $mytotals) {
							dealerwin;
						}
						elsif($dealertotals < $mytotals ) {
							playerwin;
						}
						else {
							pushtie;
						}
					}
					elsif($dealertotals > $mytotal) {
						dealerwin;
					}
					elsif($dealertotals < $mytotal) {
						playerwin;
					}
					else {
						pushtie;
					}
				}
				elsif($dealertotal > 16) {
					$client->Message(14, "Dealer reveals his next card [$dealercard2] for a total of $dealertotal and must STAND.");
					if($mytotals != '0') {
						if($dealertotal > $mytotals) {
							dealerwin;
						}
						elsif($dealertotal < $mytotals ) {
							playerwin;
						}
						else {
							pushtie;
						}
					}
					elsif($dealertotal > $mytotal) {
						dealerwin;
					}
					elsif($dealertotal < $mytotal) {
						playerwin;
					}
					else {
						pushtie;
						}
				}
				else{
					$client->Message(14, "Dealer reveals his next hand [$dealercard2] for a total of $dealertotal$alt2$dealertotals and must HIT!");
					$i++;
					$dealercard3 = splice(@onedeck, int(rand(49-$i)), 1);
					value12;
					$dealertotal = $second + $fourth + $dealer + $dealer2 + $dealer3;
					$dealertotals = $second + $fourth + $dealer + $dealer2 + $dealer3 + 10;
					
					if($dealerace == '10' && $dealertotals < 22) {
						$alt2 = " or ";
						$dealertotals = $second + $fourth + $dealer + $dealer2 + $dealer3 + 10;
					}
					elsif($dealerace == '10') { 
						$alt2 = "";
						$dealertotals = "";
					}
					else{ 
						$alt2 = "";
						$dealertotals = "";
					}
					
					if($dealertotal > 21) {
						$client->Message(14, "Dealer reveals his next card [$dealercard3] for a total of $dealertotal and BUSTS!");
						playerwin;
					}
					elsif($dealertotals > 16){
						$client->Message(14, "Dealer reveals his next card [$dealercard3] for a total of $dealertotals and must STAND.");
						if($mytotals != '0') {
							if($dealertotals > $mytotals) {
								dealerwin;
							}
							elsif($dealertotals < $mytotals ) {
								playerwin;
							}
							else {
								pushtie;
							}
						}
						elsif($dealertotals > $mytotal) {
							dealerwin;
						}
						elsif($dealertotals < $mytotal) {
							playerwin;
						}
						else {
							pushtie;
						}
					}
					elsif($dealertotal > 16) {
						$client->Message(14, "Dealer reveals his next card [$dealercard3] for a total of $dealertotal and must STAND.");
						if($mytotals != '0') {
							if($dealertotal > $mytotals) {
								dealerwin;
							}
							elsif($dealertotal < $mytotals ) {
								playerwin;
							}
							else {
								pushtie;
							}
						}
						elsif($dealertotal > $mytotal) {
							dealerwin;
						}
						elsif($dealertotal < $mytotal) {
							playerwin;
						}
						else {
							pushtie;
							}
					}
					else {
						$client->Message(14, "Dealer reveals his next hand [$dealercard3] for a total of $dealertotal$alt2$dealertotals and must HIT!");
						$i++;
						$dealercard4 = splice(@onedeck, int(rand(49-$i)), 1);
						$dealertotal = $second + $fourth + $dealer + $dealer2 + $dealer3 + $dealer4;
						$dealertotals = $second + $fourth + $dealer + $dealer2 + $dealer3 + $dealer4 + 10;
						
						if($dealerace == '10' && $dealertotals < 22) {
							$alt2 = " or ";
							$dealertotals = $second + $fourth + $dealer + $dealer2 + $dealer3 + $dealer4 + 10;
						}
						elsif($dealerace == '10') { 
							$alt2 = "";
							$dealertotals = "";
						}
						else{ 
							$alt2 = "";
							$dealertotals = "";
						}
						
						if($dealertotal > 21) {
							$client->Message(14, "Dealer reveals his next card [$dealercard4] for a total of $dealertotal and BUSTS!");
							playerwin;
						}
						elsif($dealertotals > 16){
							$client->Message(14, "Dealer reveals his next card [$dealercard4] for a total of $dealertotals and must STAND.");
							if($mytotals != '0') {
								if($dealertotals > $mytotals) {
									dealerwin;
								}
								elsif($dealertotals < $mytotals ) {
									playerwin;
								}
								else {
									pushtie;
								}
							}
							elsif($dealertotals > $mytotal) {
								dealerwin;
							}
							elsif($dealertotals < $mytotal) {
								playerwin;
							}
							else {
								pushtie;
							}
						}
						elsif($dealertotal > 16) {
							$client->Message(14, "Dealer reveals his next card [$dealercard4] for a total of $dealertotal and must STAND.");
							if($mytotals != '0') {
								if($dealertotal > $mytotals) {
									dealerwin;
								}
								elsif($dealertotal < $mytotals ) {
									playerwin;
								}
								else {
									pushtie;
								}
							}
							elsif($dealertotal > $mytotal) {
								dealerwin;
							}
							elsif($dealertotal < $mytotal) {
								playerwin;
							}
							else {
								pushtie;
								}
						}
						else{
							$client->Message(14, "Dealer reveals his next hand [$dealercard4] for a total of $dealertotal$alt2$dealertotals and must HIT!");
							$i++;
							$dealercard5 = splice(@onedeck, int(rand(49-$i)), 1);
							value14;
							$dealertotal = $second + $fourth + $dealer + $dealer2 + $dealer3 + $dealer4 + $dealer5;
							$dealertotals = $second + $fourth + $dealer + $dealer2 + $dealer3 + $dealer4 + $dealer5 + 10;
							
							if($dealerace == '10' && $dealertotals < 22) {
								$alt2 = " or ";
								$dealertotals = $second + $fourth + $dealer + $dealer2 + $dealer3 + $dealer4 + $dealer5 + 10;
							}
							elsif($dealerace == '10') { 
								$alt2 = "";
								$dealertotals = "";
							}
							else{ 
								$alt2 = "";
								$dealertotals = "";
							}
							
							if($dealertotal > 21) {
								$client->Message(14, "Dealer reveals his next card [$dealercard5] for a total of $dealertotal and BUSTS!");
								playerwin;
							}
							elsif($dealertotals > 16){
								$client->Message(14, "Dealer reveals his next card [$dealercard5] for a total of $dealertotals and must STAND.");
								if($mytotals != '0') {
									if($dealertotals > $mytotals) {
										dealerwin;
									}
									elsif($dealertotals < $mytotals ) {
										playerwin;
									}
									else {
										pushtie;
									}
								}
								elsif($dealertotals > $mytotal) {
									dealerwin;
								}
								elsif($dealertotals < $mytotal) {
									playerwin;
								}
								else {
									pushtie;
								}
							}
							elsif($dealertotal > 16) {
								$client->Message(14, "Dealer reveals his next card [$dealercard5] for a total of $dealertotal and must STAND.");
								if($mytotals != '0') {
									if($dealertotal > $mytotals) {
										dealerwin;
									}
									elsif($dealertotal < $mytotals ) {
										playerwin;
									}
									else {
										pushtie;
									}
								}
								elsif($dealertotal > $mytotal) {
									dealerwin;
								}
								elsif($dealertotal < $mytotal) {
									playerwin;
								}
								else {
									pushtie;
									}
							}
							else{
								$client->Message(14, "Dealer reveals his next hand [$dealercard5] for a total of $dealertotal$alt2$dealertotals and must HIT!");
							
								$i++;
								$dealercard6 = splice(@onedeck, int(rand(49-$i)), 1);
								value15;
								$dealertotal = $second + $fourth + $dealer + $dealer2 + $dealer3 + $dealer4 + $dealer5 + $dealer6;
								$dealertotals = $second + $fourth + $dealer + $dealer2 + $dealer3 + $dealer4 + $dealer5 + $dealer6 + 10;
								
								if($dealerace == '10' && $dealertotals < 22) {
									$alt2 = " or ";
									$dealertotals = $second + $fourth + $dealer + $dealer2 + $dealer3 + $dealer4 + $dealer5 + $dealer6 + 10;
								}
								elsif($dealerace == '10') { 
									$alt2 = "";
									$dealertotals = "";
								}
								else{ 
									$alt2 = "";
									$dealertotals = "";
								}
							
								if($dealertotal > 21) {
									$client->Message(14, "Dealer reveals his next card [$dealercard6] for a total of $dealertotal and BUSTS!");
									playerwin;
								}
								elsif($dealertotals > 16){
									$client->Message(14, "Dealer reveals his next card [$dealercard6] for a total of $dealertotals and must STAND. OK!");
									if($mytotals != '0') {
										if($dealertotals > $mytotals) {
											dealerwin;
										}
										elsif($dealertotals < $mytotals ) {
											playerwin;
										}
										else {
											pushtie;
										}
									}
									elsif($dealertotals > $mytotal) {
										dealerwin;
									}
									elsif($dealertotals < $mytotal) {
										playerwin;
									}
									else {
										pushtie;
									}
								}
								elsif($dealertotal > 16) {
									$client->Message(14, "Dealer reveals his next card [$dealercard6] for a total of $dealertotal and must STAND.");
									if($mytotals != '0') {
										if($dealertotal > $mytotals) {
											dealerwin;
										}
										elsif($dealertotal < $mytotals ) {
											playerwin;
										}
										else {
											pushtie;
										}
									}
									elsif($dealertotal > $mytotal) {
										dealerwin;
									}
									elsif($dealertotal < $mytotal) {
										playerwin;
									}
									else {
										pushtie;
										}
								}
								else{
									$client->Message(14, "Dealer reveals his next hand [$dealercard6] for a total of $dealertotal$alt2$dealertotals and must HIT!");
								
									$i++;
									$dealercard7 = splice(@onedeck, int(rand(49-$i)), 1);
									value16;
									$dealertotal = $second + $fourth + $dealer + $dealer2 + $dealer3 + $dealer4 + $dealer5 + $dealer6 + $dealer7;
									$dealertotals = $second + $fourth + $dealer + $dealer2 + $dealer3 + $dealer4 + $dealer5 + $dealer6 + $dealer7 + 10;
									
									if($dealerace == '10' && $dealertotals < 22) {
										$alt2 = " or ";
										$dealertotals = $second + $fourth + $dealer + $dealer2 + $dealer3 + $dealer4 + $dealer5 + $dealer6 + $dealer7 + 10;
									}
									elsif($dealerace == '10') { 
										$alt2 = "";
										$dealertotals = "";
									}
									else{ 
										$alt2 = "";
										$dealertotals = "";
									}
									
									if($dealertotal > 21) {
										$client->Message(14, "Dealer reveals his next card [$dealercard7] for a total of $dealertotal and BUSTS!");
										playerwin;
									}
									elsif($dealertotals > 16){
										$client->Message(14, "Dealer reveals his next card [$dealercard7] for a total of $dealertotals and must STAND.");
										if($mytotals != '0') {
											if($dealertotals > $mytotals) {
												dealerwin;
											}
											elsif($dealertotals < $mytotals ) {
												playerwin;
											}
											else {
												pushtie;
											}
										}
										elsif($dealertotals > $mytotal) {
											dealerwin;
										}
										elsif($dealertotals < $mytotal) {
											playerwin;
										}
										else {
											pushtie;
										}
									}
									elsif($dealertotal > 16) {
										$client->Message(14, "Dealer reveals his next card [$dealercard7] for a total of $dealertotal and must STAND.");
										if($mytotals != '0') {
											if($dealertotal > $mytotals) {
												dealerwin;
											}
											elsif($dealertotal < $mytotals ) {
												playerwin;
											}
											else {
												pushtie;
											}
										}
										elsif($dealertotal > $mytotal) {
											dealerwin;
										}
										elsif($dealertotal < $mytotal) { 
											playerwin;
										}
										else {
											pushtie;
											}
									}
									else{
										$client->Message(14, "Dealer reveals his next hand [$dealercard7] for a total of $dealertotal$alt2$dealertotals and must HIT! 8th");
										$i++;
										$dealercard8 = splice(@onedeck, int(rand(49-$i)), 1);
										value17;
										$dealertotal = $second + $fourth + $dealer + $dealer2 + $dealer3 + $dealer4 + $dealer5 + $dealer6 + $dealer7 + $dealer8;
										$dealertotals = $second + $fourth + $dealer + $dealer2 + $dealer3 + $dealer4 + $dealer5 + $dealer6 + $dealer7 + $dealer8 + 10;
										
										if($dealerace == '10' && $dealertotals < 22) {
											$alt2 = " or ";
											$dealertotals = $second + $fourth + $dealer + $dealer2 + $dealer3 + $dealer4 + $dealer5 + $dealer6 + $dealer7 + $dealer8 + 10;
										}
										elsif($dealerace == '10') { 
											$alt2 = "";
											$dealertotals = "";
										}
										else{ 
											$alt2 = "";
											$dealertotals = "";
										}
										
										if($dealertotal > 21) {
											$client->Message(14, "Dealer reveals his next card [$dealercard8] for a total of $dealertotal and BUSTS!");
											playerwin;
										}
										elsif($dealertotals > 16){
											$client->Message(14, "Dealer reveals his next card [$dealercard8] for a total of $dealertotals and must STAND.");
											if($mytotals != '0') { 
												if($dealertotals > $mytotals) {
													dealerwin;
												}
												elsif($dealertotals < $mytotals ) {
													playerwin;
												}
												else {
													pushtie;
												}
											}
											elsif($dealertotals > $mytotal) {
												dealerwin;
											}
											elsif($dealertotals < $mytotal) {
												playerwin;
											}
											else {
												pushtie;
											}
										}
										elsif($dealertotal > 16) {
											$client->Message(14, "Dealer reveals his next card [$dealercard8] for a total of $dealertotal and must STAND.");
											if($mytotals != '0') { 
												if($dealertotal > $mytotals) {
													dealerwin;
												}
												elsif($dealertotal < $mytotals ) {
													playerwin;
												}
												else {
													pushtie;
												}
											}
											elsif($dealertotal > $mytotal) {
												dealerwin;
											}
											elsif($dealertotal < $mytotal) {
												playerwin;
											}
											else {
												pushtie;
												}
										}
									}
								}
							}
						}
					}
				}
			}
		}
	} #END STAND
} #END EVENT SAY
sub EVENT_ITEM {
my $play = quest::saylink("play", 1);
	if($platinum > '1000') {
		quest::say ("I'm sorry but the maximum bet is 1000 platinum pieces.");
		plugin::return_items(\%itemcount);
			if($platinum != 0 || $gold != 0 || $silver != 0 || $copper != 0) {
				quest::givecash($copper, $silver, $gold, $platinum);
				}
	}
	elsif($platinum >= '50') {
		quest::say ("Let's $play. I'll deal.");
		quest::setglobal("cheat", 1, 5, "F");
		quest::setglobal("hithit", 0, 5, "F");
		quest::setglobal("standstand", 0, 5, "F");
		}
	elsif($platinum > '0') {
		quest::say ("I'm sorry but the minimum bet is 50 platinum pieces.");
		plugin::return_items(\%itemcount);
			if($platinum != 0 || $gold != 0 || $silver != 0 || $copper != 0) {
				quest::givecash($copper, $silver, $gold, $platinum);
				}
		}
	else {
		quest::say("I have no use for this.");
		plugin::return_items(\%itemcount);
		if($platinum != 0 || $gold != 0 || $silver != 0 || $copper != 0) {
		quest::givecash($copper, $silver, $gold, $platinum);
			}
		}
}
#END OF FILE Zone:Plane of Knowledge ID:202393 -- The_Wizard_of_Odds.pl