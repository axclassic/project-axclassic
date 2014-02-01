######################################
## NPC: High Priestess Alexandria   ##
## Zone: NeriakC                    ##
##  Cleric Newbie Quests            ##
## Revised by caved for EQWorld     ##
## EQWorld Server     11-12-2010    ##
######################################
sub EVENT_SAY {
my $cleric = quest::saylink("Cleric", 1);
my $interested = quest::saylink("interested", 1);
my $magical = quest::saylink("magical", 1);
my $helms = quest::saylink("Helms", 1);
my $armguards = quest::saylink("Armguards", 1);
my $bracers = quest::saylink("Bracers", 1);
my $greaves = quest::saylink("Greaves", 1);
my $boots = quest::saylink("Boots", 1);
my $trousers = quest::saylink("Trousers", 1);
my $gauntlets = quest::saylink("Gauntlets", 1);
my $breastplates = quest::saylink("Breastplates", 1);
my $important = quest::saylink("important", 1);
my $final = quest::saylink("final", 1);

  if($text=~/Hail/i) {
    $client->Message(14,"Greetings child, what business do you have here? I'm sorry but I will only deal with Clerics that are willing to prove their loyalty to Innoruuk. I cannot deal with every single heathen that feels it is necessary to bid me a good day. If you are of Innoruuk I might be able to aid you in your training for your mercenary $cleric or yourself.");
 }
  if(($text=~/Cleric/i && $race eq 'Dark Elf')){ 
       $client->Message(14,"Is that so $race $name. Well from the looks of you I wouldn't say you are much of anything yet. However, if you have the willingness and determination to serve your God then there might just be more hope for you then I would have thought. Obviously, to move forward in your training, you will need to shield yourself from your enemies and from the elements. I believe I have something that could help you if you are still $interested in proving yourself");
}
  if(($text=~/interested/i && $race eq 'Dark Elf')) {
       $client->Message(14,"Well I must say that I am impressed by your eagerness to learn, however, you are not the first and will not be the last I am sure that has sworn devotion to our Lord Innoruuk. Lets just hope you don't end up in the burial grounds where many promising young ones before you have found their resting place. If you are ready to begin gathering items so I can craft Initiate Darkpriest Armor for you then I will use my $magical relic once again.");
  } 
  if(($text=~/magical/i && $race eq 'Dark Elf')) {
       $client->Message(14,"I have a box that I have been keeping for quite some time. I use it to craft armour. This magical box can be used to refine certain metals into a magical compound that is used in crafting Initiate Darkpriest armor pieces. I have the molds necessary to craft Initiate Darkpriest $helms, $bracers, $boots, $armguards, $greaves, $gauntlets and $breastplates. However there are some $important items that you will need to collect before the molds will be of any use to you. One thing to keep in mind is that I suggest you let me craft your Breastplate last due to the difficulty of obtaining the items needed for that specific recipe. Also bear in mind that the molds needed are 1 platinum pieces each, exept for the breastplate that mold costs 2 platinum.");

 } 
  if(($text=~/important/i && $race eq 'Dark Elf')) {
        $client->Message(14,"There are certain items that will need to be gathered in our great city of Neriak along with many different things gathered outside in the Forest of Nektulos, where most of your training will take place. The most important component that you will need to collect while adventuring in the forest are Helms that are only worn by Priests of Rodcet Nife. These vile creatures have set up camp in the forest from what I have heard and it is your responsibility to find and execute them. These helms will be your most important component that you will gather because I have to use it in all armor recipes, as the metal that I will forge your armor with.");
  } 

 if(($text=~/Armguards/i && $race eq 'Dark Elf'))  {
        $client->Message(14,"Excellent $name! To create the correct compound in my Dark Blessed Box to craft your Initiate Darkpriest's Armguards you will need to collect the following items. 2 Helms of the Lifebringer, 1 Garter Snake Tongue, 1 Ash Drakeling Scales and 1 Platinum piece.");

  }
 if(($text=~/Boots/i && $race eq 'Dark Elf'))  {
        $client->Message(14,"I would definitely agree that you will need some decent Boots if you wish to last long in any extreme climates like Lavastorm! Get me: 2 Helms of the Lifebringer, 1 Greater Lightstone and 1 Halfling Ulna and 1 platinum piece so I can craft your Initiate Darkpriest's Boots.");

  }
 if(($text=~/Bracer/i && $race eq 'Dark Elf'))  {
        $client->Message(14,"For me to craft your own Initiate Darkpriest's Bracer you will need to collect 1 Helm of the Lifebringer, 1 Deathfist Templar Scalp, 1 Snake Egg and 1 Platinum piece. Hand these to me to craft your Initiate Darkpriest`s Bracer.");

  }
 if(($text=~/Breastplate/i && $race eq 'Dark Elf'))  {
        $client->Message(14,"So, the time has come for you to gather the items necessary for your most important piece of Armor $name. You will need to bring me: 2 Helms of the Lifebringer, 1 Orc Humerus, 1 Embalming Dust and 2 pieces of platinum. Once I get these I will craft your Initiate Darkpriest's Breastplate, I would like to ask you to do 1 $final task for me to proof your loyalty.");

    } 
 if(($text=~/Gauntlets/i && $race eq 'Dark Elf'))  {
        $client->Message(14,"For me to craft your Initiate Darkpriest's Gauntlets you will need to collect and bring me: 2 Helms of the Lifebringer, 1 Halfling Finger Bone, 1 Dry Eye Weed and 1 platinum piece. Then I can craft your Initiate Darkpriest's Gauntlets.");

} 
 if(($text=~/Greaves/i && $race eq 'Dark Elf'))  {
        $client->Message(14,"Ah $name. You came back for your your Initiate Darkpriest's Greaves? The correct components for me to make the Refined sheet of Holy Metal to craft these greaves are: 2 Helms of the Lifebringer, 1 Spiderling Eyes, 1 Deathfist Legionnaire Scalps and 1 platinum piece.");

  } 
   if(($text=~/Helm/i && $race eq 'Dark Elf'))  {
       $client->Message(14,"A Helm you say $name? This should be a good test for you to see if you are able to gather the correct items and annihilate those disgusting clerics that follow that worthless God Rodcet Nife. Get me: 2 Helms of the Lifebringer, 1 Low Quality Wolf Skin, 1 Black Mamba Skin and 1 platinum piece. After you have gotten me these I craft your Initiate Darkpriest`s Helmet.");

  } 
  if(($text=~/final/i && $race eq 'Dark Elf')){ 
       $client->Message(14,"Well, I must say that I did not expect you to progress in your training at the rate you have. I also knew there was something that separated you from our other initiates. For your final test, I will need you to collect journal pages from the Ultricle. Provide me with three journal pages to receive your reward. You have come too far to fail me now. I hope to see you soon...alive, that is.");
  }     
}

