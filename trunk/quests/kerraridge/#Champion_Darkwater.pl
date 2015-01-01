######################################
## NPC: Champion Darkwater          ##
## Zone: All Starter Towns          ##
## Darkwater Ladder Event           ##
## By: Angelox	                   ##
## Revised by Caved for AXClassic   ##
## to make Clicklinks available     ##
## Angelox: Third revision          ##
## to improve logic                 ##
## Date:  02-01-2011                ##
######################################
sub EVENT_SAY {
my $reward = quest::saylink("reward", 1);
my $title = quest::saylink("title", 1);
my $items = quest::saylink("items", 1);
my $moonstones = quest::saylink("moonstones", 1);
my $possession = quest::saylink("possession", 1);
my $prove = quest::saylink("prove", 1);
my $first = quest::saylink("first", 1);
my $second = quest::saylink("second", 1);
  if(($text=~/Hail/i) && ($charid < 5010)) { #set
    #$client->Message(14,"Your character ID is $charid ");
    $client->Message(14,"Your character is too old for this ladder, start a new character!");
    $client->Message(15,"This ladder began on June 19th, 2014, ending date posted at the AX Classic forums.");
    $client->Message(15,"You should start your new character on or after the starting date.");
  }
 elsif (($text=~/Hail/i) && ($charid > 5009)){  #set
    $client->Message(14,"Hail, $name! I am Darkwater the Ladder Guide, and will be observing and rewarding you for your advancement on the Ladder."); 
    $client->Message(14,"I will $reward you for advancement to levels 20, 35, 45, 55, and 65. When you reach 65, ask me for your $title\, and I will provide it for you, in addition to your reward.");
    if ($ulevel <= 2){
      if (($year2014a <= 0) && ($event1==1)){ #Angelox New Years event earring item.
        $client->Message(14,"I see you started with the New Year. Glad to have you here again! Here,take my special reward for your dedication.");
        quest::summonitem(625);
        $client->Message(6,"You recieved Darkwater's Earring of Travel!");
        quest::setglobal("year2014a",1,5,"F");
        $year2014a=undef; }
      elsif (($year2014b <= 0) && ($event1==1)){ #Caveds New Years event item.
	 if ($year2014a > 0){ 
	   $client->Message(14,"I see you started with the New Year. Glad to have you here again! Here,take my special reward for your dedication.");
	   quest::summonitem(119503);
	   $client->Message(6,"You recieved The Stone of the Ladder!");
	   quest::setglobal("year2014b",1, 5,"F");
	   $year2014b=undef;
	 }else{
	   quest::summonitem(119503);
	   $client->Message(6,"You recieved The Stone of the Ladder!");
	   quest::setglobal("year2014b",1,5,"F");
	   $year2014b=undef;
	  }
       }
    }
  }
  elsif (($text=~/join/i)&& ($charid > 5009)){ #set
    $client->Message(14,"Glad to have you with us ");
  }
  elsif (($text=~/title/i) && ($charid > 5009) && ($ulevel > 64)) { #set
    $client->Message(14,"Well done $name! Here is your title.");
    $client->SetAATitle("Ladder Champion");
  }
  elsif (($text=~/title/i) && ($charid > 5009) && ($ulevel < 65)) { #set
    $client->Message(14,"You need to be level 65 on the Ladder for this.");
    $client->Message(15,"Ladder title is available during the time period posted.");
  }
  elsif ($text=~/reward/i) {
    if ($charid > 5009) { #set
	 if ( ($ulevel > 19) &&  ($ulevel < 35) && ($ladder_trophy < 1)) { #set LadderTrophy1
		$client->Message(14,"Well done $name! Here is your trophy.");
		quest::summonitem(409);
		$client->Message(6,"You recieved the Ladder Players Trophy!");
		$client->Message(14,"Do you still travel by ship? I have $items in my possession that can help you with your travels.");
		quest::setglobal("ladder_trophy",1,5,"F");
		$ladder_trophy=undef;
	  }
	  elsif (($ulevel < 35) && (defined $ladder_trophy) && ($ladder_trophy==1)) {
		$client->Message(14,"You already have your level 20 trophy.");
		$client->Message(14,"Do you still travel by ship? I have $items in my possession that can help you with your travels.");
	  }
	  elsif (($ulevel > 19) && ($ulevel < 45) && ($ladder_trophy < 2)) { #set LadderTrophy2
		$client->Message(14,"Well done $name! Here is your trophy.");
		quest::summonitem(410);
		$client->Message(6,"You recieved the Dedicated Ladder Players Trophy!");
		quest::setglobal("ladder_trophy",2,5,"F");
		$ladder_trophy=undef;
	  }
	  elsif (($ulevel > 34) &&  ($ulevel < 45) && ($ladder_trophy==2)) {
		$client->Message(14,"You already have your level 35 trophy.");
	  }
	  elsif (($ulevel > 44) &&  ($ulevel < 55) && ($ladder_trophy < 3)) { #set LadderTrophy3
	  $client->Message(14,"Well done $name! Here is your trophy.");
	  quest::summonitem(411);
	  $client->Message(6,"You recieved the Advanced Ladder Players Trophy!");
	  quest::setglobal("ladder_trophy",3,5,"F");
	  $ladder_trophy=undef;
      }
      elsif ( ($ulevel > 44) &&  ($ulevel < 55) && ($ladder_trophy==3)) {
	  $client->Message(14,"You already have your level 45 trophy.");
      }
      elsif (($ulevel > 54) &&  ($ulevel < 65) && ($ladder_trophy < 4)) { #set LadderTrophy4
	  $client->Message(14,"Well done $name! Here is your trophy.");
	  quest::summonitem(412);
	  $client->Message(6,"You recieved the Master's Ladder Players Trophy!");
	  quest::setglobal("ladder_trophy",4,5,"F");
	  $ladder_trophy=undef;
      }
      else{
	  $client->Message(14,"Come back when you have aquired the needed level.");
      }
    }
   elsif (($ulevel > 54) &&  ($ulevel < 65) && ($ladder_trophy==4)) {
	 $client->Message(14,"You already have your level 55 trophy.");
	return;
   }
   elsif (($ulevel > 64) && ($ladder_trophy < 5)) { #set LadderTrophy5
	$client->Message(14,"Well done $name! Here is your trophy.");
	quest::summonitem(413);
	$client->Message(6,"You recieved the Champion's Ladder Players Trophy!");
	quest::setglobal("ladder_trophy",5,5,"F");
	$ladder_trophy=undef;
    return;
	}
  elsif ( ($ulevel > 64) && ($ladder_trophy==5)) {
	$client->Message(14,"You already have your level 65 trophy.");
	}
     }
#Moonstone Quests
  elsif ($text=~/items/i){
    $client->Message(14,"While fighting evil in Norrath, I have found the legendary $moonstones on certain kills.");
  }
  elsif ($text=~/Moonstone/i){
    $client->Message(14,"With the magic of a Moonstone in your $possession\, you will be able to travel to the land where it was formed.");
  }
  elsif ($text=~/possession/i){
    $client->Message(14,"I have many of these Moonstones, I would give one to anybody who can $prove there worthiness and determination to me.");
  }
  elsif ($text=~/prove/i){
    $client->Message(14,"I have two quests for you, the $first quest is for Moonstones in Antonica, Odus, Faydwer, and Kunark. The $second is for the Moonstone of the Ice.");
  }
  elsif ($text=~/second/i){ 
      if (($race eq 'Wood Elf') | ($race eq 'High Elf') | ($race eq 'Dwarf') | ($race eq 'Gnome')){ #Fayder
	 $client->Message(14,"Go to the Castle Mistmoore in Lesser Faydark, and bring me the proof I want: bring me the blood from a Fallen Noble");
      }
      elsif (($race eq 'Human') | ($race eq 'Dark Elf') | ($race eq 'Barbarian') | ($race eq 'Half Elf') | ($race eq 'Troll') | ($race eq 'Ogre') | ($race eq 'Halfling')){ #Antonica
	$client->Message(14,"Go to the Accursed Temple of Cazic-Thule in the Feerrott, and bring me the proof I want: bring me a Mosquito Earring from The Infected Mosquito");
      }
      elsif (($race eq 'Iksar') | ($race eq 'Froglok')){ #Kunark
	$client->Message(14,"Go to the Crypt of Dalnir in Warsliks Woods, and bring me the proof I want: bring me the Battle Plans from a kly evoker");
      } 
      elsif (($race eq 'Vah Shir') | ($race eq 'Erudite') | ($race eq 'Human') | ($race eq 'Dark Elf')){ #Odus
	$client->Message(14,"Go to Stonebrunt Mountains in Odus, and bring me the proof I want: bring me a Leopard Fang from a kejek leopard");
      }
  }
  elsif ($text=~/first/i){
      if (($race eq 'Wood Elf') | ($race eq 'High Elf') | ($race eq 'Dwarf') | ($race eq 'Gnome')){ #Fayder
	$client->Message(14,"Go to Dagnor's Cauldron in Butcher Block, and bring me the proof I want: bring me the Water Ring from an aqua goblin.");
      }
      elsif (($race eq 'Human') | ($race eq 'Dark Elf') | ($race eq 'Barbarian') | ($race eq 'Half Elf') | ($race eq 'Troll') | ($race eq 'Ogre') | ($race eq 'Halfling')){ #Antonica
	$client->Message(14,"Go to Rathe Mountains in Antonica, and bring me the proof I want: bring me Bone Barbs from a barbed bone skeleton");
      }
      elsif (($race eq 'Iksar') | ($race eq 'Froglok')){ #Kunark
	$client->Message(14,"Go to the Lake of Ill Omen in Kunark, and bring me the proof I want: bring me a Tattooed Sarnak Head  from a Sarnak legionnaire");
      } 
      elsif (($race eq 'Vah Shir') | ($race eq 'Erudite') | ($race eq 'Human') | ($race eq 'Dark Elf')){ #Odus
	$client->Message(14,"Go to Erud\'s Crossing in Odus, and bring me the proof I want: bring me the tool kit from a frantic kerran.");
      }
  }
#End Moonstone - rest in EVENT_ITEM
  elsif (($text=~/reward/i) && ($charid > 5009)) { #set
    $client->Message(14,"You need to get to level 20!");
  }
  elsif ($charid < 5010){
    $client->Message(15,"Either you said the wrong thing, or you do not qualify for this Ladder.");
    $client->Message(15,"In order to qualify for this Ladder, you need to have started a character on or after the start date posted at the AX Classic forums.");
  }
}

