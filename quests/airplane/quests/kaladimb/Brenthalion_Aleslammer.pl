sub EVENT_SAY{
	if($text=~/Hail/i){
		quest::say("Lo dere $name! I be Brenthalion Aleslammer Holy Defender of Brell! I can see that ye found my temple of Brell that I have resided over for many years. I have been appointed by da King Kazon himself to make sure dat all our young paladins get da [training] dey need before dey go out to explore da world. Aye.");
	}
	if($text=~/training/i){
		quest::say("Ye see $name, learning all the correct fighting tactics along with learning your way around your homeland can be no easy task for a young one new to Kaladim. That is why I have developed a series of training exercises that help me monitor our young ones as they progress through the ranks of the Paladin on their path to true enlightenment! If you are a [young paladin of Brell] I would be happy to explain to you how the exercises work and I would also recommend that you take part in them!");
	}
	if($text=~/am a young paladin of Brell/i){
		quest::say("Well I would be lyin if`n hearing dose words didn't bring a smile to me face every time that I hear dem. First thing you will need a Magical Mail Assembly Kit that you will use to combine different magical items in that will create an armor material. Once you have created a armor material you can then take it to a forge along with a armor mold to fashion an armor piece. If you are able to collect all the items for them you will have the potential to make a full set of Underfoot Defenders Platemail! If`n ye are [ready to begin] collecting yer items I will be happy to give you your Magical Mail Assembly Kit and git you started!");
	}
	if($text=~/I am ready to begin/i){
		quest::say("Excellent $name! Here is your Magical Mail Assembly Kit. Once you are ready to collect the items for a specific armor piece simply tell me what piece of Underfoot Defenders Platemail that you [want] to craft. I can provide you with the material recipe and enchanted armor molds for Underfoot Platemail [Helms], [Bracers], [Armguards], [Boots], [Greaves], [Gauntlets], and [Breastplates].");
		quest::summonitem(17249);
	}
	if($text=~/I want to craft Armguards/i){
		quest::say("To create yer armguards material you will need to combine 2 Bricks of Crude Bronze, 2 Scarab Legs, and 1 Spiderling Silk in yer assembly kit. Once you have created the proper material take it to a forge along with this mold to fashion yer very own Underfoot Defenders Armguards.");
		quest::summonitem(22613);
	}
	if($text=~/I want to craft Boots/i){
		quest::say("To create yer boots material you will need to combine 3 Bricks of Crude Bronze, 1 Aqua Goblin Foot, 2 Ogre Jawbones in yer assembly kit. Once you have created the proper material take it to a forge along with this mold to fashion yer very own Underfoot Defenders Boots.");
		quest::summonitem(22612);
	}
	if($text=~/I want to craft Bracers/i){
		quest::say("To create yer bracer material you will need to combine 1 Brick of Crude Bronze, 1 RunnyEye Warbeads, 1 Shattered Warbeads and 1 Gypsy Wine in yer assembly kit. Once you have created the proper material take it to a forge along with this mold to fashion yer very own Underfoot Defenders Bracer.");
		quest::summonitem(22611);
	}
	if($text=~/I want to craft Breastplates/i || $text=~/I want to craft a Breastplate/i){
		quest::say("To create yer breastplate material you will need to combine 5 Bricks of Crude Bronze, 1 Scarab Carapace, 1 Golden Bandit Tooth, 1 Pristine Forest Drakeling Scale, 1 Skunk Tail and 1 Enraged Goblin Beads in yer assembly kit. Once you have created the proper material take it to a forge along with this mold to fashion yer very own Underfoot Defenders Breastplate. When you have finished completing your armor set I would like you to return to me for I have one [final task] for you to complete. Aye.");
		quest::summonitem(22616);
	}
	if($text=~/what final task/i){
		quest::say("Da final task is simply dere young $name. I myself likes to collect many trophies as well as beer steins ye see. Well sense my days have been occupied by trainin da newest up and coming lads and lasses I haven't gotten a chance to go prize hunting like I once did. So if`n yer up for da task I would like ye to collect me some [valuable trophies] fer my collection.");
	}
	if($text=~/valuable trophies/i){
		quest::say("There are 3 signifigant trophies I would love to have fer me trophy room. If ye can collect and bring me 1 Enraged Goblin Beads, 1 Green Goblin Head and 1 Aqua Goblin Head I will surely reward ye with a blade worthy of the finest defenders Brell has to offer. Aye");
	}
	if($text=~/I want to craft Gauntlets/i){
		quest::say("To create yer gauntlets material you will need to combine 3 Bricks of Crude Bronze, 1 Margyls Tongue, 1 Insignia of Greenblood, and 2 Rock Spiderling Legs in yer assembly kit. Once you have created the proper material take it to a forge along with this mold to fashion yer very own Underfoot Defenders Gauntlets.");
		quest::summonitem(22615);
	}
	if($text=~/I want to craft Greaves/i){
		quest::say("To create yer greaves material you will need to combine 4 Bricks of Crude Bronze, 1 Basilisk Tongue, 1 Orc Skull , and 1 Scarab Eye in yer assembly kit. Once you have created the proper material take it to a forge along with this mold to fashion yer very own Underfoot Defenders Greaves.");
		quest::summonitem(22614);
	}
	if($text=~/I want to craft Helms/i || $text=~/I want to craft a Helm/i){
		quest::say("To create yer helm material you will need to combine 2 Bricks of Crude Bronze, 1 Aviak Eye, 1 Goblin Skull and 1 Ration in yer assembly kit. Once you have created the proper material take it to a forge along with this mold to fashion yer very own Underfoot Defenders Helm.");
		quest::summonitem(22610);
	}
}

sub EVENT_ITEM {
	#do all other handins first, then let it do disciplines
	if(plugin::check_handin(\%itemcount, 2396 => 1, 28065 => 1, 28066 => 1)){
		quest::say("Congratulations, $name!");
		quest::summonitem(26077);
		
	}
  #do all other handins first with plugin, then let it do disciplines
  plugin::try_tome_handins(\%itemcount, $class, 'Paladin');
  plugin::return_items(\%itemcount);
}
