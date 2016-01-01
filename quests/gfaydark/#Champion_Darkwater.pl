######################################
## NPC: Champion Darkwater          ##
## Zone: All Starter Towns          ##
## Darkwater Ladder Event           ##
## By: Angelox	                    ##
## Revised by Caved for AXClassic   ##
## to make Clicklinks available     ##
## Angelox: Third revision          ##
## to improve logic                 ##
## Date:  02-01-2011    	        ##
## 4th revision 7/29/2015 cleanup   ##
## 5th rev. 7/31/2015 improved	    ##
## qglobals and made sure its reset ##
## UPDATE 1/1/16: SoW Earring gift working only when new years event is ON ##
######################################
sub EVENT_SAY {
#hyperlinks
my $reward = quest::saylink("reward", 1);
my $title = quest::saylink("title", 1);
my $items = quest::saylink("items", 1);
my $moonstones = quest::saylink("moonstones", 1);
my $possession = quest::saylink("possession", 1);
my $prove = quest::saylink("prove", 1);
my $first = quest::saylink("first", 1);
my $second = quest::saylink("second", 1);
my $newyears = quest::saylink("special", 1);

	if(($text=~/hail/i) && ($charid < '3')) { #this is the newest charID
	    $client->Message(14, "Champion Darkwater says, 'Your character is too old for this ladder, start a new character!'");
		$client->Message(15, "This ladder began on January 1st, 2016, check AX Classic forums.");
		$client->Message(15, "You should start a new character on or after this date.");
		# quest::say("Your characterid is $charid."); debugging $charid
	}
	elsif(($text=~/hail/i) && ($charid > '2') && (!defined $qglobals{"ladder_trophy"}) && (!defined $qglobals{"ladder_title"})) {
		$client->Message(14, "Champion Darkwater says, 'Hail, $name! I am Champion Darkwater the Ladder Guide, and I will be observing
		and rewarding you for your advancement on the Ladder.'");
		$client->Message(14, "Champion Darkwater says, 'I will $reward you for your advancement at 20, 35, 45, 55, and 65.
		When you reach 65, ask me for your $title, and I will provide it for you, in addition to your reward.'");
		quest::setglobal("ladder_trophy", 1, 5, "F");
		quest::setglobal("ladder_title", 1, 5, "F");
		#$client->Message(15, "Your qglobal and ladder number is $ladder_trophy and $ladder_title."); #debugging
		
	}
	elsif(($text=~/hail/i) && ($charid > '2') && (defined $qglobals{"ladder_trophy"})) { #charid must be greater than X 5476
		$client->Message(14, "Champion Darkwater says, 'Welcome back, $name!'");
		$client->Message(14, "Champion Darkwater says, 'I will $reward you for your advancement at 20, 35, 45, 55, and 65.
		When you reach 65, ask me for your $title, and I will provide it for you, in addition to your reward.'");
		#$client->Message(15, "Your qglobal and ladder number is $ladder_trophy and $ladder_title."); #debugging
	}
#Rewards
	elsif (($text=~/reward/i) && (defined $qglobals{"ladder_trophy"})) {
		if ($ulevel < '20') {
		$client->Message(14, "Champion Darkwater says, 'Come back when you have acquired the needed level.'");
			}
		elsif ($ulevel < '35' && ($ladder_trophy < '2')) { #set 1st trophy
		$client->Message(14, "Champion Darkwater says, 'Well done $name! Here is your trophy.'");
		quest::summonitem(409);
		quest::exp(50);
		quest::ding();
		$client->Message(6, "You received the Ladder Players Trophy!");
		$client->Message(14, "Champion Darkwater says, 'Do you still travel by ship? I have $items in my possession
		that can help you with your travels.'");
		quest::setglobal("ladder_trophy", 2, 5, "F");
		}
		elsif (($ulevel < '35') && ($ladder_trophy == '2')) {
		$client->Message(15, "You already have your level 20 trophy.");
		$client->Message(14, "Champion Darkwater says, 'Do you still travel by ship? I have $items in my possession
		that can help you with your travels.'");
		}
		elsif (($ulevel < '45') && ($ladder_trophy < '3')) { #set 2nd trophy
		$client->Message(14, "Champion Darkwater says, 'Well done $name! Here is your trophy.'");
		quest::summonitem(410);
		quest::exp(50);
		quest::ding();
		$client->Message(6, "You received the Dedicated Ladder Players Trophy!");
		quest::setglobal("ladder_trophy", 3, 5, "F");
		}
		elsif (($ulevel < '45') && ($ladder_trophy == '3')) {
		$client->Message(15, "You already have your level 35 trophy.");
		$client->Message(14, "Champion Darkwater says, 'Do you still travel by ship? I have $items in my possession
		that can help you with your travels.'");
		}
		elsif (($ulevel < '55') && ($ladder_trophy < '4')) { #set 3rd trophy
		$client->Message(14, "Champion Darkwater says, 'Well done $name! Here is your trophy.'");
		quest::summonitem(411);
		quest::exp(50);
		quest::ding();
		$client->Message(6, "You received the Advanced Ladder Players Trophy!");
		quest::setglobal("ladder_trophy", 4, 5, "F");
		}
		elsif (($ulevel < '55') && ($ladder_trophy == '4')) {
			if ($ulevel < '53') { #This is last check for under level 53 with items
			$client->Message(15, "You already have your level 45 trophy.");
			$client->Message(14, "Champion Darkwater says, 'Do you still travel by ship? I have $items in my possession
			that can help with your travels.'");
				}
			else {	
			$client->Message(15, "Champion Darkwater says, 'You already have your level 45 trophy.'");
			}
		}
		elsif (($ulevel < '65') && ($ladder_trophy < '5')) { #set 4th trophy
		$client->Message(14, "Champion Darkwater says, 'Well done $name! Here is your trophy.'");
		quest::summonitem(412);
		quest::exp(50);
		quest::ding();
		$client->Message(6, "You received the Master's Ladder Players Trophy!");
		quest::setglobal("ladder_trophy", 5, 5, "F");
		}
		elsif (($ulevel < '65') && ($ladder_trophy == '5')) {
		$client->Message(15, "You already have your level 55 trophy.");
		}
		elsif (($ulevel < '66') && ($ladder_trophy < '6')) { #set 5th trophy
		$client->Message(14, "Champion Darkwater says, 'Well done $name! Here is your final trophy.'");
		quest::summonitem(413);
		quest::exp(50);
		quest::ding();
		$client->Message(6, "You received the Champion's Ladder Players Trophy!");
		quest::setglobal("ladder_trophy", 6, 5, "F");
		$client->Message(14, "Champion Darkwater says, 'If you are not satisfied with this final reward, you can give it back to me at any time
		and I will give you something.");
		}
		elsif (($ulevel < '66') && ($ladder_trophy == '6')) {
		$client->Message(15, "You already have your level 65 trophy.");
			}
		}
#Ladder Title
	elsif (($text=~/title/i) && (defined $qglobals{"ladder_title"})) {
		if ($ulevel < '65') {
			$client->Message(14, "Champion Darkwater says, 'I'm sorry but you are not eligible for the Ladder Title at this time.'");
			}
		elsif (($ulevel == '65') && ($ladder_title == '1')) { #set Ladder Title
			$client->SetAATitle("Ladder Champion");
			quest::we(13, "Champion Darkwater shouts, 'All Hail $name for earning the title Ladder Champion!'");
			quest::ding();
			quest::setglobal("ladder_title", 2, 5, "F");
			$ladder_title=undef;
			}
		elsif (($ulevel == '65') && ($ladder_title == '2')) {
			$client->Message(15, "You already received your Ladder Title.");
			#quest::setglobal("ladder_trophy", 0, 4, "F"); #For resets
			#quest::setglobal("ladder_title", 0, 4, "F");  #For resets
			#$client->Message(15, "Your qglobal and ladder number is $ladder_trophy and $ladder_title."); #debugging
			}
		}
#End Rewards
#Moonstone Quests
	elsif ($text=~/items/i) {
	$client->Message(14, "Champion Darkwater says, 'While fighting evil in Norrath, I have found the legendary $moonstones on certain kills.'"); 
	}
	elsif ($text=~/moonstone/i) {
	$client->Message(14, "Champion Darkwater says, 'With the magic of a Moonstone in your $possession, you will be able to travel to the land where it was formed.'");
	}
	elsif ($text=~/possession/i) {
	$client->Message(14, "Champion Darkwater says, 'I have many of these Moonstones, I would give one to anybody who can $prove their worthiness and determination to me.'");
	}
	elsif ($text=~/prove/i) {
	$client->Message(14, "Champion Darkwater says, 'I have two quests for you, the $first quest is for Moonstones in Antonica, Odus, Faydwer, and Kunark. The $second is for the Moonstone of the Ice.'");
	}
	elsif ($text=~/first/i) {
		if (($race eq 'Wood Elf') | ($race eq 'High Elf') | ($race eq 'Dwarf') | ($race eq 'Gnome')){ #Fayder
		$client->Message(14,"Champion Darkwater says, 'Go to Dagnor's Cauldron in Butcher Block, and bring me the proof I want: bring me the Water Ring from an aqua goblin.'");
		}
		elsif (($race eq 'Human') | ($race eq 'Dark Elf') | ($race eq 'Barbarian') | ($race eq 'Half Elf') | ($race eq 'Troll') | ($race eq 'Ogre') | ($race eq 'Halfling')){ #Antonica
		$client->Message(14,"Champion Darkwater says, 'Go to Rathe Mountains in Antonica, and bring me the proof I want: bring me Bone Barbs from a barbed bone skeleton.'");
		}
		elsif (($race eq 'Iksar') | ($race eq 'Froglok')){ #Kunark
		$client->Message(14,"Champion Darkwater says, 'Go to the Lake of Ill Omen in Kunark, and bring me the proof I want: bring me a Tattooed Sarnak Head  from a Sarnak legionnaire.'");
		} 
		elsif (($race eq 'Vah Shir') | ($race eq 'Erudite') | ($race eq 'Human') | ($race eq 'Dark Elf')){ #Odus
		$client->Message(14,"Champion Darkwater says, 'Go to Erud's Crossing in Odus, and bring me the proof I want: bring me the tool kit from a frantic kerran.'");
		}
	}
	elsif ($text=~/second/i) {
		if (($race eq 'Wood Elf') | ($race eq 'High Elf') | ($race eq 'Dwarf') | ($race eq 'Gnome')){ #Fayder
		$client->Message(14,"Champion Darkwater says, 'Go to the Castle Mistmoore in Lesser Faydark, and bring me the proof I want: bring me the blood from a Fallen Noble.'");
		}
		elsif (($race eq 'Human') | ($race eq 'Dark Elf') | ($race eq 'Barbarian') | ($race eq 'Half Elf') | ($race eq 'Troll') | ($race eq 'Ogre') | ($race eq 'Halfling')){ #Antonica
		$client->Message(14,"Champion Darkwater says, 'Go to the Accursed Temple of Cazic-Thule in the Feerrott, and bring me the proof I want: bring me a Mosquito Earring from The Infected Mosquito.'");
		}
		elsif (($race eq 'Iksar') | ($race eq 'Froglok')){ #Kunark
		$client->Message(14,"Champion Darkwater says, 'Go to the Crypt of Dalnir in Warsliks Woods, and bring me the proof I want: bring me the Battle Plans from a kly evoker.'");
		} 
		elsif (($race eq 'Vah Shir') | ($race eq 'Erudite') | ($race eq 'Human') | ($race eq 'Dark Elf')){ #Odus
		$client->Message(14,"Champion Darkwater says, 'Go to Stonebrunt Mountains in Odus, and bring me the proof I want: bring me a Leopard Fang from a kejek leopard.'");
		}
	}
#End Moonstone

#Angelox's New Year's reward SoW Earring only when Event1 is ON
	if(($text=~/hail/i) && ($event1 == 1) && ((!defined $qglobals{"newyears"}) || ($qglobals{"newyears"} == 0))) {
		$client->Message(14,"Champion Darkwater says, 'Is it New Years already? Well, Happy New Year $name! Here, take
		my $newyears reward for your dedication.");
		quest::setglobal("newyears", 1, 5, "F");
	}
	elsif(($text=~/special/i) && ($event1 == 1) && ($qglobals{'newyears'} == 1)) {
		quest::summonitem(625);
		quest::ding();
		$client->Message(6,"You received Darkwater's earring of travel!");
		quest::setglobal("newyears", 2, 5, "F");
	}
	elsif(($text=~/hail/i) && ($event1 == 1) && ($qglobals{"newyears"} == 2)) {
		$client->Message(14, "Champion Darkwater says, 'Happy New Year $name. Glad to see you again!");
		
		# $client->Message(14, "debugging, newyears is $newyears, or qglobals is $qglobals{'newyears'}");
	}
	elsif(($text=~/hail/i) && ($event1 != 1)) {
		# $client->Message(15, "Okay trying to make event1 undefined or at least start New years again!");
		quest::setglobal("newyears", 0, 5, "F");
	}
	else{
		# Do nothing. Put msg for debugging!
	}
#End New Year's reward SoW Earring
}



sub EVENT_ITEM {
	if ($charid < '5829') { #this charid and the one above should be the same. 5477 5829
		$client->Message(14, "Champion Darkwater says, 'Your character is too old for this ladder, start a new character!'");
		$client->Message(15, "This ladder began on January 1st, 2016, check AX Classic forums.");
		$client->Message(15, "You should start a new character on or after this date.");
		plugin::return_items(\%itemcount);
			if($platinum != 0 || $gold != 0 || $silver != 0 || $copper != 0) {
			quest::givecash($copper, $silver, $gold, $platinum);
			}
		}
#Champion Darkwater's gift
	elsif (plugin::check_handin(\%itemcount, 119925=>1)) {
	$client->Message(14, "Champion Darkwater says, 'Welcome $name to the Rathe Ladder! Here is your earring.");
	$client->Message(6, "You received a Darkwater's Gift!");
	quest::summonitem(119924);
	quest::ding();
	}
# Bone Barbs, Water Ring (both types),Sarnak Head,Tool Kit
	elsif ((plugin::check_handin(\%itemcount, 19037 =>1)) | (plugin::check_handin(\%itemcount, 69246 => 1)) | (plugin::check_handin(\%itemcount, 10546 => 1)) | (plugin::check_handin(\%itemcount, 12911 => 1)) | (plugin::check_handin(\%itemcount, 17057 => 1))) {
		$client->Message(14, "Champion Darkwater says, 'Well done $name! Here is your Moonstone.'");
		$client->Message(6, "You received Moonstone of the Commons!");
		quest::summonitem(126);
		quest::exp(50);
		quest::ding();
	}
# Noble's Blood, Dalnir Battle Plans,Leopard Fang, Skeeter Earring
	elsif ((plugin::check_handin(\%itemcount, 1890 => 1)) | (plugin::check_handin(\%itemcount, 48058 => 1)) | (plugin::check_handin(\%itemcount, 6944 => 1)) | (plugin::check_handin(\%itemcount, 604 => 1))) {
		$client->Message(14, "Champion Darkwater says, 'Well done $name! Here is your Moonstone.'");
		$client->Message(6, "You received Moonstone of Ice!");
		quest::summonitem(133);
		quest::exp(50);
		quest::ding();
		}
#Turning in 65 ladder reward for King Card
	elsif (plugin::check_handin(\%itemcount, 413=> 1)) {
		$client->Message(14, "Champion Darkwater says, 'Here, take this and let us never speak of it again.'");
		$client->Message(6, "You received a King Card.");
		quest::summonitem(22298);
	}
	else {
	$client->Message(14, "Champion Darkwater says, 'Sorry, I can't use this.'");
	plugin::return_items(\%itemcount);
		if($platinum != 0 || $gold != 0 || $silver != 0 || $copper != 0) {
		quest::givecash($copper, $silver, $gold, $platinum);
		}
	}
}

#END OF FILE Zone:Starter Cities ID:54286 -- #Champion_Darkwater.pl
