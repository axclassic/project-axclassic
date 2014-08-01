sub EVENT_SAY {
my $Naygog = quest::saylink("Naygog", 1);
my $Helm = quest::saylink("Helm", 1);
my $Bracer = quest::saylink("Bracer", 1);
my $Gauntlets = quest::saylink("Gauntlets", 1);
my $Boots = quest::saylink("Boots", 1);
my $Vambraces = quest::saylink("Vambraces", 1);
my $Greaves = quest::saylink("Greaves", 1);
my $Breastplate = quest::saylink("Breastplate", 1);
  if($text=~/hail/i) {
    quest::say("What do YOU want? Did $Naygog send you?");
  }
  if($text=~/Naygog/i) {
    quest::say("Hail $name! You must be one of Naygog's new soldiers. Naygog has asked me to help get you outfitted in a suit of armor to protect you from the weapons of our foes. I have assembled a kit for you that will allow you to construct the armor pieces once you have gathered the necessary components. The required components vary according to which piece of Plague Warrior Armor you are planning on assembling. Do you wish to craft a Plague Warrior $Helm, a Plague Warrior $Bracer, Plague Warrior $Gauntlets, Plague Warrior $Boots, Plague Warrior $Vambraces, Plague Warrior $Greaves, or a Plague Warrior $Breastplate.");
    quest::summonitem(17124); #mail assembly kit
  }
  if($text=~/Helm/i) {
    quest::say("To assemble a Plague Warrior Helm you will need to obtain two bricks of crude bronze and smelt them in a forge with a Water Flask and this Crude Helm Mold. Once that is done combine the Crude Bronze Helm with a Ruined Coyote Pelt and two Rebel Clockwork Eye Lenses in the Mail Assembly Kit.");
    quest::summonitem(19631); #crude helm mold
  }
if($text=~/Bracer/i) {
    quest::say("To assemble a Plague warrior Mail Bracer you will need to obtain a brick of crude bronze and smelt it in a forge with a Water Flask and this Crude Bracer Mold. Once that is done, combine the Crude Bronze Bracer with a Ruined Coyote Pelt and a Rebel Clockwork Wrist Section in the Mail Assembly Kit.");
    quest::summonitem(19632); #crude bracer mold
  }
  if($text=~/Gauntlets/i) {
    quest::say("To assemble Plague warrior Gauntlets you will need to obtain two bricks of crude bronze and smelt them in a forge with a Water Flask and this crude Gauntlet Mold. Once that is done combine the Crude Bronze Gauntlets with a Ruined Coyote Pelt and two Rebel Clockwork Hand Plates in the Mail Assembly Kit.");
    quest::summonitem(19633); #crude gauntlets mold
  }
  if($text=~/Boots/i) {
    quest::say("To assemble Plague warrior Mail Boots you will need to obtain two bricks of crude bronze and smelt them in a forge with a Water Flask and this crude Boot Mold. Once that is done combine the Crude Bronze Boots with two Ruined Coyote Pelts, and two Rebel Clockwork Foot Plates in the Mail Assembly Kit.");
    quest::summonitem(19634); #crude boot mold
  }
  if($text=~/Vambraces/i) {
    quest::say("To assemble Plague warrior Vambraces you will need to obtain two bricks of crude bronze and smelt them in a forge with a Water Flask and this Crude Vambrace Mold. Once that is done combine the Crude Bronze Vambraces with a Low Quality Coyote Pelt and two Rebel Clockwork Arm Sections in the Mail Assembly Kit.");
    quest::summonitem(19635); #crude vambrace mold
  }
  if($text=~/Greaves/i) {
    quest::say("To assemble Plague warrior Greaves you will need to obtain two bricks of crude bronze and smelt them in a forge with a Water Flask and this Crude Greaves Mold. Once that is done combine the Crude Bronze Greaves with two Low Quality Coyote Pelts and two Rebel Clockwork Leg Sections in the Mail Assembly Kit.");
    quest::summonitem(19636); #crude greaves mold
  }
  if($text=~/Breastplate/i) {
    quest::say("To assemble a Plague warrior Breastplate you will need to obtain four bricks of crude bronze and smelt them in a forge with a Water Flask and this Crude Breastplate Mold. Once that is done combine the Crude Bronze Breastplate with a Coyote Pelt, a Rebel Clockwork Chest Plate, and a Rebel Clockwork Back Plate in the Mail Assembly Kit.");
    quest::summonitem(19637); #crude breastplate mold
  }
}
sub EVENT_ITEM {
if (plugin::check_handin(\%itemcount,  => 1) && $class eq "Warrior") { 
   plugin::try_tome_handins(\%itemcount, $class, 'Warrior');
    plugin::return_items(\%itemcount);
    quest::say("I have no use for this.");
   }
   }