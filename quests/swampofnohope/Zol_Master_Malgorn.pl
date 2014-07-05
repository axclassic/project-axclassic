sub EVENT_SAY {
  sub EVENT_SAY {
my $new = quest::saylink("new", 1);
my $before = quest::saylink("before", 1);
my $Necromancer = quest::saylink("Necromancer", 1);
my $listen = quest::saylink("listen", 1);
my $components = quest::saylink("components", 1);
my $Headband = quest::saylink("Headband", 1);
my $Vestment = quest::saylink("Vestment", 1);
my $Armwraps = quest::saylink("Armwraps", 1);
my $Bracer = quest::saylink("Bracer", 1);
my $Handwraps = quest::saylink("Handwraps", 1);
my $Leggings = quest::saylink("Leggings", 1);
my $Sandals = quest::saylink("Sandals", 1);
my $lesson = quest::saylink("lesson", 1);
my $him = quest::saylink("him", 1);

  if($text=~/Hail/i) {
    quest::say("Hail $name, I am Zol Master Shargnol, Necromancer Guildmaster of the Guktan Army.");
    quest::say("Are you $new to the area? Or have I seen you $before?");
    }
  if($text=~/new/i) {
	quest::say("Well then I welcome you to our new home $name. I feel we can make this place our own while we plan the invaison and recapturing of our dear old Gutka.");
	quset::say("Do you have something for me?");
	}
  if($text=~/before/i) {
	quest::say("Welcome back, young Zol $Necromancer. I hope your training is going well. Unfortunately I have been unable to keep up to date on your progress, but should you need advanced training in any individual skills, I am here to help you with that. As well, I am here to guide you through your growth as a Rogue in the Guktan Army. With the skills that you learn here, you will be better prepared to serve the Army.");
  }
  if ($text=~/Necromancer/i) {
    quest::say("That is your path you have chosen? Good. Then we must begin immediately for time is short. The arcane path ahead of you is fraught with dangers, many of them of your own making. I will guide you as I can, so $listen well.");
  }
  if ($text=~/listen/i) {
    quest::say("This Corrupt Arcane Crucible will allow you to combine various $components to form a basic magical mesh. This mesh, when combined with the proper mold and worked in a forge, will allow you to create your own Armor of the Zol Initiate.");
    quest::summonitem(119893);
  }
  if ($text=~/components/i) {
    quest::say("These are not the usual components used in spells. Look instead in Innothule Swamp for your pieces. The many enemies and vermin that stalk that bog hold items which are only trash to others. But to you they will eventually become treasures. When you are ready to attempt making your armor, return and tell me what you wish to make and I will instruct you. I can teach you the recipes and give you the proper molds for the Armor of the Zol Initiate $Headband, $Vestment, $Armwraps, $Bracer, $Handwraps, $Leggings, and $Sandals.");
  }
  if ($text=~/Headband/i) {
    quest::say("Wise. Your mind is your greatest weapon and you must protect it. You'll need a Malleable Bleeder Skin, a Pristine Bleeder Skin and two Mushroom Spores. Combine these components in your crucible. When you have the proper basic mesh in hand, take it to a forge along with this mold to finish your Headband of the Zol Initiate ");
    quest::summonitem(119894);
  }
  if ($text=~/Vestment/i) {
    quest::say("The true mark of an initiate and a banner to the world of our growing might. To make it you'll need a Pristine Bull Alligator Hide, Bull Alligator Spines, a Giant Moccasin Eye and some Spiderling Silk. When you have the proper basic mesh in hand, take it to a forge along with this mold to finish your Vestment of the Zol Initiate. There is a final $lesson you must learn.");
    quest::summonitem(119907);
  }
  if ($text=~/Armwraps/i) {
    quest::say("Gird yourself completely. To craft these you'll need a Bleeder Wing, an Undead Froglok Talisman, some Moccasin Eggs and a Water Moccasin Tail. Combine these components in your crucible. When you have the proper basic mesh in hand, take it to a forge along with this mold to finish your Armwraps of the Zol Initiate.");
    quest::summonitem(119905);
  }
  if ($text=~/Bracer/i) {
    quest::say("This bracer will be a compliment to your other armor. You'll need a Blackened Fungus, Airborne Spores, a Bleeder Carapace and a Cracked Crab Spider Legs. Combine these components in your crucible. When you have the proper basic mesh in hand, take it to a forge along with this mold to finish your Bracer of the Zol Initiate.");
    quest::summonitem(119903);
  }
  if ($text=~/Handwraps/i) {
    quest::say("Your mind commands, but your hands implement. It is wise to protect them. You'll need a Bull Alligator Tooth, two Pristine Kobold Paws and a Larval Carapace. Combine these components in your crucible. When you have the proper basic mesh in hand, take it to a forge along with this mold to finish your Handwraps of the Zol Initiate.");
    quest::summonitem(119902);
  }
  if ($text=~/Leggings/i) {
    quest::say("What better to protect you from all that lurks beneath the swamp's murky waters? You'll need a Kobold Talon, a Ball of Pulpy Fungus, a Kobold Liver and a Giant Moccasin Fang. Combine these components in your crucible. When you have the proper basic mesh in hand, take it to a forge along with this mold to finish your Leggings of the Zol Initiate.");
    quest::summonitem(119906);
  }
  if ($text=~/Sandals/i) {
    quest::say("Your feet will always touch your homeland. You'll need a Cracked Skeleton Skull, two Alligator Hides, and a Mosquito Carcass. Combine these components in your crucible. When you have the proper basic mesh in hand, take it to a forge along with this mold to finish your Sandals of the Zol Initiate.");  
    quest::summonitem(119904);
  }
  if ($text=~/lesson/i) {
    quest::say("It is said, with power must come mercy.... BAH! True comes fromour father Innoruuk! Well there is one in need of mercy, the mercy of death. A former student of mine, Initiate Xabbis, tried his skills against the ghouls of the swamp but he was weak, he became one himself. Now, he wanders near the broken tower. Go . . .slay $him.");
  }
        
  if ($text=~/him/i) {
    quest::emote("appears to be intently concentrating on the topics at hand, soon gaining an understanding of the topic being discussed, and continues in conversation with $name.");
    quest::say("Yes. It is the only way now. But once he has fallen, look in his possessions and see if you can find a Tattered Codex. It was my last gift to him. Return it to me along with two Burly Kobold Ears and a Larvae Skin and I shall fashion you a special weapon, one worthy of your power. You are certainly worthy of it.");
  }
}

sub EVENT_ITEM {
  if (plugin::check_handin(\%itemcount, 18367 => 1) && $class eq "Wizard") { 
    quest::say("I welcome you $name to the order of Zol, followers of Innoruuk.");
    quest::say("Take this Robe and wear it with pride! May it protect you as you grow young Zol.");  
    quest::summonitem(119884);
    quest::ding();
    quest::exp(1000);
	quest::rebind(83,-1419,-1230,27);
  }
  elsif (plugin::check_handin(\%itemcount,  63089=>1, 51036=>2, 51019=>1  )) {
    quest::say("You have done me a great favor and ridding the world of that weakling.  Here is you reward, use it well and remember your lessons.");
    quest::summonitem(51663);
     quest::ding(); quest::exp(1000);
    }
  else {
	quest::say("I cant use this.");
    plugin::return_items(\%itemcount); 
 }
}
sub EVENT_ITEM {
if (plugin::check_handin(\%itemcount, 51634 => 1) && $class eq "Necromancer") { 
  quest::say("I welcome you $name to the order of Zol, followers of our father Innoruuk");
  quest::say("Take this Robe and wear it with pride! May it protect you as you grow young Zol.");  
  quest::summonitem(119877);
  quest::ding();
  quest::exp(1000);
  }
  	else {
	quest::say("I cant use this.");
    plugin::return_items(\%itemcount); 
}
}