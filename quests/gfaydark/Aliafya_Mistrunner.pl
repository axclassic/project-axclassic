######################################
## NPC:   Aliafya_Mistrunner        ##
## Zone:  Gfaydark                  ##
## Quest: Druids Newbie Armor       ##
## Revised by caved for AXClassic   ##
## EQWorld Server     03-01-2011    ##
######################################
sub EVENT_SAY {
my $druid = quest::saylink("Druid", 1);
my $ready = quest::saylink("ready", 1);
my $components = quest::saylink("components", 1);
my $cap = quest::saylink("Caps", 1);
my $bracer = quest::saylink("Bracers", 1);
my $sleeves = quest::saylink("Sleeves", 1);
my $boots = quest::saylink("Boots", 1);
my $gloves = quest::saylink("Gloves", 1);
my $leggings = quest::saylink("Leggings", 1);
my $tunic = quest::saylink("Tunics", 1);
my $complete = quest::saylink("complete", 1);
  if(($race == 'Wood Elf') && ($class == 'druid') && ($text=~/Hail/i)) {
    $client->Message(14,"Pleased to meet you, $name, I am Aliafya Mistrunner Preserver of Nature and loyal servant of Tunare. I have resided in this guild house for many of my years. I pride myself on being a mentor to many young druids of Tunare that come up through our ranks. If you are a $druid of Tunare then I might have some work for you.");
  }
  elsif(($race == 'Wood Elf') && ($class == 'druid') && ($text=~/druid/i)) {
    $client->Message(14,"I am always pleased to see new faces amongst us indeed $name. However, I must learn if you are loyal to your house and your god by asking you to complete a series of training exercises. These tests will enable you to learn your way around this great land we call home and to pick up some very valuable hunting skills that will aid you in all of your battles to come. When you are $ready to begin your training.");
  }
  elsif(($race == 'Wood Elf') && ($class == 'druid') && ($text=~/ready/i)) {
    $client->Message(14,"I am in the posession of a Leafrunners Assembly Kit, $name. In this kit I will be able to place a number of magical $components that will be infused together to create Leafrunners Leather Armor. Please remember that the molds I have to use will cost you 1 platinum per piece, exept for the Tunic that costs 2 platinum pieces");
  }
  elsif(($race == 'Wood Elf') && ($class == 'druid') && ($text =~/components/i)) {
    $client->Message(14,"The components you will need to collect for your armor will take you to all parts of the faydark. These items can be found on some of the deadliest creatures and also on some of our most trust worthy merchants. Once you are ready to begin creating your armor pieces simply tell me what piece you want me to craft. I can create Leafrunners $cap\, $bracer\, $sleeves\, $boots\, $leggings\, $gloves and $tunic\.");
  }
  elsif(($race == 'Wood Elf') && ($class == 'druid') && ($text =~/boots/i)) {
    $client->Message(14,"If you want me to craft Boots of the Leafrunner, you need to bring me: 2 Bricks of Crude Bronze, 1 Small Cloth Sandals, 1 Elven Blood and 1 platinum piece. Once you hand me these items I will create your very own Boots of the Leafrunner.");
  }
  elsif(($race == 'Wood Elf') && ($class == 'druid') && ($text =~/bracer/i)) {
    $client->Message(14,"If you want me to craft a Bracer of the Leafrunner, you need to bring me: 1 Bricks of Crude Bronze, 1 Small Cloth Wristband, 1 Basilisk Egg and 1 platinum piece. Once you hand me these items I will create your very own Bracer of the Leafrunner.");
  }
  elsif(($race == 'Wood Elf') && ($class == 'druid') && ($text =~/cap/i)) {
    $client->Message(14,"If you want me to craft a Cap of the Leafrunner, you need to bring me: 2 Bricks of Crude Bronze, 1 Small Cloth Cap, 1 Wasp Wing and 1 platinum piece. Once you hand me these items I will create your very own Cap of the Leafrunner.");
  }
  elsif(($race == 'Wood Elf') && ($class == 'druid') && ($text =~/gloves/i)) {
    $client->Message(14,"If you want me to craft Gloves of the Leafrunner, you need to bring me: 2 Bricks of Crude Bronze, 1 Small Cloth Gloves, 1 Orc Finger Bones and 1 platinum piece. Once you hand me these items I will create your very own Gloves of the Leafrunner.");
  }
  elsif(($race == 'Wood Elf') && ($class == 'druid') && ($text =~/leggings/i)) {
    $client->Message(14,"If you want me to craft Leggings of the Leafrunner, you need to bring me: 2 Bricks of Crude Bronze, 1 Small Cloth Pants, 1 Giant Bat Fur and 1 platinum piece. Once you hand me these items I will create your very own Leggings of the Leafrunner.");
  }
  elsif(($race == 'Wood Elf') && ($class == 'druid') && ($text =~/sleeves/i)) {
    $client->Message(14,"If you want me to craft Sleeves of the Leafrunner, you need to bring me: 2 Bricks of Crude Bronze, 1 Small Cloth Sleeves, 1 Decaying Ulna and 1 platinum piece. Once you hand me these items I will create your very own Sleeves of the Leafrunner.");
  }
  elsif(($race == 'Wood Elf') && ($class == 'druid') && ($text =~/tunic/i)) {
    $client->Message(14,"If you want me to craft a Tunic of the Leafrunner, you need to bring me: 2 Bricks of Crude Bronze, 1 Small Cloth Cape, 1 Morning Dew and 2 platinum pieces. Once you hand me these items I will create your very own Tunic of the Leafrunner. When you have completed all of your armor pieces please return to me when you are ready to $complete the test of loyalty.");
  }
  elsif(($race == 'Wood Elf') && ($class == 'druid') && ($text =~/complete/i)) {
    $client->Message(14,"There have been numerous attacks mounted lately by the orcs of Clan Crushbone. With their stronghold ever so close to us it is feared that a full-scale attack could level our city and at the very least, leave many of our bretheren dead by the hands of the filthy orcs. What I ask is that you bring me the detailed battle plans that only the highest ranking orcs could be carrying. Bring me these battle plans along with 2 pairs of Crushbone Battle Beads and I will surely reward you for your trouble.");
  }
  else {
	 $client->Message(14,"I don't speak to you $class, begone!!");
     return 1;
  }
}

