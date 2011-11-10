#######################################################
##ZONE: Paineel (paineel)                            ##
##DATABASE:  AX-Classic 3.0g                         ##
##LAST EDIT DATE: Jan 2,2011                         ##
##VERSION: 1.2                                       ##
##DEVELOPER: Asram                                   ##
##REVISED: Caved                                     ##
## REVISION NOTES: Saylinks added and quest makeover ##
#######################################################
sub EVENT_SAY {
my $clothing = quest::saylink("clothing", 1);
my $important = quest::saylink("important", 1);
my $information = quest::saylink("information", 1);
my $cap = quest::saylink("Cap", 1);
my $wristband = quest::saylink("Wristband", 1);
my $gloves = quest::saylink("Gloves", 1);
my $sandals = quest::saylink("Sandals", 1);
my $sleeves = quest::saylink("Sleeves", 1);
my $pantaloons = quest::saylink("Pantaloons", 1);
my $robe = quest::saylink("Robe", 1);
if(($race == 'erudite') && ($class == 'necromancer') && ($text=~/Hail/i)) {
$client->Message(14,"Welcome to The Abattoir fellow Cazicite. I am Shwara Volerno. Mistress of Necromancy. If you have just begun to study the Necromantic arts I will assist you with obtaining some $clothing and a robe that will be most useful when conducting research outside of The Abattoirs walls. We members of the Abattoir are the most feared of the residents of Paineel by the citizens of Erudin. To venture too far beyond the safety of our city unprepared would be foolish.");
}
elsif(($race == 'erudite') && ($class == 'necromancer') && ($text=~/clothing/i)) {
$client->Message(14,"I have this Curing Kit I have been holding onto for a while now. This kit enbables me to craft a suit and robe of Abattoir Initiate Clothing. The components necessary to craft the clothing vary according to the article that you desire me to fabricate. Once you have been outfitted in the proper attire return to me and you may assist with some $important research. Do you want me to fabricate an abattoir initiate $cap\, abattoir initiate $wristband\, abattoir initiate $gloves\, abattoir initiate $sandals\, abattoir initiate $sleeves\, abattoir initiate $pantaloons\, or abattoir initiate $robe\?");
}
elsif(($race == 'erudite') && ($class == 'necromancer') && ($text=~/important/i)) {
$client->Message(14,"We Cazicites of the Abattoir are the most advanced Necromancers in all of Norrath. Our greatness is due to the diligence and studiousness we apply to our research. and our powers over fear. The foolish sorcerers in Erudin are afraid of the knowledge we possess. They fear the magic we wield and control. for their minds are too weak to harness it themselves. Despite our vast knowledge there is always more to learn that can prove to be beneficial to The Abattoir. I require your assistance in obtaining some new $information\.");
}
elsif(($race == 'erudite') && ($class == 'necromancer') && ($text=~/information/i)) {
$client->Message(14,"The Abattoir has recently discovered a Kobold Spiritist that wields necromantic powers. We believe this unusual kobold resides in the Warrens of Clan Kolbok as he has been sighted entering and exiting those ruinous caverns. It is possible that this kobold has somehow acquired this necromantic knowledge from Paineel but I would not like to rule out the possibility that it is a rare form of kobold sorcery. Find this Kobold Spiritist and bring me whatever arcane parchments you discover in his possession.");
}
elsif(($race == 'erudite') && ($class == 'necromancer') && ($text=~/cap/i)) {
$client->Message(14,"If you want me to craft a Abattoir Initiate Cap you must bring me: 2 Bricks of Crude Bronze, 1 Dusty Burlap Hood and 1 Snake Fang. Once you hand me these items I will create your very own Abattoir Initiate Cap.");
}
elsif(($race == 'erudite') && ($class == 'necromancer') && ($text=~/gloves/i)) {
$client->Message(14,"If you want me to craft Abattoir Initiate Gloves you must bring me: 2 Bricks of Crude Bronze, 1 Dusty Burlap Gloves and 1 Twilight Bloom. Once you hand me these items I will create your very own Abattoir Initiate Gloves.");
}
elsif(($race == 'erudite') && ($class == 'necromancer') && ($text=~/wristband/i)) {
$client->Message(14,"If you want me to craft a Abattoir initiate Wristband you must bring me: 1 Bricks of Crude Bronze, 1 Dusty Burlap Wristband and 1 Briar Snake Skin. Once you hand me these items I will create your very own Abattoir Initiate Wristband.");
}
elsif(($race == 'erudite') && ($class == 'necromancer') && ($text=~/sleeves/i)) {
$client->Message(14,"If you want me to craft Abattoir Initiate Sleeves you must bring me: 2 Bricks of Crude Bronze, 1 Dusty Burlap Sleeves and 1 Snake Venom Sac. Once you hand me these items I will create your very own Abattoir Initiate Sleeves.");
}
elsif(($race == 'erudite') && ($class == 'necromancer') && ($text=~/sandals/i)) {
$client->Message(14,"If you want me to craft Abattoir Initiate Sandals you must bring me: 2 Bricks of Crude Bronze, 1 Dusty Burlap Sandals and 1 Skunk Eye. Once you hand me these items I will create your very own Abattoir Initiate Sandals.");
}
elsif(($race == 'erudite') && ($class == 'necromancer') && ($text=~/pantaloons/i)) {
$client->Message(14,"If you want me to craft Abattoir Initiate Pantaloons you must bring me: 2 Bricks of Crude Bronze, 1 Dusty Burlap Pants and 1 Pixie Dust. Once you hand me these items I will create your very own Abattoir Initiate Pantaloons.");
}
elsif(($race == 'erudite') && ($class == 'necromancer') && ($text=~/robe/i)) {
$client->Message(14,"If you want me to craft a Abattoir Initiate Robe you must bring me: 2 Bricks of Crude Bronze, 1 Dusty Burlap Shirt and 1  . Once you hand me these items I will create your very own Abattoir Initiate Robe.");
}
else {
$client->Message(14,"You don't belong here $class\. Begone!!");
return 1;
	}
}

