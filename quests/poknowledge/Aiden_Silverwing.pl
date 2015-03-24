sub EVENT_SAY {
my $disappeared = quest::saylink("disappeared", 1);
my $find = quest::saylink("find", 1);
   if ($text=~/Hail/i){
   quest::say("Hail, and well met fellow travel, I wonder if you would be interested in helping me find some of my clansmen who seem to have $disappeared?");
  } 
   if ($text=~/disappeared/i){
   quest::say("Several of my clansmen ventured out into the lands of Norath searching for various items but I fear the worst since none have them reported back. If while out in your travels and should you $find them, have them report to me at once.");
  } 
   if ($text=~/find/i){
   quest::say("Hopefully, they are alive and well, but if they have met thier match, you may find items that have our clans mark on them. Bring to me any items that you run across that have our insignia and I will help you transform the item into something that you can use and make it even better.");
  }
   if ($text=~/Melee/i){
   quest::say("And so it shall be, Take this box and these shoulderpads, combine them in this box with a Shimmering Shard from Velketors Labyrinth to recieve you new shoulderpads.");
   quest::summonitem(17335);
   quest::summonitem(120191);
   quest::ding();
  }
  if ($text=~/Hybrid/i){
   quest::say("And so it shall be, Take this box and these shoulderpads, combine them in this box with a Shimmering Shard from Velketors Labyrinth to recieve you new shoulderpads.");
   quest::summonitem(17335);
   quest::summonitem(120192);
   quest::ding();
  }
  if ($text=~/Priest/i){
   quest::say("And so it shall be, Take this box and these shoulderpads, combine them in this box with a Shimmering Shard from Velketors Labyrinth to recieve you new shoulderpads.");
   quest::summonitem(17335);
   quest::summonitem(120193);
   quest::ding();
  }
  if ($text=~/Caster/i){
   quest::say("And so it shall be, Take this box and these shoulderpads, combine them in this box with a Shimmering Shard from Velketors Labyrinth to recieve you new shoulderpads.");
   quest::summonitem(17335);
   quest::summonitem(120194);
   quest::ding();
  }
  if ($text=~/Berserker/i){
   quest::say("And so it shall be, Take this box and this cloak, combine them in this box with a Pearlescent Shard from The Deep to recieve you new cloak.");
   quest::summonitem(17335);
   quest::summonitem(120195);
   quest::ding();
  }
  if ($text=~/Monk/i){
   quest::say("And so it shall be, Take this box and this cloak, combine them in this box with a Pearlescent Shard from The Deep to recieve you new cloak.");
   quest::summonitem(17335);
   quest::summonitem(120195);
   quest::ding();
  }
  if ($text=~/Rogue/i){
   quest::say("And so it shall be, Take this box and this cloak, combine them in this box with a Pearlescent Shard from The Deep to recieve you new cloak.");
   quest::summonitem(17335);
   quest::summonitem(120195);
   quest::ding();
  }
  if ($text=~/Warrior/i){
   quest::say("And so it shall be, Take this box and this cloak, combine them in this box with a Pearlescent Shard from The Deep to recieve you new cloak.");
   quest::summonitem(17335);
   quest::summonitem(120195);
   quest::ding();
  }
  if ($text=~/Beastlord/i){
   quest::say("And so it shall be, Take this box and this cloak, combine them in this box with a Pearlescent Shard from The Deep to recieve you new cloak.");
   quest::summonitem(17335);
   quest::summonitem(120196);
   quest::ding();
  }
  if ($text=~/Paladin/i){
   quest::say("And so it shall be, Take this box and this cloak, combine them in this box with a Pearlescent Shard from The Deep to recieve you new cloak.");
   quest::summonitem(17335);
   quest::summonitem(120196);
   quest::ding();
  }
  if ($text=~/Ranger/i){
   quest::say("And so it shall be, Take this box and this cloak, combine them in this box with a Pearlescent Shard from The Deep to recieve you new cloak.");
   quest::summonitem(17335);
   quest::summonitem(120196);
   quest::ding();
  }
  if ($text=~/Shadowknight/i){
   quest::say("And so it shall be, Take this box and this cloak, combine them in this box with a Pearlescent Shard from The Deep to recieve you new cloak.");
   quest::summonitem(17335);
   quest::summonitem(120196);
   quest::ding();
  }
  if ($text=~/Bard/i){
   quest::say("And so it shall be, Take this box and this cloak, combine them in this box with a Pearlescent Shard from The Deep to recieve you new cloak.");
   quest::summonitem(17335);
   quest::summonitem(120196);
   quest::ding();
  }
  if ($text=~/Enchanter/i){
   quest::say("And so it shall be, Take this box and this cloak, combine them in this box with a Pearlescent Shard from The Deep to recieve you new cloak.");
   quest::summonitem(17335);
   quest::summonitem(120197);
   quest::ding();
  }
  if ($text=~/Magician/i){
   quest::say("And so it shall be, Take this box and this cloak, combine them in this box with a Pearlescent Shard from The Deep to recieve you new cloak.");
   quest::summonitem(17335);
   quest::summonitem(120197);
   quest::ding();
  }
  if ($text=~/Necromancer/i){
   quest::say("And so it shall be, Take this box and this cloak, combine them in this box with a Pearlescent Shard from The Deep to recieve you new cloak.");
   quest::summonitem(17335);
   quest::summonitem(120197);
   quest::ding();
  }
  if ($text=~/Wizard/i){
   quest::say("And so it shall be, Take this box and this cloak, combine them in this box with a Pearlescent Shard from The Deep to recieve you new cloak.");
   quest::summonitem(17335);
   quest::summonitem(120197);
   quest::ding();
  }
  if ($text=~/Cleric/i){
   quest::say("And so it shall be, Take this box and this cloak, combine them in this box with a Pearlescent Shard from The Deep to recieve you new cloak.");
   quest::summonitem(17335);
   quest::summonitem(120198);
   quest::ding();
  }
  if ($text=~/Druid/i){
   quest::say("And so it shall be, Take this box and this cloak, combine them in this box with a Pearlescent Shard from The Deep to recieve you new cloak.");
   quest::summonitem(17335);
   quest::summonitem(120198);
   quest::ding();
  }
  if ($text=~/Shaman/i){
   quest::say("And so it shall be, Take this box and this cloak, combine them in this box with a Pearlescent Shard from The Deep to recieve you new cloak.");
   quest::summonitem(17335);
   quest::summonitem(120198);
   quest::ding();
  }
 }  
