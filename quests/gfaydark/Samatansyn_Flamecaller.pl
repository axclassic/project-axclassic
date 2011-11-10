######################################
## NPC: Samatansyn Flamecaller      ##
## Zone: Gfaydark                   ##
##  Ranger Newbie Armor Quest       ##
##                                  ##
## Revised by caved for AXClassic   ##
## EQWorld Server     03-01-2011    ##
######################################
sub EVENT_SAY {
my $training = quest::saylink("training", 1);
my $ranger = quest::saylink("ranger", 1);
my $components = quest::saylink("components", 1);
my $coif = quest::saylink("Coif", 1);
my $bracer = quest::saylink("Bracers", 1);
my $sleeves = quest::saylink("Sleeves", 1);
my $boots = quest::saylink("Boots", 1);
my $legplates = quest::saylink("Legplates", 1);
my $gauntlet = quest::saylink("Gauntlets", 1);
my $tunic = quest::saylink("Tunics", 1);
my $favor = quest::saylink("favor", 1);
my $retrieve = quest::saylink("retrieve", 1);
if(($race == 'Wood Elf') && ($class == 'ranger') && ($text =~/Hail/i)) {
	$client->Message(14,"It is a pleasure to meet you $name, I am Samatansyn Flamecaller, Warder of Tunare and Guildmaster of Faydarks Champions. I have studied here for many of my years until recently when I took up teaching. I have many pupils that undergo my vigorous $training exercises.");
}
elsif(($race == 'Wood Elf') && ($class == 'ranger') && ($text=~/training/i)) {
	$client->Message(14,"I have a series of tests that all new rangers of Kelethin are suggested to participate in. These tests will help you develop many of your skills including hunting and gathering and will also provide you with a chance to get your own Trueshot Chainmail. If you are a $ranger of Tunare and are willing to begin your training I will be happy to explain to you how the tests work.");
}
elsif(($race == 'Wood Elf') && ($class == 'ranger') && ($text=~/ranger/i)) {
	$client->Message(14,"Excellent $name, then lets get started! I am the proud owner of a Trueshot Assembly Kit. I will gladly use my kit to craft some high quality armor for you... Simply tell me what armor piece you want me to craft and I can provide you with the patterns for Trueshot Chainmail $coif\, $bracer\, $sleeves\, $boots\, $legplates\, $gauntlet and $tunic\. The patterns will cost you 1 platinum per piece exept for the Tunic, that will cost 2 platinum pieces.");
}
elsif(($race == 'Wood Elf') && ($class == 'ranger') && ($text=~/coif/i)) {
	$client->Message(14,"If you want me to craft a Trueshot Coif you will need to bring me: 2 Bricks of Crude Bronze, 1 Small Cloth Cap, 1 Golen Bandit Tooth and 1 Platinum piece. Once you hand me these items I will create your very own Trueshot Coif.");
}
elsif(($race == 'Wood Elf') && ($class == 'ranger') && ($text=~/bracer/i)) {
	$client->Message(14,"If you want me to craft a Trueshot Chainmail Bracer you will need to bring me: 1 Brick of Crude Bronze, 1 Small Cloth Wristband, 1 Coyote Skull and 1 Platinum piece. Once you hand me these items I will create your very own Trueshot Chainmail Bracer.");
}
elsif(($race == 'Wood Elf') && ($class == 'ranger') && ($text=~/sleeves/i)) {
	$client->Message(14,"If you want me to craft Trueshot Chainmail Sleeves you will need to bring me: 2 Brick of Crude Bronze, 1 Small Cloth Sleeves, 1 Royal Jelly and 1 Platinum piece. Once you hand me these items I will create your very own Trueshot Chainmail Sleeves.");
}
elsif(($race == 'Wood Elf') && ($class == 'ranger') && ($text=~/boots/i)) {
	$client->Message(14,"If you want me to craft Trueshot Chainmail Boots you will need to bring me: 2 Brick of Crude Bronze, 1 Small Cloth Sandals, 1 Orc Scalp and 1 Platinum piece. Once you hand me these items I will create your very own Trueshot Chainmail Boots.");
}
elsif(($race == 'Wood Elf') && ($class == 'ranger') && ($text=~/legplates/i)) {
	$client->Message(14,"If you want me to craft Trueshot Chainmail Legplates you will need to bring me: 2 Brick of Crude Bronze, 1 Small Cloth Pants, 1 Basilisk Hatchling Hide and 1 Platinum piece. Once you hand me these items I will create your very own Trueshot Chainmail Legplates.");
}
elsif(($race == 'Wood Elf') && ($class == 'ranger') && ($text=~/gauntlet/i)) {
	$client->Message(14,"If you want me to craft Trueshot Chainmail Gauntlets you will need to bring me: 2 Brick of Crude Bronze, 1 Small Cloth Gloves, 1 Large Sylvan Bat Fur and 1 Platinum piece. Once you hand me these items I will create your very own Trueshot Chainmail Gauntlets.");
}
elsif(($race == 'Wood Elf') && ($class == 'ranger') && ($text=~/tunic/i)) {
	$client->Message(14,"If you want me to craft a Trueshot Chainmail Tunic you will need to bring me: 2 Brick of Crude Bronze, 1 Small Cloth Cape, 1 Spider Venom Sac and 2 Platinum pieces. Once you hand me these items I will create your very own Trueshot Chainmail Tunic. Please return to me after you have completed your tunic, for I have one final $favor to ask of you.");
}
elsif(($race == 'Wood Elf') && ($class == 'ranger') && ($text=~/favor/i)) {
	$client->Message(14,"I have received word that there are numerous elves being held hostage in the confines of Clan Crushbone, beaten and forced to perform slave work under horrible conditions. There is believed to be a specific Orc that patrols the jail cells that has a master key in his possession for all of the elven hostages. If you were to retrieve this master key for me I would possibly be able to make copies of it and distribute them to my task force so that we may attempt to rescue our helpless bretheren. Will you $retrieve the master key?");
}
elsif(($race == 'Wood Elf') && ($class == 'ranger') && ($text=~/retrieve/i)) {
	$client->Message(14,"Excellent news, I was afraid I would not be able to find someone willing to help. Please bring me the master key along with 2 Orc Eyes and I shall craft you a long sword worthy of your great deeds.");
}
else {
	 $client->Message(14,"I don't speak to you $class, begone!!");
     return 1;
	}
}

