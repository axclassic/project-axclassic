###################################
#Zone: Ak`Anon                    #                                             
#Short Name: akanon               #                                                                 
#Zone ID: 55                      #                                       
###################################                                             
#NPC Name: Iony_Gredlong          #                             
#NPC ID: 55139                    #
#Quest Status: Complete           #                                     
###################################

sub EVENT_SAY {
my $cleric = quest::saylink("cleric", 1);
my $armor = quest::saylink("armor", 1);
my $items = quest::saylink("items", 1);
my $Helm = quest::saylink("Helm", 1);
my $Bracer = quest::saylink("Bracer", 1);
my $Boots = quest::saylink("Boots", 1);
my $Armguards = quest::saylink("Armguards", 1);
my $Greaves = quest::saylink("Greaves", 1);
my $Gauntlets = quest::saylink("Gauntlets", 1);
my $Breastplate = quest::saylink("Breastplate", 1);
my $favor = quest::saylink("favor", 1);
my $collect = quest::saylink("collect", 1);
if($text=~/Hail/i){
quest::say("It is very nice to meet you $name. I am Iony Gredlong Priestess of the Underfoot. I coordinate all the training for new clerics here in the Deep Musing. If you are a $cleric then I might just have some tests for you that will challenge your wisdom as well as your fighting abilities.");
}
if($text=~/cleric/i){
quest::say("Well you would certainly be eligible for my training then young $name. I have a number of armor recipes that I give to young clerics to make sure that when they leave the comfort of the Steamfont Mountains they are ready for whatever battles they may face. If you are interested in creating your own $armor then all you must do is simply ask and I will give you instructions to get started.");
}
if($text=~/armor/i){
quest::say("I am always happy to see an eager young one like yourself! Brell certainly takes pride in all young gnomes that draw power from him to give life so you should consider yourself very special. To create your own armor you are going to collect various $items from Ak`Anon and Steamfont. You will then combine them in this assembly kit. Once you have made a material you will place it in a forge along with molds that I will present to you to create your armor.");
}
if($text=~/items/i){
quest::say("There are numerous items that you will need to collect and combine in your kit. I will present you for the recipe for Shortnoble Platemail $Helms, $Bracer, $Armguards, $Boots, $Greaves, $Gauntlets and $Breastplates. When you are ready to attempt a specific piece please let me know what piece you want to craft and I will give you the necessary mold along with the recipe.");
}
if($text=~/Helm/i){
quest::say("Getting something on top of your head is a wise idea $name. To create your helm material you will need to combine 2 Bricks of Crude Bronze, 1 Rat Whisker, 1 Spiderling Silk and 1 Water Flask in your assembly kit. Once you have created the proper material take it to a forge along with this mold to fashion your very own Shortnoble Platemail Helm");
quest::summonitem(17253);
quest::summonitem(22610);
}
if($text=~/Bracer/i){
quest::say("Bracers are very important to keep your wrists safe in battle $name. To create your bracer material you will need to combine 1 Brick of Crude Bronze, 1 Size 4 Gizmo, 1 Clockwork Spider Mesh and 1 Cloth Choker in your assembly kit. Once you have created the proper material take it to a forge along with this mold to fashion your very own Shortnoble Platemail Bracer.");
quest::summonitem(17253);
quest::summonitem(22611);
}
if($text=~/Boots/i){
quest::say("Well you cant go running around the Steamfont Mountains with no shoes on now can you. To create your boot material you will need to combine 3 Bricks of Crude Bronze, 1 Kobold Tooth, 2 Spiderling Silks and 1 Mead in your assembly kit. Once you have created the proper material take it to a forge along with this mold to fashion your very own Shortnoble Platemail Boots.");
quest::summonitem(17253);
quest::summonitem(22612);
}
if($text=~/Armguards/i){
quest::say("In order to keep those big muscles that all gnomes like us are blessed with you will definitely need some Armguards! To create your armguard material you will need to combine 2 Bricks of Crude Bronze, 2 Harpy Wings and 1 Snake Fang in your assembly kit. Once you have created the proper material take it to a forge along with this mold to fashion your very own Shortnoble Platemail Armguards.");
quest::summonitem(17253);
quest::summonitem(22613);
}
if($text=~/Greaves/i){
quest::say("Pants are most definitely an essential armor piece for any young cleric in training. To create your greaves material you will need to combine 4 Bricks of Crude Bronze, 1 High Quality Cat Pelt, 1 Minotaur Scalp, 1 Bottle and the Torn Cloak of Faerron in your assembly kit. Once you have created the proper material take it to a forge along with this mold to fashion your very own Shortnoble Platemail Greaves.");
quest::summonitem(17253);
quest::summonitem(22614);
}
if($text=~/Gauntlets/i){
quest::say("Keeping your hands well protected is very important while you are in training. To create your gauntlets material you will need to combine 3 Bricks of Crude Bronze, 1 Yellow Reculse Silk, 1 Brownie Brain and 2 Mountain Lion Claws in your assembly kit. Once you have created the proper material take it to a forge along with this mold to fashion your very own Shortnoble Platemail Gauntlets.");
quest::summonitem(17253);
quest::summonitem(22615);
}
if($text=~/Breastplate/i){
quest::say("I believe you are ready to craft and gather the components for the most difficult piece of Shortnoble Platemail. To create your breastplate material you will need to combine 5 Bricks of Crude Bronze, 1 Clockwork Spider Thorax Plate, 1 Brownie Parts, 1 Aviak Talon 1 Scrap Metal and the evil Halorniop`s Insignia in your assembly kit. Once you have created the proper material take it to a forge along with this mold to fashion your very own Shortnoble Platemail Breastplate. Return to me for one final $favor I have to ask of you after you have completed your breastplate.");
quest::summonitem(17253);
quest::summonitem(22616);
}
if($text=~/favor/i){
quest::say("I thank you for returning to me young Gearsword. I must say that it is now quite clear that you are very capable of completing any task I should assign you due to your eagerness to learn. I am currently in need of a few specific items to craft a weapon worthy of any servant of Brell. It is my hope that I can pass these out to our new recruits quite soon. Will you $collect the items I require?");
}
if($text=~/collect/i){
quest::say("I need 3 Flawless Harpy Claws and 1 Ebon Drake Backbone still to have all the items necessary to craft this new mace. Once I have these items I can make a Shortnobles Walking Staff. For your trouble I will offer you my first staff made should I be able to create one. I hope to see you soon!");}
}
sub EVENT_ITEM {
if(plugin::check_handin(\%itemcount, 9105 => 3, 9106 => 1)) {
quest::summonitem("9107"); #Walking Staff of the Shortnoble
}
elsif(plugin::check_handin(\%itemcount, 18775 => 1) && $class eq "Cleric") { #Tattered Note
   quest::say("Welcome to the Abbey of Deep Musing young Cleric. You are expected to serve his majesty, King Ak'Anon with pride. You have much to learn.") ;
   quest::say("You can report to any of the cleric trainers for further guidance.");
   quest::say("Go forth and serve.") ; 
   quest::summonitem(119859); #Dusty Gold Tunic
   quest::ding();
   quest::faction(76,10); #Deep Muses
   quest::faction(176,10); #King Ak'Anon
   quest::faction(210,10); #Merchants of Ak'Anon
   quest::exp(1000);
}
  else
    {
	#Do all other handins first With plugin, then let it Do disciplines
    plugin::try_tome_handins(\%itemcount, $class, 'Cleric');
    quest::say("I have no use for these $name.");
    plugin::return_items(\%itemcount);
    }
 }

