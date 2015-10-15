#######################################
## NPC: a Gigglegibber Goblin                 
## Zone: Plane of Knowledge    
## Quest: Lottery that keeps jackpot info server-wide and stores past winner
## by Patrikpatrik   
## started on Aug 30 2015
## Based Upon Everquest 2's lottery system
## Last updated 8/28/2015
## Completed 10/15/2015 @ revision 2555
#######################################

#Square facing
$square = chr(9861);

sub EVENT_SPAWN {
	$x = $npc->GetX();
	$y = $npc->GetY();
	quest::set_proximity($x - 20, $x + 20, $y - 20, $y + 20);
}
sub EVENT_ENTER {
	#$npc->SetAppearance(0);
}
sub EVENT_EXIT {
	#$npc->SetAppearance(0);
}
#Mechanism
@numbers = (
1,
2,
3,
4,
5,
6,
7,
8,
9,
10,
11,
12,
13,
14,
15,
16,
17,
18,
19,
20,
21,
22,
23,
24,
25,
26,
27,
28,
29,
30,
31);

#Manual input of lottery numbers
$roll1 = '15';
$roll2 = '27';
$roll3 = '9';
#The code snippit below is for self maintaining numbers on each win still wip
# Initial Lottery
# if (!defined $qglobals{"trigger"}) {
	# $roll1 = '15';
	# $roll2 = '27';
	# $roll3 = '9';
# }
# If someone wins the lottery, this should kick in and randomize a new set of numbers.
# else {
	# @newrolls = @numbers;
	# $next1 = splice(@newrolls, int(rand(31)), 1);
	# $next2 = splice(@newrolls, int(rand(30)), 1);
	# $next3 = splice(@newrolls, int(rand(29)), 1);
	# $roll1 = $next1;
	# $roll2 = $next2;
	# $roll3 = $next3;
# }
sub EVENT_SAY {
	# This alters the way text is said if there was no previous winner
	if(!defined $qglobals{"ticketnumber"} || $qglobals{"ticketnumber"} == 0) {
		$none = " none";
	}
	else{
		$none = " ticket number " . $qglobals{'ticketnumber'} . " for " . $qglobals{'globaljackpot'} . " platinum";
	}
my $lottery = quest::saylink("lottery", 1);

	if($text=~/hail/i) {
		quest::say("Hail $name, would you like to play the $lottery? The jackpot is currently " . $qglobals{"jackpot"} . " platinum.");
		#quest::setglobal("ticketnumber", 0, 7, "F"); #troubleshooting alternate texts based on previous winners
	}
	elsif($text=~/lottery/i) {
		quest::say("Each ticket costs 5 platinum to play. If you match 2 of the 3 numbers you win 10 plat! Match
		all 3 and you win the jackpot. Our last big winner was $none!");
	}
}
sub EVENT_ITEM {
	if( $platinum == '5') {
		quest::say("Thank you! The current numbers are $roll1$square$roll2$square$roll3.");
		quest::setglobal("jackpot", ($qglobals{"jackpot"} + 5), 7, "F");
		
		#Your Lottery here
		@lottery = @numbers;
		#$second = 15;
		#$third = 9;
		#$first = 27;
		$first = splice(@lottery, int(rand(31)), 1);
		$second = splice(@lottery, int(rand(30)), 1);
		$third = splice(@lottery, int(rand(29)), 1);
		
		#List of all lottery results in array
		@totals = ($first, $second, $third);
		
		quest::say("Your ticket is $first$square$second$square$third.");
		#Matches all 3 numbers
		if ((($totals[0] == $roll1) || ($totals[0] == $roll2) || ($totals[0] == $roll3)) &&
		   (($totals[1] == $roll1) || ($totals[1] == $roll2) || ($totals[1] == $roll3)) &&
		   (($totals[2] == $roll1) || ($totals[2] == $roll2) || ($totals[2] == $roll3))) {
			   $client->Message(14, "a Gigglegibber Goblin says, 'You HIT the jackpot $name, congratulations!");
			   quest::we(13, "a Gigglegibber Goblin shouts, '$name just won the jackpot of $qglobals{'jackpot'} platinum!'");
			   quest::setglobal("globaljackpot", $qglobals{"jackpot"} , 7, "F");
			   $globaljackpot = $qglobals{"jackpot"};
				#quest::say ("jackpot size was $qglobals{'globaljackpot'} platinum.");
				quest::givecash(0, 0, 0, $globaljackpot);
				quest::ding();
				quest::setglobal("jackpot", 0, 7, "F");
				our $ticketnumber = $charid; #This is really the id number which can be looked up in the database
				#quest::say("okay testing ticket number char id as $ticketnumber."); # THIS WORKS <---
				quest::setglobal("ticketnumber", $ticketnumber, 7, "F"); #This sets charid to global variable ticketnumber
				#quest::say ("Ok global value should be $qglobals{'ticketnumber'}.");
		}
		#Matches any 2, first set
		elsif ((($totals[0] == $roll1) || ($totals[0] == $roll2) || ($totals[0] == $roll3)) &&
			((($totals[1] == $roll1) || ($totals[1] == $roll2) || ($totals[1] == $roll3)) ||
			(($totals[2] == $roll1) || ($totals[2] == $roll2) || ($totals[2] == $roll3)))) {
			$client->Message(15, "a Gigglegibber Goblin says, 'You got TWO numbers right! You win 10 platinum!'");
			quest::givecash(0, 0, 0, 10);
		}
		#Matches any 2, last set
		elsif ((($totals[1] == $roll1) || ($totals[1] == $roll2) || ($totals[1] == $roll3)) &&
			((($totals[2] == $roll1) || ($totals[2] == $roll2) || ($totals[2] == $roll3)) ||
			(($totals[0] == $roll1) || ($totals[0] == $roll2) || ($totals[0] == $roll3)))) {
			$client->Message(15, "a Gigglegibber Goblin says, 'You got TWO numbers right! You win 10 platinum!'");
			quest::givecash(0, 0, 0, 10);
		}
		#Any 1 match
		elsif ((($totals[0] == $roll1) || ($totals[0] == $roll2) || ($totals[0] == $roll3)) ||
		   (($totals[1] == $roll1) || ($totals[1] == $roll2) || ($totals[1] == $roll3)) ||
		   (($totals[2] == $roll1) || ($totals[2] == $roll2) || ($totals[2] == $roll3))) {
			$client->Message(6, "a GiggleGibber Goblin says, 'You got a number right! Good for you.'");
			#quest::say("The thing is $totals[].");
		}
	}
	elsif($platinum > '5'){
		quest::say ("Ohhnoooo it's exactly 5 platinum pieces this is too much!");
		plugin::return_items(\%itemcount);
			if($platinum != 0 || $gold != 0 || $silver != 0 || $copper != 0) {
				quest::givecash($copper, $silver, $gold, $platinum);
				}
		}
	elsif($platinum < '5' && $platinum > '0'){
		quest::say ("Ermmm... well okay.");
	}
	else {
		quest::say("I have no use for this.");
		plugin::return_items(\%itemcount);
		if($platinum != 0 || $gold != 0 || $silver != 0 || $copper != 0) {
		quest::givecash($copper, $silver, $gold, $platinum);
			}
		}
}
#END of FILE Zone:Plane of Knowledge ID:202396 -- a_Gigglegibber_Goblin.pl