#######################################
## NPC: Seven Cards                   
## Zone: Plane of Knowledge    
## Simple gambling game                
## by Patrikpatrik   
## Aug 1st 2015
#######################################
sub EVENT_SPAWN {
	$x = $npc->GetX();
	$y = $npc->GetY();
	quest::set_proximity($x - 10, $x + 10, $y - 10, $y + 10);
	}
sub EVENT_ENTER {
	$npc->SetAppearance(0);
	}
sub EVENT_EXIT {
	$npc->SetAppearance(0);
	quest::doanim(24);
	$client->Message(263, "Seven Cards snickers.");
	my $randomshout = int(rand(100));
		if ($randomshout <= '1') {
		quest::shout("Come try your luck at seven cards! I'll pay 5 to 1 odds!");
		}
		else {
		}
	}
	
sub EVENT_SAY {
#Hyperlinks
my $play = quest::saylink("play", 1);
my $money = quest::saylink("money", 1);
my $yes = quest::saylink("yes", 1);
my $no = quest::saylink("no", 1);
my $cost = quest::saylink("cost", 1);

if(($text=~/Hail/i) && (!defined $qglobals{"counter1"})) {
	quest::say("Hail $name. Do you want to $play seven cards? Payout is 5 to 1! No other Casino has these odds.");
	quest::setglobal("counter1", ($qglobals{"counter1"}+1), 5, "F");
	} 
elsif((($text=~/hail/i) | ($text=~/play/i) | ($text=~/yes/i)) && (defined $qglobals{"counter1"})) {
	quest::say("I'll need some $money up front, $name.");
	$client->Message(14, "Seven Cards begins to shuffle.");
	#quest::setglobal("counter1", 1, 5, "F");
	}
elsif(($text=~/no/i) && ($counter1 < '3')) {
	quest::doanim(29);
	quest::say("Try your luck next time!");
	}
elsif(($text=~/no/i) && ($counter1 < '4')) {
	quest::emote("gives you a hard stare as he reshuffles his cards.");
	}
elsif(($text=~/no/i) && ($counter1 < '5')) {
	quest::doanim(30);
	quest::emote("glares at you threateningly.");
	}
elsif(($text=~/money/i) && (defined $qglobals{"counter1"})) {
	quest::say("It'll be 1000 platinum pieces.");
	}
elsif(($text=~/beggar/i) && ($counter1 < '2')) {
#$client->Message(14, "your counter is now $counter1.");
	my $npcroll = int(rand(7));
	#$client->Message(14, "The number rolled was $npcroll.");
		if ($npcroll == '0') {
			quest::say("You got it!");
			$client->Message(14, "Seven Cards reveals a Beggar card! You found the penny. You win!");
			quest::givecash(0, 0, 0, 5000);
			quest::ding();
			quest::setglobal("counter1", ($qglobals{"counter1"}+1), 5, "F");
			quest::say("want to play again? $yes / $no");
			}
		else {
			quest::say("Sorry, you lose!");
				if ($npcroll == '1') {
				$client->Message(14, "Seven Cards revealed a Castle card.");
				quest::setglobal("counter1", ($qglobals{"counter1"}+1), 5, "F");
				quest::say("Want to play again? $yes / $no");
				}
				elsif($npcroll == '2') {
				$client->Message(14, "Seven Cards revealed a Joker.");
				quest::setglobal("counter1", ($qglobals{"counter1"}+1), 5, "F");
				quest::say("Want to play again? $yes / $no");
				}
				elsif($npcroll == '3') {
				$client->Message(14, "Seven Cards revealed a King.");
				quest::setglobal("counter1", ($qglobals{"counter1"}+1), 5, "F");
				quest::say("Want to play again? $yes / $no");
				}
				elsif($npcroll == '4') {
				$client->Message(14, "Seven Cards revealed a Knight.");
				quest::setglobal("counter1", ($qglobals{"counter1"}+1), 5, "F");
				quest::say("Want to play again? $yes / $no");
				}
				elsif($npcroll == '5') {
				$client->Message(14, "Seven Cards revealed a Queen.");
				quest::setglobal("counter1", ($qglobals{"counter1"}+1), 5, "F");
				quest::say("Want to play again? $yes / $no");
				}
				elsif($npcroll == '6') {
				$client->Message(14, "Seven Cards revealed a Wild card.");
				quest::setglobal("counter1", ($qglobals{"counter1"}+1), 5, "F");
				quest::say("Want to play again? $yes / $no");
				}
			}
		}
elsif(($text=~/castle/i) && ($counter1 < '2')) {
	#$client->Message(14, "your counter is now $counter1.");
	my $npcroll = int(rand(7));
	#$client->Message(14, "The number rolled was $npcroll.");
		if ($npcroll == '1') {
			quest::say("You got it!");
			$client->Message(14, "Seven Cards reveals a Castle card! You found the penny. You win!");
			quest::givecash(0, 0, 0, 5000);
			quest::ding();
			quest::setglobal("counter1", ($qglobals{"counter1"}+1), 5, "F");
			quest::say("want to play again? $yes / $no");
			}
		else {
			quest::say("Sorry, you lose!");
				if ($npcroll == '0') {
				$client->Message(14, "Seven Cards revealed a Beggar card.");
				quest::setglobal("counter1", ($qglobals{"counter1"}+1), 5, "F");
				quest::say("Want to play again? $yes / $no");
				}
				elsif($npcroll == '2') {
				$client->Message(14, "Seven Cards revealed a Joker.");
				quest::setglobal("counter1", ($qglobals{"counter1"}+1), 5, "F");
				quest::say("Want to play again? $yes / $no");
				}
				elsif($npcroll == '3') {
				$client->Message(14, "Seven Cards revealed a King.");
				quest::setglobal("counter1", ($qglobals{"counter1"}+1), 5, "F");
				quest::say("Want to play again? $yes / $no");
				}
				elsif($npcroll == '4') {
				$client->Message(14, "Seven Cards revealed a Knight.");
				quest::setglobal("counter1", ($qglobals{"counter1"}+1), 5, "F");
				quest::say("Want to play again? $yes / $no");
				}
				elsif($npcroll == '5') {
				$client->Message(14, "Seven Cards revealed a Queen.");
				quest::setglobal("counter1", ($qglobals{"counter1"}+1), 5, "F");
				quest::say("Want to play again? $yes / $no");
				}
				elsif($npcroll == '6') {
				$client->Message(14, "Seven Cards revealed a Wild card.");
				quest::setglobal("counter1", ($qglobals{"counter1"}+1), 5, "F");
				quest::say("Want to play again? $yes / $no");
				}
		}
	}
elsif(($text=~/joker/i) && ($counter1 < '2')) {
	#$client->Message(14, "your counter is now $counter1.");
	my $npcroll = int(rand(7));
	#$client->Message(14, "The number rolled was $npcroll.");
		if ($npcroll == '2') {
			quest::say("You got it!");
			$client->Message(14, "Seven Cards reveals a Joker! You found the penny. You win!");
			quest::givecash(0, 0, 0, 5000);
			quest::ding();
			quest::setglobal("counter1", ($qglobals{"counter1"}+1), 5, "F");
			quest::say("want to play again? $yes / $no");
			}
		else {
			quest::say("Sorry, you lose!");
				if ($npcroll == '1') {
				$client->Message(14, "Seven Cards revealed a Castle card.");
				quest::setglobal("counter1", ($qglobals{"counter1"}+1), 5, "F");
				quest::say("Want to play again? $yes / $no");
				}
				elsif($npcroll == '0') {
				$client->Message(14, "Seven Cards revealed a Beggar card.");
				quest::setglobal("counter1", ($qglobals{"counter1"}+1), 5, "F");
				quest::say("Want to play again? $yes / $no");
				}
				elsif($npcroll == '3') {
				$client->Message(14, "Seven Cards revealed a King.");
				quest::setglobal("counter1", ($qglobals{"counter1"}+1), 5, "F");
				quest::say("Want to play again? $yes / $no");
				}
				elsif($npcroll == '4') {
				$client->Message(14, "Seven Cards revealed a Knight.");
				quest::setglobal("counter1", ($qglobals{"counter1"}+1), 5, "F");
				quest::say("Want to play again? $yes / $no");
				}
				elsif($npcroll == '5') {
				$client->Message(14, "Seven Cards revealed a Queen.");
				quest::setglobal("counter1", ($qglobals{"counter1"}+1), 5, "F");
				quest::say("Want to play again? $yes / $no");
				}
				elsif($npcroll == '6') {
				$client->Message(14, "Seven Cards revealed a Wild card.");
				quest::setglobal("counter1", ($qglobals{"counter1"}+1), 5, "F");
				quest::say("Want to play again? $yes / $no");
				}
		}
	}
elsif(($text=~/king/i) && ($counter1 < '2')) {
	#$client->Message(14, "your counter is now $counter1.");
	my $npcroll = int(rand(7));
	#$client->Message(14, "The number rolled was $npcroll.");
		if ($npcroll == '3') {
			quest::say("You got it!");
			$client->Message(14, "Seven Cards reveals a King! You found the penny. You win!");
			quest::givecash(0, 0, 0, 5000);
			quest::ding();
			quest::setglobal("counter1", ($qglobals{"counter1"}+1), 5, "F");
			quest::say("want to play again? $yes / $no");
			}
		else {
			quest::say("Sorry, you lose!");
				if ($npcroll == '1') {
				$client->Message(14, "Seven Cards revealed a Castle card.");
				quest::setglobal("counter1", ($qglobals{"counter1"}+1), 5, "F");
				quest::say("Want to play again? $yes / $no");
				}
				elsif($npcroll == '2') {
				$client->Message(14, "Seven Cards revealed a Joker.");
				quest::setglobal("counter1", ($qglobals{"counter1"}+1), 5, "F");
				quest::say("Want to play again? $yes / $no");
				}
				elsif($npcroll == '0') {
				$client->Message(14, "Seven Cards revealed a Beggar card.");
				quest::setglobal("counter1", ($qglobals{"counter1"}+1), 5, "F");
				quest::say("Want to play again? $yes / $no");
				}
				elsif($npcroll == '4') {
				$client->Message(14, "Seven Cards revealed a Knight.");
				quest::setglobal("counter1", ($qglobals{"counter1"}+1), 5, "F");
				quest::say("Want to play again? $yes / $no");
				}
				elsif($npcroll == '5') {
				$client->Message(14, "Seven Cards revealed a Queen.");
				quest::setglobal("counter1", ($qglobals{"counter1"}+1), 5, "F");
				quest::say("Want to play again? $yes / $no");
				}
				elsif($npcroll == '6') {
				$client->Message(14, "Seven Cards revealed a Wild card.");
				quest::setglobal("counter1", ($qglobals{"counter1"}+1), 5, "F");
				quest::say("Want to play again? $yes / $no");
				}
			}	
	}
elsif(($text=~/knight/i) && ($counter1 < '2')) {
	#$client->Message(14, "your counter is now $counter1.");
	my $npcroll = int(rand(7));
	#$client->Message(14, "The number rolled was $npcroll.");
		if ($npcroll == '4') {
			quest::say("You got it!");
			$client->Message(14, "Seven Cards reveals a Knight! You found the penny. You win!");
			quest::givecash(0, 0, 0, 5000);
			quest::ding();
			quest::setglobal("counter1", ($qglobals{"counter1"}+1), 5, "F");
			quest::say("want to play again? $yes / $no");
			}
		else {
			quest::say("Sorry, you lose!");
				if ($npcroll == '1') {
				$client->Message(14, "Seven Cards revealed a Castle card.");
				quest::setglobal("counter1", ($qglobals{"counter1"}+1), 5, "F");
				quest::say("Want to play again? $yes / $no");
				}
				elsif($npcroll == '2') {
				$client->Message(14, "Seven Cards revealed a Joker.");
				quest::setglobal("counter1", ($qglobals{"counter1"}+1), 5, "F");
				quest::say("Want to play again? $yes / $no");
				}
				elsif($npcroll == '3') {
				$client->Message(14, "Seven Cards revealed a King.");
				quest::setglobal("counter1", ($qglobals{"counter1"}+1), 5, "F");
				quest::say("Want to play again? $yes / $no");
				}
				elsif($npcroll == '0') {
				$client->Message(14, "Seven Cards revealed a Beggar card.");
				quest::setglobal("counter1", ($qglobals{"counter1"}+1), 5, "F");
				quest::say("Want to play again? $yes / $no");
				}
				elsif($npcroll == '5') {
				$client->Message(14, "Seven Cards revealed a Queen.");
				quest::setglobal("counter1", ($qglobals{"counter1"}+1), 5, "F");
				quest::say("Want to play again? $yes / $no");
				}
				elsif($npcroll == '6') {
				$client->Message(14, "Seven Cards revealed a Wild card.");
				quest::setglobal("counter1", ($qglobals{"counter1"}+1), 5, "F");
				quest::say("Want to play again? $yes / $no");
				}
			}
	}
elsif(($text=~/queen/i) && ($counter1 < '2')) {
	#$client->Message(14, "your counter is now $counter1.");
	my $npcroll = int(rand(7));
	#$client->Message(14, "The number rolled was $npcroll.");
		if ($npcroll == '5') {
			quest::say("You got it!");
			$client->Message(14, "Seven Cards reveals a Queen! You found the penny. You win!");
			quest::givecash(0, 0, 0, 5000);
			quest::ding();
			quest::setglobal("counter1", ($qglobals{"counter1"}+1), 5, "F");
			quest::say("want to play again? $yes / $no");
			}
		else {
			quest::say("Sorry, you lose!");
				if ($npcroll == '1') {
				$client->Message(14, "Seven Cards revealed a Castle card.");
				quest::setglobal("counter1", ($qglobals{"counter1"}+1), 5, "F");
				quest::say("Want to play again? $yes / $no");
				}
				elsif($npcroll == '2') {
				$client->Message(14, "Seven Cards revealed a Joker.");
				quest::setglobal("counter1", ($qglobals{"counter1"}+1), 5, "F");
				quest::say("Want to play again? $yes / $no");
				}
				elsif($npcroll == '3') {
				$client->Message(14, "Seven Cards revealed a King.");
				quest::setglobal("counter1", ($qglobals{"counter1"}+1), 5, "F");
				quest::say("Want to play again? $yes / $no");
				}
				elsif($npcroll == '4') {
				$client->Message(14, "Seven Cards revealed a Knight.");
				quest::setglobal("counter1", ($qglobals{"counter1"}+1), 5, "F");
				quest::say("Want to play again? $yes / $no");
				}
				elsif($npcroll == '0') {
				$client->Message(14, "Seven Cards revealed a Beggar card.");
				quest::setglobal("counter1", ($qglobals{"counter1"}+1), 5, "F");
				quest::say("Want to play again? $yes / $no");
				}
				elsif($npcroll == '6') {
				$client->Message(14, "Seven Cards revealed a Wild card.");
				quest::setglobal("counter1", ($qglobals{"counter1"}+1), 5, "F");
				quest::say("Want to play again? $yes / $no");
				}
			}
	}
elsif(($text=~/wild/i) && ($counter1 < '2')) {
	#$client->Message(14, "your counter is now $counter1.");
	my $npcroll = int(rand(7));
	#$client->Message(14, "The number rolled was $npcroll.");
		if ($npcroll == '6') {
			quest::say("You got it!");
			$client->Message(14, "Seven Cards reveals a Wild card! You found the penny. You win!");
			quest::givecash(0, 0, 0, 5000);
			quest::ding();
			quest::setglobal("counter1", ($qglobals{"counter1"}+1), 5, "F");
			quest::say("want to play again? $yes / $no");
			}
		else {
			quest::say("Sorry, you lose!");
				if ($npcroll == '1') {
				$client->Message(14, "Seven Cards revealed a Castle card.");
				quest::setglobal("counter1", ($qglobals{"counter1"}+1), 5, "F");
				quest::say("Want to play again? $yes / $no");
				}
				elsif($npcroll == '2') {
				$client->Message(14, "Seven Cards revealed a Joker.");
				quest::setglobal("counter1", ($qglobals{"counter1"}+1), 5, "F");
				quest::say("Want to play again? $yes / $no");
				}
				elsif($npcroll == '3') {
				$client->Message(14, "Seven Cards revealed a King.");
				quest::setglobal("counter1", ($qglobals{"counter1"}+1), 5, "F");
				quest::say("Want to play again? $yes / $no");
				}
				elsif($npcroll == '4') {
				$client->Message(14, "Seven Cards revealed a Knight.");
				quest::setglobal("counter1", ($qglobals{"counter1"}+1), 5, "F");
				quest::say("Want to play again? $yes / $no");
				}
				elsif($npcroll == '5') {
				$client->Message(14, "Seven Cards revealed a Queen.");
				quest::setglobal("counter1", ($qglobals{"counter1"}+1), 5, "F");
				quest::say("Want to play again? $yes / $no");
				}
				elsif($npcroll == '0') {
				$client->Message(14, "Seven Cards revealed a Beggar card.");
				quest::setglobal("counter1", ($qglobals{"counter1"}+1), 5, "F");
				quest::say("Want to play again? $yes / $no");
				}
			}
	}
	
elsif($counter1 < '3') {
	#$client->Message(14, "YOur counter is now $counter1.");
	quest::say("Hey, hey! Don't touch my cards!");
	quest::setglobal("counter1", ($qglobals{"counter1"}+1), 5, "F");
	}
elsif($counter1 < '4') {
	#$client->Message(14, "Your counter is now $counter1.");
	$client->Message(15, "Seven Cards tells you, 'I'm WARNING you! This is your last chance.'");
	quest::setglobal("counter1", ($qglobals{"counter1"}+1), 5, "F");
	#quest::setglobal("counter1", 4, 5, "F");
	}
elsif($counter1 < '5') {
	#$client->Message(14, "Your counter is now $counter1.");
	$client->Message(13, "Seven Cards shouts, 'Okay, you asked for it!'");
	quest::setglobal("counter1", 1, 5, "F");
	$client->Message(13, "Seven Cards punches YOU for 32000 points of damage!");
	quest::say("I'm outta here!");
	$client->Message(263, "Seven Cards flees the scene!");
	$client->Kill();
	quest::depop(202390); #202390 Rathe, 202391 testing depops Seven Cards and runs into hiding until next restart
	}
	
}

