####################
# Prashnak.pl - 
#
# Zone: Grobb - grobb
#
# Quests: Spiritcharmers Armor, Spiritcharmer Final Job (Staff)
#
# Revised by RealityIncarnate 2-29-08; restored to Grobb quests

sub EVENT_SAY {

   if ($text=~/Hail/i) {
      quest::say("Hullo $name, who yoo be? You need be a [Shaman] or me not talk to yoo");
   }

   if ($text=~/i am a shaman/i) {
      quest::say("You is Shaman? Well me is too so I can give yoo some tings to do if yoo want to make yer own [armor]");
   }

   if ($text=~/what armor/i) {
      quest::say("Me can tell yoo where to get tings to craft yer own armor. Yoo den take dese tings with dis armor kit and combine dem. When you have yer armor material take it too da forge and with da pattern I give yoo to make yer armor. I can give yoo recipe fer [Coif], [Bracers], [Sleeves], [Boots], [Legplates], [Gauntlets] and [Tunics]. When yoo ready yoo tell me whut piece you [want to craft]");
   quest::summonitem(61095); # Spiritcharmers Assembly Kit
   }

   if ($text=~/want to craft coif/i) {
      quest::say("Here is yer pattern, once yoo have combined 2 Bricks of Crude Bronze, 1 Ruined Wolf Pelt, 1 Fire Beetle Eye and 1 Water Flask in yer kit place it in da forge along with dis pattern to create yer Spiritcharmer Chainmail Coif");
   quest::summonitem(22671); # An Enchanted Coif Pattern
   }

   if ($text=~/want to craft bracers/i) {
      quest::say("Go out into da forest and seek out 1 Brick of Crude Bronze, 2 Snake Fangs, 1 Zombie Skin and 1 Short Ale. Once yoo have combined dem in yer kit to make da bracer material take it to a forge along with dis pattern to create yer Spiritcharmer Chainmail Bracer.");
   quest::summonitem(22672); # An Enchanted Bracer Pattern
   }

   if ($text=~/want to craft sleeves/i) {
      quest::say("If Sleeves are what yoo wish to craft yoo will need to get 2 Bricks of Crude Bronze, 1 Burned Out Lightstone, 1 Black Mamba Skin and 1 Bottle of Milk den combine dem in yer kit to fashion da necessary material. Take dis pattern to da nearest forge with that material to create yer Sleeves of the Spiritcharmer.");
   quest::summonitem(22673); # An Enchanted Sleeves Pattern
   }

   if ($text=~/want to craft boots/i) {
      quest::say("If yoo want to make Boots of da Spiritcharmer yoo will need 2 Kobold Talons, 1 Undead Froglok's Talisman, and 1 Ball of Pulpy Fungus. Combine dem together to make yer mold and put it in da forge along with dis pattern to make yer boots.");
   quest::summonitem(22674); # An Enchanted Boots Pattern
   }

   if ($text=~/want to craft legplates/i) {
      quest::say("If yoo wants leggings go get 4 Bricks of Crude Bronze, 2 Snake Eggs, 1 Low Quality Bear Skin and 1 Red Wine den combine dem in yer kit to create yer Legplates material.");
   quest::summonitem(22675); # An Enchanted Legplates Pattern
   }

   if ($text=~/want to craft gauntlets/i) {
      quest::say("To create da Gauntlet materials please collect 3 Bricks of Crude Bronze, 1 Fresh Fish, 1 Spider Venom Sac and 2 Bat Wings. When yoo done and have made yer material put it in da forge with dis pattern to make yer gauntlets.");
   quest::summonitem(22676); # An Enchanted Gauntlets Pattern
   }

   if ($text=~/want to craft tunic/i) {
      quest::say("I'm happy to see that yer training is coming along so well $name. I have no doubt in my mind that yoo are ready to craft yer Tunic. Go collect 5 Bricks of Crude Bronze, 1 Water Moccasin Tail, 1 Ruined Bear Pelt, 1 Undead Froglok's Talisman, 1 Giant Moccasin Fang and 1 Undead Froglok Spine. Come back after yoo are finished, I have a [job] for yoo.");
   quest::summonitem(22677); # An Enchanted Tunic Pattern
   }

   if ($text=~/what job/i) {
      quest::say("I want yoo too get some tings for me that I need for me special trollie. Get me 2 Undead bone Fragments, 1 Intestine Necklace, and 1 Embalming Dust; then I will give you a nice shiny ting.");
   }

}

sub EVENT_ITEM {

   if(plugin::check_handin(\%itemcount, 16990 => 1, 21837 => 2, 13311 => 1)) { # undead bone fragments x 2, Embalming Dust, Intestine Necklace
      quest::summonitem(61100); # Staff of The Spiritcharmer
       quest::ding(); 
       quest::exp(10385);

   } else {

      quest::say("Dis not for me, $name, you can have it back.");
      plugin::return_items(\%itemcount);

   }

}

#END of FILE Zone:grobb  ID: 40074