sub EVENT_ITEM {
     if(($race == 'Wood Elf') && ($class == 'druid') && plugin::check_handin(\%itemcount, 27537 => 2, 27538 => 1)) {
		quest::summonitem(27531);
		$client->Message(14,"There was no doubt in my mind that you could be counted on for this important mission. I will see that our tacticians get these battle plans so that they can be studied at once. Please take this Scimitar as a symbol of your dedication to your house and your god. You have done well, young Kiliak, may Tunare guide you always.");
		quest::ding(); quest::exp(200);
		quest::faction(99,10); #Faydark's Champions
		quest::faction(178,10); #King Tearis Thex
		quest::faction(43,10); #Clerics of Tunare got better. 
		quest::faction(304,10); #Soldiers of Tunare got better. 
		quest::faction(63,-10); #Crushbone Orcs got worse.
	  }
	 elsif(($race == 'Wood Elf') && ($class == 'druid') && ($platinum == 1) && plugin::check_handin(\%itemcount, 19697 => 2, 1013 => 1, 13141 => 1)) {
	    $client->Message(14,"Congratulations, $name! Your dedication and hard work is noted and appreciated. Take this cap as a reward!"); #Cap handin
		quest::ding(); quest::exp(1000);
		quest::summonitem(27516);
		quest::faction(99,10); #Faydark's Champions
		quest::faction(178,10); #King Tearis Thex
		quest::faction(43,10); #Clerics of Tunare got better. 
		quest::faction(304,10); #Soldiers of Tunare got better. 
		quest::faction(63,-10); #Crushbone Orcs got worse.
   	 }
	 elsif(($race == 'Wood Elf') && ($class == 'druid') && ($platinum == 1) && plugin::check_handin(\%itemcount, 19697 => 1,  1021 => 1, 13164 => 1)) {
		$client->Message(14,"Congratulations, $name! Your dedication and hard work is noted and appreciated. Take this bracer as a reward!"); #Bracer handin
		quest::ding(); quest::exp(1000);
		quest::summonitem(27517); 
		quest::faction(99,10); #Faydark's Champions
		quest::faction(178,10); #King Tearis Thex
		quest::faction(43,10); #Clerics of Tunare got better. 
		quest::faction(304,10); #Soldiers of Tunare got better. 
		quest::faction(63,-10); #Crushbone Orcs got worse.
	}
	elsif(($race == 'Wood Elf') && ($class == 'druid') && ($platinum == 1) && plugin::check_handin(\%itemcount, 19697 =>2, 1020  => 1, 20192 => 1)) {
		$client->Message(14,"Congratulations, $name! Your dedication and hard work is noted and appreciated. Take these sleeves as a reward!"); #Sleeves handin
		quest::ding(); quest::exp(1000);
		quest::summonitem(27518);
		quest::faction(99,10); #Faydark's Champions
		quest::faction(178,10); #King Tearis Thex
		quest::faction(43,10); #Clerics of Tunare got better. 
		quest::faction(304,10); #Soldiers of Tunare got better. 
		quest::faction(63,-10); #Crushbone Orcs got worse.
	}
	elsif(($race == 'Wood Elf') && ($class == 'druid') && ($platinum == 1) && plugin::check_handin(\%itemcount, 19697 => 2, 1024 => 1, 22515 => 1)) {
		$client->Message(14,"Congratulations, $name! Your dedication and hard work is noted and appreciated. Take these boots as a reward!"); #Boots handin
		quest::ding(); quest::exp(1000);
		quest::summonitem(27519);
		quest::faction(99,10); #Faydark's Champions
		quest::faction(178,10); #King Tearis Thex
		quest::faction(43,10); #Clerics of Tunare got better. 
		quest::faction(304,10); #Soldiers of Tunare got better. 
		quest::faction(63,-10); #Crushbone Orcs got worse.
	}
	elsif(($race == 'Wood Elf') && ($class == 'druid') && ($platinum == 1) && plugin::check_handin(\%itemcount, 19697 => 2, 1023 => 1, 13061 => 1)) {
		$client->Message(14,"Congratulations, $name! Your dedication and hard work is noted and appreciated. Take these leggings as a reward!"); #Leggings handin
		quest::ding(); quest::exp(1000);
		quest::summonitem(27520);
		quest::faction(99,10); #Faydark's Champions
		quest::faction(178,10); #King Tearis Thex
		quest::faction(43,10); #Clerics of Tunare got better. 
		quest::faction(304,10); #Soldiers of Tunare got better. 
		quest::faction(63,-10); #Crushbone Orcs got worse.
	}
	elsif(($race == 'Wood Elf') && ($class == 'druid') && ($platinum == 1) && plugin::check_handin(\%itemcount, 19697 => 2, 1022 => 1, 16178 => 1)) {
		$client->Message(14,"Congratulations, $name! Your dedication and hard work is noted and appreciated. Take these gloves as a reward!"); #Gloves handin
		quest::ding(); quest::exp(1000);
		quest::summonitem(27521);
		quest::faction(99,10); #Faydark's Champions
		quest::faction(178,10); #King Tearis Thex
		quest::faction(43,10); #Clerics of Tunare got better. 
		quest::faction(304,10); #Soldiers of Tunare got better. 
		quest::faction(63,-10); #Crushbone Orcs got worse.
	}
	elsif(($race == 'Wood Elf') && ($class == 'druid') && ($platinum == 2) && plugin::check_handin(\%itemcount, 19697 => 2, 1018 => 1, 16594 => 1)) {
		$client->Message(14,"Congratulations, $name! Your dedication and hard work is noted and appreciated. Take this tunic as a reward!"); #Tunic handin
		quest::ding(); quest::exp(1000);
		quest::summonitem(27522);
		quest::faction(99,10); #Faydark's Champions
		quest::faction(178,10); #King Tearis Thex
		quest::faction(43,10); #Clerics of Tunare got better. 
		quest::faction(304,10); #Soldiers of Tunare got better. 
		quest::faction(63,-10); #Crushbone Orcs got worse.
	}
    else {
        $client->Message(14,"I don't need this $name. Take it back.");
        plugin::return_items(\%itemcount);
	    return 1;
	}
}

