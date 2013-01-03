######################################
## NPC: #Anita_Thrall               ##
## Zone: All Starter Zones          ##
##       PoK and Bazaar             ##
## By:    Angelox                   ##
## Revised by caved for AXClassic   ##
## EQWorld Server     19-12-2010    ##
######################################
sub EVENT_SAY {
my $spells = quest::saylink("spells", 1);
my $circle = quest::saylink("Circle", 1);
my $portal = quest::saylink("Portal", 1);
my $temperance = quest::saylink("Temperance", 1);
my $lesser = quest::saylink("Lesser", 1);
my $summon = quest::saylink("Summon", 1);
my $conjure = quest::saylink("Conjure", 1);
my $tash = quest::saylink("Tash", 1);
my $quested = quest::saylink("Quested", 1);
my $need = quest::saylink("need", 1);
my $druid = quest::saylink("Druid", 1);
my $wizard = quest::saylink("Wizard", 1);
my $proof = quest::saylink("proof", 1);
my $gunthak = quest::saylink("Gunthak", 1);
my $selos = quest::saylink("Selos", 1);
my $special = quest::saylink("special", 1);
  if ($text=~/hail/i){
    $client->Message(14,"Hello $name! I can scribe certain $spells your bots may require.");
    }
  elsif ($text=~/spells/i){
   $client->Message(14,"I can scribe $circle or $portal spells, Also $temperance , $lesser Summon Corpse, $summon Corpse, $conjure Corpse, $tash, $selos - But you need to bring me the spell.");
   }
  elsif ($text=~/lesser|tashan/i){
   $client->Message(14,"Buy it from the spell merchant and hand it to me. I'll scribe the spell for your bot.");
   }
  elsif ($text=~/Selos/i){
   $client->Message(14,"Ahh yes, Bard Speed for your Bard! The League of Antonican Bards will authorize me only if you have proof of their $special mission.");
   }
  elsif ($text=~/special/i){
     if(defined ($bard_spell_1)){
     $client->Message(14,"You already have been provided with Bard Speed. We have not yet located Natalia of the Roses.");
     return;
     }
     else{
      $client->Message(14,"Speak to Lislia Goldtune in Highkeep.");
     }
   }
  elsif ($text=~/summon/i){
   $client->Message(14,"That is a dropped spell, you can find it on The Ishva Mal, who resides in South Karana's caves of the Infected Paw.");
   }
  elsif ($text=~/quested/i){
   $client->Message(14,"That is the Coin of Tash quest, go and see Romar Sunto in the Temple of Solusek Ro.");
   }
  elsif ($text=~/tash/i){
   $client->Message(14,"These include merchant bought: Tashan (level 2), Tashani (level 18), $quested Tashania (level 41), and Tashanian (level 57), Howl of Tashan (level 61), Echo of Tashan (level 72)");
   $client->Message(14,"I also can scribe you the spells Wind of Tashani (55), and Wind of Tashanian (60).");
   $client->Message(14,"You can bring the spells to me one at a time, as you acquire the needed level.");
   }
  elsif ($text=~/conjure/i){
   $client->Message(14,"That is a dropped spell, you can find it on a cliff golem, a mature wurm, or most mobs in Sebilis.");
   }
  elsif (($text=~/circle/i)&&($ulevel>=50)){
   $client->Message(14,"I have the ability to scribe all of your Druid's Circle spells, but I see you are too high a level level for Norrath Adventurers' quests.");
   $client->Message(14,"I can still scribe your needed spells, if you bring me what I $need.");
   }
  elsif (($text=~/portal/i)&&($ulevel>=50)){
   $client->Message(14,"I have the ability to scribe all of your Wizard's Portal spells, but I see you are too high a level level for Norrath Adventurers' quests.");
   $client->Message(14,"I can still scribe your needed spells, if you bring me what I $need.");
   }
  elsif (($text=~/need/i)&&($ulevel>=50)){
   $client->Message(14,"If you can bring me the required spells, I will scribe the spells for $druid or $wizard.");
   }
  elsif (($text=~/Druid/i)&&($ulevel>=50)){
   $client->Message(14,"For your Druid's Circle spells, I require four spells: Circle of The Great Divide, Circle of Wakening Lands, Circle of Cobalt Scar, and Circle of Bloodfields.");
   $client->Message(14,"Bring me the Spells, and I will finish scribing your gate spells.");
   }
  elsif (($text=~/Wizard/i)&&($ulevel>=50)){
   $client->Message(14,"For your Wizard's Portal spells, I require four spells; Wakening Lands Portal, Great Divide Portal, Cobalt Scar Portal, and Bloodfields Portal.");
   $client->Message(14,"Bring me the Spells, and I will finish scribing your gate spells.");
   }
  elsif ($text=~/circle/i){
   $client->Message(14,"I have the ability to scribe all of your Druid's merchant-bought Circle spells, but I need proof that you are worthy, and have traveled Norrath without the need of portals. Go and see the Norrath Adventurer, his quests will provide $proof of your worthiness.");
   }
  elsif ($text=~/portal/i){
   $client->Message(14,"I have the ability to scribe all of your Wizard's merchant-bought Portal spells, but I need proof that you are worthy, and have traveled Norrath without the need of portals. Go and see the Norrath Adventurer, his quests will provide $proof of your worthiness.");
   }
  elsif ($text=~/proof/i){
   $client->Message(14,"The Norrath Adventurer has three quests for you, completion of a quest will reward you two moonstones - one for your Druid's Circle spells and one for your Wizard's Portal spells.");
   $client->Message(14,"Bring me the Moonstones, and I will scribe a portion of the gate spells.");
   $client->Message(14,"Complete all three quests, and you will have all possible gate spells scribed.");
   }
  elsif ($text=~/temperance/i){
   $client->Message(14,"Go to the Gulf of $gunthak, and see an Erudite Paladin named Millius Darkwater. He's near the Lighthouse with the merchants.");
   }
  elsif ($text=~/gunthak/i){
   $client->Message(14,"Entrance to Gulf of Gunthak is in an old ship docked on the east coast of Stonebrunt Mountains.");
   }
}
sub EVENT_ITEM{
## Summon Corpse
 if (($itemcount{28216} == 1) && (($bot_spell_1 == 1) || ($bot_spell_1 == 2) || ($bot_spell_1 == 3))){
    $client->Message(14,"Those spells are already scribed.");
    quest::summonitem(28216);}
  elsif (($itemcount{15003} == 1) && (($bot_spell_1 == 2) || ($bot_spell_1 == 3))){
    $client->Message(14,"Those spells are already scribed.");
    quest::summonitem(15003);}
  elsif (($itemcount{19307} == 1) && ($bot_spell_1 == 3)){
    $client->Message(14,"Those spells are already scribed.");
    quest::summonitem(19307);}
  elsif (plugin::check_handin(\%itemcount,28216 => 1)){ #Lesser Summon Corpse
    $client->Message(14,"Excellent, thank you, $class. Your spell has been scribed.");
    quest::setglobal("bot_spell_1",1,5,"F");
    $bot_spell_1 = undef;
    $client->Message(6,"You have scribed the spell Lesser Summon Corpse!");}
  elsif (plugin::check_handin(\%itemcount,15003 => 1)){ #Summon Corpse
    $client->Message(14,"Excellent, thank you, $class. Your spell has been scribed.");
    quest::setglobal("bot_spell_1",2,5,"F");
    $bot_spell_1 = undef;
    $client->Message(6,"You have scribed the spell Summon Corpse!");}
  elsif (plugin::check_handin(\%itemcount,19307 => 1)){ #Conjure Corpse
    $client->Message(14,"Excellent, thank you, $class. Your spell has been scribed.");
    quest::setglobal("bot_spell_1",3,5,"F");
    $bot_spell_1 = undef;
    $client->Message(6,"You have scribed the spell Conjure Corpse!");}

## Tash spells ##################
## Check flags
 elsif (($itemcount{15676} == 1) && (($bot_spell_5 == 1) || ($bot_spell_5 == 2) || ($bot_spell_5 == 3) || ($bot_spell_5 == 4) || ($bot_spell_5 == 5) || ($bot_spell_5 == 6))){
    $client->Message(14,"Those spells are already scribed.");
    quest::summonitem(15676);}
  elsif (($itemcount{15677} == 1) && (($bot_spell_5 == 2) || ($bot_spell_5 == 3) || ($bot_spell_5 == 4) || ($bot_spell_5 == 5) || ($bot_spell_5 == 6))){
    $client->Message(14,"Those spells are already scribed.");
    quest::summonitem(15677);}
  elsif (($itemcount{15678} == 1) && (($bot_spell_5 == 3) || ($bot_spell_5 == 4) || ($bot_spell_5 == 5) || ($bot_spell_5 == 6))){
    $client->Message(14,"Those spells are already scribed.");
    quest::summonitem(15678);}
  elsif (($itemcount{19394} == 1) && (($bot_spell_5 == 4) || ($bot_spell_5 == 5) || ($bot_spell_5 == 6))){
    $client->Message(14,"Those spells are already scribed.");
    quest::summonitem(19394);}
  elsif (($itemcount{28452} == 1) && (($bot_spell_5 == 5) || ($bot_spell_5 == 6))){
    $client->Message(14,"Those spells are already scribed.");
    quest::summonitem(28452);}
  elsif (($itemcount{78945} == 1) && ($bot_spell_5 == 6)){
    $client->Message(14,"Those spells are already scribed.");
    quest::summonitem(78945);}
## AE ones
  elsif (($itemcount{19387} == 1) && (($bot_spell_6 == 1) || ($bot_spell_6 == 2))){
    $client->Message(14,"Those spells are already scribed.");
    quest::summonitem(19387);}
  elsif (($itemcount{19405} == 1) && ($bot_spell_6 == 2)){
    $client->Message(14,"Those spells are already scribed.");
    quest::summonitem(19405);}
## Check handin
  elsif (plugin::check_handin(\%itemcount,15676 => 1)){ #Tashan
    $client->Message(14,"Excellent, thank you, $class. Your spell has been scribed.");
    quest::setglobal("bot_spell_5",1,5,"F");
    $bot_spell_5 = undef;
    $client->Message(6,"You have scribed the spell Tashan!");}
  elsif (plugin::check_handin(\%itemcount,15677 => 1)){ #Tashani
    $client->Message(14,"Excellent, thank you, $class. Your spell has been scribed.");
    quest::setglobal("bot_spell_5",2,5,"F");
    $bot_spell_5 = undef;
    $client->Message(6,"You have scribed the spell Tashani!");}
  elsif (plugin::check_handin(\%itemcount,15678 => 1)){ #Tashania
    $client->Message(14,"Excellent, thank you, $class. Your spell has been scribed.");
    quest::setglobal("bot_spell_5",3,5,"F");
    $bot_spell_5 = undef;
    $client->Message(6,"You have scribed the spell Tashania!");}
  elsif (plugin::check_handin(\%itemcount,19394 => 1)){ #Tashanian
    $client->Message(14,"Excellent, thank you, $class. Your spell has been scribed.");
    quest::setglobal("bot_spell_5",4,5,"F");
    $bot_spell_5 = undef;
    $client->Message(6,"You have scribed the spell Tashanian!");}
  elsif (plugin::check_handin(\%itemcount,28452 => 1)){ #Howl of Tashan
    $client->Message(14,"Excellent, thank you, $class. Your spell has been scribed.");
    quest::setglobal("bot_spell_5",5,5,"F");
    $bot_spell_5 = undef;
    $client->Message(6,"You have scribed the spell Howl of Tashan!");}
  elsif (plugin::check_handin(\%itemcount,78945 => 1)){ #Echo of Tashan
    $client->Message(14,"Excellent, thank you, $class. Your spell has been scribed.");
    quest::setglobal("bot_spell_5",6,5,"F");
    $bot_spell_5 = undef;
    $client->Message(6,"You have scribed the spell Echo of Tashan!");}
  elsif (plugin::check_handin(\%itemcount,19387 => 1)){ #Wind of Tashani
    $client->Message(14,"Excellent, thank you, $class. Your spell has been scribed.");
    quest::setglobal("bot_spell_6",1,5,"F");
    $bot_spell_6 = undef;
    $client->Message(6,"You have scribed the spell Wind of Tashani!");}
  elsif (plugin::check_handin(\%itemcount,19405 => 1)){ #Wind of Tashanian
    $client->Message(14,"Excellent, thank you, $class. Your spell has been scribed.");
    quest::setglobal("bot_spell_6",2,5,"F");
    $bot_spell_6 = undef;
    $client->Message(6,"You have scribed the spell Wind of Tashanian!");}
## End TashSpells #################

## Temperance
  elsif (($itemcount{59011} == 1) && (($bot_spell_4 == 1) || ($bot_spell_4 == 2))){
    $client->Message(14,"Those spells are already scribed.");
    quest::summonitem(59011);}
  elsif (($itemcount{59572} == 1) && ($bot_spell_4 == 2)){
    $client->Message(14,"Those spells are already scribed.");
    quest::summonitem(59572);}
  elsif (plugin::check_handin(\%itemcount,59011 => 1)){ #Temperance
    $client->Message(14,"Excellent, thank you, $class. Your spell has been scribed.");
    quest::setglobal("bot_spell_4",1,5,"F");
    $bot_spell_4 = undef;
    $client->Message(6,"You have scribed the spell Temperance!");}
  elsif (plugin::check_handin(\%itemcount,59572 => 1)){ #Blessing of Temperance (not complete yet , just have the script ready).
    $client->Message(14,"Excellent, thank you, $class. Your spell has been scribed.");
    quest::setglobal("bot_spell_4",2,5,"F");
    $bot_spell_4 = undef;
    $client->Message(6,"You have scribed the spell Blessing of Temperance!");}

## Circle Spells
  elsif (($itemcount{129} == 1) && ($itemcount{130} == 1)){ #Don't turn in both stones at the same time!
    $client->Message(14,"The Moonstones must be given to me one at a time.");
    $client->Message(6,"You failed to scribe your spells!");
    quest::summonitem(129);
    quest::summonitem(130);
    }
  elsif (($itemcount{135} == 1) && ($itemcount{136} == 1)){ #Don't turn in both stones at the same time!
    $client->Message(14,"The Moonstones must be given to me one at a time.");
    $client->Message(6,"You failed to scribe your spells!");
    quest::summonitem(135);
    quest::summonitem(136);
    }
  elsif (($itemcount{131} == 1) && ($itemcount{132} == 1)){ #Don't turn in both stones at the same time!
    $client->Message(14,"The Moonstones must be given to me one at a time.");
    $client->Message(6,"You failed to scribe your spells!");
    quest::summonitem(131);
    quest::summonitem(132);
    }
  elsif (($ulevel>=50) && ($itemcount{30438} == 1) && ($itemcount{30398} == 1) &&
    ($itemcount{30440} == 1)&& ($itemcount{77662} == 1) && ($bot_spell_2 == 3)){
    $client->Message(14,"You already have all these needed spells scribed.");
    quest::summonitem(129);
    quest::summonitem(30438);
    quest::summonitem(30398);
    quest::summonitem(30440);
    quest::summonitem(77662);
    }
  elsif (($itemcount{129} == 1) && (($bot_spell_2 == 1) || ($bot_spell_2 == 2) || ($bot_spell_2 == 3))){
    $client->Message(14,"Those spells are already scribed.");
    quest::summonitem(129);
    }
  elsif (($itemcount{135} == 1) && (($bot_spell_2 == 2) || ($bot_spell_2 == 3))){
    $client->Message(14,"Those spells are already scribed.");
    quest::summonitem(135);
    }
  elsif (($itemcount{131} == 1) && ($bot_spell_2 == 3)){
    $client->Message(14,"Those spells are already scribed.");
    quest::summonitem(131);
    }
elsif (($ulevel>=50) && ($itemcount{30438} == 1) && ($itemcount{30398} == 1) &&
    ($itemcount{30440} == 1)&& ($itemcount{77662} == 1) && ($bot_spell_2 == 0)){
    $client->Message(6,"You have scribed the spell Circle of Karana!");
    $client->Message(6,"You have scribed the spell Circle of Commons!");
    $client->Message(6,"You have scribed the spell Circle of Toxxulia!");
    $client->Message(6,"You have scribed the spell Circle of Butcherblock!");
    $client->Message(6,"You have scribed the spell Circle of Lavastorm!");
    $client->Message(6,"You have scribed the spell Circle of Ro!");
    $client->Message(6,"You have scribed the spell Circle of Ferrott!");
    $client->Message(6,"You have scribed the spell Circle of Steamfont!");
    $client->Message(6,"You have scribed the spell Circle of Iceclad Ocean!");
    $client->Message(6,"You have scribed the spell Circle of Surefall Glade!");
    $client->Message(6,"You have scribed the spell Circle of Grimling Forest!");
    $client->Message(6,"You have scribed the spell Circle of The Nexus!");
    $client->Message(6,"You have scribed the spell Circle of Stonebrunt Mountains!");
    $client->Message(6,"You have scribed the spell Circle of Misty!");
    $client->Message(6,"You have scribed the spell Circle of The Great Divide!"); #19516
    $client->Message(6,"You have scribed the spell Circle of Wakening Lands!"); #30398
    $client->Message(6,"You have scribed the spell Circle of Knowledge!");
    $client->Message(6,"You have scribed the spell Wind of the South!");
    $client->Message(6,"You have scribed the spell Wind of the North!");
    $client->Message(6,"You have scribed the spell Circle of Twilight!");
    $client->Message(6,"You have scribed the spell Circle of Dawnshroud!");
    $client->Message(6,"You have scribed the spell Circle of Cobalt Scar!"); #30440
    $client->Message(6,"You have scribed the spell Circle of The Combines!");
    $client->Message(6,"You have scribed the spell Circle of Slaughter!");
    $client->Message(6,"You have scribed the spell Circle of Bloodfields!"); #77662
    $client->Message(14,"Excellent, thank you, $class. Your Bots' Circle spells have been scribed.");
    quest::summonitem(129);
    quest::setglobal("bot_spell_2",3,5,"F");
    $bot_spell_2=undef;
    }
 elsif (($ulevel>=50) && ($itemcount{30438} == 1) && ($itemcount{30398} == 1) &&
    ($itemcount{30440} == 1)&& ($itemcount{77662} == 1) && ($bot_spell_2 == 1)){
    $client->Message(6,"You have scribed the spell Circle of Misty!");
    $client->Message(6,"You have scribed the spell Circle of The Great Divide!"); #19516
    $client->Message(6,"You have scribed the spell Circle of Wakening Lands!"); #30398
    $client->Message(6,"You have scribed the spell Circle of Knowledge!");
    $client->Message(6,"You have scribed the spell Wind of the South!");
    $client->Message(6,"You have scribed the spell Wind of the North!");
    $client->Message(6,"You have scribed the spell Circle of Twilight!");
    $client->Message(6,"You have scribed the spell Circle of Dawnshroud!");
    $client->Message(6,"You have scribed the spell Circle of Cobalt Scar!"); #30440
    $client->Message(6,"You have scribed the spell Circle of The Combines!");
    $client->Message(6,"You have scribed the spell Circle of Slaughter!");
    $client->Message(6,"You have scribed the spell Circle of Bloodfields!"); #77662
    $client->Message(14,"Excellent, thank you, $class. Your Bots' Circle spells have been scribed.");
    quest::summonitem(129);
    quest::setglobal("bot_spell_2",3,5,"F");
    $bot_spell_2=undef;
    }
 elsif (($ulevel>=50) && ($itemcount{30438} == 1) && ($itemcount{30398} == 1) &&
    ($itemcount{30440} == 1)&& ($itemcount{77662} == 1) && ($bot_spell_2 == 2)){
    $client->Message(6,"You have scribed the spell Circle of Slaughter!");
    $client->Message(6,"You have scribed the spell Circle of Bloodfields!"); #77662
    $client->Message(14,"Excellent, thank you, $class. Your Bots' Circle spells have been scribed.");
    quest::summonitem(129);
    quest::setglobal("bot_spell_2",3,5,"F");
    $bot_spell_2=undef;
    }
  elsif (plugin::check_handin(\%itemcount,129 => 1)){ #Lesser Moonstone of Circles for the spell scriber
    $client->Message(6,"You have scribed the spell Circle of Karana!");
    $client->Message(6,"You have scribed the spell Circle of Commons!");
    $client->Message(6,"You have scribed the spell Circle of Toxxulia!");
    $client->Message(6,"You have scribed the spell Circle of Butcherblock!");
    $client->Message(6,"You have scribed the spell Circle of Lavastorm!");
    $client->Message(6,"You have scribed the spell Circle of Ro!");
    $client->Message(6,"You have scribed the spell Circle of Ferrott!");
    $client->Message(6,"You have scribed the spell Circle of Steamfont!");
    $client->Message(6,"You have scribed the spell Circle of Iceclad Ocean!");
    $client->Message(6,"You have scribed the spell Circle of Surefall Glade!");
    $client->Message(6,"You have scribed the spell Circle of Grimling Forest!");
    $client->Message(6,"You have scribed the spell Circle of The Nexus!");
    $client->Message(6,"You have scribed the spell Circle of Stonebrunt Mountains!");
    $client->Message(14,"Excellent, thank you, $class. Your Bots' Lesser Moonstone of Circles spells have been scribed.");
    quest::setglobal("bot_spell_2",1,5,"F");
    quest::summonitem(129);
    $bot_spell_2=undef;
    }
  elsif (plugin::check_handin(\%itemcount,135 => 1)){ #Moonstone of Circles for the spell scriber
    $client->Message(6,"You have scribed the spell Circle of Misty!");
    $client->Message(6,"You have scribed the spell Circle of The Great Divide!"); #19516
    $client->Message(6,"You have scribed the spell Circle of Wakening Lands!"); #30398
    $client->Message(6,"You have scribed the spell Circle of Knowledge!");
    $client->Message(6,"You have scribed the spell Wind of the South!");
    $client->Message(6,"You have scribed the spell Wind of the North!");
    $client->Message(6,"You have scribed the spell Circle of Twilight!");
    $client->Message(6,"You have scribed the spell Circle of Dawnshroud!");
    $client->Message(6,"You have scribed the spell Circle of Cobalt Scar!"); #30440
    $client->Message(6,"You have scribed the spell Circle of The Combines!");
    $client->Message(14,"Excellent, thank you, $class. Your Bots' Moonstone of Circles spells have been scribed.");
    quest::setglobal("bot_spell_2",2,5,"F");
    $bot_spell_2=undef;
    }
  elsif (plugin::check_handin(\%itemcount,131 => 1)){ #Greater Moonstone of Circles for the spell scriber
    $client->Message(6,"You have scribed the spell Circle of Slaughter!");
    $client->Message(6,"You have scribed the spell Circle of Bloodfields!"); #77662
    $client->Message(14,"Excellent, thank you, $class. Your Bots' Greater Moonstone of Circles spells have been scribed.");
    quest::setglobal("bot_spell_2",3,5,"F");
    $bot_spell_2=undef;
    }
## Portal Spells
  elsif (($ulevel>=50) && ($itemcount{30399} == 1) && ($itemcount{30423} == 1)&& ($itemcount{30425} == 1)&&
    ($itemcount{77661} == 1) && ($bot_spell_3 == 3)){
    $client->Message(14,"You already have all these needed spells scribed.");
    quest::summonitem(130);
    quest::summonitem(30399);
    quest::summonitem(30423);
    quest::summonitem(30425);
    quest::summonitem(77661);
    }
  elsif (($itemcount{130} == 1) && (($bot_spell_3 == 1) || ($bot_spell_3 == 2) || ($bot_spell_3 == 3))){
    $client->Message(14,"Those spells are already scribed.");
    quest::summonitem(130);
    }
  elsif (($itemcount{136} == 1) && (($bot_spell_3 == 2) || ($bot_spell_3 == 3))){
    $client->Message(14,"Those spells are already scribed.");
    quest::summonitem(136);
    }
  elsif (($itemcount{132} == 1) && ($bot_spell_3 == 3)){
    $client->Message(14,"Those spells are already scribed.");
    quest::summonitem(132);
    }
  elsif (($ulevel>=50) && ($itemcount{30399} == 1) && ($itemcount{30423} == 1)&& ($itemcount{30425} == 1)&&
    ($itemcount{77661} == 1) && ($bot_spell_3 == 0)){
    $client->Message(6,"You have scribed the spell Fay Portal!");
    $client->Message(6,"You have scribed the spell Ro Portal!");
    $client->Message(6,"You have scribed the spell Toxxula Portal!");
    $client->Message(6,"You have scribed the spell North Karana Portal!");
    $client->Message(6,"You have scribed the spell Nektulos Portal!");
    $client->Message(6,"You have scribed the spell West Karana Portal!");
    $client->Message(6,"You have scribed the spell Dawnshroud Portal!");
    $client->Message(6,"You have scribed the spell Nexus Portal!");
    $client->Message(6,"You have scribed the spell Plane of Knowledge Portal!");
    $client->Message(6,"You have scribed the spell Stonebrunt Portal!");
    $client->Message(6,"You have scribed the spell Grimling Forest Portal!");
    $client->Message(6,"You have scribed the spell Twilight Portal!");
    $client->Message(6,"You have scribed the spell Iceclad Ocean Portal!");
    $client->Message(6,"You have scribed the spell Commons Portal!");
    $client->Message(6,"You have scribed the spell Wakening Lands Portal!"); #30399
    $client->Message(6,"You have scribed the spell Emerald Jungle Portal!");
    $client->Message(6,"You have scribed the spell Hate Plane Portal!");
    $client->Message(6,"You have scribed the spell Airplane Portal!");
    $client->Message(6,"You have scribed the spell Skyfire Portal!");
    $client->Message(6,"You have scribed the spell Great Divide Portal!"); #30423
    $client->Message(6,"You have scribed the spell Cobalt Scar Portal!"); #30425
    $client->Message(6,"You have scribed the spell Combines Portal!");
    $client->Message(6,"You have scribed the spell Wall of Slaughter Portal!");
    $client->Message(6,"You have scribed the spell Bloodfields Portal!"); # 77661
    $client->Message(14,"Excellent, thank you, $class. Your Bots' Portal spells have been scribed.");
    quest::summonitem(130);
    quest::setglobal("bot_spell_3",3,5,"F");
    $bot_spell_3 = undef;
    }
  elsif (($ulevel>=50) && ($itemcount{30399} == 1) && ($itemcount{30423} == 1)&& ($itemcount{30425} == 1)&&
    ($itemcount{77661} == 1) && ($bot_spell_3 == 1)){
    $client->Message(6,"You have scribed the spell Twilight Portal!");
    $client->Message(6,"You have scribed the spell Iceclad Ocean Portal!");
    $client->Message(6,"You have scribed the spell Commons Portal!");
    $client->Message(6,"You have scribed the spell Wakening Lands Portal!"); #30399
    $client->Message(6,"You have scribed the spell Emerald Jungle Portal!");
    $client->Message(6,"You have scribed the spell Hate Plane Portal!");
    $client->Message(6,"You have scribed the spell Airplane Portal!");
    $client->Message(6,"You have scribed the spell Skyfire Portal!");
    $client->Message(6,"You have scribed the spell Great Divide Portal!"); #30423
    $client->Message(6,"You have scribed the spell Cobalt Scar Portal!"); #30425
    $client->Message(6,"You have scribed the spell Combines Portal!");
    $client->Message(14,"Excellent, thank you, $class. Your Bots' Portal spells have been scribed.");
    quest::summonitem(130);
    quest::setglobal("bot_spell_3",3,5,"F");
    $bot_spell_3 = undef;
    }
  elsif (($ulevel>=50) && ($itemcount{30399} == 1) && ($itemcount{30423} == 1)&& ($itemcount{30425} == 1) && ($itemcount{77661} == 1) && ($bot_spell_3 == 2)){
    $client->Message(6,"You have scribed the spell Wall of Slaughter Portal!");
    $client->Message(6,"You have scribed the spell Bloodfields Portal!"); # 77661
    $client->Message(14,"Excellent, thank you, $class. Your Bots' Portal spells have been scribed.");
    quest::summonitem(130);
    quest::setglobal("bot_spell_3",3,5,"F");
    $bot_spell_3 = undef;
    }
  elsif (plugin::check_handin(\%itemcount,130 => 1)){ #Lesser Moonstone of Portals for the spell scriber
    $client->Message(6,"You have scribed the spell Fay Portal!");
    $client->Message(6,"You have scribed the spell Ro Portal!");
    $client->Message(6,"You have scribed the spell Toxxula Portal!");
    $client->Message(6,"You have scribed the spell North Karana Portal!");
    $client->Message(6,"You have scribed the spell Nektulos Portal!");
    $client->Message(6,"You have scribed the spell West Karana Portal!");
    $client->Message(6,"You have scribed the spell Dawnshroud Portal!");
    $client->Message(6,"You have scribed the spell Nexus Portal!");
    $client->Message(6,"You have scribed the spell Plane of Knowledge Portal!");
    $client->Message(6,"You have scribed the spell Stonebrunt Portal!");
    $client->Message(6,"You have scribed the spell Grimling Forest Portal!");
    $client->Message(14,"Excellent, thank you, $class. Your Bots' Lesser Moonstone of Portal spells have been scribed.");
    quest::summonitem(130);
    quest::setglobal("bot_spell_3",1,5,"F");
    $bot_spell_3 = undef;
    }
  elsif (plugin::check_handin(\%itemcount,136 => 1)){ #Moonstone of Portals for the spell scriber
    $client->Message(6,"You have scribed the spell Twilight Portal!");
    $client->Message(6,"You have scribed the spell Iceclad Ocean Portal!");
    $client->Message(6,"You have scribed the spell Commons Portal!");
    $client->Message(6,"You have scribed the spell Wakening Lands Portal!"); #30399
    $client->Message(6,"You have scribed the spell Emerald Jungle Portal!");
    $client->Message(6,"You have scribed the spell Hate Plane Portal!");
    $client->Message(6,"You have scribed the spell Airplane Portal!");
    $client->Message(6,"You have scribed the spell Skyfire Portal!");
    $client->Message(6,"You have scribed the spell Great Divide Portal!"); #30423
    $client->Message(6,"You have scribed the spell Cobalt Scar Portal!"); #30425
    $client->Message(6,"You have scribed the spell Combines Portal!");
    $client->Message(14,"Excellent, thank you, $class. Your Bots' Moonstone of Portal spells have been scribed.");
    quest::setglobal("bot_spell_3",2,5,"F");
    $bot_spell_3 = undef;
    }
  elsif (plugin::check_handin(\%itemcount,132 => 1)){ #Greater Moonstone of Portals for the spell scriber
    $client->Message(6,"You have scribed the spell Wall of Slaughter Portal!");
    $client->Message(6,"You have scribed the spell Bloodfields Portal!"); # 77661
    $client->Message(14,"Excellent, thank you, $class. Your Bots' Greater Moonstone of Portal spells have been scribed.");
    quest::setglobal("bot_spell_3",3,5,"F");
    $bot_spell_3 = undef;
    }
elsif ($itemcount{202} == 1){
   if(defined ($bard_spell_1)){
    $client->Message(14,"You already have this, try the command \"#bot selos on\" to start and \"#bot selos off\" to stop.");
     }
   else{
    $client->Message(14,"Well done! You may now use the command #bot selos on/off.");
    $client->Message(6,"Your Bards Selos spells have been scribed!");
    quest::setglobal("bard_spell_1",1,5,"F");
    $bard_spell_1 = undef;
     }
   plugin::return_items(\%itemcount);
   return;
  }
  else {
    $client->Message(14,"$name, I don't need this. Take it back."); #return bogus items
    plugin::return_items(\%itemcount);
    return 1;
  }
}