sub EVENT_ITEM {
      if(($race == 'erudite') && ($class == 'necromancer') && plugin::check_handin(\%itemcount, 20420 => 1 )) {
        $client->Message(14,"'Well done $name.These parchments will be inspected immediately by some of the Abattoir's most experienced translators and researchers. Take this Rough Abattoir initiate Staff then go forth an obtain a Giant Briar Snake Skin and a Petrified Eyeball. Once you have done so bring me those items and the rough abattoir initiate staff and I will put the final touches on what will be your new instrument of power.");
        quest::summonitem("20358");        # Rough Abattoir Initiate Staff
        quest::ding(); quest::exp(19500);                 # Experience (estimated 1/20 of level 12)
        quest::faction("56","-50");        # Craftkeepers
        quest::faction("60","-50");        # Crimson Hands
        quest::faction("143","25");        # Heretics
        quest::faction("79","-50");        # Deepwater Knights
        quest::faction("112","-50");       # Gate Callers 
      }
	 elsif(($race == 'erudite') && ($class == 'necromancer') && plugin::check_handin(\%itemcount, 20358 => 1, 20356 => 1, 20402 => 1)) {
        $client->Message(14,"'Well done $name. Rikfeer the Arcane bothers us no more! And as promised, behold your instrument of power!");
        quest::summonitem("20418");        # Abattoir Initate Staff
        quest::ding(); quest::exp(19500);                 # Experience (estimated 1/20 of level 12)
        quest::faction("56","-50");        # Craftkeepers
        quest::faction("60","-50");        # Crimson Hands
        quest::faction("143","25");        # Heretics
        quest::faction("79","-50");        # Deepwater Knights
        quest::faction("112","-50");       # Gate Callers 
	  }
	 elsif(($race == 'erudite') && ($class == 'necromancer') && plugin::check_handin(\%itemcount, 19697 => 2, 1468 => 1, 13067 => 1)) {
	    $client->Message(14,"Congratulations, $name! Your dedication and hard work is noted and appreciated. Take this cap as a reward!"); #Cap handin
		quest::ding(); quest::exp(1000);
		quest::summonitem(20333);
        quest::faction("56","-50");        # Craftkeepers
        quest::faction("60","-50");        # Crimson Hands
        quest::faction("143","25");        # Heretics
        quest::faction("79","-50");        # Deepwater Knights
        quest::faction("112","-50");       # Gate Callers 
   	 }
	 elsif(($race == 'erudite') && ($class == 'necromancer') && plugin::check_handin(\%itemcount, 19697 => 1,  1476 => 1, 20354 => 1)) {
		$client->Message(14,"Congratulations, $name! Your dedication and hard work is noted and appreciated. Take this wristband as a reward!"); #Wristband handin
		quest::ding(); quest::exp(1000);
		quest::summonitem(20334);
        quest::faction("56","-50");        # Craftkeepers
        quest::faction("60","-50");        # Crimson Hands
        quest::faction("143","25");        # Heretics
        quest::faction("79","-50");        # Deepwater Knights
        quest::faction("112","-50");       # Gate Callers  
	}
	elsif(($race == 'erudite') && ($class == 'necromancer') && plugin::check_handin(\%itemcount, 19697 =>2,  1475 => 1, 14017 => 1)) {
		$client->Message(14,"Congratulations, $name! Your dedication and hard work is noted and appreciated. Take these sleeves as a reward!"); #Sleeves handin
		quest::ding(); quest::exp(1000);
		quest::summonitem(20335);
        quest::faction("56","-50");        # Craftkeepers
        quest::faction("60","-50");        # Crimson Hands
        quest::faction("143","25");        # Heretics
        quest::faction("79","-50");        # Deepwater Knights
        quest::faction("112","-50");       # Gate Callers 
	}
	elsif(($race == 'erudite') && ($class == 'necromancer') && plugin::check_handin(\%itemcount, 19697 => 2, 1479 => 1, 27658 => 1)) {
		$client->Message(14,"Congratulations, $name! Your dedication and hard work is noted and appreciated. Take these sandals as a reward!"); #Sandals handin
		quest::ding(); quest::exp(1000);
		quest::summonitem(20336);
        quest::faction("56","-50");        # Craftkeepers
        quest::faction("60","-50");        # Crimson Hands
        quest::faction("143","25");        # Heretics
        quest::faction("79","-50");        # Deepwater Knights
        quest::faction("112","-50");       # Gate Callers 
	}
	elsif(($race == 'erudite') && ($class == 'necromancer') && plugin::check_handin(\%itemcount, 19697 => 2, 1478 => 1, 12105 => 1)) {
		$client->Message(14,"Congratulations, $name! Your dedication and hard work is noted and appreciated. Take these pantaloons as a reward!"); #Pantaloons handin
		quest::ding(); quest::exp(1000);
		quest::summonitem(20337);
        quest::faction("56","-50");        # Craftkeepers
        quest::faction("60","-50");        # Crimson Hands
        quest::faction("143","25");        # Heretics
        quest::faction("79","-50");        # Deepwater Knights
        quest::faction("112","-50");       # Gate Callers 
	}
	elsif(($race == 'erudite') && ($class == 'necromancer') && plugin::check_handin(\%itemcount, 19697 => 2, 1477 => 1, 63125 => 1)) {
		$client->Message(14,"Congratulations, $name! Your dedication and hard work is noted and appreciated. Take these gloves as a reward!"); #Gloves handin
		quest::ding(); quest::exp(1000);
		quest::summonitem(20338);
        quest::faction("56","-50");        # Craftkeepers
        quest::faction("60","-50");        # Crimson Hands
        quest::faction("143","25");        # Heretics
        quest::faction("79","-50");        # Deepwater Knights
        quest::faction("112","-50");       # Gate Callers 
	}
	elsif(($race == 'erudite') && ($class == 'necromancer') && plugin::check_handin(\%itemcount, 19697 => 2, 1471 => 1, 19660 => 1)) {
		$client->Message(14,"Congratulations, $name! Your dedication and hard work is noted and appreciated. Take this robe as a reward!"); #Robe handin
		quest::ding(); quest::exp(1000);
		quest::summonitem(20339);
        quest::faction("56","-50");        # Craftkeepers
        quest::faction("60","-50");        # Crimson Hands
        quest::faction("143","25");        # Heretics
        quest::faction("79","-50");        # Deepwater Knights
        quest::faction("112","-50");       # Gate Callers 
	}
	else {
		$client->Message(14,"I don't need this $name. Take this back.");
		plugin::return_items(\%itemcount);
		return 1;
      }
   }

