#############
#Quest Name: Crovsar Dirkbringer
#Author: Revisionary5
#NPCs Involved: Crovsar Dirkbringer
#Items Involved: Sharpened Mining Pick, Apprentice Miners Armor, Rogue Tunic
#zone: North Kaladim

sub EVENT_SAY {
  if($text=~/Hail/i){
    quest::say("Gud to meet ye there $name. Me names Crovsar Dirkbringer and I run dis here mining operation. Anyone else that tell ye different simply aint telling da truth! I like to spend most of me time minin but I also like to help our young miners pick dere way to glory as a great rogue! Er I mean a great miner! Aye, dats it. If ye are a [young minin rogue] of Kaladim den I might just have some things for ye to do.");
  }
  if($text=~/young minin rogue/i){
    quest::say("A young rogue ye say ye is eh $name? Well den If`n yer ready to git your hands dirty and yer pockets full I will be happy to explain to you the [training exercises] dat I have our new recruits all undergo to earn dere keep in dese here mines!");
  }
  if($text=~/training exercises/i){
    quest::say("Well den it must be obvious that not just any young miner can git his things and venture out into da world without the proper armor to protect dem Aye? Dis is why I have developed training exercises dat will test both yer fightin and collectin skills and will in da end yield you a full set of Apprentice Miners Chainmail! Now makin da armor will nat be hard at all because I will be able to give you the tools necessary to craft da armor pieces once you have created da correct [armor materials].");
  }
  if($text=~/armor materials/i){
    quest::say("Now were talkin! I can see dat ye are very interested in carving yer way into da Kaladim history books so lets git started. First off you will use this Dusty Mail Assembly Kit to collect various magical items that can be combined in da kit to create the armor materials that I spoke of earlier. You will then take the material to a forge along with patterns that I will present ye with to create da specific armor piece ye asked for. When ye are ready simply say what armor piece ye [want] to craft and I can provide ye with the armor material recipes and patterns for Apprentice Miners [Coifs], [Bracers], [Sleeves], [Boots], [Legplates], [Gauntlets] and [Tunics].");
    quest::summonitem(17247);
  }
  if($text=~/I want to craft coifs/i){
    quest::say("Crovsar Dirkbringer says 'To create your coif material you will need to combine 2 Bricks of Crude Bronze, 1 Skunk Scent Gland, 1 Snake Scale and 1 Mead in your assembly kit. Once you have created the proper material take it to a forge along with this mold to fashion your very own Apprentice Miners Coif.'");
    quest::summonitem(19631);
  }
  if($text=~/I want to craft bracers/i){
    quest::say("To create your bracer material you will need to combine 1 Bricks of Crude Bronze, 1 Orc Scoutsmans Wrist Pouch, 1 Towering Brute War Helm and 1 Bandage in your assembly kit. Once you have created the proper material take it to a forge along with this mold to fashion your very own Apprentice Miners Bracer.'");
    quest::summonitem(19632);
  }
  if($text=~/I want to craft sleeves/i){
    quest::say("To create your sleeves material you will need to combine 2 Bricks of Crude Bronze, 2 Giant Bat Fur, 1 Spider Legs and 1 Giant Scarab Egg Sack in your assembly kit. Once you have created the proper material take it to a forge along with this mold to fashion your very own Apprentice Miners Sleeves.'");
    quest::summonitem(19635);
  }
  if($text=~/I want to craft boots/i){
    quest::say("To create your boots material you will need to combine 3 Bricks of Crude Bronze, 1 Cracked Giant Scarab Carapace, 2 Runny Eye Warbeads and 1 Snake Scale and 1 Spiderling Silk in your assembly kit. Once you have created the proper material take it to a forge along with this mold to fashion your very own Apprentice Miners Boots.'");
    quest::summonitem(19634);
  }
  if($text=~/I want to craft legplates/i){
    quest::say("To create your legplates material you will need to combine 4 Bricks of Crude Bronze, 1 Symbol of Hatred, 1 Aqua Goblin Tongue and 1 Severed Greenblood Finger in your assembly kit. Once you have created the proper material take it to a forge along with this mold to fashion your very own Apprentice Miners Legplates.'");
    quest::summonitem(19636);
  }
  if($text=~/I want to craft gauntlets/i){
    quest::say("To create your gauntlets material you will need to combine 3 Bricks of Crude Bronze, 1 Barmas Tongue, 1 Aqua Goblin Headdress, 1 Goblin Parts and 1 Dwarven Bandit Coinpurse in your assembly kit. Once you have created the proper material take it to a forge along with this mold to fashion your very own Apprentice Miners Gauntlets.'");
    quest::summonitem(19633);
  }
  if($text=~/I want to craft tunics/i){
    quest::say("To create your tunic material you will need to combine 5 Bricks of Crude Bronze, 1 Enraged Goblin Beads, 1 Pristine Forest Drakeling Scale, 1 Golden Bandit Tooth, 1 Basilisk Tongue and 1 Goblin Parts in your assembly kit. Once you have created the proper material take it to a forge along with this mold to fashion your very own Apprentice Miners Tunic. When ye finish yer tunic come on back fer I got one more [assignment] for a miner that I know I can trust!'");
    quest::summonitem(19637);
  }
  if($text=~/What assignment/i){
    quest::say("Well da assignment is simple Gilborn. I jess simply need ye to fetch me some items that I need to create a minin pick dat I plan on distributing to all da new miners around dese parts dat pass my exercises, much like yerself. If you would like to help me [collect the items] I need I could perhaps fix ye up one of dese first minin picks. Whatta ya say dere Gilborn?'");
  }
  if($text=~/collect the items/i){
    quest::say("Das great news to hear indeed! Please seek out 1 Aqua Goblin Backbone and 2 Pristine Skunk Claws and I will surely reward ye for yer trouble. I hope to see ye soon!' ");
  }
}

sub EVENT_ITEM {
if (plugin::check_handin(\%itemcount, 18767 => 1)) {
    #unable to locate real reward text.
    quest::say("You have done well $name, here is your reward.");
    quest::summonitem(13516);
    quest::exp(100);
  }
  if (plugin::check_handin(\%itemcount, 28067 => 1, 28068 => 2)) {
    #unable to locate real reward text.
    quest::say("You have done well $name, here is your reward.");
    quest::summonitem(26078);
    quest::exp(7000);

  } else {
    #Do all other handins first With plugin, then let it Do disciplines
    plugin::try_tome_handins(\%itemcount, $class, 'Rogue');
    plugin::return_items(\%itemcount);
  }
}
#End of FILE Zone:kaladimb  ID:67003 -- Crovsar_Dirkbringer
