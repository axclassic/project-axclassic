# erudnext divine protectors armor
#

sub EVENT_SAY {
my $cleric = quest::saylink("cleric", 1);
my $armor = quest::saylink("armor", 1);
my $items = quest::saylink("items", 1);
my $Helm = quest::saylink("Helm", 1);
my $Bracer = quest::saylink("Bracer", 1);
my $Armguards = quest::saylink("Armguards", 1);
my $Boots = quest::saylink("Boots", 1);
my $Greaves = quest::saylink("Greaves", 1);
my $Gauntlets = quest::saylink("Gauntlets", 1);
my $Breastplate = quest::saylink("Breastplate", 1);
my $final = quest::saylink("final", 1);
  if ($text=~/hail/i) {
    quest::say("Hello, $name, are you new to this house? I do not believe we have ever met before. Allow me to introduce myself, I am Alimaja Shanthun High Priest of Erudin. If you are a $cleric I believe I might be able to help you.");
  }
  if ($text=~/cleric/i) {
    quest::say("This is great news, we have been awfully short on new talent lately and I am glad to see eager ones like yourself. All of our clerics must first go through a series of training exercises before they can truly be released into Norrath with our blessing. If you are interested in crafting your own $armor that will result from these exercises I can get you started.");
  }
  if ($text=~/armor/i) {
    quest::say("Fantastic, $name, please take this Assembly Kit. You will use this kit to assemble your armor materials but first there are many various $items you will need to collect.");
    quest::summonitem(61092);
  }
  if ($text=~/items/i) {
    quest::say("The many items that you need to locate can be found out in the forest or here in town. When you are ready to attempt a specific piece please let me know what piece you wish to craft and I will give you the necessary mold along with the recipe. I have the recipe for Divine Protector $Helms, $Bracers, $Armguards, $Boots, $Greaves, $Gauntlets and $Breastplate.");
  }
  if ($text=~/Helm/i) {
    quest::say("To create your helm material you will need to combine 2 Bricks of Crude Bronze, 1 Rat Tooth, 1 Fire Beetle Eye and 1 Water Flask in your assembly kit. Once you have created the proper material take it to a forge along with this mold to fashion your very own Divine Protector's Helm.");
    quest::summonitem(38911);
  }
  if ($text=~/Bracer/i) {
    quest::say("To create your bracer material you will need to combine 1 Brick of Crude Bronze, 2 Snake Eggs, 1 Spiderling Leg and 1 Raw Bamboo in your assembly kit. Once you have created the proper material take it to a forge along with this mold to fashion your very own Divine Protector's Bracer.");
    quest::summonitem(38907);
  }
  if ($text=~/Armguards/i) {
    quest::say("To create your armguard material you will need to combine 2 Bricks of Crude Bronze, 2 Fish Scales, 1 Fire Beetle Leg and 1 Bottle in your assembly kit. Once you have created the proper material take it to a forge along with this mold to fashion your very own Divine Protector's Armguards.");
    quest::summonitem(38908);
  }
  if ($text=~/Boots/i) {
    quest::say("To create your boot material you will need to combine 3 Bricks of Crude Bronze, 1 Kobold Skull, 1 Rat Eye and 1 Short Ale in your assembly kit. Once you have created the proper material take it to a forge along with this mold to fashion your very own Divine Protector's Boots.");
    quest::summonitem(38910);
  }
  if ($text=~/Greaves/i) {
    quest::say("To create your greaves material you will need to combine 4 Bricks of Crude Bronze, 2 Rat Teeth, 1 Kobold Head and 1 White Wine in your assembly kit. Once you have created the proper material take it to a forge along with this mold to fashion your very own Divine Protector's Greaves.");
    quest::summonitem(38913);
  }
  if ($text=~/Gauntlets/i) {
    quest::say("To create your gauntlets material you will need to combine 3 Bricks of Crude Bronze, 1 Snake Bile, 1 Skunk Scent Gland and 1 Bottle of Kalish in your assembly kit. Once you have created the proper material take it to a forge along with this mold to fashion your very own Divine Protector's Gauntlets.");
    quest::summonitem(38909);
  }
  if ($text=~/Breastplate/i) {
    quest::say("To create your breastplate material you will need to combine 5 Bricks of Crude Bronze, 1 Giant Wood Spider Thorax, 1 Spider Venom, 1 Large Briar Snake Skin, 1 Skeleton Tibia, 1 Skunk Tail in your assembly kit. Once you have created the proper material take it to a forge along with this mold to fashion your very own Divine Protector's Breastplate. Return to me for one $final task after you have completed your breastplate.");
    quest::summonitem(38912);
  }
  if ($text=~/final/i) {
    quest::say("We have been seeking someone to carry a weapon that we wish to provide all new clerics with. I do not trust simply anyone to have the first one but you have shown to me that you are willing to assist our house. If you collect a few $specific things I will present you with the magical staff that I speak of.");
  }
  if ($text=~/specific/i) {
    quest::say("I seek 1 Twilight Bloom, 1 Poachers Head, 1 Plague Rat Tail and 1 Large Fire Beetle Sternite. Bring me these items as soon as possible.");
  }
}

sub EVENT_ITEM {
  if (plugin::check_handin(\%itemcount, 63125 => 1, 13825 => 1, 9131 => 1, 19864 => 1)) {
    quest::summonitem(61097);
  }
else { 
    #do all other handins first with plugin, then let it do disciplines
    plugin::try_tome_handins(\%itemcount, $class, 'Cleric');
    plugin::return_items(\%itemcount);
    quest::say("I have no need of this, take it back.");
 }
}

# EOF zone: erudnext ID: 24099 NPC: Alimaja_Shanthun

