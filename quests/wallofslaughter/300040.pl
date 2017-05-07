##Trelak 300040 Bards receive Farseeker's Plate Chestguard of Harmony, Clerics receive Faithbringer's Breastplate of Conviction, Paladins receive Dawnseeker's Chestpiece of the Defender, Shadowknights receive Duskbringer's Plate Chestguard of the Hateful, and Warriors receive Gladiator's Plate Chestguard of War.##
sub EVENT_SAY{
my $willing = quest::saylink("willing", 1);
my $breastplates = quest::saylink("breastplates", 1);
  if($text=~/hail/i) {
   quest::say("Greetings stranger. What can I, Trelak do for you? Surely you are the strangers that I have heard whispers about . . . the ones that have struck back against our enemies? Perhaps we can aid each other? I am an armor smith that has crafted many fine pieces for the more prestigious officers in the dragorn militia. Many of these pieces have unique magical qualities that I crafted into them. If you are $willing to recover them, I can recapture most of this magic and create new pieces for you.");
  }   
  elsif($text=~/willing/i) {
   quest::say("Good, very good. When The Darkening came upon us, I could see by the ferocity and viciousness of the invaders that they would not be easy to defeat. So I took as much as I could and hid out here preparing for the time when our warriors would have need of me. If you help me, I will craft superior pieces of plate $breastplates fit for our mightiest fighters for you."); 
  }
  elsif($text=~/breastplates/i) {
   quest::say("Many good friends and loved ones perished in the invasion. One of my good friends was a famous hunter, Jayruk. He and I went on many hunting expeditions together protecting our lands from some of the more wild and dangerous beasts. I was not skilled enough to take care of a bazu mind you, but at least I could remove the threat of a few murkgliders. Jayruk, however, had no equal. I could regale you for hours of tales of how he narrowly escaped death, but I shan't waste time. Simply know that I wish to pay my respects to my good friend and for this I require the hunting vest he so loved. While you can not wear it, having it in your inventory may be helpful to you. I will also need three Ceremonial Dragorn Candles too. Return to me with the vest and the three candles and I will give you a plate breastplate that I was crafting for myself.");
  }
  elsif(defined $qglobals{"FTrelak"} == 1 && $text=~/Bard/i) {
    quest::say("Here is the breastplate I spoke of earlier. I was crafting this for myself, but in times such as these, it is better that it serve a true fighter such as yourself than a mere smith pretending to be one.");
    quest::ding();
	quest::exp(10000);
	quest::summonitem(70907);
	quest::delglobal("FTrelak");
  }
  elsif(defined $qglobals{"FTrelak"} == 1 && $text=~/Cleric/i) {
  quest::say("Here is the breastplate I spoke of earlier. I was crafting this for myself, but in times such as these, it is better that it serve a true fighter such as yourself than a mere smith pretending to be one.");
    quest::ding();
	quest::exp(10000);
	quest::summonitem(70865);
	quest::delglobal("FTrelak");
  }
  elsif(defined $qglobals{"FTrelak"} == 1 && $text=~/Paladin/i) {
  quest::say("Here is the breastplate I spoke of earlier. I was crafting this for myself, but in times such as these, it is better that it serve a true fighter such as yourself than a mere smith pretending to be one.");
    quest::ding();
	quest::exp(10000);
	quest::summonitem(70872);
	quest::delglobal("FTrelak");
  }
  elsif(defined $qglobals{"FTrelak"} == 1 && $text=~/Shadowknight/i) {
  quest::say("Here is the breastplate I spoke of earlier. I was crafting this for myself, but in times such as these, it is better that it serve a true fighter such as yourself than a mere smith pretending to be one.");
    quest::ding();
	quest::exp(10000);
	quest::summonitem(70886);
	quest::delglobal("FTrelak");
  }
  elsif(defined $qglobals{"FTrelak"} == 1 && $text=~/Warrior/i) {
  quest::say("Here is the breastplate I spoke of earlier. I was crafting this for myself, but in times such as these, it is better that it serve a true fighter such as yourself than a mere smith pretending to be one.");
    quest::ding();
	quest::exp(10000);
	quest::summonitem(70858);
	quest::delglobal("FTrelak");
  }
  else {
   #Do nothing
  }
 } 
sub EVENT_ITEM {
my $Bard = quest::saylink("Bard", 1);
my $Cleric = quest::saylink("Cleric", 1);
my $Paladin = quest::saylink("Paladin", 1);
my $Shadowknight = quest::saylink("Shadowknight", 1);
my $Warrior = quest::saylink("Warrior", 1);
  if (plugin::check_handin(\%itemcount, 51476 => 1, 51483 => 3)) {
  quest::emote("takes the items from you before handing you your reward."); #made up
  quest::say("Forgive my old eyes but what class are you? You all look the same to me.");
  quest::say("well? Dont you know? Be ye a 4$Bard, $Cleric, $Paladin. $Shadowknight or $Warrior?"); 
  quest::setglobal("FTrelak", 1, 5, "M2");
  quest::say("Ah, yes, this is the vest I saw Jayruk wear so often when times were brighter. No one knows what happened to him, but this vest confirms my greatest fear -- that he met with an untimely end. I thank you for returning this to me so I may pay my respects to my greatest friend.");
  }  
}
