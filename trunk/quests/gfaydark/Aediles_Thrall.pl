############################################
# ZONE: All Starter Zones, PoK and Bazaar
# DATABASE: AX_CLASSIC Custom
# LAST EDIT DATE: Febuary 4th, 2009 (Angelox)
# VERSION: 1.0
# DEVELOPER: Congdar
#
## REVISED BY ANGELOX!
## My idea is to make things easier for the player to get the bots.
## By Level 10 you should have your full group
## for less plat and newbee drobs
## Original quest is renamed "Aediles_Thrall.pl.ORG" incase you prefer it.
#
## REVISED BY CAVED!
## Revised to make ClickLinks available.
#
## Angelox: Third revision for some code clean up
#
# *** NPC INFORMATION ***
#
# NAME: Aediles Thrall
# TYPE: NPC
# RACE: Dwarf
# LEVEL: 71
#
# *** ITEMS GIVEN OR TAKEN ***
#
# Bat Wings ID-13068
# Spider Legs ID-13417
# Cracked Staff ID-6018
# Orc Ribcage  ID-19551
# Silver Ring ID-10038
# Hunting bow ID-8011
# Flag updates for quest global bot_spawn_limit
#
#
# *** QUESTS INVOLVED IN ***
#
# 1 - Custom Quest - Buying Slaves(bots)
#
#
# *** QUESTS AVAILABLE TO ***
#
# 1 - Anyone meeting level requirements
#
#
############################################

# Some global settings for the quest.  Set them to your preferred levels and plat costs
# Level options for when a character can acquire more slaves(bots)
my $firstbotlevel  = 1;
my $firstbotcost   = 1;
my $secondbotlevel = 5;
my $secondbotcost  = 2;
my $thirdbotlevel  = 7;
my $thirdbotcost   = 3;
my $fourthbotlevel = 8;
my $fourthbotcost  = 4;
my $fifthbotlevel  = 10;
my $fifthbotcost   = 5;
my $nineteenbotlevel = 45;
my $nineteenbotcost  = 2000;
my $twentyninebotlevel = 55;
my $twentyninebotcost = 3000;
my $fortyfourbotlevel = 60;
my $fortyfourbotcost  = 4000;
my $sixtyfourbotlevel = 65;
my $sixtyfourbotcost  = 5000;

# They have enough for one group, now they start creating raid bots up to the quest::spawnbotcount() limit.
# A rule setting EQOffline:SpawnBotCount of 11 is two full groups including you.
# my $nextbotlevel   = 340;
# my $nextbotcost    = 1000;
# my $nextextracost  = 2000;