sub EVENT_ITEM { 
my $Melee = quest::saylink("Melee", 1);
my $Hybrid = quest::saylink("Hybrid", 1);
my $Priest = quest::saylink("Priest", 1);
my $Caster = quest::saylink("Caster", 1);
my $Berserker = quest::saylink("Berserker", 1);
my $Monk = quest::saylink("Monk", 1);
my $Rogue = quest::saylink("Rogue", 1);
my $Warrior = quest::saylink("Warrior", 1);
my $Cleric = quest::saylink("Cleric", 1);
my $Druid = quest::saylink("Druid", 1);
my $Shaman = quest::saylink("Shaman", 1);
my $Enchanter = quest::saylink("Enchanter", 1);
my $Magician = quest::saylink("Magician", 1);
my $Necromancer = quest::saylink("Necromancer", 1);
my $Wizard = quest::saylink("Wiazard", 1);
my $Bard = quest::saylink("Bard", 1);
my $Beastlord = quest::saylink("Beastlord", 1);
my $Paladin = quest::saylink("Paladin", 1);
my $Ranger = quest::saylink("Ranger", 1);
my $Shadowknight = quest::saylink("Shadowknight", 1); 
   if (plugin::check_handin(\%itemcount, 79635 => 1)) { 
   quest::say("You've found Kyen's sholderpads! Kyen loved her work. She was a natural when it came to alchemy. Last I heard from her she was researching some new special intelligence potion, and she seemed certain the sentient mushrooms in Dawnshroud Peaks would be the key. It would appear they did not take kindly to her methods of research.");
   quest::say("Thank you $name for returning these to me and solving the mystery of what happened to Kyen.");
   quest::say("Now I have a question for you, would you like these shoulderpads improved for a $Melee, $Hybrid, $Priest or $Caster class?"); 
  }
   if (plugin::check_handin(\%itemcount, 79639 => 1)) { 
   quest::say("You've found Jaden's cloak! Jaden's thirst for knowledge of the arcane was unending. When he learned of the great wizard Velketor, he said he knew where he must go to futher his studies. Sadly, Velketor was not interested in a pupil, and Jaden was killed some time ago."); 
   quest::say("Thank you $name for returning these to me and solving the mystery of what happened to Jaden.");
   quest::say("Now I have a question for you, would you like this cloak improved for a $Berserker, $Monk, $Rogue, $Warrior, $Cleric, $Druid, $Shaman, $Enchanter, $Magician, $Necromancer, $Wizard, $Bard, $Beastlord, $Paladin, $Ranger or $Shadowknight?"); 
  }
 }