sub EVENT_ITEM{
  if ($charid < 5010) { #set
    #quest::say("Your character ID is $charid ");
    $client->Message(14,"Your character is too old for this ladder, start a new character!");
    $client->Message(15,"This ladder began on June 19th, 2014, ending date posted at the AX Classic forums.");
    $client->Message(15,"You should start your new character on or after the starting date.");
    plugin::return_items(\%itemcount);
  }
  # Noble's Blood, Dalnir Battle Plans,Leopard Fang, Skeeter Earring
  elsif (($itemcount{1890} == 1) | ($itemcount{48058} == 1) | ($itemcount{6944} == 1) | ($itemcount{604} == 1)) {
    $client->Message(14,"Well done $name! Here is your Moonstone.");
    $client->Message(6,"You recieved the Moonstone of the Ice!");
    quest::summonitem(133);
  }
 # Darkwater's Gift
  elsif ($itemcount{119925} => 1) {
    $client->Message(14,"Welcome $name to the Rathe Ladder! Here is your Earring.");
    $client->Message(6,"You recieved the Darkwater's Gift!");
    quest::summonitem(119924);
  } 
  # Bone Barbs, Water Ring (both types),Sarnak Head,Tool Kit
  elsif (($itemcount{19037} == 1) | ($itemcount{69246} == 1) | ($itemcount{10546} == 1) | ($itemcount{12911} == 1) | ($itemcount{17057} == 1)) {
    $client->Message(14,"Well done $name! Here is your Moonstone.");
      if (($race eq 'Wood Elf') | ($race eq 'High Elf') | ($race eq 'Dwarf') |
	($race eq 'Gnome')){ #Fayder
	$client->Message(6,"You recieved the Moonstone of the Commons!");
	quest::summonitem(126);
      }
      elsif (($race eq 'Human') | ($race eq 'Dark Elf') | ($race eq 'Barbarian') |
	($race eq 'Half Elf') | ($race eq 'Troll') | ($race eq 'Ogre') | ($race eq 'Halfling')){ #Antonica
	$client->Message(6,"You recieved the Moonstone of the Faydark!");
	quest::summonitem(125);
      }
      elsif (($race eq 'Iksar') | ($race eq 'Froglok')){ #Kunark
	$client->Message(6,"You recieved the Moonstone of the Faydark!");
	quest::summonitem(125);
      }
      elsif (($race eq 'Vah Shir') | ($race eq 'Erudite') | ($race eq 'Human') |
	($race eq 'Dark Elf')){ #Odus
	$client->Message(6,"You recieved the Moonstone of the Karanas!");
	quest::summonitem(128);
      }
   }
  else{
    $client->Message(14,"Sorry, I can't use this.");
    plugin::return_items(\%itemcount);
     if($platinum != 0 || $gold !=0 || $silver != 0 || $copper != 0) {
        quest::givecash($copper, $silver, $gold, $platinum);
     }
  }
}