sub EVENT_SAY {
my $want = quest::saylink("want", 1);
my $create= quest::saylink("create", 1);
my $delete = quest::saylink("delete", 1);
my $list = quest::saylink("list", 1);
my $spawn = quest::saylink("spawn", 1);
my $add = quest::saylink("add", 1);
my $remove = quest::saylink("remove", 1);
my $order = quest::saylink("order", 1);
my $hear = quest::saylink("hear", 1);
my $macros = quest::saylink("macros", 1);
my $summon = quest::saylink("summon", 1);
my $update = quest::saylink("update", 1);
my $raid = quest::saylink("raid", 1);
my $got = quest::saylink("got", 1);
my $mez = quest::saylink("mez", 1);
my $picklock= quest::saylink("picklock", 1);
my $cure = quest::saylink("cure", 1);
my $track = quest::saylink("track", 1);
my $calm = quest::saylink("calm", 1);
my $evac = quest::saylink("evac", 1);
my $resurrectme = quest::saylink("resurrectme", 1);
my $charm = quest::saylink("charm", 1);
my $sow = quest::saylink("sow", 1);
my $invis = quest::saylink("invis", 1);
my $levitate = quest::saylink("levitate", 1);
my $resist = quest::saylink("resist", 1);
my $shrinkme = quest::saylink("shrinkme", 1);
my $endureb = quest::saylink("endureb", 1);
my $gate = quest::saylink("gate", 1);
my $runeme = quest::saylink("runeme", 1);
my $action = quest::saylink("action", 1);
my $Socials = quest::saylink("Socials", 1);
my $button = quest::saylink("button", 1);
my $example = quest::saylink("example", 1);
my $combo = quest::saylink("combo", 1);
my $assistance = quest::saylink("assistance", 1);
my $command = quest::saylink("command ", 1);
my $bot = quest::saylink("bot", 1);
my $help = quest::saylink("help", 1);
my $product = quest::saylink("product", 1);
my $aid = quest::saylink("AID", 1);
my $individuals = quest::saylink("individuals", 1);
my $interested = quest::saylink("interested", 1);
my $supplies = quest::saylink("supplies", 1);
my $inventory = quest::saylink("inventory", 1);
my $show = quest::saylink("show", 1);

   if(defined $qglobals{bot_spawn_limit} && (quest::spawnbotcount() >= $qglobals{bot_spawn_limit})) {
         if($text=~/show/i) {
            $client->Message(14,"Well, ya gotta tell'm what ya $want , and they don't know everything!");
         }
         elsif(($text=~/want/i) || ($text=~/command/i)) {
            $client->Message(14,"They answer these commands that start with #bot (fer example, '#bot create'); $create, $delete, $list, $spawn, $add, $order. Want to $hear more or need me to explain $macros ?");
         }
         elsif(($text=~/create/i) || ($text=~/spawn/i)) {
            $client->Message(14,"First you have to create the bot; '#bot help create' will show you related class and race numbers you will have to provide, and you have to make a name - for example, this command will make you a female cleric, high elf with the name of Sissy; '#bot create Sissy 2 5 female'. If the creation is successful, you will see a message; 'Bot created'  you'll need its name for spawning the bot with the command #bot spawn'");
         }
         elsif(($text=~/list/i)|| ($text=~/inventory/i)) {
            $client->Message(14,"'#bot list' will show you what bots are yours and their ID numbers.");
            $client->Message(14,"'#bot inventory list', will show you what the targeted bot has on, and their ID numbers.");
            $client->Message(14,"'#bot remove [slotid]' or '#bot remove [slot name]' will remove the item at the given slot in the inventory of the targetted bot.");
         }
         elsif($text=~/delete/i) {
            $client->Message(14,"#bot delete will completely destroy forever the targeted bot and all its items, so be careful with this one.");
         }
         elsif($text=~/add/i) {
            $client->Message(14,"Target the bot you spawned and use '#bot add' so he will join your group.");
         }
         elsif($text=~/remove/i) {
            $client->Message(14,"Target the bot and use '#bot group remove' will remove it from the group and it will die.");
         }
         elsif($text=~/order/i) {
            $client->Message(14,"Use #bot follow, #bot guard, or #bot attack (target), and the bots will do as told.");
         }
         elsif($text=~/hear/i) {
            $client->Message(14,"Ok, but ya gots ta remember to start with #bot when ya try the command (fer example'#bot update'); here's some more; $inventory list, $inventory remove , $update [group summon], $summon , $raid , and I $got more too!");
         }
         elsif($text=~/summon/i) {
            $client->Message(14,"'#bot summon' will summon one targeted bot to you.");
            $client->Message(14,"'#bot group summon' summons all your grouped bots to you");
            $client->Message(14,"'#bot corpse summon' Necromancers will summon your corpse for resurrect.");
         }
         elsif($text=~/update/i) {
            $client->Message(14,"Enter '#bot update' when you gain a level, so the bot ups his level too");
         }
         elsif($text=~/raid/i) {
            $client->Message(14," You can also form multiple groups of bots and form your own raids, '#bot raid [commands]' has a whole slew of more commands. I might teach you those later, but '#bot raid help' will show help.");
         }
         elsif($text=~/got/i) {
            $client->Message(14,"These commands are for special spells or skills you want the bot to use; ai $mez , $picklock , $cure , $track , target $calm , $evac , $resurrectme , corpse $summon, $sow , $invis , $levitate , $resist , $shrinkme , $endureb , $charm ,$gate , $runeme ");
         }
         elsif($text=~/mez/i) {
            $client->Message(14,"'#bot ai mez' will mez your target, If you're grouped with an enchanter.");
         }
         elsif($text=~/picklock/i) {
            $client->Message(14,"For '#bot picklock', You must have a targeted rogue bot in your group and be right on the door.");
         }
         elsif($text=~/cure/i) {
            $client->Message(14,"#bot cure has the following options (If you use a cleric with the right level); poison, disease, curse, and blindness.");
         }
         elsif($text=~/track/i) {
            $client->Message(14,"'#bot track' is for looking at mobs in the zone a ranger has rare tracking oprion.");
         }
         elsif($text=~/calm/i) {
            $client->Message(14,"'#bot target calm' is pacify spell for mob control");
         }
         elsif($text=~/evac/i) {
            $client->Message(14,"'#bot evac' will transport your pc group to safe location in the current zone.");
         }
         elsif($text=~/resurrectme/i) {
            $client->Message(14,"#bot resurrectme is so your bot Cleric will rez you.");
         }
         elsif($text=~/sow/i) {
            $client->Message(14,"'#bot sow' for bot class that can sow, Druid can also sow wolf, and sow indoors when she gets the right level");
         }
         elsif($text=~/invis/i) {
            $client->Message(14,"'#bot invis' will provide you with invisiblity (must have proper class in group)");
         }
         elsif($text=~/levitate/i) {
            $client->Message(14,"'#bot levitate' gives you levitation (must have proper class in group)");
         }
         elsif($text=~/resist/i) {
            $client->Message(14,"For '#bot resist', the bot wil ask you which restist you want (must have proper class in group)");
         }
         elsif($text=~/shrinkme/i) {
            $client->Message(14,"'#bot shrinkme' You need a Shaman for this, he'll make you smaller");
         }
         elsif($text=~/endureb/i) {
            $client->Message(14,"'#bot endureb' You won't need to hold your breath under water (must have proper class in group)");
         }
         elsif($text=~/charm/i) {
            $client->Message(14," There's '#bot charm' and there's '#bot dire charm', these are for turning the enemy into your bot's pet. Be sure to remove the bots pet first with '#bot pet remove'.");
         }
         elsif($text=~/gate/i) {
            $client->Message(14,"'#bot gate' works with a Druid or a Wizard in your group.");
         }
         elsif($text=~/runeme/i) {
            $client->Message(14,"'#bot runeme', your Enchanter Bot cast Rune spell on you");
         }
        elsif($text=~/macros/i) {
            $client->Message(14,"A macro will make your bot command always be ready to use with a click of your mouse, on your keyboard press the <alt> and the <m> keys- that will bring up your $action window.");
         }
         elsif($text=~/action/i) {
            $client->Message(14,"Your action window has four tabs, you need the fourth one called ' $socials Page', another way to get to it, is with keyboard strokes <ctrl> and <o>");
         }
         elsif($text=~/socials/i) {
            $client->Message(14,"When you get to the Socials Page, click on the '>' $button tell you find and empty page.");
         }
         elsif($text=~/button/i) {
            $client->Message(14,"Right-click on an empty button, that will bring up your 'Edit Social' window. Wanna see an $example ?");
         }
         elsif($text=~/example/i) {
            $client->Message(14,"Okay, in the Edit Social window, you'll see six spaces, one for the name of the button (Social Name), and five more that will take a command on each line. Do you want to see a $single command or a $combo of commands? ");
         }
         elsif($text=~/single/i) {
            $client->Message(14,"I'll use the bot attack command for this one; for the first line under 'Social Name' put in the label 'Attack', then you only need one more line in one of the five larger spaces, type in '#bot group order attack', then click the <accept> button.");
            $client->Message(14,"When you zone or camp out, these macros will be saved with your character.");
         }
         elsif($text=~/combo/i) {
            $client->Message(14,"For this combo, I'll show you how to spawn a bot, then add him to your group.");
            $client->Message(14,"For 'Social Name', you can call it the class it is, this will be called 'Cleric'.");
            $client->Message(14,"You'll need all five remaining comand spaces, and for a bot named Sissy would look like this;");
            $client->Message(14,"Line one '#bot spawn Sissy'");
            $client->Message(14,"Line two (you need to make a pause, or next command will be over looked); '/pause 4'");
            $client->Message(14,"Line three; '/target Sissy'");
            $client->Message(14,"Line four; '/pause 4'");
            $client->Message(14,"Line five; '#bot group add'");
            $client->Message(14,"Click on the <accept> button and you're ready");
         }
         elsif($text=~/assistance/i) {
            $client->Message(14,"I can help ya with $command s or $macros .");
         }
         elsif($text=~/bot/i) {
            $client->Message(14,"A bot is another name we give to your NPC helpers or Mercenaries. You can use them so you don't have to venture alone.");
         }
         
         if(($ulevel >= $firstbotlevel) && ($qglobals{bot_spawn_limit} <= 0)) {
	   #quest::settimer("face", 25);
           if($text=~/Hail/i) {
            $client->Message(14,"Aediles Thrall says, \"Hey der youngster.  Lookin' fer a bit o' $help with yer adventurin'?\"");
           }
           elsif($text=~/help/i) {
            quest::emote("looks around the room and pauses a few seconds");
            $client->Message(14,"Well, I kin sell ye a $product ye can't find no place else.");
           }
           elsif($text=~/product/i) {
            quest::emote("looks around the room again");
            $client->Message(14,"Shhh, i'm involved in wut I like ta call A.I.D., I kin $aid ye in yer adventurin'");
           }
           elsif($text=~/aid/i) {
            quest::emote("looks around the room again");
            $client->Message(14,"It be 'Acquired Individuals Delivery' and it means I kin supply ye with $individuals .");
           }
            elsif($text=~/individuals/i) {
              quest::emote("looks around the room again");
              $client->Message(14,"Shhh, not too loud... I kin deliver ye an Individual if yer $interested ?");
           }
           elsif($text=~/interested/i) {
            $client->Message(14,"Let me tell ye, keepin' up a supply o' Individuals can be a costly endeavor and so's I kin feed 'em I need ye ta be collectin' up sum $supplies fer me.");
           }
           elsif(($text=~/supplies/i) && ($qglobals{bot_spawn_limit} <= 0)) {
	      my $success1 = 0;
              $success1 = $qglobals{bot_spawn_limit}+1;
              $client->Message(14,"First one's on da house! Now if ya need me to $show you how to work these things, or want to learn how to make $macros of your bot $command\Qs\E, Even if ya don't know how to $spawn a bot, just say so.");
	        if($success1 > 0) {
	    	  quest::setglobal("bot_spawn_limit", $success1, 5, "F");
		  $bot_spawn_limit = undef;
		  $client->Message(6,"You receive a character flag!");
		    if ($ulevel <=5){
		      $client->Message(6,"You can now create and spawn an Individual! See: '#bot help create' and '#bot spawn' commands.");}
		      my $sbcount = quest::spawnbotcount();
		      $client->Message(6,"You have $success1 out of $sbcount possible Individuals.");
		      $success1 = 0;
	      }
           }
        }
      elsif(($ulevel >= $secondbotlevel) && ($qglobals{bot_spawn_limit} <= 1)) {
	my $interested = quest::saylink("interested", 1);
	my $supplies = quest::saylink("supplies", 1);
         if($text=~/Hail/i) {
            $client->Message(14,"Ahh, a returnin' customer. Are ye $interested in another Individual?");
         }
#spider legs, spiderling legs, fine mosquito wing, fire beetle leg, Sabertooth Cub Canine
         elsif ($text=~/supplies/i){ 
	    if ($race eq 'Froglok') {
	      quest::emote("looks around the room");
	      $client->Message(14,"The Individual will cost ye $secondbotcost platinum pieces an' 4 fine mosquito wings.");
	    }
	    elsif ($race eq 'Iksar') {
	      quest::emote("looks around the room");
	      $client->Message(14,"The Individual will cost ye $secondbotcost platinum pieces an' 4 Sabertooth Cub Canines.");
	    }
	    elsif(($text=~/supplies/i) && ($race eq 'Human')) {
	      quest::emote("looks around the room");
	      $client->Message(14,"The Individual will cost ye $secondbotcost platinum pieces an' 4 fire beetle legs.");
            }
         }
        if($text=~/interested/i) {
            quest::emote("looks around the room");
            $client->Message(14,"Shhh, I kin deliver ye another Individual for $secondbotcost platinum an' 4 spider legs... heh, me likes spider legs!");
         }
      }
      elsif(($ulevel >= $thirdbotlevel) && ($qglobals{bot_spawn_limit} <= 2)) {
my $interested = quest::saylink("interested", 1);
         if($text=~/Hail/i) {
            $client->Message(14,"Ahh, a returnin' customer. Are ye $interested in another Individual?");
         }
         if($text=~/interested/i) {
            quest::emote("looks around the room");
            $client->Message(14,"Shhh, I kin deliver ye another Individual for $thirdbotcost platinum an' 2 cracked staffs... I can make me somore plat wit dose.");
         }
      }
      elsif(($ulevel >= $fourthbotlevel) && ($qglobals{bot_spawn_limit} <= 3)) {
my $interested = quest::saylink("interested", 1);
         if($text=~/Hail/i) {
            $client->Message(14,"Ahh, a returnin' customer. Are ye $interested in another Individual?");
         }
         if($text=~/interested/i) {
            quest::emote("looks around the room");
            $client->Message(14,"Shhh, I kin deliver ye another Individual for $fourthbotcost platinum an bring me any ribcage as long as it's not off a nasty 'ol rat!");
         }
      }
      elsif(($ulevel >= $fifthbotlevel) && ($qglobals{bot_spawn_limit} <= 4)) {
my $interested = quest::saylink("interested", 1);
         if($text=~/Hail/i) {
            $client->Message(14,"Ahh, a returnin' customer. Are ye $interested in another Individual?");
         }
         if($text=~/interested/i) {
            quest::emote("looks around the room");
            $client->Message(14,"Shhh, I kin deliver ye another Individual for $fifthbotcost platinum an' I wanna silver ring fer me lady.");
         }
      }
      elsif(($ulevel >= $nineteenbotlevel) && ($qglobals{bot_spawn_limit} <= 19)) {
my $interested = quest::saylink("interested", 1);
         if($text=~/Hail/i) {
            $client->Message(14,"Ahh, a returnin' customer. Are ye $interested in another Individual?");
         }
         if($text=~/interested/i) {
            quest::emote("looks around the room");
            $client->Message(14,"Shhh, I kin deliver ye another Individual for $nineteenbotcost platinum an' one o' dem hunting bows fer shootin' at dem runaway Individuals.");
         }
      }
      elsif(($ulevel >= $twentyninebotlevel) && ($qglobals{bot_spawn_limit} <= 29)) {
my $interested = quest::saylink("interested", 1);
         if($text=~/Hail/i) {
            $client->Message(14,"Ahh, a returnin' customer. Are ye $interested in another Individual?");
         }
         elsif($text=~/interested/i) {
            quest::emote("looks around the room");
            $client->Message(14,"Shhh, I kin deliver ye another Individual for $twentyninebotcost platinum an' da wife wants a nice Blue Diamond cause she tinks she's so cute!, and I gotta keep her happy!");
         }
      }
      elsif(($ulevel >= $fortyfourbotlevel) && ($qglobals{bot_spawn_limit} <=44 )) {
my $interested = quest::saylink("interested", 1);
         if($text=~/Hail/i) {
            $client->Message(14,"Ahh, a returnin' customer. Are ye $interested in another Individual?");
         }
         elsif($text=~/interested/i) {
            quest::emote("looks around the room");
            $client->Message(14,"Shhh, I kin deliver ye another Individual for $fortyfourbotcost platinum an' da wife wants to collect Fire Emerald Rings, so get me one a dose ... I gotta keep her happy!");
         }
      }
      elsif(($ulevel >= $sixtyfourbotlevel) && ($qglobals{bot_spawn_limit} <=64 )) {
my $interested = quest::saylink("interested", 1);
         if($text=~/Hail/i) {
            $client->Message(14,"Ahh, a returnin' customer. Are ye $interested in another Individual?");
         }
         elsif($text=~/interested/i) {
            quest::emote("looks around the room");
            $client->Message(14,"Shhh, I kin deliver ye another Individual for $sixtyfourbotcost platinum - an' I needs flowstones, so I can pimp me an me wife's gear! Ill take any kind: Bloodflow, Starflow, Boneflow, Fireflow, Waterflow, Mudflow, Voidflow, Emberflow, Stormflow, Mossflow, or Shadowflow.");
         }
      }
      else {
my $command = quest::saylink("command ", 1);
my $macros = quest::saylink("macros", 1);
         if (($text=~/Hail/i) && ($ulevel < $secondbotlevel)) {
	   $client->Message(14,"Ya already gots yer first bot, try the \"#bot create help\" command.");
            $client->Message(14,"Come sees me again when ya gets level $secondbotlevel .");
            $client->Message(14,"Or maybe ya wants ta learn more about $command s or $macros ?");}
         elsif(($text=~/Hail/i) && ($ulevel >= $secondbotlevel) && ($ulevel < $thirdbotlevel)) {
            $client->Message(14,"Yer not ready yet, come back when you get level $thirdbotlevel");
            $client->Message(14,"Or maybe ya wants ta learn more about $command s or $macros ?");}
         elsif(($text=~/Hail/i) && ($ulevel >= $thirdbotlevel) && ($ulevel < $fourthbotlevel)) {
            $client->Message(14,"Yer not ready yet, come back when you get level $fourthbotlevel .");
            $client->Message(14,"Or maybe ya wants ta learn more about $command s or $macros ?");}
         elsif(($text=~/Hail/i) && ($ulevel >= $fourthbotlevel) && ($ulevel < $fifthbotlevel)) {
            $client->Message(14,"Yer not ready yet, come back when you get level $fifthbotlevel .");
            $client->Message(14,"Or maybe ya wants ta learn more about $command s or $macros ?");}
         elsif(($text=~/Hail/i) && ($ulevel >= $fifthbotlevel) && ($ulevel < $nineteenbotlevel)) {
            $client->Message(14,"Yer not ready yet, come back when you get level $nineteenbotlevel .");
            $client->Message(14,"Or maybe ya wants ta learn more about $command s or $macros ?");}
         elsif(($text=~/Hail/i) && ($ulevel >= $nineteenbotlevel) && ($ulevel < $twentyninebotlevel)) {
            $client->Message(14,"Yer not ready yet, come back when you get level $twentyninebotlevel");
            $client->Message(14,"Or maybe ya wants ta learn more about $command s or $macros ?");}
         elsif(($text=~/Hail/i) && ($ulevel >= $twentyninebotlevel) && ($ulevel < $fortyfourbotlevel)) {
            $client->Message(14,"Yer not ready yet, come back when you get level $fortyfourbotlevel .");
            $client->Message(14,"Or maybe ya wants ta learn more about $command s or $macros ?");}
         elsif(($text=~/Hail/i) && ($ulevel >= $fortyfourbotlevel) && ($ulevel < $sixtyfourbotlevel)) {
            $client->Message(14,"Yer not ready yet, come back when you get level $sixtyfourbotlevel .");
            $client->Message(14,"Or maybe ya wants ta learn more about $command s or $macros ?");}
         elsif(($text=~/Hail/i) && (($ulevel >= $sixtyfourbotlevel) && ($qglobals{bot_spawn_limit} >= 64 ))) {
            $client->Message(14,"Ya already got all da bots ya can get!");
            $client->Message(14,"Or maybe ya wants ta learn more about $command s or $macros ?");}
         #elsif(($text=~/Hail/i) && ($ulevel >= $sixtyfourbotlevel) && ($ulevel < $nextbotlevel)) {
         #   $client->Message(14,"Yer not ready yet, come back when you get level $nextbotlevel .");
         #   $client->Message(14,"Or maybe ya wants ta learn more about $command s or $macros ?");}
       }
    }
      else {
       if($text=~/Hail/i) {
         $client->Message(14,"eh? Mind yer own business, go away!");
      }
    }
 }