sub EVENT_ITEM {
if (plugin::check_handin(\%itemcount, 22617 => 1, 22618 => 1, 22619 => 1)) {
        $client->Message(14,"Your prowess both in the classroom and on the battlefield has certainly amazed me. Please take this relic that is only presented to the most dedicated initiates and carry it with pride. You have made your house very proud on this day.");
        quest::summonitem(22698); #Mace of the Darkpriest
		quest::faction(177, 10);#King Naythox Thex
		quest::faction(256, 10);#Priests of Innoruuk
		quest::faction(43, -30);#Clerics of Tunare
		quest::faction(257, -30);#Priests of Life
		quest::faction(258, -30);#Priests of Marr
	}
    elsif(($platinum == 1) && plugin::check_handin(\%itemcount, 22601  => 2, 13753 => 1, 16166 => 1)) {
        $client->Message(14,"Very good, $name!  Here is your very own Initiate Darkpriest Helmet"); #helm turnin
        quest::ding(); quest::exp(1000);
        quest::summonitem(22603);
		quest::faction(177, 10);#King Naythox Thex
		quest::faction(256, 10);#Priests of Innoruuk
		quest::faction(43, -30);#Clerics of Tunare
		quest::faction(257, -30);#Priests of Life
		quest::faction(258, -30);#Priests of Marr
    }
    elsif(($platinum == 1) && plugin::check_handin(\%itemcount, 22601  => 1, 16173 => 1, 13088 => 1)) {
        $client->Message(14,"Very good, $name! Here is your very own Initiate Darkpriest Bracer"); #bracer turnin
        quest::ding(); quest::exp(1000);
        quest::summonitem(22604);
		quest::faction(177, 10);#King Naythox Thex
		quest::faction(256, 10);#Priests of Innoruuk
		quest::faction(43, -30);#Clerics of Tunare
		quest::faction(257, -30);#Priests of Life
		quest::faction(258, -30);#Priests of Marr
	}
    elsif(($platinum == 1) && plugin::check_handin(\%itemcount, 22601  => 2, 10400 => 1, 16189 => 1)) {
        $client->Message(14,"Very good, $name! Here is your very own Initiate Darkpriest Boots"); #boots turnin
        quest::ding(); quest::exp(1000);
        quest::summonitem(22605);
		quest::faction(177, 10);#King Naythox Thex
		quest::faction(256, 10);#Priests of Innoruuk
		quest::faction(43, -30);#Clerics of Tunare
		quest::faction(257, -30);#Priests of Life
		quest::faction(258, -30);#Priests of Marr
	}
   elsif(($platinum == 1) && plugin::check_handin(\%itemcount, 22601  => 2, 16168 => 1, 19575 => 1)) {
        $client->Message(14,"Very good, $name! Here are your very own Initiate Darkpriest Armguards"); #armguards turnin
        quest::ding(); quest::exp(1000);
        quest::summonitem(22606);
		quest::faction(177, 10);#King Naythox Thex
		quest::faction(256, 10);#Priests of Innoruuk
		quest::faction(43, -30);#Clerics of Tunare
		quest::faction(257, -30);#Priests of Life
		quest::faction(258, -30);#Priests of Marr
	}
  elsif(($platinum == 1) && plugin::check_handin(\%itemcount, 22601  => 2, 13253 => 1, 16172 => 1)) {
        $client->Message(14,"Very good, $name! Here are your very own Initiate Darkpriest Greaves"); #greaves turnin
        quest::ding(); quest::exp(1000);
        quest::summonitem(22607);
		quest::faction(177, 10);#King Naythox Thex
		quest::faction(256, 10);#Priests of Innoruuk
		quest::faction(43, -30);#Clerics of Tunare
		quest::faction(257, -30);#Priests of Life
		quest::faction(258, -30);#Priests of Marr
	}
   elsif(($platinum == 1) && plugin::check_handin(\%itemcount, 22601  => 2, 16182 => 1, 63093 => 1)) {
        $client->Message(14,"Very good, $name! Here are your very own Initiate Darkpriest Gauntlets"); #gauntlets turnin
        quest::ding(); quest::exp(1000);
        quest::summonitem(22608);
		quest::faction(177, 10);#King Naythox Thex
		quest::faction(256, 10);#Priests of Innoruuk
		quest::faction(43, -30);#Clerics of Tunare
		quest::faction(257, -30);#Priests of Life
		quest::faction(258, -30);#Priests of Marr
	}
  elsif(($platinum == 2) && plugin::check_handin(\%itemcount, 22601  => 2, 16194 => 1, 16990 => 1)) {
        $client->Message(14,"Very good, $name! Here is your very own Initiate Darkpriest Breastplate. Don't forget i have 1 $final task for you!"); #breastplate turnin
        quest::ding(); quest::exp(1000);
        quest::summonitem(22609);
		quest::faction(177, 10);#King Naythox Thex
		quest::faction(256, 10);#Priests of Innoruuk
		quest::faction(43, -30);#Clerics of Tunare
		quest::faction(257, -30);#Priests of Life
		quest::faction(258, -30);#Priests of Marr
	}
  else {
    $client->Message(14,"$name, I don't need this. Take it back."); #return bogus items 
    plugin::return_items(\%itemcount);
    return 1;
  }
}