sub EVENT_ITEM {
	 if(($race == 'Wood Elf') && ($class == 'ranger') && plugin::check_handin(\%itemcount, 13266 => 2, 27539 => 1)) {
		$client->Message(14,"Well done, $name! Now we will be able to free more of our brothers and sisters from the orcs! Take this, as promised, a fine weapon with which to slay more orcs!!");
		quest::summonitem(27532); #Faydark Champions Long Sword
		quest::ding(); quest::exp(7000);
		quest::faction(99,10); #Faydark's Champions
		quest::faction(178,10); #King Tearis Thex
		quest::faction(43,10); #Clerics of Tunare got better. 
		quest::faction(304,10); #Soldiers of Tunare got better. 
		quest::faction(63,-10); #Crushbone Orcs got worse.
	 }
	 elsif(($race == 'Wood Elf') && ($class == 'ranger') && ($platinum == 1) && plugin::check_handin(\%itemcount, 19697 => 2, 1013 => 1, 27410 => 1)) {
	    $client->Message(14,"Congratulations, $name! Your dedication and hard work is noted and appreciated. Take this coif as a reward!"); #Coif handin
		quest::ding(); quest::exp(1000);
		quest::summonitem(27509);
		quest::faction(99,10); #Faydark's Champions
		quest::faction(178,10); #King Tearis Thex
		quest::faction(43,10); #Clerics of Tunare got better. 
		quest::faction(304,10); #Soldiers of Tunare got better. 
		quest::faction(63,-10); #Crushbone Orcs got worse.
   	 }
	 elsif(($race == 'Wood Elf') && ($class == 'ranger') && ($platinum == 1) && plugin::check_handin(\%itemcount, 19697 => 1, 1021 => 1, 9130 => 1)) {
		$client->Message(14,"Congratulations, $name! Your dedication and hard work is noted and appreciated. Take this bracer as a reward!"); #Bracer handin
		quest::ding(); quest::exp(1000);
		quest::summonitem(27510); 
		quest::faction(99,10); #Faydark's Champions
		quest::faction(178,10); #King Tearis Thex
		quest::faction(43,10); #Clerics of Tunare got better. 
		quest::faction(304,10); #Soldiers of Tunare got better. 
		quest::faction(63,-10); #Crushbone Orcs got worse.
	 }
	 elsif(($race == 'Wood Elf') && ($class == 'ranger') && ($platinum == 1) && plugin::check_handin(\%itemcount, 19697 =>2, 1020 => 1, 13145 => 1)) {
		$client->Message(14,"Congratulations, $name! Your dedication and hard work is noted and appreciated. Take these sleeves as a reward!"); #Sleeves handin
		quest::ding(); quest::exp(1000);
		quest::summonitem(27511);
		quest::faction(99,10); #Faydark's Champions
		quest::faction(178,10); #King Tearis Thex
		quest::faction(43,10); #Clerics of Tunare got better. 
		quest::faction(304,10); #Soldiers of Tunare got better. 
		quest::faction(63,-10); #Crushbone Orcs got worse.
	 }
	 elsif(($race == 'Wood Elf') && ($class == 'ranger') && ($platinum == 1) && plugin::check_handin(\%itemcount, 19697 => 2, 1024 => 1, 13791 => 1)) {
		$client->Message(14,"Congratulations, $name! Your dedication and hard work is noted and appreciated. Take these boots as a reward!"); #Boots handin
		quest::ding(); quest::exp(1000);
		quest::summonitem(27512);
		quest::faction(99,10); #Faydark's Champions
		quest::faction(178,10); #King Tearis Thex
		quest::faction(43,10); #Clerics of Tunare got better. 
		quest::faction(304,10); #Soldiers of Tunare got better. 
		quest::faction(63,-10); #Crushbone Orcs got worse.
	 }
	 elsif(($race == 'Wood Elf') && ($class == 'ranger') && ($platinum == 1) && plugin::check_handin(\%itemcount, 19697 => 2, 1023 => 1, 16170 => 1)) {
		$client->Message(14,"Congratulations, $name! Your dedication and hard work is noted and appreciated. Take these legplates as a reward!"); #Legplates handin
		quest::ding(); quest::exp(1000);
		quest::summonitem(27513);
		quest::faction(99,10); #Faydark's Champions
		quest::faction(178,10); #King Tearis Thex
		quest::faction(43,10); #Clerics of Tunare got better. 
		quest::faction(304,10); #Soldiers of Tunare got better. 
		quest::faction(63,-10); #Crushbone Orcs got worse.
	 }
	 elsif(($race == 'Wood Elf') && ($class == 'ranger') && ($platinum == 1) && plugin::check_handin(\%itemcount, 19697 => 2, 1022 => 1, 20272 => 1)) {
		$client->Message(14,"Congratulations, $name! Your dedication and hard work is noted and appreciated. Take these gauntlets as a reward!"); #Gauntlets handin
		quest::ding(); quest::exp(1000);
		quest::summonitem(27514);
		quest::faction(99,10); #Faydark's Champions
		quest::faction(178,10); #King Tearis Thex
		quest::faction(43,10); #Clerics of Tunare got better. 
		quest::faction(304,10); #Soldiers of Tunare got better. 
		quest::faction(63,-10); #Crushbone Orcs got worse.
	 }
  	 elsif(($race == 'Wood Elf') && ($class == 'ranger') && ($platinum == 2) && plugin::check_handin(\%itemcount, 19697 => 2, 1018 => 1, 14018 => 1)) {
		$client->Message(14,"Congratulations, $name! Your dedication and hard work is noted and appreciated. Take this tunic as a reward!"); #Tunic handin
		quest::ding(); quest::exp(1000);
		quest::summonitem(27515);
		quest::faction(99,10); #Faydark's Champions
		quest::faction(178,10); #King Tearis Thex
		quest::faction(43,10); #Clerics of Tunare got better. 
		quest::faction(304,10); #Soldiers of Tunare got better. 
		quest::faction(63,-10); #Crushbone Orcs got worse.
	 }
     else {
     $client->Message(14,"$name, I don't need this. Take it back."); #return bogus items
     plugin::return_items(\%itemcount);
     plugin::try_tome_handins(\%itemcount, $class, 'Ranger');
     return 1;
	}
}