sub EVENT_ITEM {
my $command = quest::saylink("command ", 1);
my $macros = quest::saylink("macros", 1);
my $show = quest::saylink("show", 1);
my $spawn = quest::saylink("spawn", 1);
#First bot items
my @itemz = (13068,13071,12405,12466,13064,13073); #batwing, rat whiskers ,small mosquito wings, loose scale, rat fur, bonechips
#Second bot items
    my $total = 0;
    foreach my $xitem (@itemz) {
      $total += $itemcount{$xitem}
      }
my @itemy = (13417,13254,97171,13250,12426); #spider legs, spiderling legs, fine mosquito wing, fire beetle leg, Sabertooth Cub Canine
#Fourth bot items (third bot items are cracked staffs, you can find those anywhere)
    my $total2 = 0;
    foreach my $witem (@itemy) {
      $total2 += $itemcount{$witem}
      }
my @itemx = (3402,6705,7162,17381,17388,19551,19552,19553,20185,20196,20412,55980); #These are all just assorted ribcages so almost any ribcage is valid, provided the mobs level is not too low.
    my $total3 = 0;
    foreach my $vitem (@itemx) {
      $total3 += $itemcount{$vitem}
      }
   if($itemcount{200} == 1){
    $client->Message(14,"Nice to meets ya! Here's a little somtin' ta get ya started. It's me own lucky charm!");
    $client->Message(14,"You gots work ta do! Ya can have one of me Bots already, but I needs to see yer gonna stay wit me.");
    $client->Message(14,"Go get me 4 bat wings an one platinum piece - don't weigh me down with dat copper and silver or gold! Just one platium piece and da bat wings.");
    quest::summonitem(620);  #Aediles Mark of the Bots Charm
    return;
    }
   if(defined $qglobals{bot_spawn_limit} && (quest::spawnbotcount() > $qglobals{bot_spawn_limit})) {
      my $success = 0;
      if(($ulevel >= $firstbotlevel) && ($qglobals{bot_spawn_limit} <= 0)) {
         if(($platinum == $firstbotcost) && ($total >= 4)) { #First bot items
            $success = $qglobals{bot_spawn_limit}+1;
        $client->Message(14,"Ya did okay! Now if ya need me to $show you how to work these things, or want to learn how to make $macros of your bot $command s, Even if ya don't know how to $spawn a bot, just say so.");
          }
     else{
         $client->Message(14,"Dat ain't whats me asked ye fer!");
             plugin::return_items(\%itemcount);
       if($platinum != 0 || $gold !=0 || $silver != 0 || $copper != 0) {
              quest::givecash($copper, $silver, $gold, $platinum);
      }
    }
      }
      elsif(($ulevel >= $secondbotlevel) && ($qglobals{bot_spawn_limit} <= 1)) {
         if(($platinum == $secondbotcost) && ($total2 >= 4)) { #Second bot items
            $success = $qglobals{bot_spawn_limit}+1;
            $client->Message(14,"Thanks $name!");
         }
     else{
         $client->Message(14,"Dat ain't whats me asked ye fer!");
             plugin::return_items(\%itemcount);
       if($platinum != 0 || $gold !=0 || $silver != 0 || $copper != 0) {
            quest::givecash($copper, $silver, $gold, $platinum);
      }
    }
      }
      elsif(($ulevel >= $thirdbotlevel) && ($qglobals{bot_spawn_limit} <= 2)) {
         if(($platinum == $thirdbotcost) && plugin::check_handin(\%itemcount, 6018  => 2)) { #cracked staff
            $success = $qglobals{bot_spawn_limit}+1;
            $client->Message(14,"Thanks $name!");
         }
     else{
         $client->Message(14,"Dat ain't whats me asked ye fer!");
             plugin::return_items(\%itemcount);
       if($platinum != 0 || $gold !=0 || $silver != 0 || $copper != 0) {
            quest::givecash($copper, $silver, $gold, $platinum);
      }
    }
      }
      elsif(($ulevel >= $fourthbotlevel) && ($qglobals{bot_spawn_limit} <= 3)) {
         if(($platinum == $fourthbotcost) && ($total3 >= 1)) { #fourth bot items
            $success = $qglobals{bot_spawn_limit}+1;
            $client->Message(14,"Thanks $name!");
         }
     else{
         $client->Message(14,"Dat ain't whats me asked ye fer!");
             plugin::return_items(\%itemcount);
       if($platinum != 0 || $gold !=0 || $silver != 0 || $copper != 0) {
            quest::givecash($copper, $silver, $gold, $platinum);
      }
    }
      }
      elsif(($ulevel >= $fifthbotlevel) && ($qglobals{bot_spawn_limit} <= 4)) {
         if(($platinum == $fifthbotcost) && plugin::check_handin(\%itemcount, 10038 => 1)) { #silver ring
            $success = $qglobals{bot_spawn_limit}+1;
            $client->Message(14,"Thanks $name!");
         }
     else{
         $client->Message(14,"Dat ain't whats me asked ye fer!");
             plugin::return_items(\%itemcount);
       if($platinum != 0 || $gold !=0 || $silver != 0 || $copper != 0) {
            quest::givecash($copper, $silver, $gold, $platinum);
      }
    }
      }
      elsif(($ulevel >= $nineteenbotlevel) && ($qglobals{bot_spawn_limit} <= 19)) {
         if(($platinum == $nineteenbotcost) && plugin::check_handin(\%itemcount, 8011 => 1)) { #hunting bow
            $success = $qglobals{bot_spawn_limit}+1;
            $client->Message(14,"Thanks $name!");
         }
     else{
           if (plugin::check_handin(\%itemcount, 8003 => 1)){ #the wrong bow
               $client->Message(14,"I don want that stink'n bow, me wants a hunting bow!");
               quest::summonitem(8003);
         }
           if (plugin::check_handin(\%itemcount, 8009 => 1)){ #the wrong bow
               $client->Message(14,"I don want that stink'n bow, me wants a hunting bow!");
               quest::summonitem(8009);
         }
       if($platinum != 0 || $gold !=0 || $silver != 0 || $copper != 0) {
        quest::givecash($copper, $silver, $gold, $platinum);
         }
         $client->Message(14,"Dat ain't whats me asked ye fer!!");
             plugin::return_items(\%itemcount);
    }
      }
      elsif(($ulevel >= $twentyninebotlevel) && ($qglobals{bot_spawn_limit} <= 29)) {
         if(($platinum == $twentyninebotcost) && plugin::check_handin(\%itemcount, 22503 => 1)) { #Blue Diamond
            $success = $qglobals{bot_spawn_limit}+1;
            $client->Message(14,"Thanks $name!");
         }
     else{
         $client->Message(14,"Dat ain't whats me asked ye fer!");
             plugin::return_items(\%itemcount);
       if($platinum != 0 || $gold !=0 || $silver != 0 || $copper != 0) {
            quest::givecash($copper, $silver, $gold, $platinum);
      }
    }
      }
      elsif(($ulevel >= $fortyfourbotlevel) && ($qglobals{bot_spawn_limit} <= 44)) {
         if(($platinum == $fortyfourbotcost) && plugin::check_handin(\%itemcount, 10049 => 1)) { #Fire Emerald Ring
            $success = $qglobals{bot_spawn_limit}+1;
            $client->Message(14,"Thanks $name!");
         }
     else{
         $client->Message(14,"Dat ain't whats me asked ye fer!");
             plugin::return_items(\%itemcount);
       if($platinum != 0 || $gold !=0 || $silver != 0 || $copper != 0) {
            quest::givecash($copper, $silver, $gold, $platinum);
      }
    }
      }
      elsif(($ulevel >= $sixtyfourbotlevel) && ($qglobals{bot_spawn_limit} <= 64)) {
         if(($platinum == $sixtyfourbotcost) && plugin::check_handin(\%itemcount, 72650 =>1) || plugin::check_handin(\%itemcount, 72651 =>1) ||
        plugin::check_handin(\%itemcount, 72652 =>1) || plugin::check_handin(\%itemcount, 72653 =>1) ||
        plugin::check_handin(\%itemcount, 72654 =>1) || plugin::check_handin(\%itemcount, 72655 =>1) ||
        plugin::check_handin(\%itemcount, 72657 =>1) || plugin::check_handin(\%itemcount, 72658 =>1) ||
        plugin::check_handin(\%itemcount, 72659 =>1) || plugin::check_handin(\%itemcount, 72660 =>1) ||
        plugin::check_handin(\%itemcount, 72661 =>1) || plugin::check_handin(\%itemcount, 72656 =>1)) { #Flow Stones
            $success = $qglobals{bot_spawn_limit}+1;
            $client->Message(14,"Thanks $name!");
         }
     else{
         $client->Message(14,"Dat ain't whats me asked ye fer!");
             plugin::return_items(\%itemcount);
       if($platinum != 0 || $gold !=0 || $silver != 0 || $copper != 0) {
            quest::givecash($copper, $silver, $gold, $platinum);
      }
    }
      }
      if($success > 0) {
         #$client->Message(14,"Thanks $name!");
         quest::setglobal("bot_spawn_limit", $success, 5, "F");
	 $bot_spawn_limit = undef;
         $client->Message(6,"You receive a character flag!");
    if ($ulevel <=5){
          $client->Message(6,"You can now create and spawn an Individual! See: '#bot help create' and '#bot spawn' commands.");}
         my $sbcount = quest::spawnbotcount();
         $client->Message(6,"You have $success out of $sbcount possible Individuals.");
         $success = 0;
      }
   }
   else {
      $client->Message(14,"Dat ain't whats me asked ye fer!");
      plugin::return_items(\%itemcount);
      if($platinum != 0 || $gold !=0 || $silver != 0 || $copper != 0) {
         quest::givecash($copper, $silver, $gold, $platinum);
      }
   }
}

sub EVENT_SPAWN {
my $x;
my $y;
my $z;
my $h;

$x = $npc->GetX();
$y = $npc->GetY();
$z = $npc->GetZ();
$h = $npc->GetHeading();
   quest::set_proximity($x - 50, $x + 50, $y - 50, $y + 50);
}

sub EVENT_ENTER {
my $assistance = quest::saylink("assistance", 1);
my $bot = quest::saylink("bot", 1);
  #if(quest::botquest()) {
     if(!defined $qglobals{bot_spawn_limit}) {
        quest::setglobal("bot_spawn_limit", 0, 5, "F");
	$bot_spawn_limit = undef;
     }
  #}
 my $random_result2 = int(rand(100));
 if ($random_result2<=40){
   if($ulevel <= $firstbotlevel){
     $client->Message(14,"Aediles Thrall says, \"Psst! hey $name! wouldn't you like to have some $assistance ? I can provide you with some $bot helpers! Come find me and we can talk.\"");
  }
 }
}

# END of FILE Zone:many -- Aediles_Thrall.pl