sub EVENT_ITEM {
#The 7 cards to view
my $beggar = quest::saylink("Beggar", 1);
my $castle = quest::saylink("Castle", 1);
my $joker = quest::saylink("Joker", 1);
my $king = quest::saylink("King", 1);
my $knight = quest::saylink("Knight", 1);
my $queen = quest::saylink("Queen", 1);
my $wild = quest::saylink("Wild", 1);
#If given exact platinum
if($platinum == '1000') {
		quest::itemlink(22294);
		quest::itemlink(22293);
		quest::itemlink(22295);
		quest::itemlink(22298);
		quest::itemlink(22299);
		quest::itemlink(22297);
		quest::itemlink(22296);
		quest::setglobal("counter1", 1, 5, "F");
		quest::say("I have seven cards here and hidden is a lucky penny.");
		plugin::Whisper("Pick a card: $beggar, $castle, $joker, $king, $knight, $queen, or $wild.");
		}
#If tipping
elsif($platinum > '1000') {
		quest::itemlink(22294);
		quest::itemlink(22293);
		quest::itemlink(22295);
		quest::itemlink(22298);
		quest::itemlink(22299);
		quest::itemlink(22297);
		quest::itemlink(22296);
		quest::setglobal("counter1", 1, 5, "F");
		quest::say("Why thank you for the generous tip! Here are seven cards and one has a lucky penny.");
		plugin::Whisper("Pick a card: $beggar, $castle, $joker, $king, $knight, $queen, or $wild.");
		}
elsif($platinum < '1000') {
		quest::say("No no, I need 1000 platinum pieces! What are you trying to do, insult me!?");
		plugin::return_items(\%itemcount);
		if($platinum != 0 || $gold != 0 || $silver != 0 || $copper != 0) {
		quest::givecash($copper, $silver, $gold, $platinum);
		}
	}
else {
	$client->Message(14,"I have no use for this.");
	plugin::return_items(\%itemcount);
	}
}

#END OF FILE Zone: Plane of Knowledge ID:202390 -- Seven_Cards.pl