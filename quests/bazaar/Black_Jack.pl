#############
#Quest Name: Black Jack's Blackjack
#Author: Cisyouc
#NPCs Involved: 1
#Items Involved: 0
#################
##NPC 1
#Name: Black_Jack00
#Race: 6 (dark elf - global model)
#Zone: Shadowhaven -- but can be anywhere really
#################

my $permissions = 0;
my $xplatinum = 0;
my $xgold = 0;
my $xsilver = 0;
my $xcopper = 0;
my $client1 = 0;
my $client2 = 0;
my $server = 0;
my $client = 0;

sub DealCard
{
	@cards = (1,2,3,4,5,6,7,8,9,10,11);
	$returnvalue = $cards[int(rand(scalar @cards))];
	return $choice;
}

sub EVENT_SAY
{
	if($text=~/hail/i)
		{
			quest::say("Greetings! Want to play blackjack? Hand me your bet to begin! All games return double on win!");
		}
	if($text=~/deal/i)
		{
			if($permissions == 1)
				{
					$client1 = DealCard();
					$client2 = DealCard();
					my $tempserver = DealCard();
					my $tempclient = ($client1+$client2);
					$client = $tempclient;
					$server = (DealCard() + $tempserver);
					if($server < 16)
						{
							$server = ($server + DealCard());
						}
					quest::say("The dealer passes you a $client1 and a $client2 giving you a total of $tempclient. The dealer is showing a $tempserver. Say [yes] for another card or [no] to stay.");
					$permissions = 2;
				}
				else
				{
					quest::say("Have you bet?");
				}
		}
	if($text=~/yes/i)
		{
			if($permissions == 2)
				{
					my $newcard = DealCard();
					$client = ($client + $newcard);
					quest::say("The dealer has handed you a $newcard, giving you a total of $client. Say [yes] for another card or [no] to stay.");
				}
                        if($permissions == 1)
				{
					quest::say("You must [deal] first!");
				}
		}
	if($text=~/no/i)
		{
			if($permissions == 2)
				{
					if($client < $server && $server <= 21)
						{
							quest::say("Dealer wins with $server. Thanks for playing.");
							$client = 0;
							$permissions = 0;
							$xplatinum = 0;
							$xgold = 0;
							$xsilver = 0;
							$xcopper = 0;
						}
					if($client < $server && $server > 21)
						{
							quest::say("You win with $client. Thanks for playing.");
							quest::givecash($xplatinum*2,$xgold*2,$xsilver*2,$  xcopper*2);
							$permissions = 0;
							$client = 0;
							$xplatinum = 0;
							$xgold = 0;
							$xsilver = 0;
							$xcopper = 0;
						}
					if($client > $server && $client <= 21)
						{
							quest::say("You win with $client. Thanks for playing.");
							quest::givecash($xplatinum*2,$xgold*2,$xsilver*2,$  xcopper*2);
							$permissions = 0;
							$client = 0;
							$xplatinum = 0;
							$xgold = 0;
							$xsilver = 0;
							$xcopper = 0;
						}
					if($client > $server && $client > 21)
						{
							quest::say("Dealer wins with $server. Thanks for playing.");
							$permissions = 0;
							$xplatinum = 0;
							$client = 0;
							$xgold = 0;
							$xsilver = 0;
							$xcopper = 0;
						}
				}
		}
}

sub EVENT_ITEM
{
	if($xplatinum > 0 || $xgold > 0 || $xsilver > 0 || $xcopper > 0 && $permissions == 0 && $platinum > 0 && $gold > 0 && $silver > 0 && $copper > 0)
		{
			quest::say("Your bet of $platinum platinum, $gold gold, $silver silver, $copper copper has been saved. You may [deal] the cards now.");
			$xplatinum = $platinum;
			$xgold = $gold;
			$xsilver = $silver;
			$xcopper = $copper;
			$permissions = 1;
		}
	else
		{
			quest::say("You've already bet!");
		}
}

