sub EVENT_SAY {
my $new = quest::saylink("new", 1);
my $before = quest::saylink("before", 1);
my $first = quest::saylink("first", 1);
my $rogue = quest::saylink("rogue", 1);
my $begin = quest::saylink("begin", 1);
my $valuables = quest::saylink("valuables", 1);
my $Sleeves = quest::saylink("Sleeves", 1);
my $Boots = quest::saylink("Boots", 1);
my $Bracer = quest::saylink("Bracer", 1);
my $Tunic = quest::saylink("Tunic", 1);
my $Gloves = quest::saylink("Gloves", 1);
my $Helm = quest::saylink("Helm", 1);
my $Leggings = quest::saylink("Leggings", 1);
my $task = quest::saylink("task", 1);
  if($text=~/Hail/i) {
    quest::say("Hail $name, I am Gaz Master Shargnol, Rogue Guildmaster of the Guktan Army.");
    quest::say("Are you $new to the area? Or have I seen you $before?");
    }
  if($text=~/new/i) {
	quest::say("Well then I welcome you to our new home $name. I feel we can make this place our own while we plan the invaison and recapturing of our dear old Gutka.");
	quset::say("Do you have something for me?");
	}
  if($text=~/before/i) {
	quest::say("Welcome back, young Gaz. I hope your training is going well. Unfortunately I have been unable to keep up to date on your progress, but should you need advanced training in any individual skills, I am here to help you with that. Also, though you've chosen a life of adventure, remember that you may still be called upon to defend your homeland. To do this, you must be well prepared for war. Let me tell you what little I know of this land and aid you in your $first steps.");
  }
  if($text=~/first/i) {
    quest::say("The city is a place of sanctuary for all Frogloks. We count many friends among the good races of the land, but we have few true allies yet. We are bordered by the evil Feerrott to the south and the desolate Southern Desert of Ro to the north. Even Guk, the city-dungeon whose entrance you will see as you wander the swamp, has its darker aspects. We will need to build our might if we are to survive. Are you by chance a new $rogue?"); 
  }
  if($text=~/rogue/i) {
    quest::say("Ah, good. The Army and its reserve are always in need of fresh courage. Every new rogue must attempt the training I personally oversee. I say attempt because these exercises will test you to the very limit. Now, if you have enough of the courage we seek, we may $begin."); 
  }
  if($text=~/begin/i) {
    quest::say("Good. Take this Corrupt Field Armorer Kit. It will allow you to use the looted $valuables and even bodies of your enemies to form basic armor materials. These basic materials will prove quite valuable. When placed into a forge along with the proper mold, it will allow you to craft your own Armor of the Gaz Initiate."); 
    quest::ding();
	quest::summonitem(119908);
	}
  if($text=~/valuables/i) {
    quest::say("As I said, spoils of war and bodies will provide the supplies you need. Innothule Swamp, the murky land just beyond the city gates, holds some of the items you seek. You may also have to talk to local merchants to locate the odd piece. When you are ready to attempt these quests, you need only tell me what you want and I will provide further instruction. I can teach you the recipes and give you the armor molds for the Armor of the Gaz Initiate $Helm, $Breastplate, $Sleeves, $Bracer, $Gloves, $Leggings and $Boots."); 
    }
  if($text=~/Sleeves/i) {
    quest::say("To make your armplates, you'll need a Moccassin Eggs, a Bleeder Wings, a Moccasin Scales and a Kobold Talisman. Combine these ingredients in your kit. When you have the proper basic material in hand, take it to a forge along with this mold to finish your Armplates of the Gaz Initiate.");
    quest::summonitem(119910);
	}
  if($text=~/Boots/i) {
    quest::say("A soldier's life is a life of travel. For your boots you'll need a Kobold Scalp, two Chunks of Digested Earth, and an Undead Froglok Talisman. Combine these ingredients in your kit. When you have the proper basic material in hand, take it to a forge along with this mold to finish your Boots of the Gaz Initiate.");
    quest::summonitem(119913);
	}
  if($text=~/Bracer/i) {
    quest::say("Ah, the quick defense against bloodthirsty blades. You'll need a Crab Spider's Carapace, two Spiderling Silks and a Malleable Bleeder Skin. Combine these ingredients in your kit. When you have the proper basic material in hand, take it to a forge along with this mold to finish your Bracer of the Gaz Initiate.");
    quest::summonitem(119909);
    }
  if($text=~/Tunic/i) {
    quest::say("The final shield. Yes. But its construction will not be easy. Go and seek some Pristine Moccasin Scales, Burly Kobold Ears, a Pristine Bull Alligator Hide and some Moccasin Poison. Combine these ingredients in your kit. When you have the proper basic material in hand, take it to a forge along with this mold to finish your Breastplate of the Gaz Initiate. Once so armored, you'll be well prepared for a greater $task.");
    quest::summonitem(119916);
    }
  if($text=~/Gloves/i) {
    quest::say("You'll need a Bleeder's Poison Sack, Blackened Fungus and two Bleeder Carapaces. Combine these ingredients in your kit. When you have the proper basic material in hand, take it to a forge along with this mold to finish your Gauntlets of the Gaz Initiate."); 
    quest::summonitem(119911);
    }
  if($text=~/Helm/i) {
    quest::say("A shadowknight's second skull, I always say. You'll need an Alligator Hide, a Ball of Pulpy Fungus, a Cracked Skeleton Skull and a Giant Moccasin Fang. Combine these ingredients in your kit. When you have the proper basic material in hand, take it to a forge along with this mold to finish your Helm of the Gaz Initiate.");
    quest::summonitem(119912);
    }
  if($text=~/Leggings/i) {
    quest::say("Wise. To make the leggings you'll need a Giant Moccasin Eye, two Kobold Livers and a Larval Carapace. Combine these ingredients in your kit. When you have the proper basic material in hand, take it to a forge along with this mold to finish your Leggings of the Gaz Initiate.");
    quest::summonitem(119914);
    }
  if($text=~/task/i) {
    quest::say("War often brings out the worst, it is said. Sadly one of our very own grew greedy when he saw the trolls' treasure. Sergeant Herptol fell to temptation, ignoring the voice of our Lord that had commanded us to ignore the tainted loot. He fled the city and his rightful punishment. I've learned he's hiding out in the northern reaches of the Innothule. Go. Find him. Slay him and recover what he stole. Bring me a Larvae Skin and some Bull Alligator Spines. When you return the recovered loot and these items, I shall craft you a sword.");
    }
}

sub EVENT_ITEM {
if (plugin::check_handin(\%itemcount, 51636 => 1) && $class eq "Rogue") { 
  quest::say("I welcome you $name to the order of Gaz, followers of our father Innoruuk");
  quest::say("Take this Tunic and wear it with pride! May it protect you as you grow young Gaz.");  
  quest::summonitem(119880);
  quest::ding();
  quest::exp(1000);
  }
  elsif(plugin::check_handin(\%itemcount,  63088=>1, 51019=>2, 51038=>1  )) { 
    quest::say("I can't Believe my eyes!. Well done $name, Here is the sword I promised you.");
    quest::summonitem(51645);
    quest::ding();
    quest::exp(1000);
   }
  	else {
	quest::say("I cant use this.");
    plugin::return_items(\%itemcount); 
}
}